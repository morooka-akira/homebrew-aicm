class Aicd < Formula
  desc      "AI Code Agent Context management tool"
  homepage  "https://github.com/morooka-akira/aicd"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url     "https://github.com/morooka-akira/aicm/releases/download/v#{version}/aicm-aarch64-apple-darwin"
      sha256  "3512fa921a959567f3a2f11052336a3c057463ef864fea5e5cd02dfe3aeac613"
    end

    on_intel do
      url     "https://github.com/morooka-akira/aicm/releases/download/v#{version}/aicm-x86_64-apple-darwin"
      sha256  "6f9d498ce78ddf3d86c79d6e627a28ce564c6c3638c683962225c61b88ce7ed9"
    end
  end

  on_linux do
    on_intel do
      url     "https://github.com/morooka-akira/aicm/releases/download/v#{version}/aicm-x86_64-unknown-linux-gnu"
      sha256  "d34ea479b0530b3d83708807edab99a0ae8cb4e8a3ea148999d0a2d0b03ae931"
    end
  end

  def install
    bin.install cached_download.basename => "aicd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aicd --version")
  end
end
