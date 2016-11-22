class Qctools < Formula
  desc "Quality control archival video via libavfilter."
  homepage "https://bavc.org/preserve-media/preservation-tools"
  url "https://github.com/bavc/qctools/archive/v0.7.3.tar.gz"
  sha256 "e30dc3618598d7ad1fc663b5060dbaeadacfcb795378c7c4e579aa08ca9c6540"
  head "https://github.com/bavc/qctools.git"

  depends_on "pkg-config" => :build
  depends_on "amiaopensource/amiaos/qwt-qt5"
  depends_on "qt5"
  depends_on "decklinksdk"
  depends_on "ffmpeg"
  depends_on "freetype"

  patch :DATA

  def install
    cd "Project/Homebrew" do
      system "#{Formula["qt5"].bin}/qmake", "qctools.pro"
      system "make"
      prefix.install "QCTools.app"
    end
  end
end

__END__
diff --git a/Project/Homebrew/qctools.pro b/Project/Homebrew/qctools.pro
index d6b17ac..cd9c5ac 100755
--- a/Project/Homebrew/qctools.pro
+++ b/Project/Homebrew/qctools.pro
@@ -7,7 +7,7 @@ QMAKE_TARGET_BUNDLE_PREFIX = org.bavc
 
 QT_CONFIG -= no-pkg-config
 
-include ( $$system(brew --prefix qwt-qt5)/features/qwt.prf )
+include ( "/usr/local/opt/qwt-qt5/features/qwt.prf" )
 
 CONFIG += qt qwt release no_keywords
