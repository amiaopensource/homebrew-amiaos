class CableBible < Formula
  desc "Guide to cables and connectors used in audiovisual archiving"
  homepage "https://github.com/amiaopensource/cable-bible"
  url "https://github.com/amiaopensource/cable-bible/archive/v2017-08-25.tar.gz"
  version "2017-08-25"
  sha256 "00c96af890319065e2e4000c6e5685de08a577a3ff8c2738f8dced7b73a4ed15"

  bottle :unneeded

  def install
    bin.install "cable-bible"
    prefix.install "css", "images", "js", "README.md", "code_of_conduct.md", "index.html", "params.json", "pinouts.md"
  end
end
