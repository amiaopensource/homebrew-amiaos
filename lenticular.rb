class Lenticular < Formula
  desc "Digital Restoration of Lenticular Colours"
  homepage "https://github.com/amiaopensource/lenticular"
  url "https://github.com/amiaopensource/lenticular/archive/v2018-02-24.tar.gz"
  version "2018-02-24"
  sha256 "61b85d6a98c86f417dad0ee7977d6bdb4c0d07b9fe8a24707424a9f533e6fee4"
  head "https://github.com/amiaopensource/lenticular.git"

  option "with-frameCropper", "Install 'frameCropper' tool"
  option "with-inStudy", "Install 'inStudy' tool"

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
