class Astataudit < Formula
  desc "Generate audiovisual metrics for audio via FFmpeg and BWF MetaEdit"
  homepage "https://github.com/amiaopensource/astataudit"
  url "https://github.com/amiaopensource/astataudit/archive/refs/tags/20210703.tar.gz"
  sha256 "37cb89c40e37fdaeb62f2703f169b361d257d245afbbb85e4ef492ae0edd4c84"
  head "https://github.com/amiaopensource/astataudit.git"

  depends_on "bwfmetaedit"
  depends_on "ffmpeg"
  depends_on "xmlstarlet"

  def install
    bin.install "astataudit"
  end
end
