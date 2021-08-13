class Ffmprovisr < Formula
  desc "Repository of useful FFmpeg command-lines for archivists"
  homepage "https://github.com/amiaopensource/ffmprovisr"
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2021-08-14.tar.gz"
  version "2021-08-14"
  sha256 "97dd1a200eba9e1d4f7f00299eae07d5526460218bb4fd53ee29419722ddefc9"

  def install
    bin.install "scripts/ffmprovisr"
    prefix.install "css", "img", "js", "scripts", "code_of_conduct.md", "index.html", "readme.md"
  end
end
