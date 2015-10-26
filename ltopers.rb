require 'formula'

class Ltopers < Formula
  homepage 'https://github.com/amiaopensource/ltopers'
  url 'https://github.com/amiaopensource/ltopers/archive/v0.0.8.zip'
  sha256 '5f7bced428f230253a1bbba11d4ad08f1cdd293aae8626ab581718a77f271bb6'
  
  head 'git://github.com/amiaopensource/ltopers.git'

  depends_on 'xmlstarlet'

  def install
    bin.install "formatlto"
    bin.install "lto2filemaker"
    bin.install "ltoperconfig"
    bin.install "mountlto"
    bin.install "writelto"
    bin.install "ltofunctions"
    bin.install "renameschemas"
    bin.install "indexschemas"
  end
end
