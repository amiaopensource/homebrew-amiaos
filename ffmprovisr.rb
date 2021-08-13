class Ffmprovisr < Formula
  desc "Repository of useful FFmpeg command-lines for archivists"
  homepage "https://github.com/amiaopensource/ffmprovisr"
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2021-08-13.tar.gz"
  version "2021-08-13"
  sha256 "a15ad7701a2818dbf32ebd2e9d947585a2819676c25c4323b807dab1ec70d8f9"

  def install
    bin.install "scripts/ffmprovisr"
    prefix.install "css", "img", "js", "scripts", "code_of_conduct.md", "index.html", "readme.md"
  end
end
