class Vrecord < Formula
  desc "Capturing a video signal and turning it into a digital file"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/refs/tags/v2023-03-01.tar.gz"
  version "2023-03-01"
  sha256 "d7a6de526f8cf992a24e1456d3935b3a938e5f8220abc09c722a1da9608e8e5e"
  revision 2
  head "https://github.com/amiaopensource/vrecord.git"

  depends_on "amiaopensource/amiaos/ffmpegdecklink"
  depends_on "cowsay"
  depends_on "gtkdialog"

  on_macos do
    depends_on "amiaopensource/amiaos/deckcontrol"
    depends_on "bash"
    depends_on "gnuplot" unless MacOS.version < :mojave
    depends_on "mediaarea/mediaarea/dvrescue"
    depends_on "mediaconch"
    depends_on "mkvtoolnix" unless MacOS.version < :mojave
    depends_on "mpv" unless MacOS.version < :mojave
    depends_on "qcli" unless MacOS.version < :mojave
    depends_on "xmlstarlet"
    if MacOS.version < :mojave
      def caveats
        <<~EOS
          ** IMPORTANT FOR macOS INSTALL **
          Additional install steps are necessary for a fully functioning Vrecord
          install on macOS. Vrecord uses gnuplot, mkvtoolnix, mpv, and qcli for
          some optional (though sometimes recommeded) features steps such as
          embedding logs into Matroska files and generating QCTools reports.
          These programs are automatically installed via homebrew if the Mac OS
          is Mojave or greater, else we recommend finding supported installers
          (for example mkvtoolnix via
          https://mkvtoolnix.download/macos/MKVToolNix-46.0.0.dmg) or consider
          updating your version of macOS.
        EOS
      end
    end
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
    prefix.install "Resources/dvrecord.png"
    prefix.install "Resources/qcview.lua"
    prefix.install "Resources/vrecord_functions"
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
