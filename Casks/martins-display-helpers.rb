cask "martins-display-helpers" do
  version "0.12.0"
  sha256 "3505d44f2f87115e67278595e020db74a45c881c5c15dde9114ff16cb66189f5"

  url "https://github.com/mwolf-net/MartinsDisplayHelpers/releases/download/v#{version}/MartinsDisplayHelpers-#{version}.zip"
  name "Martin's Display Helpers"
  desc "Menu bar app for working with more than one screen"
  homepage "https://github.com/mwolf-net/MartinsDisplayHelpers"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "MartinsDisplayHelpers.app"

  uninstall quit: "net.mwolf.martinsdisplayhelpers"

  zap trash: [
    "~/Library/Preferences/net.mwolf.martinsdisplayhelpers.plist",
    "~/Library/Preferences/net.mwolf.mouselock.plist",
  ]

  caveats <<~EOS
    Martin's Display Helpers isn't notarized by Apple, so macOS blocks its first
    launch. Open it once, click Done, then go to System Settings -> Privacy &
    Security and click "Open Anyway". Homebrew keeps that approval for future
    upgrades.

    On first lock, allow it under Privacy & Security -> Accessibility.
  EOS
end
