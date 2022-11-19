class Astataudit < Formula
  desc "Generate audiovisual metrics for audio via FFmpeg and BWF MetaEdit"
  homepage "https://github.com/amiaopensource/astataudit"
  url "https://github.com/amiaopensource/astataudit/archive/refs/tags/20221119.tar.gz"
  sha256 "1445fa98bfdcd4c24408a1ba5fa51a2cb7e08af26bad8aef8f6ad85efba29ca3"
  head "https://github.com/amiaopensource/astataudit.git"

  depends_on "bwfmetaedit"
  depends_on "ffmpeg"
  depends_on "xmlstarlet"

  def install
    bin.install "astataudit"
  end
end
