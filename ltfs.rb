class Ltfs < Formula
  desc "Reference implementation of the LTFS format Spec for stand alone tape drive"
  homepage "https://github.com/LinearTapeFileSystem/ltfs"
  url "https://github.com/LinearTapeFileSystem/ltfs/archive/v2.4.1.2-10254.tar.gz"
  sha256 "ddd4032190c15ebd4aa30d3df075e1d0a06e4fba78a598032b2805fe138b9ad3"
  head "https://github.com/LinearTapeFileSystem/ltfs.git"

  depends_on "automake"
  depends_on "autoconf"
  depends_on "gnu-sed"
  depends_on "icu4c"
  depends_on "libtool"
  depends_on "libxml2" => :build
  depends_on "ossp-uuid"
  depends_on "pkg-config" => :build
  depends_on :osxfuse

  def install
    system "./autogen.sh"
    ENV.append "LDFLAGS", "-framework CoreFoundation"
    ENV.append "LDFLAGS", "-framework IOKit"
    system "./configure", "--disable-snmp", "LDFLAGS=#{ENV.ldflags}"
    system "make"
    system "make", "install"
  end
end
