class Decklinksdk < Formula
  desc "Blackmagic Design Decklink Software Development Kit libraries"
  homepage "https://www.blackmagicdesign.com/support/family/capture-and-playback"
  url "https://github.com/MartinPulec/desktopvideo_sdk-api/archive/refs/tags/v15.3.tar.gz"
  sha256 "087a7e42a18475bb48787837eef829ad95576d80903b87e4efec0600edcc215c"
  head "https://github.com/MartinPulec/desktopvideo_sdk-api.git"

  option "with-macOS", "Install DecklinkSDK for macOS"
  option "with-linux", "Install DecklinkSDK for linux"

  def install
    if build.with?("macOS") && build.with?("linux")
      puts "Please select only one build option."
      puts "To manually install a specific version, use the flags --with-macOS or --with-linux"
    elsif build.with?("linux")
      include.install Dir["Linux/include/*"]
    elsif build.with?("macOS")
      include.install Dir["Mac/include/*"]
    elsif RUBY_PLATFORM.include?("linux")
      include.install Dir["Linux/include/*"]
    elsif RUBY_PLATFORM.include?("darwin")
      include.install Dir["Mac/include/*"]
    else
      puts "Unable to detect supported system. Skipping Install."
      puts "To manually install a specific version, use the flags --with-macOS or --with-linux"
    end
  end
end
