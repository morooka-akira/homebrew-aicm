class Aicm < Formula
  desc      "AI Code Agent Context management tool"
  homepage  "https://github.com/morooka-akira/aicm"
  license "MIT"

  on_macos do
    on_arm do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.1.2/aicm-aarch64-apple-darwin",
              using: :nounzip
      sha256  "5cbd73c64c1da2da15364dfd92b73470b519efd03d6acc42aac86256bbeb6371"
    end

    on_intel do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.1.2/aicm-x86_64-apple-darwin",
              using: :nounzip
      sha256  "201271934edbb956417c8810c3585cbf8edabbc7a458accd53e1912f067eeab6"
    end
  end

  on_linux do
    on_intel do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.1.2/aicm-x86_64-unknown-linux-gnu",
              using: :nounzip
      sha256  "d773b2aebac3e86a4847947eee97c663b9e20eaf0f36dcbe654b705752985281"
    end

    on_arm do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.1.2/aicm-aarch64-unknown-linux-gnu",
              using: :nounzip
      sha256  "3a688082ce8342bde9c9277e4ed05c57202d7e3aada80abeeed6428fa862a921"
    end
  end

  def install
    platform_bin = Dir["*"].first
    chmod "+x", platform_bin
    bin.install platform_bin => "aicm"
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/aicm --version")
  end
end
