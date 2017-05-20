class Ffmprovisr < Formula
  desc "Repository of useful FFmpeg command lines for archivists"
  homepage "https://github.com/amiaopensource/ffmprovisr"
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2017-05-20.tar.gz"
  sha256 "347d1b4ee4ce37c912345395362e13a564499bbdbfc02d775af387b8af9ceb88"
  version "2017-05-20"

  def install
    bin.install "scripts/ffmprovisr"
    prefix.install "css", "img", "js", "scripts", "code_of_conduct.md", "index.html", "readme.md"
  end
end
