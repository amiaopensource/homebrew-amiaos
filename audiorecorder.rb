class Audiorecorder < Formula
  desc "Tool for calibration and recording of analog audio sources"
  homepage "https://github.com/amiaopensource/audiorecorder"
  url "https://github.com/amiaopensource/audiorecorder/archive/2018-08-17.tar.gz"
  version "2018-08-17"
  sha256 "2c784b7dc70faf6befb5602ae61ee119bcceee8ad7db90d9ca891af423d9d617"
  revision 2
  head "https://github.com/amiaopensource/audiorecorder.git"

  option "with-audiorecorder2"

  depends_on "bwfmetaedit"
  depends_on "dialog"
  depends_on "ffmpeg"
  depends_on "mpv"
  depends_on "sdl"
  depends_on "sox"

  def install
    bin.install "audiorecorder"
    man1.install "audiorecorder.1"

    if build.with?("audiorecorder2")
      if RUBY_PLATFORM.include?("linux")
        bin.install "Linux/audiorecorder2"
      elsif RUBY_PLATFORM.include?("darwin")
        prefix.install "macOS/audiorecorder2-osx.tgz"
        system("open #{prefix}/audiorecorder2-osx.tgz")
      end
    end
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

  test do
    system "#{bin}/audiorecorder", "-h"
  end
end
