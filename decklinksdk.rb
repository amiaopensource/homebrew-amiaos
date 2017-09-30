class Decklinksdk < Formula
  desc "The Blackmagic Design Decklink Software Development Kit libraries"
  homepage "https://www.blackmagicdesign.com/support/family/capture-and-playback"
  url "https://github.com/Streampunk/macadam/archive/v0.2.9.tar.gz"
  sha256 "f07b7f5b5c9354cb5b9e4e393ce99f8640bf22038cb1d8f8ce624f823cac6a3a"
  head "https://github.com/Streampunk/macadam.git"

  def install
    include.install Dir["decklink/Mac/include/*"]
  end
end
