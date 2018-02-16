class Lenticular < Formula
  desc "Digital Restoration of Lenticular Colours"
  homepage "https://github.com/amiaopensource/lenticular"
  url "https://github.com/amiaopensource/lenticular/archive/v2018-02-16.tar.gz"
  version "2018-02-16"
  sha256 "f9c06d594ba65bc49af1aa09f0691a789a7f0a27c8512388082bc26e8f8ed4d8"
  head "https://github.com/amiaopensource/lenticular.git"

  option "with-frameCropper", "Add the 'frameCropper' tool"
  option "with-inStudy", "Add the 'inStudy' tool"

  def install
    cd "lenticular" do
      system "make"
      bin.install "doLCE"
      bin.install "frameCropper" if build.with? "frameCropper"
      bin.install "inStudy" if build.with? "inStudy"
    end
  end
end
