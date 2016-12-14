require 'formula'

class Audiorecorder < Formula
  homepage 'https://github.com/amiaopensource/audiorecorder'
  url "https://github.com/amiaopensource/audiorecorder/archive/0.0.00.zip"
  sha256 "1d875f38a25eca929ca40f688e8e59a4f0fb2bf2eb2bff56b7cdf500828fae21" 
  
  depends_on "sdl"
  depends_on "ffmpeg" => [ 'with-sdl2', 'with-freetype' ]
  depends_on "mpv"

  def install
     bin.install 'audiorecorder'
     prefix.install 'Pashua.app'
  end
end
