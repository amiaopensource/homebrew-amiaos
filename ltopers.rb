require 'formula'

class Ltopers < Formula
  homepage 'https://github.com/amiaopensource/ltopers'
  url 'http://github.com/amiaopensource/ltopers/archive/v0.0.2.tar.gz'
  sha256 '62f812d308121fe4bd6cfdbcbefaa37b1068c6cee907ced4ed01f26b24c43394'
  
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
