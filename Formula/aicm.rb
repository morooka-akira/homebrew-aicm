class Aicm < Formula
  desc      "AI Code Agent Context management tool"
  homepage  "https://github.com/morooka-akira/aicm"
  license "MIT"

  on_macos do
    on_arm do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.3.0/aicm-aarch64-apple-darwin",
              using: :nounzip
      sha256  "0fbe9552ce455b68317a01e5f8779174a872bd5d1e8027d929f330346107f253"
    end

    on_intel do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.3.0/aicm-x86_64-apple-darwin",
              using: :nounzip
      sha256  "2047235b9309b5d5db86f984365ea51f887479f0e0c853e4b8058ea60d37eec1"
    end
  end

  on_linux do
    on_intel do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.3.0/aicm-x86_64-unknown-linux-gnu",
              using: :nounzip
      sha256  "f1960ad87154baada8dffddbb3f804df79a03e068739bdeda938c1b665ef0245"
    end

    on_arm do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.3.0/aicm-aarch64-unknown-linux-gnu",
              using: :nounzip
      sha256  "a6f3eedeb5e644527e05c32d3500b9bf937c3ee6beeabece715b638b09c6a47b"
    end
  end

  def install
    platform_bin = Dir["*"].first
    chmod "+x", platform_bin
    bin.install platform_bin => "aicm"
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/aicm --version")
  end
end
