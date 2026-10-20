cask "mouselock" do
  version "0.2.5"
  sha256 "1b9ae8caba54b194abb7e8c3d87526386cc11f4cdf13bb4e13f0e9c01dd4ae1e"

  url "https://github.com/mwolf-net/mouselock/releases/download/v#{version}/MouseLock-#{version}.zip"
  name "MouseLock"
  desc "Menu bar app that locks the mouse pointer to one display"
  homepage "https://github.com/mwolf-net/mouselock"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "MouseLock.app"

  uninstall quit: "net.mwolf.mouselock"

  zap trash: "~/Library/Preferences/net.mwolf.mouselock.plist"

  caveats <<~EOS
    MouseLock isn't notarized by Apple, so macOS blocks its first launch.
    Open it once, click Done, then go to System Settings -> Privacy & Security
    and click "Open Anyway". Homebrew keeps that approval for future upgrades.

    On first lock, allow MouseLock under Privacy & Security -> Accessibility.
  EOS
end
