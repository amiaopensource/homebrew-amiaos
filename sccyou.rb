class Sccyou < Formula
  desc "Create scc or srt outputs from video files which contain EIA-608 data"
  homepage "https://github.com/amiaopensource/sccyou"
  url "https://github.com/amiaopensource/sccyou/archive/refs/tags/v0.3.tar.gz"
  sha256 "dfdf6985a29a4183a81b31bda2cd2c68614b8c2646fa4a4f6f39887635bbe44f"
  head "https://github.com/amiaopensource/sccyou.git"

  depends_on "ffmpeg"

  def install
    bin.install "sccyou"
  end
end
