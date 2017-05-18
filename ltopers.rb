class Ltopers < Formula
  desc "Scripts for doing stuff with LTFS"
  homepage "https://github.com/amiaopensource/ltopers"
  url "https://github.com/amiaopensource/ltopers/archive/v2017-05-20.tar.gz"
  sha256 ""
  head "https://github.com/amiaopensource/ltopers.git"
  version "2017-05-20"
  
  option "--with-db", "Build database-related commands"
  option "--with-cuny", "Build database-related and CUNY-specific commands"

  depends_on "coreutils"
  depends_on "mediamicroservices/mm/mm"
  depends_on "xmlstarlet"

  def install
    bin.install "ltopers"
    bin.install "formatlto"
    bin.install "mountlto"
    bin.install "readlto"
    bin.install "writelto"
    bin.install "verifylto"
  end
  
  if build.with? "db"
    bin.install "ingestcollectionchecksum"
    bin.install "ingestschemas"
    bin.install "searchlto"    
  end

  if build.with? "cuny"
    bin.install "ingestcollectionchecksum"
    bin.install "ingestschemas"
    bin.install "searchlto"    
    bin.install "renameschemas"
    bin.install "indexschemas"
    bin.install "collectionchecksum"
  end
end
