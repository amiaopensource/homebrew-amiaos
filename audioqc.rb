class Audioqc < Formula
  desc "Tool for aiding automated audio quality control"
  homepage "https://github.com/amiaopensource/audioqc"
  url "https://github.com/amiaopensource/audioqc/archive/refs/tags/2021-05-07.tar.gz"
  version "2021-05-07"
  sha256 "2962a02509e0c101f1b2b4872a8483dbc09f84d0a3f7428e51cdcdcabb45bd41"
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
  end
end
