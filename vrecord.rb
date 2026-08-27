class Vrecord < Formula
  desc "Capturing a video signal and turning it into a digital file"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/refs/tags/vrecord_v2026-08-27.tar.gz"
  sha256 "d1b792e1de18e2dafa8c5c9aabaedf997ff3af388859bf3d471c5a0d1ca1a4b5"
  head "https://github.com/amiaopensource/vrecord.git", branch: "main"

  depends_on "amiaopensource/amiaos/gtkdialog"
  depends_on "cowsay"
  depends_on "mediaarea/mediaarea/ffmpeg-ma"
  depends_on "mediaarea/mediaarea/timecodexml"
  depends_on "mediaconch"
  depends_on "mediainfo"

  on_macos do
    depends_on "amiaopensource/amiaos/deckcontrol"
    depends_on "bash"
    depends_on "gnuplot"
    depends_on "mediaarea/mediaarea/dvrescue"
    depends_on "mkvtoolnix"
    depends_on "mpv"
    depends_on "xmlstarlet"
  end

  on_linux do
    def caveats
      <<~EOS
        ** IMPORTANT FOR LINUX INSTALL **
        Additional install steps may be necessary for a fully functioning Vrecord
        install on Linux, particularly for some optional dependencies. For more information please see:
        https://github.com/amiaopensource/vrecord/blob/master/Resources/Documentation/linux_installation.md
      EOS
    end
  end

  def install
    bin.install "cchex_to_display"
    bin.install "vrecord"
    bin.install "vtest"
    prefix.install "Resources/audio_mode.gif"
    prefix.install "Resources/dvrecord.png"
    prefix.install "Resources/qcview.lua"
    prefix.install "Resources/vrecord_functions"
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
    system "bin/vrecord", "-h"
  end
end
