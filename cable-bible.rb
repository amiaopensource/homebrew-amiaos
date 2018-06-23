class CableBible < Formula
  desc "Guide to cables and connectors used in audiovisual archiving"
  homepage "https://github.com/amiaopensource/cable-bible"
  url "https://github.com/amiaopensource/cable-bible/archive/v2018-06-23.tar.gz"
  version "2018-06-23"
  sha256 "bc5b6f673b783c9af306bc9fd15f69477d42b98f76c1012bb90b41c3f4d28145"

  bottle :unneeded

  def install
    bin.install "cable-bible"
    prefix.install "css", "images", "js", "README.md", "code_of_conduct.md", "index.html", "params.json", "pinouts.html"
  end
end
