require 'formula'

class Ltopers < Formula
  homepage 'https://github.com/amiaopensource/ltopers'
  url 'https://github.com/amiaopensource/ltopers/archive/v0.1.13.tar.gz'
  sha256 '33aaee18097e2bae99d7668a7f3086b17a5ab774ebedf1f6992fed477770ab1f'
  head 'git://github.com/amiaopensource/ltopers.git'

  depends_on 'coreutils'
  depends_on 'xmlstarlet'
  depends_on 'mediamicroservices/mm/mm'

  def install
    bin.install "formatlto"
    bin.install "mountlto"
    bin.install "writelto"
    bin.install "renameschemas"
    bin.install "indexschemas"
    bin.install "collectionchecksum"
    bin.install "verifylto"
    bin.install "ingestschemas"
    bin.install "searchlto"
    bin.install "ingestcollectionchecksum"
    bin.install "readlto"
  end
end
