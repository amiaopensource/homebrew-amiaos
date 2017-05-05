class Ffmprovisr < Formula
  desc ""
  homepage ""
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2017-05-05.tar.gz"
  sha256 "914952725bcf481174ffb1b7c2915eede7d2162de4e2c6d884faf4e10b8f93f8"

  def install
    bin.install 'scripts/ffmprovisr'
    prefix.install 'css', 'img', 'js', 'scripts', 'code_of_conduct.md', 'index.html', 'readme.md'
  end
end
