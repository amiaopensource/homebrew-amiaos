require 'formula'

class Ltopers < Formula
  homepage 'https://github.com/amiaopensource/ltopers'
  url 'https://github.com/amiaopensource/ltopers/archive/v0.0.5.zip'
  sha256 '5e882706f85368a041e4de1f40afcc060a8f921bc8901d1efb29401a3a5436b8'
  
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
