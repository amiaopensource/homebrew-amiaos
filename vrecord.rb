require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.11.zip"
  sha256 "92fd5181687eff6358c60fe98d33400dd6cd6bc33a49ec5d0645a04fc3dbfd61" 
  head 'https://github.com/amiaopensource/vrecord.git'

  depends_on "sdl"
  depends_on "cowsay"
  depends_on "ffmpeg" => [ 'with-ffplay', 'with-libass', 'with-freetype' ]
  depends_on 'amiaopensource/amiaos/bmdtools'
  depends_on "xmlstarlet" => :recommended
  depends_on "caskroom/cask/brew-cask"

  def install
     bin.install 'vrecord'
     bin.install 'shotcutsaveas'
  end
end
