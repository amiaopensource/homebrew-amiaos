require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.5.zip"
  sha256 "bac847c1a07175934cc70617fbfb928621eddf216e3a58bf06e1ed63bff0cf01"
  head 'https://github.com/amiaopensource/vrecord.git'

  depends_on "sdl"
  depends_on "ffmpeg" => [ 'with-ffplay', 'with-libass', 'with-freetype', 'with-faac' ]
  depends_on 'amiaopensource/amiaos/bmdtools'
  depends_on "xmlstarlet" => :recommended
  depends_on "caskroom/cask/brew-cask"

  def install
     bin.install 'vrecord'
     bin.install 'vstop'
     bin.install 'shotcutsaveas'
  end
end
