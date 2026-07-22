class Dotmage < Formula
  desc "E2E-encrypted .env secret manager"
  homepage "https://github.com/dotMage/dotmage"
  version "2.1.1"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-macos-aarch64"
      sha256 "dde9b1fb862bf80b17dfd9ff51ceed1fb9a4f78b1a80fd135ae55a208aeb4e9e"
    else
      url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-macos-x86_64"
      sha256 "7a386737b96e22d3ecaf10eefe31b869b054a8c6f8aca21acf41309114e642b0"
    end
  end

  on_linux do
    url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-linux-x86_64"
    sha256 "8ba00076f8b2ff5f30658f12e952cfb5b823d903bbff4482678455cc7ab3323d"
  end

  def install
    binary = Dir["dmage-*"].first || "dmage"
    bin.install binary => "dmage"

    # Runs `dmage completions bash|zsh|fish` and installs each to the right dir.
    generate_completions_from_executable(bin/"dmage", "completions")
  end

  test do
    assert_match "dotMage", shell_output("#{bin}/dmage help")
  end
end
