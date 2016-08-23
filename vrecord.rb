require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.18.zip"
  sha256 "a201db150fe792ef68f2530eef9416ff974a0923f338eb53e26fca3136d51da1" 
  head 'https://github.com/amiaopensource/vrecord.git'


  depends_on "sdl"
  depends_on "cowsay"
  depends_on "ffmpeg" => [ 'with-ffplay', 'with-freetype' ]
  depends_on 'amiaopensource/amiaos/bmdtools'
  depends_on "xmlstarlet" => :recommended

  def install
     bin.install 'vrecord'
     bin.install 'shotcutsaveas'
  end
end
