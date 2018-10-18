class Decklinksdk < Formula
  desc "The Blackmagic Design Decklink Software Development Kit libraries"
  homepage "https://www.blackmagicdesign.com/support/family/capture-and-playback"
  url "https://github.com/amiaopensource/SoyDecklink/archive/v10.11.2.tar.gz"
  sha256 "edff8c6bcc58cb61c003b792298f0254d9373aaae12e13435e4fc0c41dead21a"
  head "https://github.com/amiaopensource/SoyDecklink.git"

  def install
    include.install Dir["DecklinkSdk/Mac/include/*"]
  end
end
