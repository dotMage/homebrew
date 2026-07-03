class Dotmage < Formula
  desc "E2E-encrypted .env secret manager"
  homepage "https://github.com/dotMage/dotmage"
  version "1.4.0"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-macos-aarch64"
      sha256 "f83c3e52285431dcf6affe823da18bdab7f30712d3460f5cd355c0d920f108a4"
    else
      url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-macos-x86_64"
      sha256 "2f500eed2f9d170eb927aefbb0b4f5796becb96b80e3e4d00ce38bcc1a4df512"
    end
  end

  on_linux do
    url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-linux-x86_64"
    sha256 "ba2a955fabce5f99741a4382de184cd47b8997737016fe5a61b6b642f576b02a"
  end

  def install
    binary = Dir["dmage-*"].first || "dmage"
    bin.install binary => "dmage"
  end

  test do
    assert_match "dotMage", shell_output("#{bin}/dmage help")
  end
end
