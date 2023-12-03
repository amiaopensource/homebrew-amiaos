class Ffmprovisr < Formula
  desc "Repository of useful FFmpeg command-lines for archivists"
  homepage "https://github.com/amiaopensource/ffmprovisr"
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2023-11-26.tar.gz"
  version "2023-11-26"
  sha256 "b1298da19a498d2f64d1aede148a2b873eee5b82131fd21fb1bfc1e41145e1fd"

  def install
    bin.install "scripts/ffmprovisr"
    prefix.install "css", "img", "js", "scripts", "code_of_conduct.md", "index.html", "readme.md"
  end
end
