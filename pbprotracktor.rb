class Pbprotracktor < Formula
  desc "Postgres calls to databases to produce a PBCore XML or CSV output"
  homepage "https://github.com/amiaopensource/pbprotracktor"
  url "https://github.com/amiaopensource/pbprotracktor/archive/v2017-09-23.tar.gz"
  version "2017-09-23"
  sha256 "0976e295dea20415518e4dbc8968c013a865e11cad22762ae015856788622461"
  head "https://github.com/amiaopensource/pbprotracktor.git"

  bottle :unneeded

  depends_on "mysql"
  depends_on "postgresql"

  def install
    bin.install "pbprotracktor"
    bin.install "prot2rs"
    bin.install "rs_search"
    bin.install "rs_uploadfile"
  end
end
