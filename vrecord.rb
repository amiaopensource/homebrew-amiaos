require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.16.zip"
  sha256 "e9be751bfac6e07671d737f84fb28efedc73f1f21e2c16794e1c376a156b2ae1" 
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
