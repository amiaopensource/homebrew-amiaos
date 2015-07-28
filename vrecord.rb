require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.1.zip"
  sha256 "d68b6c41534f589b3d9f58be01ce48f17fd81518c286ae3129a349f6d94c261f"
  head 'https://github.com/amiaopensource/vrecord.git'

  depends_on 'amiaopensource/amiaos/bmdtools'
  depends_on "xmlstarlet" => :recommended
  depends_on "sdl"
  depends_on "ffmpeg" => [ 'with-ffplay', 'with-openjpeg', 'with-libass', 'with-freetype', 'with-faac' ]
  depends_on "caskroom/cask/brew-cask"

  def install
     system "brew", "cask", "install", "pashua"
     bin.install 'vrecord'
     bin.install 'vstop'
     bin.install 'shotcutsaveas'
  end
end
