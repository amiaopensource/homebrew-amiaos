class Lenticular < Formula
  desc "Digital restoration of lenticular colours"
  homepage "https://github.com/amiaopensource/lenticular"
  url "https://github.com/amiaopensource/lenticular/archive/v2018-05-21.tar.gz"
  version "2018-05-21"
  sha256 "b8a45a88a0790c648d992be72d83f218fe5ffaff54617b6e738e124a29a65fc1"
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
