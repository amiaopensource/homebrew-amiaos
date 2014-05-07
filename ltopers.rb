require 'formula'

class Ltopers < Formula
  homepage 'https://github.com/amiaopensource/ltopers'
  url 'http://github.com/amiaopensource/ltopers/archive/v0.0.1.tar.gz'
  sha256 '947463bcd99a07f9bab26b8c35c037f4ecc5a0d565aecd0d00c870f59e59b949'
  
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
