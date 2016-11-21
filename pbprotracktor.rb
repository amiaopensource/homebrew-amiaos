require 'formula'

class Pbprotracktor < Formula
  homepage 'https://github.com/amiaopensource/pbprotracktor'
  url "https://github.com/amiaopensource/pbprotracktor/archive/v20161121.tar.gz"
  sha256 "8c4f1c368b5af5917c8462e807d9fded9062b2abd398e74da4910a136fe207fe" 
  head 'https://github.com/amiaopensource/pbprotracktor.git'
  revision 2

  depends_on "mysql"
  depends_on "postgresql"

  def install
     bin.install 'pbcore2resourcespace.xsl'
     bin.install 'psql2pbcore.xsl'
     bin.install 'pbprotracktor'
     bin.install 'prot2rs'
  end
end
