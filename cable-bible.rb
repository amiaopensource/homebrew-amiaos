class CableBible < Formula
  desc "A comprehensive guide to cables and connectors used in audiovisual archiving"
  homepage "https://github.com/amiaopensource/cable-bible"
  url "https://github.com/amiaopensource/cable-bible/archive/v2017-07-29.tar.gz"
  version "2017-07-29"
  sha256 "21928e539570dbbac137450c24762863988551f886811183206a16e7b5906a46"

  bottle :unneeded

  def install
    bin.install "cable-bible"
    prefix.install "css", "images", "js", "README.md", "code_of_conduct.md", "index.html", "params.json", "pinouts.md"
  end
end
