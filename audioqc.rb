class Audioqc < Formula
  desc "Tool for aiding automated audio quality control"
  homepage "https://github.com/amiaopensource/audioqc"
  url "https://github.com/amiaopensource/audioqc/archive/refs/tags/2023-02-27.tar.gz"
  version "2023-02-27"
  sha256 "a72f2aa0a0cf7036844c39dc805ee8459b1fd66fd639262ed48f437dff9c18b6"
  head "https://github.com/amiaopensource/audioqc.git"

  on_macos do
    depends_on "bwfmetaedit"
    depends_on "mediaconch"
    depends_on "mediainfo"
  end

  on_linux do
    def caveats
      <<~EOS
        ** IMPORTANT FOR LINUX INSTALL **
        Additional dependencies BWFMetaedit, MediaInfo and MediaConch must be installed prior to use.
      EOS
    end
  end

  def install
    bin.install "audioqc"
    bin.install "audioqc.config"
    bin.install "makespectrums"
  end
end
