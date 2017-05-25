class Ltopers < Formula
  desc "Scripts for doing stuff with LTFS"
  homepage "https://github.com/amiaopensource/ltopers"
  url "https://github.com/amiaopensource/ltopers/archive/v2017-05-20.tar.gz"
  sha256 "85323514cf12de4a3eea2883963242371986654c473fc26fb99efe9383a2361e"
  version "2017-05-20"
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
    bin.install "verifylto"
    bin.install "writelto"
 
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
end
