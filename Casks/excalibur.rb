cask "excalibur" do
  version "0.1.0"
  sha256 "37884a527249638eddaf872a97f4849c5ab8e6fc3111983651d60cd26ed24256"

  url "https://github.com/gaberighter/excalibur/releases/download/v#{version}/Excalibur-#{version}-arm64.zip"
  name "Excalibur"
  desc "Small floating window showing system metrics"
  homepage "https://github.com/gaberighter/excalibur"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Excalibur.app"

  # The app is not notarised, so Gatekeeper would refuse to open it while it
  # carries the quarantine flag that a download is given.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Excalibur.app"]
  end

  zap trash: "~/.config/excalibur"
end
