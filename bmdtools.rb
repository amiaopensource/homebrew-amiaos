class Bmdtools < Formula
  desc "Basic capture and play programs for Blackmagic Design Decklink"
  homepage "https://github.com/lu-zero/bmdtools"
  url "https://github.com/lu-zero/bmdtools/archive/v0.2.tar.gz"
  sha256 "9ae420076aa362debf6cbe5b62811825682af4ab59ccb8d8c775545c1d0cce47"
  head "https://github.com/lu-zero/bmdtools.git"

  depends_on "decklinksdk" => :build
  depends_on "pkg-config" => :build
  depends_on "ffmpeg"

  def install
    system "make", "SDK_PATH=#{Formula["decklinksdk"].opt_include}"
    bin.install "bmdcapture"
    bin.install "bmdgenlock"
    bin.install "bmdplay"
  end
end
