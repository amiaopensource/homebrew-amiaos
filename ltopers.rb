require 'formula'

class Ltopers < Formula
  homepage 'https://github.com/amiaopensource/ltopers'
  url 'https://github.com/amiaopensource/ltopers/archive/v0.1.15.tar.gz'
  sha256 'b581949c8308739d6364e92fb290f69ad4186d6fa562d23be4bb6abda03a6a8f'
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
