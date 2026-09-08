cask "dropshot" do
  version "1.2.1"
  sha256 "e359537f2b32a10c1a6700b9798215fcc81fbefc30e7a919a96759ec50eb3a4c"

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
