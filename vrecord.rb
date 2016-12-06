require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.26.zip"
  sha256 "78dcf4a7910747520b121a23b08566a9239d9aa423490bed2a44b5869a778736" 
  head 'https://github.com/amiaopensource/vrecord.git'
  
  depends_on "sdl"
  depends_on "cowsay"
  depends_on "ffmpeg" => [ 'with-sdl2', 'with-freetype' ]
  depends_on 'amiaopensource/amiaos/bmdtools'
  depends_on "xmlstarlet" => :recommended
  depends_on "mpv"

  def install
     bin.install 'vrecord'
     prefix.install 'vrecord_logo.png'
     man1.install 'vrecord.1'
  end
end
