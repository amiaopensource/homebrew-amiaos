class Ffmprovisr < Formula
  desc "Repository of useful FFmpeg command lines for archivists"
  homepage "https://github.com/amiaopensource/ffmprovisr"
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2017-06-02.tar.gz"
  sha256 "940059e29127bf3bfd5d761c58ed22573512423147de464b735e476e8aeffbf9"
  version "2017-06-02"

  def install
    bin.install "scripts/ffmprovisr"
    prefix.install "css", "img", "js", "scripts", "code_of_conduct.md", "index.html", "readme.md"
  end
end
