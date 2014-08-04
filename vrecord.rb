require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  head 'https://github.com/amiaopensource/vrecord.git'

  depends_on 'amiaopensource/amiaos/decklinksdk'

  def install
     bin.install 'vrecord'
     bin.install 'vstop'
  end
end
