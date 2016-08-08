require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.14.zip"
  sha256 "44b5b5202879eb40ca366ffc380152f244daa8cffbbc27d1a94ca19cdf00894f" 
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
