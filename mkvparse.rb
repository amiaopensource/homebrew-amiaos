class Mkvparse < Formula
  desc "Simple Matroska (MKV) parser"
  homepage "https://github.com/vi/mkvparse"
  url "https://github.com/vi/mkvparse/archive/v1.2.0.tar.gz"
  sha256 "951282e3ffade95f5d9951d792578098616c1009264ea7cbd6178f1727ef406d"
  head "https://github.com/vi/mkvparse.git"

  def install
    bin.install "mkv2xml"
    bin.install "xml2mkv"
    bin.install "mkvparse.py"
  end
end
