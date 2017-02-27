require 'formula'

class Pbprotracktor < Formula
  homepage 'https://github.com/amiaopensource/pbprotracktor'
  url "https://github.com/amiaopensource/pbprotracktor/archive/v20170227.tar.gz"
  sha256 "081e27ba510eeb6d157ca282508c8ffc06707fdd354157c36df2161c9606fe5b" 
  head 'https://github.com/amiaopensource/pbprotracktor.git'

  depends_on "mysql"
  depends_on "postgresql"

  def install
     bin.install 'pbprotracktor'
     bin.install 'prot2rs'
  end
end
