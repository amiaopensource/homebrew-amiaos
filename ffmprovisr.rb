class Ffmprovisr < Formula
  desc "Repository of useful FFmpeg command-lines for archivists"
  homepage "https://github.com/amiaopensource/ffmprovisr"
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2019-12-21.tar.gz"
  version "2019-12-21"
  sha256 "79311267f9904d14581ae7c529db968ecbe6784ebb7d3386e852d12424dd6247"

  bottle :unneeded

  def install
    bin.install "scripts/ffmprovisr"
    prefix.install "css", "img", "js", "scripts", "code_of_conduct.md", "index.html", "readme.md"
  end
end
