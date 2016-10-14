require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.22.zip"
  sha256 "5418125c1e6ccaf70bd2a8239a059dc147272061a1e5d8f4a104a964ea51f017" 
  head 'https://github.com/amiaopensource/vrecord.git'
  revision 1

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
