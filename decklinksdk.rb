class Decklinksdk < Formula
  desc "The Blackmagic Design Decklink Software Development Kit libraries"
  homepage "https://www.blackmagicdesign.com/support/family/capture-and-playback"
  url "https://github.com/Streampunk/macadam/archive/v0.2.9.tar.gz"
  sha256 "f07b7f5b5c9354cb5b9e4e393ce99f8640bf22038cb1d8f8ce624f823cac6a3a"
  head "https://github.com/Streampunk/macadam.git"

  patch :DATA

  def install
    include.install Dir["decklink/Mac/include/*"]
  end
end

__END__
diff --git a/decklink/Mac/include/DeckLinkAPIDispatch.cpp b/decklink/Mac/include/DeckLinkAPIDispatch.cpp
index 7a6fd4c..19b3486 100644
--- a/decklink/Mac/include/DeckLinkAPIDispatch.cpp
+++ b/decklink/Mac/include/DeckLinkAPIDispatch.cpp
@@ -53,7 +53,7 @@ static CreateVideoConversionInstanceFunc	gCreateVideoConversionFunc	= NULL;
 static CreateDeckLinkDiscoveryInstanceFunc  gCreateDeckLinkDiscoveryFunc= NULL;
 
 
-void	InitDeckLinkAPI (void)
+static void	InitDeckLinkAPI (void)
 {
 	CFURLRef		bundleURL;
 
@@ -74,7 +74,7 @@ void	InitDeckLinkAPI (void)
 	}
 }
 
-bool		IsDeckLinkAPIPresent (void)
+static bool		IsDeckLinkAPIPresent (void)
 {
 	// If the DeckLink API bundle was successfully loaded, return this knowledge to the caller
 	if (gDeckLinkAPIBundleRef != NULL)
@@ -154,7 +154,7 @@ static CFBundleRef         gBMDStreamingAPIBundleRef = NULL;
 static CreateDiscoveryFunc gCreateDiscoveryFunc      = NULL;
 static CreateNALParserFunc gCreateNALParserFunc      = NULL;
 
-void InitBMDStreamingAPI(void)
+static void InitBMDStreamingAPI(void)
 {
 	CFURLRef bundleURL;
