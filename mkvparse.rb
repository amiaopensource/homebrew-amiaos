class Mkvparse < Formula
  desc "Simple Matroska (MKV) parser"
  homepage "https://github.com/vi/mkvparse"
  url "https://github.com/vi/mkvparse/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "4050de75adf58e16796de9f684d0b30409b0e231c21f4930985a4c57a7bb9f4c"
  license "MIT"
  head "https://github.com/vi/mkvparse.git"

  def install
    bin.install "mkv2xml"
    bin.install "xml2mkv"
    bin.install "mkvparse.py"
  end
end
