require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.3.zip"
  sha256 "890e26eb29aba6ca15b005ec5faf527b40e3986670c89641061adb94e05dc91c"
  head 'https://github.com/amiaopensource/vrecord.git'

  depends_on 'amiaopensource/amiaos/bmdtools'
  depends_on "xmlstarlet" => :recommended
  depends_on "sdl"
  depends_on "ffmpeg" => [ 'with-ffplay', 'with-openjpeg', 'with-libass', 'with-freetype', 'with-faac' ]
  depends_on "caskroom/cask/brew-cask"

  def install
     bin.install 'vrecord'
     bin.install 'vstop'
     bin.install 'shotcutsaveas'
  end
end
