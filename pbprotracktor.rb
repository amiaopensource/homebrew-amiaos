class Pbprotracktor < Formula
  desc "Postgres calls to databases to produce a PBCore XML or CSV output"
  homepage "https://github.com/amiaopensource/pbprotracktor"
  url "https://github.com/amiaopensource/pbprotracktor/archive/refs/tags/v2026-06-29.tar.gz"
  sha256 "de1e059d432d8845688cc4080e24fbc101d0d26d4d6849bf1905f0d7e1e0266f"
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
