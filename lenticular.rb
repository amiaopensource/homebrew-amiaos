class Lenticular < Formula
  desc "Digital Restoration of Lenticular Colours"
  homepage "https://github.com/amiaopensource/lenticular"
  url "https://github.com/amiaopensource/lenticular/archive/v2018-03-04.tar.gz"
  version "2018-03-04"
  sha256 "bfa7e0b1492684a9537966c078a2c775c16cb31325498f8911d5f126a6f3cbe2"
  revision 2
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
  end
end
