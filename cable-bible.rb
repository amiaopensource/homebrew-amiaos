class CableBible < Formula
  desc "Guide to cables and connectors used in audiovisual archiving"
  homepage "https://github.com/amiaopensource/cable-bible"
  url "https://github.com/amiaopensource/cable-bible/archive/v2022-02-24.tar.gz"
  version "2022-02-24"
  sha256 "3d309949308cc050c4147babdd1b41bd24de925db491a5f8719b5f9443f36c6d"

  def install
    bin.install "cable-bible"
    prefix.install "css", "images", "js", "README.md", "code_of_conduct.md", "index.html", "params.json",
      "pinouts.html"
  end
end
