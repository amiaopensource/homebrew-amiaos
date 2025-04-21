class Deckcontrol < Formula
  desc "Control an attached videodeck via Blackmagic Design Decklink SDK"
  homepage "https://github.com/bavc/deckcontrol"
  head "https://github.com/bavc/deckcontrol.git"

  stable do
    url "https://github.com/bavc/deckcontrol/archive/refs/tags/v0.5.tar.gz"
    sha256 "73abcbb1801b11aaf954567fe8f86edd2efbe789037774653de6f06b219d48e7"
    patch :DATA
  end

  depends_on "amiaopensource/amiaos/decklinksdk" => :build

  def install
    system "make", "BMSDK=#{Formula["decklinksdk"].opt_include}"
    bin.install "deckcontrol"
  end
end
__END__
diff --git a/deckcontrol.cpp b/deckcontrol.cpp
index 934680b..5eff492 100644
--- a/deckcontrol.cpp
+++ b/deckcontrol.cpp
@@ -269,7 +269,7 @@ int main(int argc, char *argv[])
         uint8_t hours, minutes, seconds, frames;
         deckControl->GetTimecode(&currentTimecode, &deckError);
         currentTimecode->GetComponents(&hours, &minutes, &seconds, &frames);
-        printf("TC=%02"PRIu8":%02"PRIu8":%02"PRIu8":%02"PRIu8"\n",
+        printf("TC=%02" PRIu8 ":%02" PRIu8 ":%02" PRIu8 ":%02" PRIu8 "\n",
                hours, minutes, seconds, frames);
         SAFE_RELEASE(currentTimecode);
         break;
