class Audioqc < Formula
  desc "Tool for aiding automated audio quality control"
  homepage "https://github.com/amiaopensource/audioqc"
  url "https://github.com/amiaopensource/audioqc/archive/refs/tags/2023-11-22.tar.gz"
  sha256 "5a98e8836c427b5e238c9e591c0f4139ead37d0dc32d22d07cd6a20d7dcb8fe7"
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
