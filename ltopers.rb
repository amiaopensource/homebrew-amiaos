require 'formula'

class Ltopers < Formula
  homepage 'https://github.com/amiaopensource/ltopers'
  url 'https://github.com/amiaopensource/ltopers/archive/v0.0.9.zip'
  sha256 '93b792bb826abc04b2bf15431c31dfa502e053867cc1da948f70542728bf9e49'
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
  end
end
