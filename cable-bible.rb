class CableBible < Formula
  desc "A comprehensive guide to cables and connectors used in audiovisual archiving"
  homepage "https://github.com/amiaopensource/cable-bible"
  url "https://github.com/amiaopensource/cable-bible/archive/v2017-08-01.tar.gz"
  version "2017-08-01"
  sha256 "ff4c19f3ec3468bd592f4eb800b159d7cfdc9a80b7714ed5578247dea620480e"

  bottle :unneeded

  def install
    bin.install "cable-bible"
    prefix.install "css", "images", "js", "README.md", "code_of_conduct.md", "index.html", "params.json", "pinouts.md"
  end
end
