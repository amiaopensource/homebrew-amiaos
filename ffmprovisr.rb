class Ffmprovisr < Formula
  desc "Repository of useful FFmpeg command lines for archivists"
  homepage "https://github.com/amiaopensource/ffmprovisr"
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2017-07-15.tar.gz"
  sha256 "1270a1bd2dada7a7d267e001c2f15d753b8915a47b0562f93f8291f42c2dc82c"
  version "2017-07-15"

  bottle :unneeded

  def install
    bin.install "scripts/ffmprovisr"
    prefix.install "css", "img", "js", "scripts", "code_of_conduct.md", "index.html", "readme.md"
  end
end
