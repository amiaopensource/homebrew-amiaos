class Qctools < Formula
  desc "Quality control archival video via libavfilter."
  homepage "https://bavc.org/preserve-media/preservation-tools"
  url "https://github.com/bavc/qctools/archive/v0.8.tar.gz"
  sha256 "ad8dc56465db2d03dd804ef0d322d04a24cd9bcd2daba95d7f2aca789cc8a6aa"
  head "https://github.com/bavc/qctools.git"

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
