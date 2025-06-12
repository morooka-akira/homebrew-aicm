class Aicd < Formula
  desc "AI Code Development tool"
  homepage "https://github.com/morooka-akira/homebrew-aicm"
  url "https://github.com/morooka-akira/homebrew-aicm/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "fedf2fa94b4d43346002ef718846237617eb9d971740e7fab0453567f16db0e6"
  license "MIT"

  bottle do
    root_url "https://github.com/morooka-akira/homebrew-aicm/releases/download/v0.1.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5693cda447ac49438b3454e2e2c846a2b1404e1935c1120b2d6631cce69baec5"
  end

  def install
    bin.install "aicd"
  end

  test do
    system bin/"aicd", "--version"
  end
end
