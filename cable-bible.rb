class CableBible < Formula
  desc "Guide to cables and connectors used in audiovisual archiving"
  homepage "https://github.com/amiaopensource/cable-bible"
  url "https://github.com/amiaopensource/cable-bible/archive/v2018-01-12.tar.gz"
  version "2018-01-12"
  sha256 "ea1386bc3237e67e97eb7ea54a97a712adcfc661b891981d2830efbb5cdb0d65"

  bottle :unneeded

  def install
    bin.install "cable-bible"
    prefix.install "css", "images", "js", "README.md", "code_of_conduct.md", "index.html", "params.json", "pinouts.md"
  end
end
