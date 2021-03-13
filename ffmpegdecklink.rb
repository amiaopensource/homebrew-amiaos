class Ffmpegdecklink < Formula
  desc "FFmpeg with --enable-decklink"
  homepage "https://ffmpeg.org/"
  url "https://ffmpeg.org/releases/ffmpeg-4.3.2.tar.xz"
  sha256 "46e4e64f1dd0233cbc0934b9f1c0da676008cad34725113fb7f802cfa84ccddb"
  head "https://github.com/FFmpeg/FFmpeg.git"
  keg_only "anything that needs this will know where to look"

  option "with-iec61883", "Enable DV device (Linux)" if OS.linux?
  depends_on "nasm" => :build
  depends_on "pkg-config" => :build
  depends_on "texinfo" => :build

  depends_on "amiaopensource/amiaos/decklinksdk"
  depends_on "fontconfig"
  depends_on "freetype"
  depends_on "lame"
  depends_on "libvorbis"
  depends_on "libvpx"
  depends_on "openjpeg"
  depends_on "opus"
  depends_on "sdl2"
  depends_on "snappy"
  depends_on "theora"
  depends_on "x264"
  depends_on "x265"
  depends_on "xvid"
  depends_on "xz"

  patch :DATA

  def install
    args = %W[
      --prefix=#{prefix}
      --disable-shared
      --enable-version3
      --cc=#{ENV.cc}
      --host-cflags=#{ENV.cflags}
      --host-ldflags=#{ENV.ldflags}
      --enable-gpl
      --enable-libfreetype
      --enable-libmp3lame
      --enable-libopenjpeg
      --enable-libopus
      --enable-libsnappy
      --enable-libtheora
      --enable-libvorbis
      --enable-libvpx
      --enable-libx264
      --enable-libx265
      --enable-libxvid
      --enable-libfontconfig
      --disable-libjack
      --disable-indev=jack
    ]

    args << "--enable-libiec61883" if (build.with? "iec61883") && OS.linux?

    # decklink options
    args << "--enable-nonfree"
    args << "--enable-decklink"
    args << "--extra-cflags=-I#{HOMEBREW_PREFIX}/include"
    args << "--extra-ldflags=-L#{HOMEBREW_PREFIX}/include"

    system "./configure", *args
    system "make"
    bin.install "ffmpeg" => "ffmpeg-dl"
    bin.install "ffprobe" => "ffprobe-dl"
    bin.install "ffplay" => "ffplay-dl"
  end

  test do
    # Create an example mp4 file
    mp4out = testpath/"video.mp4"
    system bin/"ffmpeg-dl", "-filter_complex", "testsrc=rate=1:duration=1", mp4out
    assert_predicate mp4out, :exist?
  end
end

__END__
diff --git a/libavformat/dv.c b/libavformat/dv.c
index 3e0d12c0e3..26a78139f5 100644
--- a/libavformat/dv.c
+++ b/libavformat/dv.c
@@ -49,7 +49,6 @@ struct DVDemuxContext {
     uint8_t           audio_buf[4][8192];
     int               ach;
     int               frames;
-    uint64_t          abytes;
 };
 
 static inline uint16_t dv_audio_12to16(uint16_t sample)
@@ -258,7 +257,7 @@ static int dv_extract_audio_info(DVDemuxContext *c, const uint8_t *frame)
             c->ast[i] = avformat_new_stream(c->fctx, NULL);
             if (!c->ast[i])
                 break;
-            avpriv_set_pts_info(c->ast[i], 64, 1, 30000);
+            avpriv_set_pts_info(c->ast[i], 64, c->sys->time_base.num, c->sys->time_base.den);
             c->ast[i]->codecpar->codec_type = AVMEDIA_TYPE_AUDIO;
             c->ast[i]->codecpar->codec_id   = AV_CODEC_ID_PCM_S16LE;
 
@@ -387,8 +386,7 @@ int avpriv_dv_produce_packet(DVDemuxContext *c, AVPacket *pkt,
     for (i = 0; i < c->ach; i++) {
         c->audio_pkt[i].pos  = pos;
         c->audio_pkt[i].size = size;
-        c->audio_pkt[i].pts  = c->abytes * 30000 * 8 /
-                               c->ast[i]->codecpar->bit_rate;
+        c->audio_pkt[i].pts  = (c->sys->height == 720) ? (c->frames & ~1) : c->frames;
         ppcm[i] = c->audio_buf[i];
     }
     if (c->ach)
@@ -401,10 +399,7 @@ int avpriv_dv_produce_packet(DVDemuxContext *c, AVPacket *pkt,
             c->audio_pkt[2].size = c->audio_pkt[3].size = 0;
         } else {
             c->audio_pkt[0].size = c->audio_pkt[1].size = 0;
-            c->abytes           += size;
         }
-    } else {
-        c->abytes += size;
     }
 
     /* Now it's time to return video packet */
@@ -444,13 +439,6 @@ static int64_t dv_frame_offset(AVFormatContext *s, DVDemuxContext *c,
 void ff_dv_offset_reset(DVDemuxContext *c, int64_t frame_offset)
 {
     c->frames = frame_offset;
-    if (c->ach) {
-        if (c->sys) {
-        c->abytes = av_rescale_q(c->frames, c->sys->time_base,
-                                 (AVRational) { 8, c->ast[0]->codecpar->bit_rate });
-        } else
-            av_log(c->fctx, AV_LOG_ERROR, "cannot adjust audio bytes\n");
-    }
     c->audio_pkt[0].size = c->audio_pkt[1].size = 0;
     c->audio_pkt[2].size = c->audio_pkt[3].size = 0;
 }
-- 
