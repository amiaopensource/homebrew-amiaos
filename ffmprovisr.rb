class Ffmprovisr < Formula
  desc "Repository of useful FFmpeg command-lines for archivists"
  homepage "https://github.com/amiaopensource/ffmprovisr"
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2020-05-14.tar.gz"
  version "2020-05-14"
  sha256 "96396a070ba1f8c3a01998be5ba6ced20d8f4474d5426b6d5e592134853547f1"

  def install
    bin.install "scripts/ffmprovisr"
    prefix.install "css", "img", "js", "scripts", "code_of_conduct.md", "index.html", "readme.md"
  end
end
