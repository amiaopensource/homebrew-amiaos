require 'formula'

class Audiorecorder < Formula
  homepage 'https://github.com/amiaopensource/audiorecorder'
  url "https://github.com/amiaopensource/audiorecorder/archive/0.0.03.tar.gz"
  sha256 "9741683835f9da6f3f05e346b826d93aba21384c3ed72df8fa07b47a957029e1"
  
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
          system `echo 'brew cask install pashua > /dev/null'`
        else
          puts 'Pashua was found'
        end
      end
  end
end
