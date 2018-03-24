class Lenticular < Formula
  desc "Digital Restoration of Lenticular Colours"
  homepage "https://github.com/amiaopensource/lenticular"
  url "https://github.com/amiaopensource/lenticular/archive/v2018-03-24.tar.gz"
  version "2018-03-24"
  sha256 "ef12691c25d8301092e0576b934bf90def9a4a1a14a5c182b90c7807b8a984e3"
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
