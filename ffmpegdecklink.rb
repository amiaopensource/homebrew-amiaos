class Ffmpegdecklink < Formula
  desc "FFmpeg with --enable-decklink"
  homepage "https://ffmpeg.org/"
  url "https://ffmpeg.org/releases/ffmpeg-4.2.3.tar.xz"
  sha256 "9df6c90aed1337634c1fb026fb01c154c29c82a64ea71291ff2da9aacb9aad31"
  head "https://github.com/FFmpeg/FFmpeg.git"
  keg_only "anything that needs this will know where to look"

  option "with-iec61883", "Enable DV device (Linux)" if OS.linux?
  depends_on "nasm" => :build
  depends_on "pkg-config" => :build
  depends_on "texi2html" => :build

  depends_on "amiaopensource/amiaos/decklinksdk"
  depends_on "fontconfig"
  depends_on "freetype"
  depends_on "lame"
  depends_on "libvorbis"
  depends_on "libvpx"
  depends_on "openjpeg"
  depends_on "opus"
  depends_on "sdl2"
  depends_on "snappy"
  depends_on "theora"
  depends_on "x264"
  depends_on "x265"
  depends_on "xvid"
  depends_on "xz"

  patch :DATA

  def install
    # Work around Xcode 11 clang bug, see:
    # https://bitbucket.org/multicoreware/x265/issues/514/wrong-code-generated-on-macos-1015
    # https://trac.ffmpeg.org/ticket/8073
    ENV.append_to_cflags "-fno-stack-check" if DevelopmentTools.clang_build_version >= 1010

    args = %W[
      --prefix=#{prefix}
      --disable-shared
      --enable-version3
      --cc=#{ENV.cc}
      --host-cflags=#{ENV.cflags}
      --host-ldflags=#{ENV.ldflags}
      --enable-gpl
      --enable-libfreetype
      --enable-libmp3lame
      --enable-libopenjpeg
      --enable-libopus
      --enable-libsnappy
      --enable-libtheora
      --enable-libvorbis
      --enable-libvpx
      --enable-libx264
      --enable-libx265
      --enable-libxvid
      --enable-libfontconfig
      --disable-libjack
      --disable-indev=jack
    ]

    args << "--enable-libiec61883" if (build.with? "iec61883") && OS.linux?

    # decklink options
    args << "--enable-nonfree"
    args << "--enable-decklink"
    args << "--extra-cflags=-I#{HOMEBREW_PREFIX}/include"
    args << "--extra-ldflags=-L#{HOMEBREW_PREFIX}/include"

    system "./configure", *args
    system "make"
    bin.install "ffmpeg" => "ffmpeg-dl"
    bin.install "ffprobe" => "ffprobe-dl"
    bin.install "ffplay" => "ffplay-dl"
  end

  test do
    # Create an example mp4 file
    mp4out = testpath/"video.mp4"
    system bin/"ffmpeg-dl", "-filter_complex", "testsrc=rate=1:duration=1", mp4out
    assert_predicate mp4out, :exist?
  end
end

__END__
diff --git a/libavdevice/avfoundation.m b/libavdevice/avfoundation.m
index af8fe31367..0d854a18a3 100644
--- a/libavdevice/avfoundation.m
+++ b/libavdevice/avfoundation.m
@@ -98,6 +98,7 @@
     int             capture_cursor;
     int             capture_mouse_clicks;
     int             capture_raw_data;
+    int             drop_late_frames;
     int             video_is_muxed;
 
     int             list_devices;
@@ -496,7 +497,7 @@ static int add_video_device(AVFormatContext *s, AVCaptureDevice *video_device)
 
         [ctx->video_output setVideoSettings:capture_dict];
     }
-    [ctx->video_output setAlwaysDiscardsLateVideoFrames:YES];
+    [ctx->video_output setAlwaysDiscardsLateVideoFrames:ctx->drop_late_frames];
 
     ctx->avf_delegate = [[AVFFrameReceiver alloc] initWithContext:ctx];
 
@@ -1135,6 +1136,7 @@ static int avf_close(AVFormatContext *s)
     { "capture_cursor", "capture the screen cursor", offsetof(AVFContext, capture_cursor), AV_OPT_TYPE_BOOL, {.i64=0}, 0, 1, AV_OPT_FLAG_DECODING_PARAM },
     { "capture_mouse_clicks", "capture the screen mouse clicks", offsetof(AVFContext, capture_mouse_clicks), AV_OPT_TYPE_BOOL, {.i64=0}, 0, 1, AV_OPT_FLAG_DECODING_PARAM },
     { "capture_raw_data", "capture the raw data from device connection", offsetof(AVFContext, capture_raw_data), AV_OPT_TYPE_BOOL, {.i64=0}, 0, 1, AV_OPT_FLAG_DECODING_PARAM },
+    { "drop_late_frames", "drop frames that are available later than expected", offsetof(AVFContext, drop_late_frames), AV_OPT_TYPE_BOOL, {.i64=1}, 0, 1, AV_OPT_FLAG_DECODING_PARAM },
 
     { NULL },
 };
-- 
diff --git a/libavdevice/avfoundation.m b/libavdevice/avfoundation.m
index 0d854a1..43b2edb 100644
--- a/libavdevice/avfoundation.m
+++ b/libavdevice/avfoundation.m
@@ -88,7 +88,6 @@ typedef struct
     int64_t         first_pts;
     int64_t         first_audio_pts;
     pthread_mutex_t frame_lock;
-    pthread_cond_t  frame_wait_cond;
     id              avf_delegate;
     id              avf_audio_delegate;
 
@@ -130,6 +129,10 @@ typedef struct
     AVCaptureAudioDataOutput *audio_output;
     CMSampleBufferRef         current_frame;
     CMSampleBufferRef         current_audio_frame;
+
+    AVCaptureDevice          *observed_device;
+    AVCaptureDeviceTransportControlsPlaybackMode observed_mode;
+    int                      observed_quit;
 } AVFContext;
 
 static void lock_frames(AVFContext* ctx)
@@ -163,10 +166,50 @@ static void unlock_frames(AVFContext* ctx)
 {
     if (self = [super init]) {
         _context = context;
+
+        // start observing if a device is set for it
+        if (_context->observed_device) {
+            NSString *keyPath = NSStringFromSelector(@selector(transportControlsPlaybackMode));
+            NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew;
+
+            [_context->observed_device addObserver: self
+                                        forKeyPath: keyPath
+                                           options: options
+                                           context: _context];
+        }
     }
     return self;
 }
 
+- (void)dealloc {
+    // stop observing if a device is set for it
+    NSString *keyPath = NSStringFromSelector(@selector(transportControlsPlaybackMode));
+    [_context->observed_device removeObserver: self forKeyPath: keyPath];
+    [super dealloc];
+}
+
+- (void)observeValueForKeyPath:(NSString *)keyPath
+                      ofObject:(id)object
+                        change:(NSDictionary *)change
+                       context:(void *)context {
+    if (context == _context) {
+        AVCaptureDeviceTransportControlsPlaybackMode mode =
+            [change[NSKeyValueChangeNewKey] integerValue];
+
+        if (mode != _context->observed_mode) {
+            if (mode == AVCaptureDeviceTransportControlsNotPlayingMode) {
+                _context->observed_quit = 1;
+            }
+            _context->observed_mode = mode;
+        }
+    } else {
+        [super observeValueForKeyPath: keyPath
+                             ofObject: object
+                               change: change
+                              context: context];
+    }
+}
+
 - (void)  captureOutput:(AVCaptureOutput *)captureOutput
   didOutputSampleBuffer:(CMSampleBufferRef)videoFrame
          fromConnection:(AVCaptureConnection *)connection
@@ -179,8 +222,6 @@ static void unlock_frames(AVFContext* ctx)
 
     _context->current_frame = (CMSampleBufferRef)CFRetain(videoFrame);
 
-    pthread_cond_signal(&_context->frame_wait_cond);
-
     unlock_frames(_context);
 
     ++_context->frames_captured;
@@ -225,8 +266,6 @@ static void unlock_frames(AVFContext* ctx)
 
     _context->current_audio_frame = (CMSampleBufferRef)CFRetain(audioFrame);
 
-    pthread_cond_signal(&_context->frame_wait_cond);
-
     unlock_frames(_context);
 
     ++_context->audio_frames_captured;
@@ -253,7 +292,6 @@ static void destroy_context(AVFContext* ctx)
     av_freep(&ctx->audio_buffer);
 
     pthread_mutex_destroy(&ctx->frame_lock);
-    pthread_cond_destroy(&ctx->frame_wait_cond);
 
     if (ctx->current_frame) {
         CFRelease(ctx->current_frame);
@@ -499,6 +537,15 @@ static int add_video_device(AVFormatContext *s, AVCaptureDevice *video_device)
     }
     [ctx->video_output setAlwaysDiscardsLateVideoFrames:ctx->drop_late_frames];
 
+    // check for transport control support and set observer device if supported
+    int trans_ctrl = [video_device transportControlsSupported];
+    AVCaptureDeviceTransportControlsPlaybackMode trans_mode = [video_device transportControlsPlaybackMode];
+
+    if (trans_ctrl) {
+        ctx->observed_mode   = trans_mode;
+        ctx->observed_device = video_device;
+    }
+
     ctx->avf_delegate = [[AVFFrameReceiver alloc] initWithContext:ctx];
 
     queue = dispatch_queue_create("avf_queue", NULL);
@@ -709,7 +756,6 @@ static int avf_read_header(AVFormatContext *s)
     ctx->first_audio_pts    = av_gettime();
 
     pthread_mutex_init(&ctx->frame_lock, NULL);
-    pthread_cond_init(&ctx->frame_wait_cond, NULL);
 
 #if !TARGET_OS_IPHONE && __MAC_OS_X_VERSION_MIN_REQUIRED >= 1070
     CGGetActiveDisplayList(0, NULL, &num_screens);
@@ -1110,7 +1156,12 @@ static int avf_read_packet(AVFormatContext *s, AVPacket *pkt)
             ctx->current_audio_frame = nil;
         } else {
             pkt->data = NULL;
-            pthread_cond_wait(&ctx->frame_wait_cond, &ctx->frame_lock);
+            unlock_frames(ctx);
+            if (ctx->observed_quit) {
+                return AVERROR_EOF;
+            } else {
+                return AVERROR(EAGAIN);
+            }
         }
 
         unlock_frames(ctx);
-- 
