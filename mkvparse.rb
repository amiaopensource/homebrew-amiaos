class Mkvparse < Formula
  desc "Simple Matroska (MKV) parser"
  homepage "https://github.com/vi/mkvparse"
  url "https://github.com/vi/mkvparse/archive/v1.1.0.tar.gz"
  sha256 "9884666af60cdae4fc5f1bec0ef6fd4740827d15b09a4c346b7828c5cf36c1cf"
  head "https://github.com/vi/mkvparse.git"

  def install
    bin.install "mkv2xml"
    bin.install "xml2mkv"
    bin.install "mkvparse.py"
  end
end
