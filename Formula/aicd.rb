class Aicd < Formula
  desc "AI Code Development tool"
  homepage "https://github.com/morooka-akira/homebrew-aicm"
  
  if OS.mac?
    url "https://github.com/morooka-akira/homebrew-aicm/releases/download/v0.1.1/aicm-aarch64-apple-darwin"
    sha256 "305a102fffe28b89072034435cbe0c22db74a895bae44102fdd07c94fe38cf5c"
  elsif OS.linux?
    url "https://github.com/morooka-akira/homebrew-aicm/releases/download/v0.1.1/aicm-x86_64-unknown-linux-gnu"
    sha256 "594cceb248e02383952b56a1050bea5271eaf0ec1f472bfdda090ea995604644"
  end
  
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5f03ca9507915f14d58a7e30721271a996ec0d5db5b0d447c59c9ceed825847a"
  end

  def install
    bin.install Dir["*"].first => "aicd"
  end

  test do
    system bin/"aicd", "--version"
  end
end
