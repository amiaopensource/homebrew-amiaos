require 'formula'

class Deckcontrol < Formula
    homepage 'https://github.com/bavc/deckcontrol'
    url "https://github.com/bavc/deckcontrol/archive/v0.3.zip"
    sha256 "2c9bfda0d08a85e2057eeccc24f371183b3f524951ab399773cab20de89a0d77"
    head 'https://github.com/bavc/deckcontrol.git'

    depends_on 'amiaopensource/amiaos/decklinksdk' => :build

    def install
        system "make"
        bin.install 'deckcontrol'
    end
end
