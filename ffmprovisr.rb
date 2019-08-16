class Ffmprovisr < Formula
  desc "Repository of useful FFmpeg command-lines for archivists"
  homepage "https://github.com/amiaopensource/ffmprovisr"
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2019-08-01.tar.gz"
  version "2019-08-01"
  sha256 "3b4749d537ea0a62dda14a6f5f5d80a40cae3d3e76a367fa4ee7603b0255fc42"

  bottle :unneeded

  def install
    bin.install "scripts/ffmprovisr"
    prefix.install "css", "img", "js", "scripts", "code_of_conduct.md", "index.html", "readme.md"
  end
end
