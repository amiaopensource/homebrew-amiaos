class Pbprotracktor < Formula
  desc "Postgres calls to databases to produce a PBCore XML or CSV output"
  homepage "https://github.com/amiaopensource/pbprotracktor"
  url "https://github.com/amiaopensource/pbprotracktor/archive/v2020-04-30.tar.gz"
  version "2020-04-30"
  sha256 "9ffcd96fa5404f45f15602f1643fd6ecbbae8da65a519447f8641dc4ca1d6bf1"
  head "https://github.com/amiaopensource/pbprotracktor.git"

  bottle :unneeded

  depends_on "jq"
  depends_on "mysql"
  depends_on "postgresql"
  depends_on "xmlstarlet"

  def install
    bin.install "pbprotracktor"
    bin.install "prot2rs"
    bin.install "rs_search"
    bin.install "rs_uploadfile"
  end
end
