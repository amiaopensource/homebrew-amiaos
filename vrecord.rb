class Vrecord < Formula
  desc "Capturing a video signal and turning it into a digital file"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/v2020-08-05.tar.gz"
  version "2020-08-05"
  sha256 "77162d2950397a10e51602478cd9b0dba910c673e83a71e66019fb064f3445b2"
  head "https://github.com/amiaopensource/vrecord.git"

  depends_on "amiaopensource/amiaos/deckcontrol"
  depends_on "amiaopensource/amiaos/ffmpegdecklink"
  depends_on "amiaopensource/amiaos/gtkdialog"
  depends_on "cowsay"

  on_macos do
    depends_on "bash"
    depends_on "gnuplot"
    depends_on "mediaconch"
    depends_on "mkvtoolnix"
    depends_on "mpv"
    depends_on "qcli"
    depends_on "xmlstarlet"
  end

  on_linux do
    def caveats
      <<~EOS
        ** IMPORTANT FOR LINUX INSTALL **
        Additional install steps are necessary for a fully functioning Vrecord
        install on Linux. This includes using the standard package manager to
        install gnuplot, xmlstarlet, mkvtoolnix and mediaconch. Additionally,
        it often is necessary to remove the Homebrew installed version of SDL2
        to prevent conflicts. For more information please see:
        https://github.com/amiaopensource/vrecord/blob/master/Resources/Documentation/linux_installation.md
      EOS
    end
  end

  def install
    bin.install "vrecord"
    bin.install "vtest"
    prefix.install "Resources/audio_mode.gif"
    prefix.install "Resources/qcview.lua"
    prefix.install "Resources/vrecord_policy_ffv1.xml"
    prefix.install "Resources/vrecord_policy_uncompressed.xml"
    prefix.install "Resources/vrecord_logo.png"
    prefix.install "Resources/vrecord_logo_playback.png"
    prefix.install "Resources/vrecord_logo_audio.png"
    prefix.install "Resources/vrecord_logo_edit.png"
    prefix.install "Resources/vrecord_logo_help.png"
    prefix.install "Resources/vrecord_logo_documentation.png"
    man1.install "vrecord.1"
    man1.install "vtest.1"
  end

  test do
    system "#{bin}/vrecord", "-h"
  end
end
