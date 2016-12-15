class Decklinksdk < Formula
  desc "The Blackmagic Design Decklink Software Development Kit libraries"
  homepage "https://www.blackmagicdesign.com/support/family/capture-and-playback"
  url "https://github.com/amiaopensource/decklinksdk/archive/v10.1.4.tar.gz"
  sha256 "f0cda862b8f8ffc05695180f2cec1998b1ec70dc280dc67c70b6c711a1950ffc"
  head "https://github.com/amiaopensource/decklinksdk.git"

  def install
    include.install Dir["Mac/include/*"]
  end
end
