cask "grab-it" do
  version "0.9.5"
  sha256 "4ea6353c89e722ebbbd07f6d4005f6dd9a49c5f9b4d681158ac8576ec0370f46"

  url "https://github.com/kerwincarpede/grab-it/releases/download/v0.9.5/Grab-it_0.9.5_universal.dmg"
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
