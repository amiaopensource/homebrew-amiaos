class CableBible < Formula
  desc "Guide to cables and connectors used in audiovisual archiving"
  homepage "https://github.com/amiaopensource/cable-bible"
  url "https://github.com/amiaopensource/cable-bible/archive/v2021-11-16.tar.gz"
  version "2021-11-16"
  sha256 "d7c220dcc916f997bee5d7a54d12a56d210c6fd46f8084014301326aea8c7301"

  def install
    bin.install "cable-bible"
    prefix.install "css", "images", "js", "README.md", "code_of_conduct.md", "index.html", "params.json",
      "pinouts.html"
  end
end
