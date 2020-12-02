class Ffmprovisr < Formula
  desc "Repository of useful FFmpeg command-lines for archivists"
  homepage "https://github.com/amiaopensource/ffmprovisr"
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2020-12-02.tar.gz"
  version "2020-12-02"
  sha256 "b9bf16c4d6d62a7af47fc26c9f8d9e02ebf0ecc665396d8757845b212764f325"

  def install
    bin.install "scripts/ffmprovisr"
    prefix.install "css", "img", "js", "scripts", "code_of_conduct.md", "index.html", "readme.md"
  end
end
