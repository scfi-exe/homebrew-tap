cask "dropshot" do
  version "1.1"
  sha256 "9b0c02c3b6acb8f2ede0ccaefdbe9686826e40925d6dc4a9d245334817776b38"

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
