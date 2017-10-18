class Ltopers < Formula
  desc "Scripts for doing stuff with LTFS"
  homepage "https://github.com/amiaopensource/ltopers"
  url "https://github.com/amiaopensource/ltopers/archive/v2017-10-18.tar.gz"
  version "v2017-10-18"
  sha256 "969a0f0312799d8e3a705b04079682424d3a7ad3442e2201e58805a637ff3763"
  head "https://github.com/amiaopensource/ltopers.git"

  bottle :unneeded

  option "with-db", "Build database-related commands"
  option "with-cuny", "Build database-related and CUNY-specific commands"

  depends_on "coreutils"
  depends_on "mediamicroservices/mm/mm"
  depends_on "xmlstarlet"

  conflicts_with "openlto",
    :because => "both install some scripts having the same name"

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
