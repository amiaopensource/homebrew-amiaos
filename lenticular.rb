class Lenticular < Formula
  desc "Digital Restoration of Lenticular Colours"
  homepage "https://github.com/amiaopensource/lenticular"
  url "https://github.com/amiaopensource/lenticular/archive/v2018-02-12.tar.gz"
  version "2018-02-12"
  sha256 "65696d8d859a4ae7fd3818d02b145937ba44f7809c45f0cdaed2a4577b9eb8c4"
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
