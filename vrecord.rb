require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.21.zip"
  sha256 "283b89ee3bee1f4d2a9b909a1e057d6fba3f13e7168f055aa795319671dea112" 
  head 'https://github.com/amiaopensource/vrecord.git'


  depends_on "sdl"
  depends_on "cowsay"
  depends_on "ffmpeg" => [ 'with-ffplay', 'with-freetype' ]
  depends_on 'amiaopensource/amiaos/bmdtools'
  depends_on "xmlstarlet" => :recommended
  depends_on "mpv"

  def install
     bin.install 'vrecord'
     bin.install 'shotcutsaveas'
  end
end
