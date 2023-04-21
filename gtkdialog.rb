class Gtkdialog < Formula
  desc "Small utility for fast and easy GUI building"
  homepage "https://code.google.com/archive/p/gtkdialog/"
  url "https://github.com/puppylinux-woof-CE/gtkdialog/archive/0.8.5.tar.gz"
  sha256 "6bb3057cbd30921c3e04cc9a6071da6a8c19decbac547e38f8a104adefe2938f"

  depends_on "atk" => :build
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
  depends_on "xorgproto" => :build

  depends_on "gtk+"

  def install
    system "./autogen.sh"
    system "make"
    bin.install "src/gtkdialog"
  end
end
