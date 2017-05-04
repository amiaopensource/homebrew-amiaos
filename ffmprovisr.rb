class Ffmprovisr < Formula
  desc ""
  homepage ""
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2017-04-19.tar.gz"
  sha256 "4120fb650d35ab8fa8b96e6ec78740b3ade27249dd4193d858ffb1956a6098dc"

  def install
    bin.install 'scripts/ffmprovisr'
    prefix.install 'css', 'img', 'js', 'scripts', 'code_of_conduct.md', 'index.html', 'readme.md'
  end
end
