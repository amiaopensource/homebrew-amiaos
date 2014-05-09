require 'formula'

class Bmdtools < Formula
  homepage 'http://github.com/lu-zero/bmdtools'
  head 'https://github.com/lu-zero/bmdtools.git'

  depends_on 'pkg-config'
  depends_on 'amiaopensource/amiaos/decklinksdk'
  depends_on 'libav'

  def install
     system "make", "SDK_PATH=/usr/local/include"
     bin.install 'bmdcapture'
     bin.install 'bmdgenlock'
     bin.install 'bmdplay'
  end
end
