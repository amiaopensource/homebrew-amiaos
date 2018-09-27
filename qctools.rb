class Qctools < Formula
  desc "Quality control archival video via libavfilter"
  homepage "https://bavc.org/preserve-media/preservation-tools"
  url "https://github.com/bavc/qctools/archive/v1.0.tar.gz"
  sha256 "4b687eb9aedf29a8262393079669d3870c04b510669b9df406021243b8ebd918"
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
      puts "To create a link in the Application folder, run:"
      puts "  ln -Fs `find /usr/local -name QCTools.app` /Applications/QCTools.app"
    end
  end
end
