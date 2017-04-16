class Qctools < Formula
  desc "Quality control archival video via libavfilter."
  homepage "https://bavc.org/preserve-media/preservation-tools"
  url "https://github.com/bavc/qctools/archive/v0.8-1.tar.gz"
  sha256 "53f79d2d379a39cb0b568958daa07e071117058f72ac24ad63a8a8cf7f55f1ef"
  head "https://github.com/bavc/qctools.git"
  version "0.8"
  revision 1

  depends_on "pkg-config" => :build
  depends_on "amiaopensource/amiaos/qwt-qt5"
  depends_on "qt"
  depends_on "freetype"
  depends_on "ffmpeg" => ["with-freetype"]

  def install
    ENV["QCTOOLS_USE_BREW"]="true"
    path = ENV["PATH"]
    ENV["PATH"] = "#{path}:#{HOMEBREW_PREFIX}/bin"

    cd "Project/QtCreator" do
      cd "qctools-lib"
      system "qmake", "qctools-lib.pro"
      system "make"
      cd "../qctools-gui"
      system "qmake", "qctools-gui.pro"
      system "make"
      cd ".."
      prefix.install "qctools-gui/QCTools.app"
    end
  end
end
