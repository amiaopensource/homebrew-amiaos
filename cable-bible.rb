class CableBible < Formula
  desc "Guide to cables and connectors used in audiovisual archiving"
  homepage "https://github.com/amiaopensource/cable-bible"
  url "https://github.com/amiaopensource/cable-bible/archive/v2021-06-04.tar.gz"
  version "2021-06-04"
  sha256 "baf3c1a9f3bb9aa4acc38b59a73ad56f239d66a875e1d68ad4609ae6f960ecb4"

  def install
    bin.install "cable-bible"
    prefix.install "css", "images", "js", "README.md", "code_of_conduct.md", "index.html", "params.json",
      "pinouts.html"
  end
end
