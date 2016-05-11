require 'formula'

class Ltopers < Formula
  homepage 'https://github.com/amiaopensource/ltopers'
  url 'https://github.com/amiaopensource/ltopers/archive/v0.1.0.zip'
  sha256 'fb18b21e12ec1f312e1d9c5c1b62845970cd7cd8fb60c43a8c0befdb2d8b0eda'
  
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
