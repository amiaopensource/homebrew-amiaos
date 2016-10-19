require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.23.zip"
  sha256 "81d468ce14def876bf92a84931bb59169dc0d977658295f15c7816a1c02b21b9" 
  head 'https://github.com/amiaopensource/vrecord.git'

  depends_on "sdl"
  depends_on "cowsay"
  depends_on "ffmpeg" => [ 'with-sdl', 'with-freetype' ]
  depends_on 'amiaopensource/amiaos/bmdtools'
  depends_on "xmlstarlet" => :recommended
  depends_on "mpv"

  def install
     bin.install 'vrecord'
     bin.install 'shotcutsaveas'
  end
end
