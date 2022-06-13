class Sccyou < Formula
  desc "Create scc or srt outputs from video files which contain EIA-608 data"
  homepage "https://github.com/amiaopensource/sccyou"
  url "https://github.com/amiaopensource/sccyou/archive/refs/tags/v0.2.tar.gz"
  sha256 "52cd9b712fdb5629222d4aaa608dcfa0c870a73275c7fd56c6e3503f25dc3dab"
  head "https://github.com/amiaopensource/sccyou.git"

  depends_on "ffmpeg"

  def install
    bin.install "sccyou"
  end
end
