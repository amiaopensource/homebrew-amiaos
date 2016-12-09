require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.27.zip"
  sha256 "acb9c82060f5ed76e762340edeb9daf92d19f15ee1afc3abe80baf05c67c9e2e" 
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
