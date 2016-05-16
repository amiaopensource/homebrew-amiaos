require 'formula'

class Digibase < Formula
  homepage 'https://github.com/amiaopensource/digibase'
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.12.zip"
  sha256 "07356f53087f5cec35d5a291dd1fa2e23e73f9b0d10d0d54302da95d941cdc71" 
  head 'https://github.com/amiaopensource/digibase.git'

  depends_on "mysql"

  def install
     bin.install 'setuptables'
     bin.install 'check_db'
     bin.install 'finish_qc'
     bin.install 'digibase_functions'
  end
end
