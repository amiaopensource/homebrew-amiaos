class Audioqc < Formula
  desc "Tool for aiding automated audio quality control"
  homepage "https://github.com/amiaopensource/audioqc"
  url "https://github.com/amiaopensource/audioqc/archive/refs/tags/2025-05-27.tar.gz"
  sha256 "6fab74b658e316d0a8b178647383ca41eabb273967de2b227232d1d303466ad9"
  head "https://github.com/amiaopensource/audioqc.git"

  on_macos do
    depends_on "mediaconch"
    depends_on "mediainfo"
    depends_on "ffmpeg"
  end

  on_linux do
    def caveats
      <<~EOS
        ** IMPORTANT FOR LINUX INSTALL **
        Additional dependencies FFmpeg, FFprobe, MediaInfo and MediaConch must be installed prior to use.
      EOS
    end
  end

  def install
    bin.install "audioqc"
    bin.install "audioqc_methods.rb"
    bin.install "settings.csv"
  end

  test do
    assert_path_exists bin/"audioqc"
  end
end
