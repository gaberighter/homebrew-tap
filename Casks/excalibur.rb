cask "excalibur" do
  version "0.1.1"
  sha256 "355c314f86fc9979134a5d8c7625054682b5063aadba0f5c28803dd404f52ef2"

  url "https://github.com/gaberighter/excalibur/releases/download/v#{version}/Excalibur-#{version}-arm64.zip"
  name "Excalibur"
  desc "Small floating window showing system metrics"
  homepage "https://github.com/gaberighter/excalibur"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Excalibur.app"

  # The app is not notarised, so Gatekeeper would refuse to open it while it
  # carries the quarantine flag that a download is given.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Excalibur.app"]
  end

  zap trash: "~/.config/excalibur"
end
