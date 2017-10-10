class Ffmprovisr < Formula
  desc "Repository of useful FFmpeg command-lines for archivists"
  homepage "https://github.com/amiaopensource/ffmprovisr"
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2017-10-10.tar.gz"
  version "2017-10-10"
  sha256 "a3d61beaba37e3d1b01d5a4a865a5cd2bc7dfc41d0fdd4b5dbfc987fbf889ca3"

  bottle :unneeded

  def install
    bin.install "scripts/ffmprovisr"
    prefix.install "css", "img", "js", "scripts", "code_of_conduct.md", "index.html", "readme.md"
  end
end
