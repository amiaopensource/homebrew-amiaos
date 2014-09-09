require 'formula'

class Vrecord < Formula
  homepage 'https://github.com/amiaopensource/vrecord'
  url "https://github.com/amiaopensource/vrecord/archive/v0.5.zip"
  sha256 "02afb1949b52a90d41d481efcf534718037328ab4c69727515b574069065e8d6"
  head 'https://github.com/amiaopensource/vrecord.git'

  depends_on 'amiaopensource/amiaos/bmdtools'
  depends_on "xmlstarlet" => :recommended
  depends_on "ffmpeg"

  def install
     bin.install 'vrecord'
     bin.install 'vstop'
     bin.install 'shotcutsaveas'
  end
end
