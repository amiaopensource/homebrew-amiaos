class Ffmprovisr < Formula
  desc "Repository of useful FFmpeg command-lines for archivists"
  homepage "https://github.com/amiaopensource/ffmprovisr"
  url "https://github.com/amiaopensource/ffmprovisr/refs/tags/v2025-04-16.tar.gz"
  sha256 "6b01b95e483e8dbd4253bbf2cf4a23b75bdd0b895ab497c1c66c6b9fd17ad8e2"

  def install
    bin.install "scripts/ffmprovisr"
    prefix.install "css", "img", "js", "scripts", "code_of_conduct.md", "index.html", "readme.md"
  end
end
