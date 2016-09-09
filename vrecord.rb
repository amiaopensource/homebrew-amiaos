require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.20.zip"
  sha256 "f2595060f7c663db699c9676c46b7e71680b71992cd0ed8ad0feab27d82ef572" 
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
