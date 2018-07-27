class Ffmprovisr < Formula
  desc "Repository of useful FFmpeg command-lines for archivists"
  homepage "https://github.com/amiaopensource/ffmprovisr"
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2018-07-27.tar.gz"
  version "2018-07-27"
  sha256 "6ebd5cec45c944d236cbfb08e79a0da21d015e2dd079cfda4e7009f3e2434b16"

  bottle :unneeded

  def install
    bin.install "scripts/ffmprovisr"
    prefix.install "css", "img", "js", "scripts", "code_of_conduct.md", "index.html", "readme.md"
  end
end
