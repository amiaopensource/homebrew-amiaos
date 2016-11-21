require 'formula'

class Pbprotracktor < Formula
  homepage 'https://github.com/amiaopensource/pbprotracktor'
  url "https://github.com/amiaopensource/pbprotracktor/archive/v20161121.tar.gz"
  sha256 "b4b51433b503359f7b1eafdd7a9545d2774ffa5ac6d460c1de5de39f0e6b35bc" 
  head 'https://github.com/amiaopensource/pbprotracktor.git'

  depends_on "postgresql"

  def install
     bin.install 'psql2pbcore.xsl'
     bin.install 'pbprotracktor'
     bin.install 'prot2rs'
  end
end
