class CableBible < Formula
  desc "Guide to cables and connectors used in audiovisual archiving"
  homepage "https://github.com/amiaopensource/cable-bible"
  url "https://github.com/amiaopensource/cable-bible/archive/v2019-02-03.tar.gz"
  version "2019-02-03"
  sha256 "760962f3c0d80976d015487d5428dd3d9556e70a815cc5e108b256d6b26a813b"

  def install
    bin.install "cable-bible"
    prefix.install "css", "images", "js", "README.md", "code_of_conduct.md", "index.html", "params.json", "pinouts.html"
  end
end
