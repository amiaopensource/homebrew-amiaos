require 'formula'

class Audiorecorder < Formula
  homepage 'https://github.com/amiaopensource/audiorecorder'
  url "https://github.com/amiaopensource/audiorecorder/archive/0.0.06.tar.gz"
  sha256 "06c5ab9eb104dc484ad4c5021e3addb5db948f4297a27f4f2ef89e9b114921b5"
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
