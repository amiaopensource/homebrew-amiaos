class Audiorecorder < Formula
  desc "Tool for calibration and recording of analog audio sources"
  homepage "https://github.com/amiaopensource/audiorecorder"
  url "https://github.com/amiaopensource/audiorecorder/archive/refs/tags/2019-05-21.tar.gz"
  sha256 "c23d318e5c77fe8e6ccf637a5f8100625e2459a97b20a4f1c3cbb07b66ce7aa3"
  license "BSD-3-Clause"
  head "https://github.com/amiaopensource/audiorecorder.git"

  option "with-audiorecorder2"

  depends_on "bwfmetaedit"
  depends_on "dialog"
  depends_on "ffmpeg"
  depends_on "mpv"
  depends_on "sdl12-compat"
  depends_on "sox"

  def install
    bin.install "audiorecorder"
    man1.install "audiorecorder.1"

    if build.with?("audiorecorder2")
      if RUBY_PLATFORM.include?("linux")
        bin.install "Linux/audiorecorder2"
      elsif RUBY_PLATFORM.include?("darwin")
        prefix.install "macOS/audiorecorder2-osx.tgz"
        system("open", "#{prefix}/audiorecorder2-osx.tgz")
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
    system bin/"audiorecorder", "-h"
  end
end
