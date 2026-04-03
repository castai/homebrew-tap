cask "kimchi-companion" do
  version "0.1.1"
  sha256 "00ed8c154a8307796fb3914da1d25845375665cacf558e7c2daa023d491a253d"

  url "https://github.com/castai/kimchi-companion/releases/download/v#{version}/KimchiCompanion.dmg"
  name "Kimchi Companion"
  desc "macOS menu bar companion for CAST AI usage monitoring"
  homepage "https://github.com/castai/kimchi-companion"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Kimchi Companion.app"

  zap trash: [
    "~/Library/Application Support/KimchiCompanion",
    "~/Library/Preferences/com.castai.kimchi-companion.plist",
    "~/Library/Caches/com.castai.kimchi-companion",
  ]
end
