cask "mouselock" do
  version "0.10.2"
  sha256 "3590d1110c0a0f88429d2efe84ffa017325835253621ac7760b018faf6cd4c12"

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
