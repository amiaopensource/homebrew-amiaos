class Audiorecorder < Formula
  desc "Tool for calibration and recording of analog audio sources"
  homepage "https://github.com/amiaopensource/audiorecorder"
  url "https://github.com/amiaopensource/audiorecorder/archive/0.1.03.tar.gz"
  sha256 "76d4313c74b22c2ec2d73047d296a14cf4e4d78c71f69b9a70fe285aedc37c8d"
  revision 2
  head "https://github.com/amiaopensource/audiorecorder.git"

  depends_on "sdl"
  depends_on "ffmpeg" => ["with-sdl2", "with-freetype"]
  depends_on "mpv"
  depends_on "sox"
  depends_on "dialog"

  def install
    bin.install "audiorecorder"
    man1.install "audiorecorder.1"
    if File.exist? File.expand_path "/usr/local/bin/bwfmetaedit"
      puts "BWF Metaedit confirmed"
    else
      bin.install "bwfmetaedit"
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
end
