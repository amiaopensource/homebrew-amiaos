require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.2.zip"
  sha256 "26b479a0ab124bbe9c0843e769a7b1e3f0c6dd01ba0e7ae48d1c743839eb21e6"
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
