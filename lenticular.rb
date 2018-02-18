class Lenticular < Formula
  desc "Digital Restoration of Lenticular Colours"
  homepage "https://github.com/amiaopensource/lenticular"
  url "https://github.com/amiaopensource/lenticular/archive/v2018-02-18.tar.gz"
  version "2018-02-18"
  sha256 "1c631ed4bf567e17fe997f17428a9e30524061906a6e6becc62a79417a44d27a"
  head "https://github.com/amiaopensource/lenticular.git"

  option "with-frameCropper", "Add the 'frameCropper' tool"
  option "with-inStudy", "Add the 'inStudy' tool"

  def install
    cd "lenticular" do
      system "make"
      bin.install "doLCE"
      bin.install "frameCropper" if build.with? "frameCropper"
      bin.install "inStudy" if build.with? "inStudy"
      man1.install "lenticular.1"
    end
  end
end
