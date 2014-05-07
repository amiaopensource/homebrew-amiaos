require 'formula'

class Ltopers < Formula
  homepage 'https://github.com/amiaopensource/ltopers'
  url 'http://github.com/amiaopensource/ltopers/archive/v0.0.1.tar.gz'
  md5 'b43dffc882249c42232ad0856fb1e0c1'
  
  head 'git://github.com/amiaopensource/ltopers.git'

  depends_on 'xmlstarlet'

  def install
    bin.install "formatlto"
    bin.install "lto2filemaker"
    bin.install "ltoperconfig"
    bin.install "mountlto"
    bin.install "writelto"
  end
end
