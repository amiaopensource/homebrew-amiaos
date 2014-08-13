require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/vrecord_v0.1.zip"
  sha256 "9b6744c406dcf3b7c1f188ec38c17fa728e9f69853607002f21689bcf75c1ee0"
  head 'https://github.com/amiaopensource/vrecord.git'

  depends_on 'amiaopensource/amiaos/decklinksdk'
  depends_on "xmlstarlet" => :recommended

  def install
     bin.install 'vrecord'
     bin.install 'vstop'
     bin.install 'shotcutsaveas'
  end
end
