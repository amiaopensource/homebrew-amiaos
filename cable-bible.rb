class CableBible < Formula
  desc "A comprehensive guide to cables and connectors used in audiovisual archiving"
  homepage "https://github.com/amiaopensource/cable-bible"
  url "https://github.com/amiaopensource/cable-bible/archive/v2017-07-29.tar.gz"
  version "2017-07-29"
  sha256 "f7f7f1bc7ce2b3a1859035fdfc8ce9a228cfbe02958a2550e614458f586a100e"

  bottle :unneeded

  def install
    bin.install "cable-bible"
    prefix.install "css", "images", "js", "README.md", "code_of_conduct.md", "index.html", "params.json", "pinouts.md"
  end
end
