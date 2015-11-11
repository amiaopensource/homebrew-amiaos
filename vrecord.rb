require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.9.zip"
  sha256 "72f6a99b70d7b9fba713ee169269c2e909a4cfa8d5f0d93b6534f355fceac0ca"
  head 'https://github.com/amiaopensource/vrecord.git'

  depends_on "sdl"
  depends_on "ffmpeg" => [ 'with-ffplay', 'with-libass', 'with-freetype', 'with-faac' ]
  depends_on 'amiaopensource/amiaos/bmdtools'
  depends_on "xmlstarlet" => :recommended
  depends_on "caskroom/cask/brew-cask"

  def install
     bin.install 'vrecord'
     bin.install 'shotcutsaveas'
  end
end
