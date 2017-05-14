class Qctools < Formula
  desc "Quality control archival video via libavfilter."
  homepage "https://bavc.org/preserve-media/preservation-tools"
  url "https://github.com/bavc/qctools/archive/v0.8.tar.gz"
  sha256 "5362dc8325aeb37e0742a5e5df7b831e7fe82a7b06c72c50463a43a7ad0b56bc"
  head "https://github.com/bavc/qctools.git"
  revision 3

  depends_on "pkg-config" => :build
  depends_on "amiaopensource/amiaos/qwt-qt5"
  depends_on "qt"
  depends_on "freetype"
  depends_on "ffmpeg" => ["with-freetype"]

  def install
    ENV["QCTOOLS_USE_BREW"]="true"

    cd "Project/QtCreator/qctools-lib" do
      system "qmake", "qctools-lib.pro"
      system "make"
    end
    cd "Project/QtCreator/qctools-gui" do
      system "qmake", "qctools-gui.pro"
      system "make"
      prefix.install "QCTools.app"
    end
  end
end
