class Dotmage < Formula
  desc "E2E-encrypted .env secret manager"
  homepage "https://github.com/dotMage/dotmage"
  version "2.0.1"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-macos-aarch64"
      sha256 "f2639d781015ea1f7ed90efc973e881f7e05404f75c2b5866d787e98b487c411"
    else
      url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-macos-x86_64"
      sha256 "8b26aff764e3bd5a1906d470b98280053e70665bcbb13feb118d99f4b874cc48"
    end
  end

  on_linux do
    url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-linux-x86_64"
    sha256 "d6ff83284bffd9647e22d39dd6116784350304a01190fb15dbe9760325219f26"
  end

  def install
    binary = Dir["dmage-*"].first || "dmage"
    bin.install binary => "dmage"
  end

  test do
    assert_match "dotMage", shell_output("#{bin}/dmage help")
  end
end
