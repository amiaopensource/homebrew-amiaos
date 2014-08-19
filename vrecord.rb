require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/vrecord_v0.2.zip"
  sha256 "74ec29a65ed7e9a77fbc79f45e4f44fa12173c723e4fbc8efe05d14cb139c616"
  head 'https://github.com/amiaopensource/vrecord.git'

  depends_on 'amiaopensource/amiaos/decklinksdk'
  depends_on "xmlstarlet" => :recommended
  depends_on "ffmpeg"

  def install
     bin.install 'vrecord'
     bin.install 'vstop'
     bin.install 'shotcutsaveas'
  end
end
