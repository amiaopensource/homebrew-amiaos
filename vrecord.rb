class Vrecord < Formula
  desc "Capturing a video signal and turning it into a digital file"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/v2019-07-22.tar.gz"
  version "2019-07-22"
  sha256 "534e9daff42c95e300969e840b278a91ada3db739220bf67bd989834298bd11c"
  revision 1
  head "https://github.com/amiaopensource/vrecord.git"

  bottle :unneeded

  depends_on "amiaopensource/amiaos/decklinksdk"
  depends_on "amiaopensource/amiaos/ffmpegdecklink"
  depends_on "amiaopensource/amiaos/gtkdialog"
  depends_on "cowsay"
  depends_on "freetype"
  depends_on "gnuplot"
  depends_on "mediaconch"
  depends_on "mkvtoolnix"
  depends_on "qcli"
  depends_on "sdl"
  depends_on "xmlstarlet"

  def install
    bin.install "vrecord"
    bin.install "vtest"
    prefix.install "Resources/qcview.lua"
    prefix.install "Resources/vrecord_policy_ffv1.xml"
    prefix.install "Resources/vrecord_policy_uncompressed.xml"
    prefix.install "Resources/vrecord logo.png"
    prefix.install "Resources/vrecord logo playback.png"
    prefix.install "Resources/vrecord logo audio.png"
    prefix.install "Resources/vrecord logo edit.png"
    prefix.install "Resources/vrecord logo help.png"
    prefix.install "Resources/vrecord logo documentation.png"
    man1.install "vrecord.1"
    man1.install "vtest.1"
  end

  def caveats; <<~EOS
    For full use of vrecord, the program mpv must be installed.
    The mpv install formula has been removed from core Homebrew,
    but mpv can be installed via Homebrew Cask with the following
    commands:
      brew uninstall mpv (use if there is a prior install of mpv
                          that was installed with Homebrew core)
      brew cask install mpv
  EOS
  end

  test do
    system "#{bin}/vrecord", "-h"
  end
end
