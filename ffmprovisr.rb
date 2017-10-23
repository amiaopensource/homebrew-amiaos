class Ffmprovisr < Formula
  desc "Repository of useful FFmpeg command-lines for archivists"
  homepage "https://github.com/amiaopensource/ffmprovisr"
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2017-10-23.tar.gz"
  version "2017-10-23"
  sha256 "03fec58ee55531746bfcd64af70708e265f58e974abe5480f514b721736f896a"

  bottle :unneeded

  def install
    bin.install "scripts/ffmprovisr"
    prefix.install "css", "img", "js", "scripts", "code_of_conduct.md", "index.html", "readme.md"
  end
end
