class CableBible < Formula
  desc "Guide to cables and connectors used in audiovisual archiving"
  homepage "https://github.com/amiaopensource/cable-bible"
  url "https://github.com/amiaopensource/cable-bible/archive/v2018-06-12.tar.gz"
  version "2018-06-12"
  sha256 "4dfaf433777181fff81fbfd925c1cdca2a0ad04dccf9f8d815fa39cd2a325816"

  bottle :unneeded

  def install
    bin.install "cable-bible"
    prefix.install "css", "images", "js", "README.md", "code_of_conduct.md", "index.html", "params.json", "pinouts.html"
  end
end
