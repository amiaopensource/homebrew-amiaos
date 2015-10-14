require 'formula'

class Ltopers < Formula
  homepage 'https://github.com/amiaopensource/ltopers'
  url 'https://github.com/amiaopensource/ltopers/archive/v0.0.4.zip'
  sha256 'e94844a5a239a845d2a5350a21cdb346231e5649aaa930b3f633904f12f365ef'
  
  head 'git://github.com/amiaopensource/ltopers.git'

  depends_on 'xmlstarlet'

  def install
    bin.install "formatlto"
    bin.install "lto2filemaker"
    bin.install "ltoperconfig"
    bin.install "mountlto"
    bin.install "writelto"
  end
end
