cask "macforge-beta" do
  version "1.2.2-3"
  sha256 "b316bb4fc6b37dbd3a442eb0ac89549d3e9068ef16603d905e36ad90462333cb"

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
