class Aicd < Formula
  desc "AI Code Development tool"
  homepage "https://github.com/morooka-akira/homebrew-aicm"
  url "https://github.com/morooka-akira/homebrew-aicm/archive/v0.1.0.tar.gz"
  sha256 "fedf2fa94b4d43346002ef718846237617eb9d971740e7fab0453567f16db0e6"
  license "MIT"

  def install
    bin.install "aicd"
  end

  test do
    system bin/"aicd", "--version"
  end
end
