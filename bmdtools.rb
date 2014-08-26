require 'formula'
 
class Bmdtools < Formula
  homepage 'http://github.com/lu-zero/bmdtools'
  head 'https://github.com/lu-zero/bmdtools.git'
 
  env :std
 
  depends_on 'pkg-config' => :build
  depends_on 'amiaopensource/amiaos/decklinksdk' => :build
  depends_on 'libav' => :build
 
  def install
     system "make", "SDK_PATH=/usr/local/include", "SYS=Darwin"
     bin.install 'bmdcapture'
     bin.install 'bmdgenlock'
     bin.install 'bmdplay'
  end
end
