cask "dropshot" do
  version "1.0"
  sha256 "b21275c30e47e7f0ca68fb588f59ecc63f29e75b5f5eda07183ae6379bb34197"

  url "https://github.com/scfi-exe/DropShot/releases/download/v#{version}/DropShot-#{version}.dmg"
  name "DropShot"
  desc "Screenshot and screen recording tool for macOS"
  homepage "https://dropshot.tools"

  depends_on macos: ">= :ventura"

  app "DropShot.app"

  zap trash: [
    "~/Library/Preferences/com.scfi.DropShot.plist",
    "~/Pictures/DropShot",
  ]
end
