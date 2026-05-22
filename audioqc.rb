class Audioqc < Formula
  desc "Tool for aiding automated audio quality control"
  homepage "https://github.com/amiaopensource/audioqc"
  url "https://github.com/amiaopensource/audioqc/archive/refs/tags/2026-05-22.tar.gz"
  sha256 "3e08e9f06e8d4dbce0b2bd631b0c4a4f45734945a361559cdb27a03964f2e1f7"
  head "https://github.com/amiaopensource/audioqc.git"

  depends_on "ffmpeg"
  depends_on "mediaconch"
  depends_on "mediainfo"

  def install
    bin.install "audioqc"
    etc.install "audioqc_methods.rb"
    etc.install "settings.csv"
    etc.install "media_conch_policy.xml"
  end

  test do
    assert_path_exists bin/"audioqc"
  end
end
