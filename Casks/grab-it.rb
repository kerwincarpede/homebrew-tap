cask "grab-it" do
  version "0.7.27"
  sha256 "ecde2f135a97edca6705b916ed618dac6b81c343507f7c43b5f13775ffc4d66c"

  url "https://github.com/kerwincarpede/grab-it/releases/download/v0.7.27/Grab-it_0.7.27_universal.dmg"
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
