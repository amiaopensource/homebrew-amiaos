class Ffmprovisr < Formula
  desc "Repository of useful FFmpeg command-lines for archivists"
  homepage "https://github.com/amiaopensource/ffmprovisr"
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2020-07-19.tar.gz"
  version "2020-07-19"
  sha256 "3215d0e746c170f65b9e019ee6538b183cd2c0207e7a1ce8043f2f0bfb7e2d35"

  def install
    bin.install "scripts/ffmprovisr"
    prefix.install "css", "img", "js", "scripts", "code_of_conduct.md", "index.html", "readme.md"
  end
end
