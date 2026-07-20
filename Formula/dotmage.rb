class Dotmage < Formula
  desc "E2E-encrypted .env secret manager"
  homepage "https://github.com/dotMage/dotmage"
  version "2.1.0"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-macos-aarch64"
      sha256 "a6dd0a1c5b185fdbf3234a60d2852d702b6091405e19738356d45c2ef5df8d79"
    else
      url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-macos-x86_64"
      sha256 "397b712fbcfdcb576af8353f2639afc07f9c0e31f542e03dac752e5d2cc4860f"
    end
  end

  on_linux do
    url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-linux-x86_64"
    sha256 "3d5bed4cb2230726b3415264014001fc1bc2986585d1b27200a949ebf59db903"
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
