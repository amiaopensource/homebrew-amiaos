class Qctools < Formula
  desc "Quality control archival video via libavfilter."
  homepage "https://bavc.org/preserve-media/preservation-tools"
  url "https://github.com/bavc/qctools/archive/v0.7.3.tar.gz"
  sha256 "e30dc3618598d7ad1fc663b5060dbaeadacfcb795378c7c4e579aa08ca9c6540"
  head "https://github.com/bavc/qctools.git"

  depends_on "pkg-config" => :build
  depends_on "amiaopensource/amiaos/qwt-qt5"
  depends_on "qt5"
  depends_on "decklinksdk"
  depends_on "ffmpeg"
  depends_on "freetype"

  def install
    ENV["QCTOOLS_USE_BREW"]="true"
    path = ENV["PATH"]
    ENV["PATH"] = "#{path}:#{HOMEBREW_PREFIX}/bin"
        
    cd "Project/QtCreator" do
      system "#{Formula["qt5"].bin}/qmake", "qctools.pro"
      system "make"
      prefix.install "qctools-gui/QCTools.app"
    end
  end
end
