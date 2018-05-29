class Lenticular < Formula
  desc "Digital restoration of lenticular colours"
  homepage "https://github.com/amiaopensource/lenticular"
  url "https://github.com/amiaopensource/lenticular/archive/v2018-05-26.tar.gz"
  version "2018-05-26"
  sha256 "56b51d782b317df952070626c6fd693a7af18d1fa579b20f8bc02747f48fd4ec"
  head "https://github.com/amiaopensource/lenticular.git"

  option "with-framecropper", "Install frame-cropper tool"
  option "with-interpolationstudy", "Install interpolation-study tool"

  depends_on "libtiff"

  def install
    cd "lenticular" do
      system "make"
      bin.install "lenticular"
      bin.install "framecropper" if build.with? "framecropper"
      bin.install "interpolationstudy" if build.with? "interpolationstudy"
      man1.install "lenticular.1"
    end
  end

  test do
    system "#{bin}/lenticular"
    system "#{bin}/framecropper" if build.with? "framecropper"
    system "#{bin}/interpolationstudy" if build.with? "interpolationstudy"
  end
end
