class Qctools < Formula
  desc "Quality control archival video via libavfilter"
  homepage "https://bavc.org/preserve-media/preservation-tools"
  url "https://github.com/bavc/qctools/archive/v0.9.tar.gz"
  sha256 "19ef4be054ebfca70a07043afea20bcca241ba08d70a47acda837ead849aff03"
  head "https://github.com/bavc/qctools.git"

  depends_on "pkg-config" => :build
  depends_on "amiaopensource/amiaos/qwt-qt5"
  depends_on "qt"
  depends_on "freetype"
  depends_on "ffmpeg" => ["with-freetype"]

  def install
    ENV["QCTOOLS_USE_BREW"] = "true"
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
