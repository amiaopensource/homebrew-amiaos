class Pbprotracktor < Formula
  homepage 'https://github.com/amiaopensource/pbprotracktor'
  url "https://github.com/amiaopensource/pbprotracktor/archive/v2017-06-16.tar.gz"
  version "2017-06-16"
  sha256 "7d170947ce83964923873322542d383c3ee4d7927363bd4246b9d931468e3936" 
  head 'https://github.com/amiaopensource/pbprotracktor.git'

  bottle :unneeded

  depends_on "mysql"
  depends_on "postgresql"

  def install
     bin.install 'pbprotracktor'
     bin.install 'prot2rs'
     bin.install 'rs_search'
     bin.install 'rs_uploadfile'
  end
end
