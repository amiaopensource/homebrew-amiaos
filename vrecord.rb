require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.15.zip"
  sha256 "d036c3ed81426a6ca43989b2115e473850ecdc0bec81e3f5385975f1ab40945b" 
  head 'https://github.com/amiaopensource/vrecord.git'

  depends_on "sdl"
  depends_on "cowsay"
  depends_on "ffmpeg" => [ 'with-ffplay', 'with-freetype' ]
  depends_on 'amiaopensource/amiaos/bmdtools'
  depends_on "xmlstarlet" => :recommended
  depends_on "caskroom/cask/brew-cask"

  def install
     bin.install 'vrecord'
     bin.install 'shotcutsaveas'
  end
end
