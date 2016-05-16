require 'formula'

class Digibase < Formula
  homepage 'https://github.com/amiaopensource/digibase'
  url "https://github.com/amiaopensource/digibase/archive/v0.1-beta.zip"
  sha256 "e69c23135e188bf7a2e71aa81fd1a9993131d0d1a239f879206eada302f28207" 
  head 'https://github.com/amiaopensource/digibase.git'

  depends_on "mysql"

  def install
     bin.install 'setuptables'
     bin.install 'check_db'
     bin.install 'finish_qc'
     bin.install 'digibase_functions'
  end
end
