class CableBible < Formula
  desc "Guide to cables and connectors used in audiovisual archiving"
  homepage "https://github.com/amiaopensource/cable-bible"
  url "https://github.com/amiaopensource/cable-bible/archive/v2021-06-05.tar.gz"
  version "2021-06-05"
  sha256 "00791eac8f2a0c7b697dc47124c93d555b8f2a8f328f3a9f51119d50caf136b8"

  def install
    bin.install "cable-bible"
    prefix.install "css", "images", "js", "README.md", "code_of_conduct.md", "index.html", "params.json",
      "pinouts.html"
  end
end
