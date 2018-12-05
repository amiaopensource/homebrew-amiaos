class Gtkdialog < Formula
  desc "Small utility for fast and easy GUI building"
  homepage "https://code.google.com/archive/p/gtkdialog/"
  url "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/gtkdialog/gtkdialog-0.8.3.tar.gz"
  sha256 "ff89d2d7f1e6488e5df5f895716ac1d4198c2467a2a5dc1f51ab408a2faec38e"

  depends_on "atk" => :build
  depends_on "cairo" => :build
  depends_on "fontconfig" => :build
  depends_on "freetype" => :build
  depends_on "fribidi" => :build
  depends_on "gdk-pixbuf" => :build
  depends_on "gettext" => :build
  depends_on "glib" => :build
  depends_on "graphite2" => :build
  depends_on "gtk+" => :build
  depends_on "harfbuzz" => :build
  depends_on "libpng" => :build
  depends_on "pango" => :build
  depends_on "pixman" => :build
  depends_on "pkg-config" => :build

  # Update patch to compile gtkdialog on macOS
  # See: http://www.murga-linux.com/puppy/viewtopic.php?t=108945
  patch :DATA

  def install
    system "./configure"
    system "make"
    bin.install "src/gtkdialog"
  end
end

__END__
diff -urN a/src/automaton.c b/src/automaton.c
--- a/src/automaton.c	2017-11-16 07:27:06.000000000 +0200
+++ b/src/automaton.c	2017-11-16 07:21:33.000000000 +0200
@@ -1295,7 +1295,7 @@
    Miert nem kapja meg az adatokat parameterben es foglalkozik
    a veremmel a hivo?
  */
-#ifdef __arm__
+#if defined(__arm__) || defined(__APPLE__)
 /* 120701 BK Puppy Linux forum member jamesbond fixed this for arm cpus...*/
 stackelement _sum(stackelement b, stackelement a)
 #else
diff -urN a/src/variables.c b/src/variables.c
--- a/src/variables.c	2017-11-16 07:27:06.000000000 +0200
+++ b/src/variables.c	2017-11-16 07:22:42.000000000 +0200
@@ -1113,7 +1113,7 @@
 		actual = root;
 
 	if (actual == NULL)
-		return;
+		return 0;
 
 	if (actual->left != NULL)
 		n = do_variables_count_widgets(actual->left, n);
