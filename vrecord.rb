require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.17.zip"
  sha256 "e198c20e623b148c2cab0188fd6749c2cb63f312f3b1e2a608e3954aa1d60fee" 
  head 'https://github.com/amiaopensource/vrecord.git'
  revision 1

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
