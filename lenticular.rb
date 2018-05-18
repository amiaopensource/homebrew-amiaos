class Lenticular < Formula
  desc "Digital restoration of lenticular colours"
  homepage "https://github.com/amiaopensource/lenticular"
  url "https://github.com/amiaopensource/lenticular/archive/v2018-04-13.tar.gz"
  version "2018-04-13"
  sha256 "eaa7a2a8e1e8c7798c14ae14d797690e825f4f9606882d50a9236c643d0d5f68"
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
