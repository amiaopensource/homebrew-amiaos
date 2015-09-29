require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.6.zip"
  sha256 "da11971aea7d62055e76c9eda5d9fa2a68677d6d3a33ca495236ae190d64063c"
  head 'https://github.com/amiaopensource/vrecord.git'

  depends_on "sdl"
  depends_on "ffmpeg" => [ 'with-ffplay', 'with-libass', 'with-freetype', 'with-faac' ]
  depends_on 'amiaopensource/amiaos/bmdtools'
  depends_on "xmlstarlet" => :recommended
  depends_on "caskroom/cask/brew-cask"

  def install
     bin.install 'vrecord'
     bin.install 'vstop'
     bin.install 'shotcutsaveas'
  end
end
