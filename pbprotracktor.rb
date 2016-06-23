require 'formula'

class Pbprotracktor < Formula
  homepage 'https://github.com/amiaopensource/pbprotracktor'
  url "https://github.com/amiaopensource/pbprotracktor/archive/v20160623.tar.gz"
  sha256 "40665344a2cfdac6d4d785109ecf60f969856d6f271f4a47892199d3eef5df6f" 
  head 'https://github.com/amiaopensource/pbprotracktor.git'
  revision 1

  depends_on "postgresql"

  def install
     bin.install 'psql2pbcore.xsl'
     bin.install 'pbprotracktor'
  end
end
