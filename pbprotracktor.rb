class Pbprotracktor < Formula
  homepage 'https://github.com/amiaopensource/pbprotracktor'
  url "https://github.com/amiaopensource/pbprotracktor/archive/v20170407.tar.gz"
  sha256 "cd9f70291b0a8871b4e3d28a95a09663b1e9700a673c8aaa8b2a6da87e5e8a4e" 
  head 'https://github.com/amiaopensource/pbprotracktor.git'

  depends_on "mysql"
  depends_on "postgresql"

  def install
     bin.install 'pbprotracktor'
     bin.install 'prot2rs'
     bin.install 'rs_search'
     bin.install 'rs_uploadfile'
  end
end
