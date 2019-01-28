class Lenticular < Formula
  desc "Digital restoration of lenticular colours"
  homepage "https://github.com/amiaopensource/lenticular"
  url "https://github.com/amiaopensource/lenticular/archive/v2019-01-27.tar.gz"
  version "2019-01-27"
  sha256 "831a397ecf8080395ac69374bc38ce2a305845cc057a5ef8c93caa3f148bff44"
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
