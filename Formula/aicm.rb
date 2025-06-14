class Aicm < Formula
  desc      "AI Code Agent Context management tool"
  homepage  "https://github.com/morooka-akira/aicm"
  license "MIT"

  bottle do
    root_url "https://github.com/morooka-akira/homebrew-aicm/releases/download/aicm-64-unknown-linux-gnu"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bf4e117115c2f57881677772a335ac1bf81209830d783199df782bb78ce1659a"
    sha256 cellar: :any_skip_relocation, ventura:       "fc833a29034e83ac9ad7453af0f69247bc6020a8ba2ef0a1d9d76263163dc310"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8ac8eb87e5b461491181344ff1262e6442a2d50586269e68b7a3dd40c4921849"
  end

  on_macos do
    on_arm do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.1.3/aicm-aarch64-apple-darwin",
              using: :nounzip
      sha256  "126974ac18d980030696a427be2056b509021963a33696d6142f86b363f77068"
    end

    on_intel do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.1.3/aicm-x86_64-apple-darwin",
              using: :nounzip
      sha256  "338451cbc2a6f8fbcee2fe435a19163e4fdc9fd08fed47b4474c4c1c6353b8d4"
    end
  end

  on_linux do
    on_intel do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.1.3/aicm-x86_64-unknown-linux-gnu",
              using: :nounzip
      sha256  "cd307e9e3f8f2ef8d213013b14505200d2f8492bbfefb4f1e1d83b84142705a2"
    end

    on_arm do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.1.3/aicm-aarch64-unknown-linux-gnu",
              using: :nounzip
      sha256  "055cff13fd4db4cc63f6afcba656f68b6999edcb820845c16f545e9b2813165d"
    end
  end

  def install
    platform_bin = Dir["*"].first
    chmod "+x", platform_bin
    bin.install platform_bin => "aicm"
  end

  test do
    assert_match "0.1.3", shell_output("#{bin}/aicm --version")
  end
end
