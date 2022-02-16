class Sccyou < Formula
  desc "Create scc or srt outputs from video files which contain EIA-608 data"
  homepage "https://github.com/amiaopensource/sccyou"
  url "https://github.com/amiaopensource/sccyou/archive/refs/tags/v0.1.tar.gz"
  sha256 "84f17aa09a86cc0e24287cc3942d0ddbec96b921ff1a71aa5d01bb75d2115a08"
  head "https://github.com/amiaopensource/sccyou.git"

  depends_on "ffmpeg"

  def install
    bin.install "sccyou"
  end
end
