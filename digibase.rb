class Digibase < Formula
  desc "MySQL to create a DB tracking tapes through a digitization workflow"
  homepage "https://github.com/amiaopensource/digibase"
  url "https://github.com/amiaopensource/digibase/archive/v0.2-beta.tar.gz"
  sha256 "bba6b7da1d3dca0d0da8efc9cf992e0bc21b2769c6aeb611e461715542341746"
  head "https://github.com/amiaopensource/digibase.git"

  depends_on "mysql"

  def install
    bin.install "setuptables"
    bin.install "check_db"
    bin.install "finish_qc"
    bin.install "digibase_functions"
  end
end
