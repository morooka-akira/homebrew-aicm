class Aicm < Formula
  desc      "AI Code Agent Context management tool"
  homepage  "https://github.com/morooka-akira/aicm"
  license "MIT"

  on_macos do
    on_arm do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.2.0/aicm-aarch64-apple-darwin",
              using: :nounzip
      sha256  "95aa6c09a087ba08e037a1e1e6f15c68e9f9ebbd6e87bd195fd28247c6c428d9"
    end

    on_intel do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.2.0/aicm-x86_64-apple-darwin",
              using: :nounzip
      sha256  "3576f464e8e5887c568c9b545d0da8d957e24f371cec642ad7e58c7a15760f17"
    end
  end

  on_linux do
    on_intel do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.2.0/aicm-x86_64-unknown-linux-gnu",
              using: :nounzip
      sha256  "24408ad8ca78392f7c374a732e571e6f3a2a0d46f1f64f306a5b32714506f214"
    end

    on_arm do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.2.0/aicm-aarch64-unknown-linux-gnu",
              using: :nounzip
      sha256  "0ddbf37425f619f292e3989ba87eb45ef3846be9620a1e040adde6c1088f69b5"
    end
  end

  def install
    platform_bin = Dir["*"].first
    chmod "+x", platform_bin
    bin.install platform_bin => "aicm"
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/aicm --version")
  end
end
