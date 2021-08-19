class Deckcontrol < Formula
  desc "Control an attached videodeck via Blackmagic Design Decklink SDK"
  homepage "https://github.com/bavc/deckcontrol"
  url "https://github.com/bavc/deckcontrol/archive/v0.5.tar.gz"
  sha256 "73abcbb1801b11aaf954567fe8f86edd2efbe789037774653de6f06b219d48e7"
  head "https://github.com/bavc/deckcontrol.git"

  depends_on "amiaopensource/amiaos/decklinksdk" => :build

  def install
    system "make", "BMSDK=#{Formula["decklinksdk"].opt_include}"
    bin.install "deckcontrol"
  end
end
