class Dotmage < Formula
  desc "E2E-encrypted .env secret manager"
  homepage "https://github.com/dotMage/dotmage"
  version "1.2.0"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-macos-aarch64"
      sha256 "7a091b2777b3d164aae687b1565e90bd42ba53d2b5dd35bfae9bd51b17f6c9d9"
    else
      url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-macos-x86_64"
      sha256 "9d853059a188f2077f94e533bcec4bc5e3b66a92e859dfa4ed59c83c7ed47168"
    end
  end

  on_linux do
    url "https://github.com/dotMage/dotmage/releases/download/v#{version}/dmage-linux-x86_64"
    sha256 "bd3c0f1be165344562d8f8424eee7cbe9e4a135d87586159abfdf63852095369"
  end

  def install
    binary = Dir["dmage-*"].first || "dmage"
    bin.install binary => "dmage"
  end

  test do
    assert_match "dotMage", shell_output("#{bin}/dmage help")
  end
end
