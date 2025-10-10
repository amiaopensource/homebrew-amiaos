class Ltopers < Formula
  desc "Scripts for doing stuff with LTFS"
  homepage "https://github.com/amiaopensource/ltopers"
  url "https://github.com/amiaopensource/ltopers/archive/refs/tags/v20230823.tar.gz"
  version "2023-08-23"
  sha256 "7e2387c9e20aa1c2a247444193c914e3e6719187bf408c13cbb93d10c9600ead"
  license "MIT"
  head "https://github.com/amiaopensource/ltopers.git"

  option "with-db", "Build database-related commands"
  option "with-cuny", "Build database-related and CUNY-specific commands"

  depends_on "coreutils"
  depends_on "mediamicroservices/mm/mm"
  depends_on "xmlstarlet"

  def install
    bin.install "formatlto"
    bin.install "ltopers"
    bin.install "mountlto"
    bin.install "readlto"
    bin.install "renameschemas"
    bin.install "verifylto"
    bin.install "writelto"
    man1.install "ltopers.1"

    if build.with?("db") || build.with?("cuny")
      bin.install "ingestcollectionchecksum"
      bin.install "ingestschemas"
      bin.install "searchlto"

      if build.with? "cuny"
        bin.install "collectionchecksum"
        bin.install "indexschemas"
      end
    end
  end

  test do
    assert_path_exists bin/"formatlto"
    assert_path_exists bin/"ltopers"
    assert_path_exists bin/"mountlto"
    assert_path_exists bin/"readlto"
    assert_path_exists bin/"renameschemas"
    assert_path_exists bin/"verifylto"
    assert_path_exists bin/"writelto"
  end
end
