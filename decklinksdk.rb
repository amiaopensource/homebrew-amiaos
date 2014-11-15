require 'formula'

class Decklinksdk < Formula
  homepage 'http://www.blackmagicdesign.com/support/sdks/'
  url 'http://software.blackmagicdesign.com/SDK/Blackmagic_DeckLink_SDK_10.3.zip'
  sha256 '7e07867b39ea036e3f9f9cd1b6e9ef627b6a12366e5bb6cf717cb839e7d5b2be'

  def install
      
    # blackmagic's DeckControl bin names conflict with deckcontrol by BAVC
    mv "Mac/Samples/bin/DeckControl", "Mac/Samples/bin/DeckControlsdk"
    
    bin.install 'Mac/Samples/bin/BypassControl'
    bin.install 'Mac/Samples/bin/CaptureFromTape'
    bin.install 'Mac/Samples/bin/DeckControlsdk'
    bin.install 'Mac/Samples/bin/DeviceList'
    bin.install 'Mac/Samples/bin/ExportToTape'
    include.install Dir['Mac/include/*']
  end
end
