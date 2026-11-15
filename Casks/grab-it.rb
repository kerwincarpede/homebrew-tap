cask "grab-it" do
  version "0.7.22"
  sha256 "3c71e52f6e8b7a4e808dbdf88e09686b079014b7d3eb5be4810e8f278edc75fc"

  url "https://github.com/kerwincarpede/grab-it/releases/download/v0.7.22/Grab-it_0.7.22_universal.dmg"
  name "Grab-it"
  desc "Screenshot, annotate and paste anywhere"
  homepage "https://kerwincarpede.github.io/grab-it/"

  auto_updates true

  app "Grab-it.app"

  # Grab-it is not notarized: clear the quarantine flag so it opens without
  # the Gatekeeper prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Grab-it.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.kerwincarpede.grabit",
    "~/Library/Caches/com.kerwincarpede.grabit",
    # "Start at login" registers a LaunchAgent named after the app.
    "~/Library/LaunchAgents/Grab-it.plist",
    "~/Library/Preferences/com.kerwincarpede.grabit.plist",
    "~/Library/Saved Application State/com.kerwincarpede.grabit.savedState",
    "~/Library/WebKit/com.kerwincarpede.grabit",
  ]
end
