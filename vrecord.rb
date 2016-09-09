require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.19.zip"
  sha256 "7abdf253b8531fada690e1745a4a16ab9fcc46291aa1941671a09a0bab857571" 
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
