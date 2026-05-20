class Audioqc < Formula
  desc "Tool for aiding automated audio quality control"
  homepage "https://github.com/amiaopensource/audioqc"
  url "https://github.com/amiaopensource/audioqc/archive/refs/tags/2025-05-27.tar.gz"
  sha256 "6fab74b658e316d0a8b178647383ca41eabb273967de2b227232d1d303466ad9"
  head "https://github.com/amiaopensource/audioqc.git"
  revision 1

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
