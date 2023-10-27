class Ffmpegdecklink < Formula
  desc "FFmpeg with --enable-decklink"
  homepage "https://ffmpeg.org/"
  head "https://github.com/FFmpeg/FFmpeg.git", branch: "master"
  keg_only "anything that needs this will know where to look"

  stable do
    url "https://ffmpeg.org/releases/ffmpeg-6.0.tar.xz"
    sha256 "57be87c22d9b49c112b6d24bc67d42508660e6b718b3db89c44e47e289137082"

    # Fix for binutils, remove with `stable` block on next release
    # https://www.linuxquestions.org/questions/slackware-14/regression-on-current-with-ffmpeg-4175727691/
    patch do
      url "https://github.com/FFmpeg/FFmpeg/commit/effadce6c756247ea8bae32dc13bb3e6f464f0eb.patch?full_index=1"
      sha256 "9800c708313da78d537b61cfb750762bb8ad006ca9335b1724dbbca5669f5b24"
    end
  end

  option "with-iec61883", "Enable DV device (Linux)" if OS.linux?
  depends_on "nasm" => :build
  depends_on "pkg-config" => :build
  depends_on "texinfo" => :build

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

  # Fix for QtWebEngine, do not remove
  # https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=270209
  patch do
    url "https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/raw/5670ccd86d3b816f49ebc18cab878125eca2f81f/add-av_stream_get_first_dts-for-chromium.patch"
    sha256 "57e26caced5a1382cb639235f9555fc50e45e7bf8333f7c9ae3d49b3241d3f77"
  end

  def install
    # Apple's new linker leads to duplicate symbol
    ENV.append "LDFLAGS", "-Wl,-ld_classic" if DevelopmentTools.clang_build_version >= 1500

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
      --disable-htmlpages
    ]

    args << "--enable-neon" if OS.mac? && Hardware::CPU.arm?

    args << "--enable-libiec61883" if (build.with? "iec61883") && OS.linux?

    # decklink options
    args << "--enable-nonfree"
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
    assert_predicate mp4out, :exist?
  end
end
