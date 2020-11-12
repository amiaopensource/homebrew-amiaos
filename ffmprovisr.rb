class Ffmprovisr < Formula
  desc "Repository of useful FFmpeg command-lines for archivists"
  homepage "https://github.com/amiaopensource/ffmprovisr"
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2020-11-12.tar.gz"
  version "2020-11-12"
  sha256 "73b04eaf174a2cac834afd470f7a69ee42d4a1a8d4353d57ec2b96971455fbf2"

  def install
    bin.install "scripts/ffmprovisr"
    prefix.install "css", "img", "js", "scripts", "code_of_conduct.md", "index.html", "readme.md"
  end
end
