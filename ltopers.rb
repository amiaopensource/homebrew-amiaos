require 'formula'

class Ltopers < Formula
  homepage 'https://github.com/amiaopensource/ltopers'
  url 'https://github.com/amiaopensource/ltopers/archive/v0.1.7.tar.gz'
  sha256 '9cdbc96f4c03ef4f694bb3149d51c890117f74ed5e0522c1673e218e71c2f2d7'
  head 'git://github.com/amiaopensource/ltopers.git'
  revision 3

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
  end
end
