class Qcli < Formula
  desc "report audiovisual metrics via libavfilter"
  homepage "https://bavc.org/preserve-media/preservation-tools"
  head "https://github.com/bavc/qctools.git"

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
