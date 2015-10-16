require 'formula'

class Ltopers < Formula
  homepage 'https://github.com/amiaopensource/ltopers'
  url 'https://github.com/amiaopensource/ltopers/archive/v0.0.6.zip'
  sha256 '6acc61a3da1f7cafd6f9c0dd627742c5cfdbed26b78dd86f3754bb1bbd7f3fc4'
  
  head 'git://github.com/amiaopensource/ltopers.git'

  depends_on 'xmlstarlet'

  def install
    bin.install "formatlto"
    bin.install "lto2filemaker"
    bin.install "ltoperconfig"
    bin.install "mountlto"
    bin.install "writelto"
    bin.install "ltofunctions"
  end
end
