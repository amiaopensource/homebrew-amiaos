class Vrecord < Formula
  desc "Software for capturing a video signal and turning it into a digital file"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/v2017-07-27.tar.gz"
  version "2017-07-27"
  sha256 "218ba27c1148f33229a442ef6de6e4bbd895d5a0bcadc25e1d9f53b636f496d9"
  head "https://github.com/amiaopensource/vrecord.git"

  bottle :unneeded

  depends_on "sdl"
  depends_on "cowsay"
  depends_on "freetype"
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
