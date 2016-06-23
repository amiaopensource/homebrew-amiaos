require 'formula'

class Pbprotrackor < Formula
  homepage 'https://github.com/amiaopensource/pbprotrackor'
  url "https://github.com/amiaopensource/pbprotrackor/archive/v20160623.tar.gz"
  sha256 "a96a2f0b04b4c5a788f2703f8abd0ec7dbf639964b68c31bae60847804284dfa" 
  head 'https://github.com/amiaopensource/pbprotrackor.git'

  depends_on "postgresql"

  def install
     bin.install 'psql2pbcore.xsl'
     bin.install 'pbprotrackor'
  end
end
