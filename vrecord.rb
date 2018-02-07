class Vrecord < Formula
  desc "Capturing a video signal and turning it into a digital file"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/v2018-02-07.tar.gz"
  version "2018-02-08"
  sha256 "a5c2a643ffc78f2dd57d06392bd3db4baacad3b6f9ec0c803084ddcdc6a12dca"
  head "https://github.com/amiaopensource/vrecord.git"

  bottle :unneeded

  depends_on "sdl"
  depends_on "cowsay"
  depends_on "freetype"
  depends_on "amiaopensource/amiaos/decklinksdk"
  depends_on "amiaopensource/amiaos/ffmpegdecklink" => ["with-sdl2", "with-freetype", "with-openjpeg"]
  depends_on "xmlstarlet" => :recommended
  depends_on "mpv"
  depends_on "qcli"

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
