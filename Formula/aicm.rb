class Aicm < Formula
  desc      "AI Code Agent Context management tool"
  homepage  "https://github.com/morooka-akira/aicm"
  license "MIT"

  on_macos do
    on_arm do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.4.1/aicm-aarch64-apple-darwin",
              using: :nounzip
      sha256  "e8f18d7627f9e828a960abe67cd84fc8883c8cb5e89acc1707f9cb6c44077980"
    end

    on_intel do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.4.1/aicm-x86_64-apple-darwin",
              using: :nounzip
      sha256  "d9929e5b7983ca853af07987073b129daf425b959cb4f91c715fedda329178ea"
    end
  end

  on_linux do
    on_intel do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.4.1/aicm-x86_64-unknown-linux-gnu",
              using: :nounzip
      sha256  "db98b0cd2ca4d51f481eb671c08c8d818381c0cdd1625595305063b6971d04f5"
    end

    on_arm do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.4.1/aicm-aarch64-unknown-linux-gnu",
              using: :nounzip
      sha256  "8184a35dcb27af490cd417067e52d77960169d03f28d7e89e3b318c9dea167a5"
    end
  end

  def install
    platform_bin = Dir["*"].first
    chmod "+x", platform_bin
    bin.install platform_bin => "aicm"
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/aicm --version")
  end
end
