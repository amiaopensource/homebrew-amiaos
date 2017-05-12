class Ltopers < Formula
  desc "Scripts for doing stuff with LTFS"
  homepage "https://github.com/amiaopensource/ltopers"
  url "https://github.com/amiaopensource/ltopers/archive/v0.1.16.tar.gz"
  sha256 "8cc7a05894f34936d59bf6c3f9917f44bc7639bf3855ab151c2a4c7c2c4d2f8a"
  head "https://github.com/amiaopensource/ltopers.git"

  depends_on "coreutils"
  depends_on "xmlstarlet"
  depends_on "mediamicroservices/mm/mm"

  def install
    bin.install "formatlto"
    bin.install "mountlto"
    bin.install "writelto"
    bin.install "renameschemas"
    bin.install "indexschemas"
    bin.install "collectionchecksum"
    bin.install "verifylto"
    bin.install "ingestschemas"
    bin.install "searchlto"
    bin.install "ingestcollectionchecksum"
    bin.install "readlto"
  end
end
