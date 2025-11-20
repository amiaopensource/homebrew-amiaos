class Gtkdialog < Formula
  desc "Small utility for fast and easy GUI building"
  homepage "https://code.google.com/archive/p/gtkdialog/"
  if OS.mac?
    url "https://github.com/puppylinux-woof-CE/gtkdialog/archive/refs/tags/0.8.4d.tar.gz"
    sha256 "1d3619ef1aca2baa783b936e8c6bd67135621f47428049c8231db9ee366f73db"
  else
    url "https://github.com/puppylinux-woof-CE/gtkdialog/archive/refs/tags/0.8.5e.tar.gz"
    sha256 "93561ed4042c113b85aa5550f51ae4e6980a5de6e083db5c358d6fc2fb2feb0a"
  end
  revision 7

  depends_on "at-spi2-core" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "cairo" => :build
  depends_on "fontconfig" => :build
  depends_on "freetype" => :build
  depends_on "fribidi" => :build
  depends_on "gdk-pixbuf" => :build
  depends_on "gettext" => :build
  depends_on "glib" => :build
  depends_on "graphite2" => :build
  depends_on "harfbuzz" => :build
  depends_on "libepoxy" => :build
  depends_on "libffi" => :build
  depends_on "libpng" => :build
  depends_on "libpthread-stubs" => :build
  depends_on "libtiff" => :build
  depends_on "libx11" => :build
  depends_on "libxau" => :build
  depends_on "libxcb" => :build
  depends_on "libxdmcp" => :build
  depends_on "libxext" => :build
  depends_on "libxrender" => :build
  depends_on "pango" => :build
  depends_on "pixman" => :build
  depends_on "pkg-config" => :build
  depends_on "texinfo" => :build # for makeinfo
  depends_on "xorgproto" => :build

  depends_on "gtk+"

  # Update patch to compile gtkdialog on macOS
  # See: http://www.murga-linux.com/puppy/viewtopic.php?t=108945
  patch :DATA if OS.mac?

  def install
    ENV.append_to_cflags "-Wno-implicit-function-declaration" # Workaround for Xcode 14.3.
    system "./autogen.sh"
    system "make"
    bin.install "src/gtkdialog"
  end
end

__END__
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
