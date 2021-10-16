class Audioqc < Formula
  desc "Tool for aiding automated audio quality control"
  homepage "https://github.com/amiaopensource/audioqc"
  url "https://github.com/amiaopensource/audioqc/archive/refs/tags/2021-10-15.tar.gz"
  version "2021-10-15"
  sha256 "3003e50aed1a5b73b14c0a1c7604a977d7580e1f69b76e0a746159a41b6756bb"
  head "https://github.com/amiaopensource/audioqc.git"

  on_macos do
    depends_on "bwfmetaedit"
    depends_on "mediainfo"
    depends_on "mediaconch"
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
