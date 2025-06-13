class Aicm < Formula
  desc      "AI Code Agent Context management tool"
  homepage  "https://github.com/morooka-akira/aicm"
  license "MIT"

  bottle do
    root_url "https://github.com/morooka-akira/homebrew-aicm/releases/download/aicm-64-unknown-linux-gnu"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a221c9fd5427c22f7189f78d705bf1d9663ef40f7550343a8f2346a47fb70039"
    sha256 cellar: :any_skip_relocation, ventura:       "f6d5a5f3cd7919fce526d850bfd0acd954a57d6f940000003752699ffad8ca01"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "82e93d6b6dbee9642e9afb8c8aae1ee5dc08354af1aa02820e09a8a88ca7e2bb"
  end

  on_macos do
    on_arm do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.1.1/aicm-aarch64-apple-darwin",
              using: :nounzip
      sha256  "3512fa921a959567f3a2f11052336a3c057463ef864fea5e5cd02dfe3aeac613"
    end

    on_intel do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.1.1/aicm-x86_64-apple-darwin",
              using: :nounzip
      sha256  "6f9d498ce78ddf3d86c79d6e627a28ce564c6c3638c683962225c61b88ce7ed9"
    end
  end

  on_linux do
    on_intel do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.1.1/aicm-x86_64-unknown-linux-gnu",
              using: :nounzip
      sha256  "d34ea479b0530b3d83708807edab99a0ae8cb4e8a3ea148999d0a2d0b03ae931"
    end

    on_arm do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.1.1/aicm-aarch64-unknown-linux-gnu",
              using: :nounzip
      sha256  "b13e0ba31df92633e92874dd4218232117fe9194d333129e02144100dbc5cfad"
    end
  end

  def install
    platform_bin = Dir["*"].first
    chmod "+x", platform_bin
    bin.install platform_bin => "aicm"
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/aicm --version")
  end
end
