class Digibase < Formula
  desc "MySQL to create a DB tracking tapes through a digitization workflow"
  homepage "https://github.com/amiaopensource/digibase"
  url "https://github.com/amiaopensource/digibase/archive/refs/tags/v0.3.tar.gz"
  sha256 "5abbd0a9b660bd456113a0c576ae1209f216841ffd27963dd9f874f1c3492aa8"
  head "https://github.com/amiaopensource/digibase.git"

  depends_on "mysql"

  def install
    bin.install "setuptables"
    bin.install "check_db"
    bin.install "finish_qc"
    bin.install "digibase_functions"
  end
end
