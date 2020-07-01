class Deckcontrol < Formula
  desc "Control an attached videodeck via Blackmagic Design Decklink SDK"
  homepage "https://github.com/bavc/deckcontrol"
  url "https://github.com/bavc/deckcontrol/archive/v0.4.tar.gz"
  sha256 "511b71f139f045e78ca084ed3997a73c6a1c34ae0c02126e657c4120097974fa"
  head "https://github.com/bavc/deckcontrol.git"

  depends_on "decklinksdk" => :build

  def install
    system "make"
    bin.install "deckcontrol"
  end
end
