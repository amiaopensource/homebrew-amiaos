class CableBible < Formula
  desc "Guide to cables and connectors used in audiovisual archiving"
  homepage "https://github.com/amiaopensource/cable-bible"
  url "https://github.com/amiaopensource/cable-bible/archive/refs/tags/v2025-11-20.tar.gz"
  sha256 "d0395181ebe81c159e26be5905d552f7e113858c1b565591d74376fd5c01f21c"

  def install
    bin.install "cable-bible"
    prefix.install "css",
                   "images",
                   "js",
                   "README.md",
                   "code_of_conduct.md",
                   "index.html",
                   "params.json",
                   "pinouts.html"
  end

  test do
    assert_path_exists bin/"cable-bible"
  end
end
