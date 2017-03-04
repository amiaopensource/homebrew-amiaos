require 'formula'

class Audiorecorder < Formula
  homepage 'https://github.com/amiaopensource/audiorecorder'
  url "https://github.com/amiaopensource/audiorecorder/archive/0.0.05.tar.gz"
  sha256 "3faea902b4bd1ca66e58c9a58778caccd24f026526dadb40b52bf6ea845f0cb6"
  head 'https://github.com/amiaopensource/audiorecorder.git'
  
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
