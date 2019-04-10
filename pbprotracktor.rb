class Pbprotracktor < Formula
  desc "Postgres calls to databases to produce a PBCore XML or CSV output"
  homepage "https://github.com/amiaopensource/pbprotracktor"
  url "https://github.com/amiaopensource/pbprotracktor/archive/v2019-04-10.tar.gz"
  version "2019-04-10"
  sha256 "ee889b74569f3649d1e3042ab1357101d19dee63ae2776c8b9b75853fc76e0ff"
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
