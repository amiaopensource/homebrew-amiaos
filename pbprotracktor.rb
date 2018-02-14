class Pbprotracktor < Formula
  desc "Postgres calls to databases to produce a PBCore XML or CSV output"
  homepage "https://github.com/amiaopensource/pbprotracktor"
  url "https://github.com/amiaopensource/pbprotracktor/archive/v2018-02-14.tar.gz"
  version "2018-02-14"
  sha256 "1dacef32c1f09274b1e6f6c3a62cc50325a938cf288552e35a78529605516aa7"
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
