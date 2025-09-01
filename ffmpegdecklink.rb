class Ffmpegdecklink < Formula
  desc "FFmpeg with --enable-decklink"
  homepage "https://ffmpeg.org/"
  url "https://ffmpeg.org/releases/ffmpeg-8.0.tar.xz"
  sha256 "b2751fccb6cc4c77708113cd78b561059b6fa904b24162fa0be2d60273d27b8e"
  head "https://github.com/FFmpeg/FFmpeg.git", branch: "master"
  keg_only "anything that needs this will know where to look"

  option "with-iec61883", "Enable DV device (Linux)" if OS.linux?
  depends_on "nasm" => :build
  depends_on "pkg-config" => :build
  depends_on "texinfo" => :build

  depends_on "amiaopensource/amiaos/decklinksdk"
  depends_on "fontconfig"
  depends_on "freetype"
  depends_on "harfbuzz"
  depends_on "lame"
  depends_on "libvorbis"
  depends_on "libvpx"
  depends_on "openh264"
  depends_on "openjpeg"
  depends_on "opus"
  depends_on "sdl2"
  depends_on "snappy"
  depends_on "theora"
  depends_on "xz"

  def install
    args = %W[
      --prefix=#{prefix}
      --disable-shared
      --enable-version3
      --cc=#{ENV.cc}
      --host-cflags=#{ENV.cflags}
      --host-ldflags=#{ENV.ldflags}
      --disable-gpl
      --enable-libfreetype
      --enable-libharfbuzz
      --enable-libmp3lame
      --enable-libopenh264
      --enable-libopenjpeg
      --enable-libopus
      --enable-libsnappy
      --enable-libtheora
      --enable-libvorbis
      --enable-libvpx
      --enable-libfontconfig
      --disable-htmlpages
      --disable-libjack
      --disable-indev=jack
    ]

    args << "--enable-neon" if OS.mac? && Hardware::CPU.arm?

    args << "--enable-libiec61883" if (build.with? "iec61883") && OS.linux?

    # decklink options
    args << "--enable-decklink"
    args << "--extra-cflags=-I#{HOMEBREW_PREFIX}/include"
    args << "--extra-ldflags=-L#{HOMEBREW_PREFIX}/include"
    mv "VERSION", "VERSION.txt"

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
    assert_path_exists mp4out
  end
end
