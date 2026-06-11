class Dotmage < Formula
  desc "E2E-encrypted .env secret manager"
  homepage "https://github.com/dotMage/dotmage"
  version "1.1.0"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-macos-aarch64"
      sha256 "23673e8bfd3529cc479c6971fa3186810e526f2aa1d2d6797614883f8d3f88b9"
    else
      url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-macos-x86_64"
      sha256 "459e4b914e14f02f971be6ed018f2c88d2ddfddd8210a9c858517e9ca8a56318"
    end
  end

  on_linux do
    url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-linux-x86_64"
    sha256 "fc0803341818bcb03f3b1c4ba2ba237cde7cb1761cce8fdf6cf72d3952a17f6e"
  end

  def install
    binary = Dir["dmage-*"].first || "dmage"
    bin.install binary => "dmage"
  end

  test do
    assert_match "dotMage", shell_output("#{bin}/dmage help")
  end
end
