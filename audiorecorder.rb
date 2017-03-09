require 'formula'

class Audiorecorder < Formula
  homepage 'https://github.com/amiaopensource/audiorecorder'
  url "https://github.com/amiaopensource/audiorecorder/archive/0.0.06.zip"
  sha256 "6d510af6a139fc933966f90154233b515f2d138eb244316fdd537e918b138b6f"
  head 'https://github.com/amiaopensource/audiorecorder.git'
  revision 1
  
  depends_on "sdl"
  depends_on "ffmpeg" => [ 'with-sdl2', 'with-freetype' ]
  depends_on "mpv"
  depends_on "sox"

  def install
    bin.install 'audiorecorder'
    if File.exist? File.expand_path '/usr/local/bin/bwfmetaedit'
      puts 'BWF Metaedit confirmed'
    else
      bin.install 'bwfmetaedit'
    end
  end
  def post_install;
    puts "Checking for dependency Pashua. If Pashua is not found will attempt to install"
      if File.exist? File.expand_path '/Applications/Pashua.app'
        puts 'Pashua was found'
      else
        if `brew cask ls --versions pashua 2>&1 | head -n1`.include? 'Warning: pashua is not installed'
          puts 'installing Pashua'
          system `echo 'brew install Caskroom/cask/pashua > /dev/null'`
        else
          puts 'Pashua was found'
        end
      end
  end
end
