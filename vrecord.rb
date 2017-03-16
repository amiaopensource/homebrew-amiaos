require "formula"

class Vrecord < Formula
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/v0.7.27.zip"
  sha256 "acb9c82060f5ed76e762340edeb9daf92d19f15ee1afc3abe80baf05c67c9e2e"
  head "https://github.com/amiaopensource/vrecord.git"
  revision 2

  depends_on "sdl"
  depends_on "cowsay"
  depends_on "ffmpeg" => ["with-sdl2", "with-freetype"]
  depends_on "amiaopensource/amiaos/bmdtools"
  depends_on "xmlstarlet" => :recommended
  depends_on "mpv"

  def install
    bin.install "vrecord"
    prefix.install "vrecord_logo.png"
    man1.install "vrecord.1"
  end

  def post_install
    puts "Checking for dependency Pashua. If Pashua is not found will attempt to install"
    if File.exist? File.expand_path "/Applications/Pashua.app"
      puts "Pashua was found"
    else
      if `brew cask ls --versions pashua 2>&1 | head -n1`.include? "Warning: pashua is not installed"
        puts "installing Pashua"
        system `echo 'brew install Caskroom/cask/pashua > /dev/null'`
      else
        puts "Pashua was found"
      end
    end
  end
end