class CableBible < Formula
  desc "Guide to cables and connectors used in audiovisual archiving"
  homepage "https://eg-tech.gitlab.io/cable-bible/"
  url "https://gitlab.com/EG-tech/cable-bible/-/archive/v2022-02-24/cable-bible-v2022-02-24.tar.gz"
  sha256 "9e426d1db0e8b98c9e95c401e149660567e66f5bffcc3f1d69468f8eef227505"
  revision 1

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
