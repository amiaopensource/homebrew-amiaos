class Mkvparse < Formula
  desc "Simple Matroska (MKV) parser"
  homepage "https://github.com/vi/mkvparse"
  head "https://github.com/vi/mkvparse.git"

  def install
    bin.install "mkv2xml"
    bin.install "xml2mkv"
    bin.install "mkvparse.py"
  end
end
