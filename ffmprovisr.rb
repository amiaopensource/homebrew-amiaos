class Ffmprovisr < Formula
  desc "Repository of useful FFmpeg command lines for archivists"
  homepage "https://github.com/amiaopensource/ffmprovisr"
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2017-08-08.tar.gz"
  sha256 "bfb54caee41b7ab2e6728a72d32f41fa8e601230d78f6968a01a76bf729f32f9"
  version "2017-08-08"

  bottle :unneeded

  def install
    bin.install "scripts/ffmprovisr"
    prefix.install "css", "img", "js", "scripts", "code_of_conduct.md", "index.html", "readme.md"
  end
end
