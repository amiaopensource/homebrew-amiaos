class Pbprotracktor < Formula
  desc "Postgres calls to databases to produce a PBCore XML or CSV output"
  homepage "https://github.com/amiaopensource/pbprotracktor"
  url "https://github.com/amiaopensource/pbprotracktor/archive/v2017-10-04.tar.gz"
  version "2017-10-04"
  sha256 "a5bc6a0b953dabe62ef672dd8fc306282109066bfcd8cc09b03b3d78e1a7bf72"
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
