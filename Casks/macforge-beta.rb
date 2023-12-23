cask "macforge-beta" do
  version "1.2.2-2"
  sha256 "0f8bb8de80ddd98f34c9465f4a8d4a5587abb4273fefe690f529a5b13a0fea53"

  url "https://github.com/jslegendre/appcast/raw/master/Beta/MacForge/MacForge.#{version}.zip",
      verified: "github.com/jslegendre/appcast/"
  name "MacForge Beta"
  desc "Plugin, App, and Theme store which includes plugin injection"
  homepage "https://www.macenhance.com/macforge"

  depends_on macos: ">= :big_sur"

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
              "/Library/LaunchDaemons/com.macenhance.MacForge.Injector.plist",
              "/Library/PrivilegedHelperTools/com.macenhance.MacForge.Injector",
            ]

  zap trash: [
    "/Library/Application Support/MacEnhance",
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
