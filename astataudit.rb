class Astataudit < Formula
  desc "Generate audiovisual metrics for audio via FFmpeg and BWF MetaEdit"
  homepage "https://github.com/amiaopensource/astataudit"
  url "https://github.com/amiaopensource/astataudit/archive/refs/tags/20230425.tar.gz"
  sha256 "55576044da9fb9fc4e8aca148450f89dcc4de936c8431061714ad1633e4a2a34"
  head "https://github.com/amiaopensource/astataudit.git"

  depends_on "bwfmetaedit"
  depends_on "ffmpeg"
  depends_on "xmlstarlet"

  def install
    bin.install "astataudit"
  end
end
