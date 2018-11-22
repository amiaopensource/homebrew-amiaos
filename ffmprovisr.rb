class Ffmprovisr < Formula
  desc "Repository of useful FFmpeg command-lines for archivists"
  homepage "https://github.com/amiaopensource/ffmprovisr"
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2018-11-22.tar.gz"
  version "2018-11-22"
  sha256 "83352e7fc2cc846667df47794653a1f394333ccc4b827af49e5a8806f7bf5f5a"

  bottle :unneeded

  def install
    bin.install "scripts/ffmprovisr"
    prefix.install "css", "img", "js", "scripts", "code_of_conduct.md", "index.html", "readme.md"
  end
end
