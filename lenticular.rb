class Lenticular < Formula
  desc "Digital Restoration of Lenticular Colours"
  homepage "https://github.com/amiaopensource/lenticular"
  url "https://github.com/amiaopensource/lenticular/archive/v2018-02-11.tar.gz"
  version "2018-02-11"
  sha256 "28170280b029debf36e0a941b4a043431f418db3388710ab2aa3005268a869e0"
  head "https://github.com/amiaopensource/lenticular.git"

  def install
    cd "lenticular" do
      system "make"
      bin.install "doLCE"
    end
  end
end
