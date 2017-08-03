class Ltopers < Formula
  desc "Scripts for doing stuff with LTFS"
  homepage "https://github.com/amiaopensource/ltopers"
  url "https://github.com/amiaopensource/ltopers/archive/v2017-08-04.tar.gz"
  sha256 "bfbe8a2e7ec6ae29a913efbd9babf1f4c9ddbf9c1d8853643bc2a987b0863dd3"
  version "2017-08-04"
  head "https://github.com/amiaopensource/ltopers.git"

  bottle :unneeded

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
end
