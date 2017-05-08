class CableBible < Formula
  desc "A comprehensive guide to cables and connectors used in audiovisual archiving"
  homepage "https://github.com/amiaopensource/cable-bible"
  url "https://github.com/amiaopensource/cable-bible/archive/v2017-05-08.tar.gz"
  sha256 "c052e49914a7e0d27a76a3b8d2394f7a3a733a5e7126c5006032d3f3082a4f8d"

  def install
    bin.install "cable-bible"
    prefix.install "css", "images", "js", "README.md", "code_of_conduct.md", "index.html", "params.json", "pinouts.md"
  end
end
