class Pbprotracktor < Formula
  desc "Postgres calls to databases to produce a PBCore XML or CSV output"
  homepage "https://github.com/amiaopensource/pbprotracktor"
  url "https://github.com/amiaopensource/pbprotracktor/archive/v2017-12-26.tar.gz"
  version "2017-12-26"
  sha256 "ec824cd2f94f9e87ea351170a656db21409b20a243c760061f08ca4168930b54"
  head "https://github.com/amiaopensource/pbprotracktor.git"

  bottle :unneeded

  depends_on "jq"
  depends_on "mysql"
  depends_on "postgresql"

  def install
    bin.install "pbprotracktor"
    bin.install "prot2rs"
    bin.install "rs_search"
    bin.install "rs_uploadfile"
  end
end
