class Ffmprovisr < Formula
  desc "Repository of useful FFmpeg command-lines for archivists"
  homepage "https://github.com/amiaopensource/ffmprovisr"
  url "https://github.com/amiaopensource/ffmprovisr/archive/v2023-08-02.tar.gz"
  version "2023-08-02"
  sha256 "c8be981f759f1ca9639f8dc376d58dfe7c0f02bcabbfc23ef4a8088045846df4"

  def install
    bin.install "scripts/ffmprovisr"
    prefix.install "css", "img", "js", "scripts", "code_of_conduct.md", "index.html", "readme.md"
  end
end
