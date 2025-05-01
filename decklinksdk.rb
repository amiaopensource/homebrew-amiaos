class Decklinksdk < Formula
  desc "Blackmagic Design Decklink Software Development Kit libraries"
  homepage "https://www.blackmagicdesign.com/support/family/capture-and-playback"
  url "https://github.com/amiaopensource/SoyDecklink/archive/refs/tags/v10.11.2.tar.gz"
  sha256 "edff8c6bcc58cb61c003b792298f0254d9373aaae12e13435e4fc0c41dead21a"
  head "https://github.com/amiaopensource/SoyDecklink.git"

  option "with-macOS", "Install DecklinkSDK for macOS"
  option "with-linux", "Install DecklinkSDK for linux"

  def install
    if build.with?("macOS") && build.with?("linux")
      puts "Please select only one build option."
      puts "To manually install a specific version, use the flags --with-macOS or --with-linux"
    elsif build.with?("linux")
      include.install Dir["DecklinkSdk/Linux/include/*"]
    elsif build.with?("macOS")
      include.install Dir["DecklinkSdk/Mac/include/*"]
    elsif RUBY_PLATFORM.include?("linux")
      include.install Dir["DecklinkSdk/Linux/include/*"]
    elsif RUBY_PLATFORM.include?("darwin")
      include.install Dir["DecklinkSdk/Mac/include/*"]
    else
      puts "Unable to detect supported system. Skipping Install."
      puts "To manually install a specific version, use the flags --with-macOS or --with-linux"
    end
  end
end
