class Dvrescue < Formula
  desc "Data migration from DV tapes into files for long-term preservation"
  homepage "https://mediaarea.net/dvrescue"
  url "https://mediaarea.net/download/binary/dvrescue/0.20.05/dvrescue_CLI_0.20.05_GNU_FromSource.tar.xz"
  sha256 "69cbf2c9f04548cdb950e3442eb498a801c1ddc689fa10895ecd3a44923efb45"

  def install
    cd "ZenLib/Project/GNU/Library" do
      args = ["--disable-debug",
              "--enable-static",
              "--disable-shared"]
      system "./configure", *args
      system "make"
    end

    cd "MediaInfoLib/Project/GNU/Library" do
      args = ["--disable-debug",
              "--enable-static",
              "--disable-shared"]
      system "./configure", *args
      system "make"
    end

    cd "dvrescue/Project/GNU/CLI" do
      system "./configure", "--disable-debug",
                            "--enable-staticlibs",
                            "--disable-dependency-tracking",
                            "--disable-silent-rules",
                            "--prefix=#{prefix}"
      system "make", "install"
    end
  end

  test do
    system "#{bin}/dvrescue", "--help"
  end
end
