cask "macforge-beta" do
  version "1.2.0B1"
  sha256 "9accfd47b244187b328d20855dc7807a6dcd2be6f6a41f1df34b4964b675d1b8"

  url "https://github.com/MacEnhance/appcast/raw/master/Beta/MacForge/MacForge.#{version}.zip",
      verified: "github.com/MacEnhance/appcast/"
  name "MacForge Beta"
  desc "Plugin, App, and Theme store which includes plugin injection"
  homepage "https://www.macenhance.com/macforge"

  depends_on macos: ">= :mojave"

  app "MacForge.app"

  uninstall launchctl:  "com.macenhance.MacForge.Injector",
            login_item: "MacForgeHelper",
            quit:       [
              "com.macenhance.MacForge",
              "com.macenhance.MacForge.PreferenceLoader",
              "com.macenhance.MacForgeDockTile",
              "com.macenhance.MacForgeHelper",
              "com.macenhance.SIPKit",
            ],
            delete:     [
              "/Library/Application Support/MacEnhance",
              "/Library/LaunchDaemons/com.macenhance.MacForge.Injector.plist",
              "/Library/PrivilegedHelperTools/com.macenhance.MacForge.Injector",
            ]

  zap trash: [
    "~/Library/Application Support/com.macenhance.MacForge",
    "~/Library/Application Support/MacEnhance",
    "~/Library/Caches/com.macenhance.MacForge",
    "~/Library/Caches/com.macenhance.MacForgeHelper",
    "~/Library/HTTPStorages/com.macenhance.MacForge",
    "~/Library/HTTPStorages/com.macenhance.MacForge.binarycookies",
    "~/Library/HTTPStorages/com.macenhance.MacForgeHelper",
    "~/Library/Preferences/com.macenhance.MacForge.plist",
    "~/Library/Preferences/com.macenhance.MacForgeHelper.plist",
    "~/Library/Saved Application State/com.macenhance.MacForge.savedState",
    "~/Library/WebKit/com.macenhance.MacForge",
  ]
end
