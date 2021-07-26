class CableBible < Formula
  desc "Guide to cables and connectors used in audiovisual archiving"
  homepage "https://github.com/amiaopensource/cable-bible"
  url "https://github.com/amiaopensource/cable-bible/archive/v2021-07-26.tar.gz"
  version "2021-07-26"
  sha256 "7091e689fc3634e13258a2bbaf7dbe52d1c15d22ecd11fbe15e06e3221b1280e"

  def install
    bin.install "cable-bible"
    prefix.install "css", "images", "js", "README.md", "code_of_conduct.md", "index.html", "params.json",
      "pinouts.html"
  end
end
