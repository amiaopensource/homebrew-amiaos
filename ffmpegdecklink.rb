class Ffmpegdecklink < Formula
  desc "FFmpeg with --enable-decklink"
  homepage "https://ffmpeg.org/"
  url "https://github.com/FFmpeg/FFmpeg/archive/refs/tags/n4.4.tar.gz"
  sha256 "bea6d9f91cdbe4c5ad98e0878955ad5077df3883ef321fd4668ee1076de793fe"
  revision 3
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
Signed-off-by: Paul B Mahol <onemda@gmail.com>
---
fftools/ffmpeg.c                |   5 +
fftools/ffmpeg.h                |   1 +
fftools/ffmpeg_opt.c            |   1 +
tests/ref/fate/adpcm-ima-smjpeg | 658 ++++++++++++++++----------------
tests/ref/fate/dcinema-encode   |  26 +-
tests/ref/lavf/smjpeg           |   2 +-
6 files changed, 350 insertions(+), 343 deletions(-)

diff --git a/fftools/ffmpeg.c b/fftools/ffmpeg.c
index b0ce7c7c32..bde36dbb12 100644
--- a/fftools/ffmpeg.c
+++ b/fftools/ffmpeg.c
@@ -2382,6 +2382,11 @@ static int decode_audio(InputStream *ist, AVPacket *pkt, int *got_output,
         decoded_frame->pts = ist->dts;
         decoded_frame_tb   = AV_TIME_BASE_Q;
     }
+    if (pkt && pkt->duration && ist->prev_pkt_pts != AV_NOPTS_VALUE &&
+        pkt->pts != AV_NOPTS_VALUE && pkt->pts - ist->prev_pkt_pts > pkt->duration)
+        ist->filter_in_rescale_delta_last = 0;
+    if (pkt)
+        ist->prev_pkt_pts = pkt->pts;
     if (decoded_frame->pts != AV_NOPTS_VALUE)
         decoded_frame->pts = av_rescale_delta(decoded_frame_tb, decoded_frame->pts,
                                               (AVRational){1, avctx->sample_rate}, decoded_frame->nb_samples, &ist->filter_in_rescale_delta_last,
diff --git a/fftools/ffmpeg.h b/fftools/ffmpeg.h
index d2dd7ca092..6657773d32 100644
--- a/fftools/ffmpeg.h
+++ b/fftools/ffmpeg.h
@@ -313,6 +313,7 @@ typedef struct InputStream {
     AVFrame *filter_frame; /* a ref of decoded_frame, to be sent to filters */
     AVPacket *pkt;

+    int64_t       prev_pkt_pts;
     int64_t       start;     /* time when read started */
     /* predicted dts of the next packet read for this stream or (when there are
      * several frames in a packet) of the next frame in current packet (in AV_TIME_BASE units) */
diff --git a/fftools/ffmpeg_opt.c b/fftools/ffmpeg_opt.c
index 428934a3d8..a7d35b1ee2 100644
--- a/fftools/ffmpeg_opt.c
+++ b/fftools/ffmpeg_opt.c
@@ -867,6 +867,7 @@ static void add_input_streams(OptionsContext *o, AVFormatContext *ic)
         }

         ist->filter_in_rescale_delta_last = AV_NOPTS_VALUE;
+        ist->prev_pkt_pts = AV_NOPTS_VALUE;

         ist->dec_ctx = avcodec_alloc_context3(ist->dec);
         if (!ist->dec_ctx) {
-- 
2.17.1
-- 
X-Git-Url: http://git.ffmpeg.org/gitweb/ffmpeg.git/blobdiff_plain/7539a01bb0ea24998e1aa87706edf9785ddd3ac6..57aaeff523ec45039c564765673c998ee900d4f9:/libavformat/dv.c

diff --git a/libavformat/dv.c b/libavformat/dv.c
index cbb38cbd7d..d7909683c3 100644
--- a/libavformat/dv.c
+++ b/libavformat/dv.c
@@ -40,12 +40,22 @@
 #include "dv.h"
 #include "libavutil/avassert.h"
 
+// Must be kept in sync with AVPacket
+struct DVPacket {
+    int64_t  pts;
+    uint8_t *data;
+    int      size;
+    int      stream_index;
+    int      flags;
+    int64_t  pos;
+};
+
 struct DVDemuxContext {
     const AVDVProfile*  sys;    /* Current DV profile. E.g.: 525/60, 625/50 */
     AVFormatContext*  fctx;
     AVStream*         vst;
     AVStream*         ast[4];
-    AVPacket          audio_pkt[4];
+    struct DVPacket   audio_pkt[4];
     uint8_t           audio_buf[4][8192];
     int               ach;
     int               frames;
@@ -261,11 +271,12 @@ static int dv_extract_audio_info(DVDemuxContext *c, const uint8_t *frame)
             c->ast[i]->codecpar->codec_type = AVMEDIA_TYPE_AUDIO;
             c->ast[i]->codecpar->codec_id   = AV_CODEC_ID_PCM_S16LE;
 
-            av_init_packet(&c->audio_pkt[i]);
             c->audio_pkt[i].size         = 0;
             c->audio_pkt[i].data         = c->audio_buf[i];
             c->audio_pkt[i].stream_index = c->ast[i]->index;
             c->audio_pkt[i].flags       |= AV_PKT_FLAG_KEY;
+            c->audio_pkt[i].pts          = AV_NOPTS_VALUE;
+            c->audio_pkt[i].pos          = -1;
         }
         c->ast[i]->codecpar->sample_rate    = dv_audio_frequency[freq];
         c->ast[i]->codecpar->channels       = 2;
@@ -358,7 +369,13 @@ int avpriv_dv_get_packet(DVDemuxContext *c, AVPacket *pkt)
 
     for (i = 0; i < c->ach; i++) {
         if (c->ast[i] && c->audio_pkt[i].size) {
-            *pkt                 = c->audio_pkt[i];
+            pkt->size         = c->audio_pkt[i].size;
+            pkt->data         = c->audio_pkt[i].data;
+            pkt->stream_index = c->audio_pkt[i].stream_index;
+            pkt->flags        = c->audio_pkt[i].flags;
+            pkt->pts          = c->audio_pkt[i].pts;
+            pkt->pos          = c->audio_pkt[i].pos;
+
             c->audio_pkt[i].size = 0;
             size                 = pkt->size;
             break;
@@ -404,7 +421,6 @@ int avpriv_dv_produce_packet(DVDemuxContext *c, AVPacket *pkt,
 
     /* Now it's time to return video packet */
     size = dv_extract_video_info(c, buf);
-    av_init_packet(pkt);
     pkt->data         = buf;
     pkt->pos          = pos;
     pkt->size         = size;
-- 
Signed-off-by: Paul B Mahol <onemda@gmail.com>
---
libavformat/dv.c | 4 ++++
1 file changed, 4 insertions(+)

diff --git a/libavformat/dv.c b/libavformat/dv.c
index d7909683c3..b2b74162df 100644
--- a/libavformat/dv.c
+++ b/libavformat/dv.c
@@ -48,6 +48,7 @@ struct DVPacket {
     int      stream_index;
     int      flags;
     int64_t  pos;
+    int64_t  duration;
 };
 
 struct DVDemuxContext {
@@ -276,6 +277,7 @@ static int dv_extract_audio_info(DVDemuxContext *c, const uint8_t *frame)
             c->audio_pkt[i].stream_index = c->ast[i]->index;
             c->audio_pkt[i].flags       |= AV_PKT_FLAG_KEY;
             c->audio_pkt[i].pts          = AV_NOPTS_VALUE;
+            c->audio_pkt[i].duration     = 0;
             c->audio_pkt[i].pos          = -1;
         }
         c->ast[i]->codecpar->sample_rate    = dv_audio_frequency[freq];
@@ -374,6 +376,7 @@ int avpriv_dv_get_packet(DVDemuxContext *c, AVPacket *pkt)
             pkt->stream_index = c->audio_pkt[i].stream_index;
             pkt->flags        = c->audio_pkt[i].flags;
             pkt->pts          = c->audio_pkt[i].pts;
+            pkt->duration     = c->audio_pkt[i].duration;
             pkt->pos          = c->audio_pkt[i].pos;
 
             c->audio_pkt[i].size = 0;
@@ -404,6 +407,7 @@ int avpriv_dv_produce_packet(DVDemuxContext *c, AVPacket *pkt,
         c->audio_pkt[i].pos  = pos;
         c->audio_pkt[i].size = size;
         c->audio_pkt[i].pts  = (c->sys->height == 720) ? (c->frames & ~1) : c->frames;
+        c->audio_pkt[i].duration = 1;
         ppcm[i] = c->audio_buf[i];
     }
     if (c->ach)
-- 
2.17.1
