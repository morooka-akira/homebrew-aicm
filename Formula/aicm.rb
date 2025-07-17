class Aicm < Formula
  desc      "AI Code Agent Context management tool"
  homepage  "https://github.com/morooka-akira/aicm"
  license "MIT"

  on_macos do
    on_arm do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.4.0/aicm-aarch64-apple-darwin",
              using: :nounzip
      sha256  "869349a83f60761cf717347fef2e7cd99913f02994f199adc2a41587e17d7341"
    end

    on_intel do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.4.0/aicm-x86_64-apple-darwin",
              using: :nounzip
      sha256  "c3525da43fa3a532c5229576c94ab909bf0f2a798e2cca7cf7b7ff697d79ea31"
    end
  end

  on_linux do
    on_intel do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.4.0/aicm-x86_64-unknown-linux-gnu",
              using: :nounzip
      sha256  "23a011a2ec857b1fb34633648d824765558a926204ebd115e07f52a788b13e72"
    end

    on_arm do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.4.0/aicm-aarch64-unknown-linux-gnu",
              using: :nounzip
      sha256  "f85ca6b51751c154cb36e8d38b91191975254196db7bb2166a6cd6772782a8af"
    end
  end

  def install
    platform_bin = Dir["*"].first
    chmod "+x", platform_bin
    bin.install platform_bin => "aicm"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/aicm --version")
  end
end
