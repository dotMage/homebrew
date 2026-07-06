class Dotmage < Formula
  desc "E2E-encrypted .env secret manager"
  homepage "https://github.com/dotMage/dotmage"
  version "2.0.2"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-macos-aarch64"
      sha256 "30725b32135ff7bac3b1a4ea852361c537c104ceefac43f89d92b1ebb9540c14"
    else
      url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-macos-x86_64"
      sha256 "29a33224307975eacafafc7d92a2f3a905c7cff7ac6ab5d6afbdbc08a97f74c2"
    end
  end

  on_linux do
    url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-linux-x86_64"
    sha256 "47a60efb8e2959727f0c817a2f3ba77a0c8780ff366e1fb572ce58db94333947"
  end

  def install
    binary = Dir["dmage-*"].first || "dmage"
    bin.install binary => "dmage"
  end

  test do
    assert_match "dotMage", shell_output("#{bin}/dmage help")
  end
end
