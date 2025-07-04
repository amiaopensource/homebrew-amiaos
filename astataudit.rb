class Astataudit < Formula
  desc "Generate audiovisual metrics for audio via FFmpeg and BWF MetaEdit"
  homepage "https://github.com/amiaopensource/astataudit"
  url "https://github.com/amiaopensource/astataudit/archive/refs/tags/20240119.tar.gz"
  sha256 "498ce010435c731dc2db504c77f786f8d0824324936eb0ace14e5f2cb650dddb"
  head "https://github.com/amiaopensource/astataudit.git"

  depends_on "bwfmetaedit"
  depends_on "ffmpeg"
  depends_on "xmlstarlet"

  def install
    bin.install "astataudit"
  end

  test do
    assert_path_exists bin/"astataudit"
  end
end
