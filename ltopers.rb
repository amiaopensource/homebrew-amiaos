require 'formula'

class Ltopers < Formula
  homepage 'https://github.com/amiaopensource/ltopers'
  url 'https://github.com/amiaopensource/ltopers/archive/v0.1.14.tar.gz'
  sha256 'cf2942ae84984f5950c65c8f7a0f7a5fb538948bd1af32581025e0cc953118ff'
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
