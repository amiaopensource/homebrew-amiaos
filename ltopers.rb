require 'formula'

class Ltopers < Formula
  homepage 'https://github.com/amiaopensource/ltopers'
  url 'https://github.com/amiaopensource/ltopers/archive/v0.1.10.tar.gz'
  sha256 'bb1ee66f5a9c7a1e3d07c16d0d0b2eb707bf475a4d4cf77941c2c62952cafc55'
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
  end
end
