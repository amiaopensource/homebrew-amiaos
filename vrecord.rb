class Vrecord < Formula
  desc "Capturing a video signal and turning it into a digital file"
  homepage "https://github.com/amiaopensource/vrecord"
  url "https://github.com/amiaopensource/vrecord/archive/v2018-04-06.tar.gz"
  version "2018-04-06"
  sha256 "d7198a5455d91db6a1704b9df920c64582fb684086b8782087e7848db053eda8"
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
  depends_on "mediaconch"
  depends_on "mkvtoolnix"

  def install
    bin.install "vrecord"
    bin.install "qcview.lua"
    bin.install "vrecord_policy_ffv1.xml"
    bin.install "vrecord_policy_uncompressed.xml"
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
