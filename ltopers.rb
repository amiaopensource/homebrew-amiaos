require 'formula'

class Ltopers < Formula
  homepage 'https://github.com/amiaopensource/ltopers'
  url 'https://github.com/amiaopensource/ltopers/archive/v0.1.2.zip'
  sha256 '4b08ef199fecf4f4281df622b1646733fd1a1c563bd9711b22e72a3ecf556276'
  revision 1
  
  head 'git://github.com/amiaopensource/ltopers.git'

  depends_on 'xmlstarlet'
  depends_on 'mediamicroservices/mm/mm'

  def install
    bin.install "formatlto"
    bin.install "lto2filemaker"
    bin.install "ltoperconfig"
    bin.install "mountlto"
    bin.install "writelto"
    bin.install "renameschemas"
    bin.install "indexschemas"
    bin.install "collectionchecksum"
  end
end
