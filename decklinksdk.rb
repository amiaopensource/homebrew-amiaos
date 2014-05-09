require 'formula'

class Decklinksdk < Formula
  homepage 'http://www.blackmagicdesign.com/support/sdks/'
  url 'http://software.blackmagicdesign.com/SDK/Blackmagic_DeckLink_SDK_10.1.zip'
  sha256 '9b7bd745c470c3710885f5a3128a8e6ee44052a6684813e30bf9196b863b84a2'

  def install
    bin.install 'Mac/Samples/bin/BypassControl'
    bin.install 'Mac/Samples/bin/CaptureFromTape'
    bin.install 'Mac/Samples/bin/DeckControl'
    bin.install 'Mac/Samples/bin/DeviceList'
    bin.install 'Mac/Samples/bin/ExportToTape'
    include.install Dir['Mac/include/*']
  end
end
