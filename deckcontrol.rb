class Deckcontrol < Formula
  desc "Control an attached videodeck via Blackmagic Design Decklink SDK"
  homepage "https://github.com/bavc/deckcontrol"
  url "https://github.com/bavc/deckcontrol/archive/refs/tags/v0.6.tar.gz"
  sha256 "e4a184ff6ec64aef8cccd15712797e7507d2de1ce873396703d575047ae1463e"
  head "https://github.com/bavc/deckcontrol.git"

  depends_on "amiaopensource/amiaos/decklinksdk" => :build

  def install
    system "make", "BMSDK=#{Formula["decklinksdk"].opt_include}"
    bin.install "deckcontrol"
  end
end
