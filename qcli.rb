class Qcli < Formula
  desc "report audiovisual metrics via libavfilter"
  homepage "https://bavc.org/preserve-media/preservation-tools"
  url "https://github.com/bavc/qctools/archive/v0.8-1.tar.gz"
  sha256 "53f79d2d379a39cb0b568958daa07e071117058f72ac24ad63a8a8cf7f55f1ef"
  head "https://github.com/bavc/qctools.git"
  version "0.1"
  revision 1

  depends_on "pkg-config" => :build
  depends_on "qwt"
  depends_on "qt"
  depends_on "ffmpeg"

  def install
    ENV["QCTOOLS_USE_BREW"]="true"
    path = ENV["PATH"]
    ENV["PATH"] = "#{path}:#{HOMEBREW_PREFIX}/bin"

    cd "Project/QtCreator" do
      cd "qctools-lib"
      system "qmake", "qctools-lib.pro"
      system "make"
      cd "../qctools-cli"
      system "qmake", "qctools-cli.pro"
      system "make"
      cd ".."
      bin.install "qctools-cli/qcli"
    end
  end

  test do
    # Create an example mp4 file
    mp4out = testpath/"video.mp4"
    system "ffmpeg", "-filter_complex", "testsrc=rate=1:duration=1", mp4out
    # Create a qcli report from the mp4
    qcliout = testpath/"video.mp4.qctools.xml.gz"
    system bin/"qcli", "-i", mp4out, "-o", qcliout
    assert qcliout.exist?
  end
end
