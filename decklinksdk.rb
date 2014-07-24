require 'formula'

class Decklinksdk < Formula
  homepage 'http://www.blackmagicdesign.com/support/sdks/'
  url 'http://software.blackmagicdesign.com/SDK/Blackmagic_DeckLink_SDK_10.1.1.zip'
  sha256 '72ba22362b94182e055200e3c577c196ded61eff20e8d6d2d756a76c79424405'

  def install
    bin.install 'Mac/Samples/bin/BypassControl'
    bin.install 'Mac/Samples/bin/CaptureFromTape'
    bin.install 'Mac/Samples/bin/DeckControl'
    bin.install 'Mac/Samples/bin/DeviceList'
    bin.install 'Mac/Samples/bin/ExportToTape'
    include.install Dir['Mac/include/*']
  end
end
