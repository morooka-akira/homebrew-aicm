class Aicd < Formula
  desc      "AI Code Agent Context management tool"
  homepage  "https://github.com/morooka-akira/aicd"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url     "https://github.com/morooka-akira/aicd/releases/download/v#{version}/aicd-aarch64-apple-darwin"
      sha256  "305a102fffe28b89072034435cbe0c22db74a895bae44102fdd07c94fe38cf5c"
    end

    on_intel do
      url     "https://github.com/morooka-akira/aicd/releases/download/v#{version}/aicd-x86_64-apple-darwin"
      sha256  "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_intel do
      url     "https://github.com/morooka-akira/aicd/releases/download/v#{version}/aicd-x86_64-unknown-linux-gnu"
      sha256  "594cceb248e02383952b56a1050bea5271eaf0ec1f472bfdda090ea995604644"
    end

    on_arm do
      url     "https://github.com/morooka-akira/aicd/releases/download/v#{version}/aicd-aarch64-unknown-linux-gnu"
      sha256  "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install cached_download.basename => "aicd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aicd --version")
  end
end
