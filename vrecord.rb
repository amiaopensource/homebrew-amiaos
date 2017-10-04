class Vrecord < Formula
  desc "Capturing a video signal and turning it into a digital file"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/v2017-10-04.tar.gz"
  version "2017-10-04"
  sha256 "fe73799d8adf2dea26e5ae94fd5ad5ea339cfe52319d9949104bf50460411c71"
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
    elsif `brew cask ls --versions pashua 2>&1 | head -n1`.include? "Warning: pashua is not installed"
      puts "installing Pashua"
      system `echo 'brew install Caskroom/cask/pashua > /dev/null'`
    else
      puts "Pashua was found"
    end
  end
end
