require 'formula'

class Digibase < Formula
  homepage 'https://github.com/amiaopensource/digibase'
  url "https://github.com/amiaopensource/digibase/archive/v0.1-beta.zip"
  sha256 "417f06922de26dac8fcef7c4770034064add901d" 
  head 'https://github.com/amiaopensource/digibase.git'

  depends_on "mysql"

  def install
     bin.install 'setuptables'
     bin.install 'check_db'
     bin.install 'finish_qc'
     bin.install 'digibase_functions'
  end
end
