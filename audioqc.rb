class Audioqc < Formula
  desc "Tool for aiding automated audio quality control"
  homepage "https://github.com/amiaopensource/audioqc"
  url "https://github.com/amiaopensource/audioqc/archive/refs/tags/2026-05-20.tar.gz"
  sha256 "371c8531b41b2e9ef774e540fddc598e0c7dc45c8f915fd4dfe87395d106f5ce"
  head "https://github.com/amiaopensource/audioqc.git"

  depends_on "ffmpeg"
  depends_on "mediaconch"
  depends_on "mediainfo"

  def install
    bin.install "audioqc"
    bin.install "audioqc_methods.rb"
    bin.install "settings.csv"
  end

  test do
    assert_path_exists bin/"audioqc"
  end
end
