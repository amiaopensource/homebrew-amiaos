class Bmdtools < Formula
  desc "Basic capture and play programs for Blackmagic Design Decklink"
  homepage "https://github.com/amiaopensource/bmdtools"
  url "https://github.com/amiaopensource/bmdtools/archive/v0.2alpha.tar.gz"
  sha256 "286ee1c6db52b1d76c59e9a93456dc43b5ac3b6bf32ec765b5718fc286b703c6"
  head "https://github.com/amiaopensource/bmdtools.git"
  version "0.2alpha"

  depends_on "pkg-config" => :build
  depends_on "decklinksdk" => :build
  depends_on "ffmpeg"

  def install
    system "make", "SDK_PATH=#{Formula["decklinksdk"].opt_include}"
    bin.install "bmdcapture"
    bin.install "bmdgenlock"
    bin.install "bmdplay"
  end
end
