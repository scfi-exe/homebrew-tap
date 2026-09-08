cask "dropshot" do
  version "1.2"
  sha256 "1e9f638a28c37ffd9941b21ec7979cb02a1e161e8a4f0065cdc810485ec7da0a"

  url "https://github.com/scfi-exe/DropShot/releases/download/v#{version}/DropShot-#{version}.dmg"
  name "DropShot"
  desc "Screenshot and screen recording tool for macOS"
  homepage "https://dropshot.tools"

  depends_on macos: :sequoia

  app "DropShot.app"

  zap trash: [
    "~/Library/Preferences/com.scfi.DropShot.plist",
    "~/Pictures/DropShot",
  ]
end
