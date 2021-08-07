class Audioqc < Formula
  desc "Tool for aiding automated audio quality control"
  homepage "https://github.com/amiaopensource/audioqc"
  url "https://github.com/amiaopensource/audioqc/archive/refs/tags/2021-08-06.tar.gz"
  version "2021-08-06"
  sha256 "26af4ef192279a58861dccdd55675bcac21a251d7ef6d4b4e777fe5094fc7944"
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
