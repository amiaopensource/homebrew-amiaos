class Ffmpegdecklink < Formula
  desc "FFmpeg with --enable-decklink"
  homepage "https://ffmpeg.org/"
  url "https://ffmpeg.org/releases/ffmpeg-4.2.2.tar.xz"
  sha256 "cb754255ab0ee2ea5f66f8850e1bd6ad5cac1cd855d0a2f4990fb8c668b0d29c"
  revision 1
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
index af8fe31367..5ee2f0a1bc 100644
--- a/libavdevice/avfoundation.m
+++ b/libavdevice/avfoundation.m
@@ -496,7 +496,7 @@ static int add_video_device(AVFormatContext *s, AVCaptureDevice *video_device)
 
         [ctx->video_output setVideoSettings:capture_dict];
     }
-    [ctx->video_output setAlwaysDiscardsLateVideoFrames:YES];
+    [ctx->video_output setAlwaysDiscardsLateVideoFrames:NO];
 
     ctx->avf_delegate = [[AVFFrameReceiver alloc] initWithContext:ctx];
 
--
