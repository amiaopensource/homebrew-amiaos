class Audiorecorder < Formula
  desc "Tool for calibration and recording of analog audio sources"
  homepage "https://github.com/amiaopensource/audiorecorder"
  url "https://github.com/amiaopensource/audiorecorder/archive/0.1.08.tar.gz"
  sha256 "bb85d907539f8438e19d1733d390b000227d598aa4d93b10747deff3f8d2c5c0"
  head "https://github.com/amiaopensource/audiorecorder.git"

  depends_on "sdl"
  depends_on "ffmpeg" => ["with-sdl2", "with-freetype"]
  depends_on "mpv"
  depends_on "sox"
  depends_on "dialog"
  depends_on "bwfmetaedit"

  def install
    bin.install "audiorecorder"
    man1.install "audiorecorder.1"
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
