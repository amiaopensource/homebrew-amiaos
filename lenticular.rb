class Lenticular < Formula
  desc "Digital Reconstruction of Lenticular Colours"
  homepage "https://github.com/amiaopensource/lenticular"
  url "https://github.com/amiaopensource/lenticular/archive/v2018-02-10.tar.gz"
  version "2018-02-10"
  sha256 "d53caf0cbb1e55bb399345a5714898e1e4a491c9130c1eb0774b89447588fa18"
  head "https://github.com/amiaopensource/lenticular.git"

  def install
    cd "lenticular" do
      system "make", "clean"
      bin.install "doLCE"
    end
  end
end
