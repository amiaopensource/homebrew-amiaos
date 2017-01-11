require 'formula'

class Pbprotracktor < Formula
  homepage 'https://github.com/amiaopensource/pbprotracktor'
  url "https://github.com/amiaopensource/pbprotracktor/archive/v20170111-2.tar.gz"
  sha256 "fe2d3967ca3be964d7f06ec25d34bbd6ecdd916c6084ad460d01a2d56981e3bc" 
  head 'https://github.com/amiaopensource/pbprotracktor.git'

  depends_on "mysql"
  depends_on "postgresql"

  def install
     bin.install 'pbcore2resourcespace.xsl'
     bin.install 'pbprotracktor'
     bin.install 'prot2rs'
  end
end
