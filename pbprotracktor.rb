require 'formula'

class Pbprotracktor < Formula
  homepage 'https://github.com/amiaopensource/pbprotracktor'
  url "https://github.com/amiaopensource/pbprotracktor/archive/v20170111.tar.gz"
  sha256 "5f6082407ca9e771a39193034b78b98af89c189daa757421ff4b8f4b8c133461" 
  head 'https://github.com/amiaopensource/pbprotracktor.git'

  depends_on "mysql"
  depends_on "postgresql"

  def install
     bin.install 'pbcore2resourcespace.xsl'
     bin.install 'pbprotracktor'
     bin.install 'prot2rs'
  end
end
