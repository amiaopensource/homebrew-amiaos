class Mpv < Formula
  # based upon the last version of homebrew-core/Formula/mpv.rb at https://github.com/Homebrew/homebrew-core/commit/41444d526c40b93069b7f0c5414539deb0534179
  desc "Media player based on MPlayer and mplayer2"
  homepage "https://mpv.io"
  url "https://github.com/amiaopensource/mpv/archive/refs/tags/2019-10-31.tar.gz"
  sha256 "3a76046fee81383d503ff1aca6668dd28d9f2c74b3aa08e7d73c403deb092676"
  head "https://github.com/mpv-player/mpv.git"

  depends_on "docutils" => :build
  depends_on "pkg-config" => :build
  depends_on "python@3.8" => :build

  depends_on "ffmpeg"
  depends_on "jpeg"
  depends_on "libarchive"
  depends_on "libass"
  depends_on "little-cms2"
  depends_on "lua@5.3"
  depends_on "mujs"
  depends_on "uchardet"
  depends_on "vapoursynth"
  depends_on "youtube-dl"

  def install
    # LANG is unset by default on macOS and causes issues when calling getlocale
    # or getdefaultlocale in docutils. Force the default c/posix locale since
    # that's good enough for building the manpage.
    ENV["LC_ALL"] = "C"

    args = %W[
      --prefix=#{prefix}
      --enable-html-build
      --enable-javascript
      --enable-libmpv-shared
      --enable-lua
      --enable-libarchive
      --enable-uchardet
      --confdir=#{etc}/mpv
      --datadir=#{pkgshare}
      --mandir=#{man}
      --docdir=#{doc}
      --zshdir=#{zsh_completion}
    ]

    system "./bootstrap.py"
    system "python3", "waf", "configure", *args
    system "python3", "waf", "install"

    system "python3", "TOOLS/osxbundle.py", "build/mpv"
    prefix.install "build/mpv.app"
  end

  def caveats
    if File.exist?("/usr/local/Caskroom/mpv")
      <<~EOS
        Warning: A brew cask installation of MPV was detected, so this version may not
        be linked. To uninstall cask version and link this version run the command:
        brew cask uninstall mpv && brew link mpv
      EOS
    end
  end

  test do
    system bin/"mpv", "--ao=null", test_fixtures("test.wav")
  end
end
