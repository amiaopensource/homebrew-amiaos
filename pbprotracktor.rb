class Pbprotracktor < Formula
  desc "Postgres calls to databases to produce a PBCore XML or CSV output"
  homepage "https://github.com/amiaopensource/pbprotracktor"
  url "https://github.com/amiaopensource/pbprotracktor/archive/refs/tags/v2026-03-16.tar.gz"
  sha256 "5f060b6634b70470bda4691d4eb7405cb359cae9c562006a1f9d39d81e245675"
  license "MIT"
  head "https://github.com/amiaopensource/pbprotracktor.git"

  depends_on "jq"
  depends_on "mysql"
  depends_on "postgresql@18"
  depends_on "xmlstarlet"

  def install
    bin.install "pbprotracktor"
    bin.install "prot2rs"
    bin.install "rs_search"
    bin.install "rs_uploadfile"
  end

  test do
    assert_path_exists bin/"pbprotracktor"
    assert_path_exists bin/"prot2rs"
    assert_path_exists bin/"rs_search"
    assert_path_exists bin/"rs_uploadfile"
  end
end
