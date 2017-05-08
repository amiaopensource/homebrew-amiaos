class CableBible < Formula
  desc "A comprehensive guide to cables and connectors used in audiovisual archiving"
  homepage "https://github.com/amiaopensource/cable-bible"
  url "https://github.com/amiaopensource/cable-bible/archive/v2017-02-27.tar.gz"
  sha256 "9fd5a792dc0973721abe08963775072462ce5ee0f1c115b6cfb7ca38c8420902"

  def install
  bin.install "cable-bible"
  prefix.install "css", "images", "js", "README.md", "code_of_conduct.md", "index.html", "params.json", "pinouts.md"
  end

end
