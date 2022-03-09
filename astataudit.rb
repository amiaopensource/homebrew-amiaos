class Astataudit < Formula
  desc "Generate audiovisual metrics for audio via FFmpeg and BWF MetaEdit"
  homepage "https://github.com/amiaopensource/astataudit"
  url "https://github.com/amiaopensource/astataudit/archive/refs/tags/20220309.1.tar.gz"
  sha256 "d3aa9f687ac712be725379bb9f69dfe4d907ab11d53d5c8fc5175c02debdd72b"
  head "https://github.com/amiaopensource/astataudit.git"

  depends_on "bwfmetaedit"
  depends_on "ffmpeg"
  depends_on "xmlstarlet"

  def install
    bin.install "astataudit"
  end
end
