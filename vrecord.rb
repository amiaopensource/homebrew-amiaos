class Vrecord < Formula
  desc "Capturing a video signal and turning it into a digital file"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/v2018-12-13.tar.gz"
  version "2018-12-13"
  sha256 "479ef8bea1e7b2dadcea9ac929496457223df0844c4251a1d99f2bdf2e218f12"
  head "https://github.com/amiaopensource/vrecord.git"
  revision 1

  bottle :unneeded

  depends_on "amiaopensource/amiaos/decklinksdk"
  depends_on "amiaopensource/amiaos/ffmpegdecklink"
  depends_on "amiaopensource/amiaos/gtkdialog"
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
    prefix.install "Resources/qcview.lua"
    prefix.install "Resources/vrecord_policy_ffv1.xml"
    prefix.install "Resources/vrecord_policy_uncompressed.xml"
    prefix.install "Resources/vrecord_logo.png"
    prefix.install "Resources/vrecord logo.png"
    prefix.install "Resources/vrecord logo playback.png"
    prefix.install "Resources/vrecord logo audio.png"
    prefix.install "Resources/vrecord logo edit.png"
    prefix.install "Resources/vrecord logo help.png"
    prefix.install "Resources/vrecord logo documentation.png"
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
  end

  test do
    system "#{bin}/vrecord", "-h"
  end
end
