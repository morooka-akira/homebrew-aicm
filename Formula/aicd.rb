class Aicd < Formula
  desc      "AI Code Agent Context management tool"
  homepage  "https://github.com/morooka-akira/aicd"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url     "https://github.com/morooka-akira/aicd/releases/download/v#{version}/aicd-aarch64-apple-darwin"
      sha256  "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  on_linux do
    on_intel do
      url     "https://github.com/morooka-akira/aicd/releases/download/v#{version}/aicd-x86_64-unknown-linux-gnu"
      sha256  "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  def install
    bin.install cached_download.basename => "aicd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aicd --version")
  end
end
