class Vrecord < Formula
  desc "Capturing a video signal and turning it into a digital file"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/v2018-10-23.tar.gz"
  version "2018-10-23"
  sha256 "c4dd4e0161d9834abf65bc0d6d4b6b70ef782ba4301fa82258a901659169ff39"
  head "https://github.com/amiaopensource/vrecord.git"

  bottle :unneeded

  depends_on "amiaopensource/amiaos/decklinksdk"
  depends_on "amiaopensource/amiaos/ffmpegdecklink"
  depends_on "cowsay"
  depends_on "freetype"
  depends_on "mediaconch"
  depends_on "mkvtoolnix"
  depends_on "mpv"
  depends_on "qcli"
  depends_on "sdl"
  depends_on "xmlstarlet"

  def install
    bin.install "vrecord"
    bin.install "vtest"
    bin.install "qcview.lua"
    bin.install "vrecord_policy_ffv1.xml"
    bin.install "vrecord_policy_uncompressed.xml"
    prefix.install "vrecord_logo.png"
    man1.install "vrecord.1"
    man1.install "vtest.1"
  end

  def post_install
    if `brew ls -1 gnuplot 2>/dev/null | head -n1`.empty?
      puts "Warning: gnuplot is not installed"
      puts "consider running 'brew install gnuplot --without-lua'"
      puts "If gnuplot is installed, you'll receive extra quality control images along with your qctools report"
    else
      puts "gnuplot was found"
    end
    puts "Checking for dependency Pashua. If Pashua is not found will attempt to install"
    if File.exist? File.expand_path "/Applications/Pashua.app"
      puts "Pashua was found"
    elsif `brew cask ls --versions pashua 2>&1 | head -n1`.include? "Warning: pashua is not installed"
      puts "installing Pashua"
      system `echo 'brew install Caskroom/cask/pashua > /dev/null'`
    else
      puts "Pashua was found"
    end
  end

  test do
    system "#{bin}/vrecord", "-h"
  end
end
