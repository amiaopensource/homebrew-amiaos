class Ffmpegdecklink < Formula
  desc "FFmpeg with --enable-decklink"
  homepage "https://ffmpeg.org/"
  url "https://ffmpeg.org/releases/ffmpeg-4.0.tar.xz"
  sha256 "ed945daf40b124e77a685893cc025d086f638bc703183460aff49508edb3a43f"
  head "https://github.com/FFmpeg/FFmpeg.git"
  keg_only "anything that needs this will know where to look"

  option "with-chromaprint", "Enable the Chromaprint audio fingerprinting library"
  option "with-fdk-aac", "Enable the Fraunhofer FDK AAC library"
  option "with-libass", "Enable ASS/SSA subtitle format"
  option "with-librsvg", "Enable SVG files as inputs via librsvg"
  option "with-libsoxr", "Enable the soxr resample library"
  option "with-libssh", "Enable SFTP protocol via libssh"
  option "with-tesseract", "Enable the tesseract OCR engine"
  option "with-libvidstab", "Enable vid.stab support for video stabilization"
  option "with-opencore-amr", "Enable Opencore AMR NR/WB audio format"
  option "with-openh264", "Enable OpenH264 library"
  option "with-openjpeg", "Enable JPEG 2000 image format"
  option "with-openssl", "Enable SSL support"
  option "with-rtmpdump", "Enable RTMP protocol"
  option "with-rubberband", "Enable rubberband library"
  option "with-sdl2", "Enable FFplay media player"
  option "with-snappy", "Enable Snappy library"
  option "with-tools", "Enable additional FFmpeg tools"
  option "with-webp", "Enable using libwebp to encode WEBP images"
  option "with-x265", "Enable x265 encoder"
  option "with-xz", "Enable decoding of LZMA-compressed TIFF files"
  option "with-zeromq", "Enable using libzeromq to receive commands sent through a libzeromq client"
  option "with-zimg", "Enable z.lib zimg library"
  option "without-lame", "Disable MP3 encoder"
  option "without-qtkit", "Disable deprecated QuickTime framework"
  option "without-securetransport", "Disable use of SecureTransport"
  option "without-x264", "Disable H.264 encoder"
  option "without-xvid", "Disable Xvid MPEG-4 video encoder"
  option "without-gpl", "Disable building GPL licensed parts of FFmpeg"

  deprecated_option "with-ffplay" => "with-sdl2"
  deprecated_option "with-sdl" => "with-sdl2"
  deprecated_option "with-libtesseract" => "with-tesseract"

  depends_on "nasm" => :build
  depends_on "pkg-config" => :build
  depends_on "texi2html" => :build

  depends_on "lame" => :recommended
  depends_on "x264" => :recommended
  depends_on "xvid" => :recommended

  depends_on "chromaprint" => :optional
  depends_on "fdk-aac" => :optional
  depends_on "fontconfig" => :optional
  depends_on "freetype" => :optional
  depends_on "frei0r" => :optional
  depends_on "game-music-emu" => :optional
  depends_on "libass" => :optional
  depends_on "libbluray" => :optional
  depends_on "libbs2b" => :optional
  depends_on "libcaca" => :optional
  depends_on "libgsm" => :optional
  depends_on "libmodplug" => :optional
  depends_on "librsvg" => :optional
  depends_on "libsoxr" => :optional
  depends_on "libssh" => :optional
  depends_on "libvidstab" => :optional
  depends_on "libvorbis" => :optional
  depends_on "libvpx" => :optional
  depends_on "opencore-amr" => :optional
  depends_on "openh264" => :optional
  depends_on "openjpeg" => :optional
  depends_on "openssl" => :optional
  depends_on "opus" => :optional
  depends_on "rtmpdump" => :optional
  depends_on "rubberband" => :optional
  depends_on "sdl2" => :optional
  depends_on "snappy" => :optional
  depends_on "speex" => :optional
  depends_on "tesseract" => :optional
  depends_on "theora" => :optional
  depends_on "two-lame" => :optional
  depends_on "wavpack" => :optional
  depends_on "webp" => :optional
  depends_on "x265" => :optional
  depends_on "xz" => :optional
  depends_on "zeromq" => :optional
  depends_on "zimg" => :optional

  patch :DATA

  def install
    args = %W[
      --prefix=#{prefix}
      --disable-shared
      --enable-pthreads
      --enable-version3
      --enable-hardcoded-tables
      --enable-avresample
      --cc=#{ENV.cc}
      --host-cflags=#{ENV.cflags}
      --host-ldflags=#{ENV.ldflags}
    ]

    args << "--enable-gpl" if build.with? "gpl"
    args << "--disable-indev=qtkit" if build.without? "qtkit"
    args << "--disable-securetransport" if build.without? "securetransport"
    args << "--enable-chromaprint" if build.with? "chromaprint"
    args << "--enable-ffplay" if build.with? "sdl2"
    args << "--enable-frei0r" if build.with? "frei0r"
    args << "--enable-libass" if build.with? "libass"
    args << "--enable-libbluray" if build.with? "libbluray"
    args << "--enable-libbs2b" if build.with? "libbs2b"
    args << "--enable-libcaca" if build.with? "libcaca"
    args << "--enable-libfdk-aac" if build.with? "fdk-aac"
    args << "--enable-libfontconfig" if build.with? "fontconfig"
    args << "--enable-libfreetype" if build.with? "freetype"
    args << "--enable-libgme" if build.with? "game-music-emu"
    args << "--enable-libgsm" if build.with? "libgsm"
    args << "--enable-libmodplug" if build.with? "libmodplug"
    args << "--enable-libmp3lame" if build.with? "lame"
    args << "--enable-libopencore-amrnb" << "--enable-libopencore-amrwb" if build.with? "opencore-amr"
    args << "--enable-libopenh264" if build.with? "openh264"
    args << "--enable-libopus" if build.with? "opus"
    args << "--enable-librsvg" if build.with? "librsvg"
    args << "--enable-librtmp" if build.with? "rtmpdump"
    args << "--enable-librubberband" if build.with? "rubberband"
    args << "--enable-libsnappy" if build.with? "snappy"
    args << "--enable-libsoxr" if build.with? "libsoxr"
    args << "--enable-libspeex" if build.with? "speex"
    args << "--enable-libssh" if build.with? "libssh"
    args << "--enable-libtesseract" if build.with? "tesseract"
    args << "--enable-libtheora" if build.with? "theora"
    args << "--enable-libtwolame" if build.with? "two-lame"
    args << "--enable-libvidstab" if build.with? "libvidstab"
    args << "--enable-libvorbis" if build.with? "libvorbis"
    args << "--enable-libvpx" if build.with? "libvpx"
    args << "--enable-libwavpack" if build.with? "wavpack"
    args << "--enable-libwebp" if build.with? "webp"
    args << "--enable-libx264" if build.with? "x264"
    args << "--enable-libx265" if build.with? "x265"
    args << "--enable-libxvid" if build.with? "xvid"
    args << "--enable-libzimg" if build.with? "zimg"
    args << "--enable-libzmq" if build.with? "zeromq"
    args << "--enable-opencl" if MacOS.version > :lion
    args << "--enable-videotoolbox" if MacOS.version >= :mountain_lion
    args << "--enable-openssl" if build.with? "openssl"

    if build.with? "xz"
      args << "--enable-lzma"
    else
      args << "--disable-lzma"
    end

    if build.with? "openjpeg"
      args << "--enable-libopenjpeg"
      args << "--disable-decoder=jpeg2000"
      args << "--extra-cflags=" + `pkg-config --cflags libopenjp2`.chomp
    end

    # decklink options
    args << "--enable-nonfree"
    args << "--enable-decklink"
    args << "--extra-cflags=-I#{HOMEBREW_PREFIX}/include"
    args << "--extra-ldflags=-L#{HOMEBREW_PREFIX}/include"

    # These librares are GPL-incompatible, and require ffmpeg be built with
    # the "--enable-nonfree" flag, which produces unredistributable libraries
    args << "--enable-nonfree" if build.with?("fdk-aac") || build.with?("openssl")

    system "./configure", *args

    system "make"
    mv "ffmpeg", "ffmpeg-dl"
    bin.install "ffmpeg-dl"

    if build.with? "sdl2"
      mv "ffplay", "ffplay-dl"
      bin.install "ffplay-dl"
    end

    if build.with? "tools"
      system "make", "alltools"
      bin.install Dir["tools/*"].select { |f| File.executable? f }
    end
  end

  test do
    # Create an example mp4 file
    mp4out = testpath/"video.mp4"
    system bin/"ffmpeg-dl", "-filter_complex", "testsrc=rate=1:duration=1", mp4out
    assert_predicate mp4out, :exist?
  end
end


__END__
diff --git a/libavdevice/decklink_dec.cpp b/libavdevice/decklink_dec.cpp
index 510637676c..897fca1003 100644
--- a/libavdevice/decklink_dec.cpp
+++ b/libavdevice/decklink_dec.cpp
@@ -21,6 +21,9 @@
  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  */
 
+#include <atomic>
+using std::atomic;
+
 /* Include internal.h first to avoid conflict between winsock.h (used by
  * DeckLink headers) and winsock2.h (used by libavformat) in MSVC++ builds */
 extern "C" {
@@ -98,6 +101,44 @@ static VANCLineNumber vanc_line_numbers[] = {
     {bmdModeUnknown, 0, -1, -1, -1}
 };
 
+class decklink_allocator : public IDeckLinkMemoryAllocator
+{
+public:
+        decklink_allocator(): _refs(1) { }
+        virtual ~decklink_allocator() { }
+
+        // IDeckLinkMemoryAllocator methods
+        virtual HRESULT STDMETHODCALLTYPE AllocateBuffer(unsigned int bufferSize, void* *allocatedBuffer)
+        {
+            void *buf = av_malloc(bufferSize + AV_INPUT_BUFFER_PADDING_SIZE);
+            if (!buf)
+                return E_OUTOFMEMORY;
+            *allocatedBuffer = buf;
+            return S_OK;
+        }
+        virtual HRESULT STDMETHODCALLTYPE ReleaseBuffer(void* buffer)
+        {
+            av_free(buffer);
+            return S_OK;
+        }
+        virtual HRESULT STDMETHODCALLTYPE Commit() { return S_OK; }
+        virtual HRESULT STDMETHODCALLTYPE Decommit() { return S_OK; }
+
+        // IUnknown methods
+        virtual HRESULT STDMETHODCALLTYPE QueryInterface(REFIID iid, LPVOID *ppv) { return E_NOINTERFACE; }
+        virtual ULONG   STDMETHODCALLTYPE AddRef(void) { return ++_refs; }
+        virtual ULONG   STDMETHODCALLTYPE Release(void)
+        {
+            int ret = --_refs;
+            if (!ret)
+                delete this;
+            return ret;
+        }
+
+private:
+        std::atomic<int>  _refs;
+};
+
 extern "C" {
 static void decklink_object_free(void *opaque, uint8_t *data)
 {
@@ -924,6 +965,7 @@ av_cold int ff_decklink_read_header(AVFormatContext *avctx)
 {
     struct decklink_cctx *cctx = (struct decklink_cctx *)avctx->priv_data;
     struct decklink_ctx *ctx;
+    class decklink_allocator *allocator;
     AVStream *st;
     HRESULT result;
     char fname[1024];
@@ -1017,6 +1059,14 @@ av_cold int ff_decklink_read_header(AVFormatContext *avctx)
     ctx->input_callback = new decklink_input_callback(avctx);
     ctx->dli->SetCallback(ctx->input_callback);
 
+    allocator = new decklink_allocator();
+    ret = (ctx->dli->SetVideoInputFrameMemoryAllocator(allocator) == S_OK ? 0 : AVERROR_EXTERNAL);
+    allocator->Release();
+    if (ret < 0) {
+        av_log(avctx, AV_LOG_ERROR, "Cannot set custom memory allocator\n");
+        goto error;
+    }
+
     if (mode_num == 0 && !cctx->format_code) {
         if (decklink_autodetect(cctx) < 0) {
             av_log(avctx, AV_LOG_ERROR, "Cannot Autodetect input stream or No signal\n");
diff --git a/libavdevice/decklink_common.h b/libavdevice/decklink_common.h
index 57ee7d1d68..f416134b8a 100644
--- a/libavdevice/decklink_common.h
+++ b/libavdevice/decklink_common.h
@@ -56,7 +56,6 @@ struct decklink_ctx {
     IDeckLinkConfiguration *cfg;
     IDeckLinkAttributes *attr;
     decklink_output_callback *output_callback;
-    decklink_input_callback *input_callback;
 
     /* DeckLink mode information */
     BMDTimeValue bmd_tb_den;
diff --git a/libavdevice/decklink_dec.cpp b/libavdevice/decklink_dec.cpp
index 897fca1003..974ee1d94c 100644
--- a/libavdevice/decklink_dec.cpp
+++ b/libavdevice/decklink_dec.cpp
@@ -596,8 +596,7 @@ public:
         virtual HRESULT STDMETHODCALLTYPE VideoInputFrameArrived(IDeckLinkVideoInputFrame*, IDeckLinkAudioInputPacket*);
 
 private:
-        ULONG           m_refCount;
-        pthread_mutex_t m_mutex;
+        std::atomic<int>  _refs;
         AVFormatContext *avctx;
         decklink_ctx    *ctx;
         int no_video;
@@ -605,42 +604,30 @@ private:
         int64_t initial_audio_pts;
 };
 
-decklink_input_callback::decklink_input_callback(AVFormatContext *_avctx) : m_refCount(0)
+decklink_input_callback::decklink_input_callback(AVFormatContext *_avctx) : _refs(1)
 {
     avctx = _avctx;
     decklink_cctx       *cctx = (struct decklink_cctx *)avctx->priv_data;
     ctx = (struct decklink_ctx *)cctx->ctx;
     no_video = 0;
     initial_audio_pts = initial_video_pts = AV_NOPTS_VALUE;
-    pthread_mutex_init(&m_mutex, NULL);
 }
 
 decklink_input_callback::~decklink_input_callback()
 {
-    pthread_mutex_destroy(&m_mutex);
 }
 
 ULONG decklink_input_callback::AddRef(void)
 {
-    pthread_mutex_lock(&m_mutex);
-    m_refCount++;
-    pthread_mutex_unlock(&m_mutex);
-
-    return (ULONG)m_refCount;
+    return ++_refs;
 }
 
 ULONG decklink_input_callback::Release(void)
 {
-    pthread_mutex_lock(&m_mutex);
-    m_refCount--;
-    pthread_mutex_unlock(&m_mutex);
-
-    if (m_refCount == 0) {
+    int ret = --_refs;
+    if (!ret)
         delete this;
-        return 0;
-    }
-
-    return (ULONG)m_refCount;
+    return ret;
 }
 
 static int64_t get_pkt_pts(IDeckLinkVideoInputFrame *videoFrame,
@@ -966,6 +953,7 @@ av_cold int ff_decklink_read_header(AVFormatContext *avctx)
     struct decklink_cctx *cctx = (struct decklink_cctx *)avctx->priv_data;
     struct decklink_ctx *ctx;
     class decklink_allocator *allocator;
+    class decklink_input_callback *input_callback;
     AVStream *st;
     HRESULT result;
     char fname[1024];
@@ -1056,8 +1044,13 @@ av_cold int ff_decklink_read_header(AVFormatContext *avctx)
         goto error;
     }
 
-    ctx->input_callback = new decklink_input_callback(avctx);
-    ctx->dli->SetCallback(ctx->input_callback);
+    input_callback = new decklink_input_callback(avctx);
+    ret = (ctx->dli->SetCallback(input_callback) == S_OK ? 0 : AVERROR_EXTERNAL);
+    input_callback->Release();
+    if (ret < 0) {
+        av_log(avctx, AV_LOG_ERROR, "Cannot set input callback\n");
+        goto error;
+    }
 
     allocator = new decklink_allocator();
     ret = (ctx->dli->SetVideoInputFrameMemoryAllocator(allocator) == S_OK ? 0 : AVERROR_EXTERNAL);
-- 
2.16.3
