class Ffmprovisr < Formula
  desc "Repository of useful FFmpeg command-lines for archivists"
  homepage "https://github.com/amiaopensource/ffmprovisr"
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2017-10-13.tar.gz"
  version "2017-10-13"
  sha256 "c8b22dd19f6f4b3f7fc06279e4e8dba80e32d20f96b6e9ce92eae72cae0393bc"

  bottle :unneeded

  def install
    bin.install "scripts/ffmprovisr"
    prefix.install "css", "img", "js", "scripts", "code_of_conduct.md", "index.html", "readme.md"
  end
end
