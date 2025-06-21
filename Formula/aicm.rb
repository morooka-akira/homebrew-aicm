class Aicm < Formula
  desc      "AI Code Agent Context management tool"
  homepage  "https://github.com/morooka-akira/aicm"
  license "MIT"

  on_macos do
    on_arm do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.2.1/aicm-aarch64-apple-darwin",
              using: :nounzip
      sha256  "6bc7dfa2224258d7fd7e78cfb6cca7f833d4e765ced16b99b093c9485c60541c"
    end

    on_intel do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.2.1/aicm-x86_64-apple-darwin",
              using: :nounzip
      sha256  "6bd07cd7299dcab4cefd5162443728d44fd05575c76ebf9bd6b123564dadcc26"
    end
  end

  on_linux do
    on_intel do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.2.1/aicm-x86_64-unknown-linux-gnu",
              using: :nounzip
      sha256  "d6a3edd3d9f0feae8cf690e7785aa5480d6764fa51729744dabc9746de5485c4"
    end

    on_arm do
      url     "https://github.com/morooka-akira/aicm/releases/download/v0.2.1/aicm-aarch64-unknown-linux-gnu",
              using: :nounzip
      sha256  "dbd4a625d01fb5fd0af843566b68a333a8eb7ddc3389f287ed1bd79553969be2"
    end
  end

  def install
    platform_bin = Dir["*"].first
    chmod "+x", platform_bin
    bin.install platform_bin => "aicm"
  end

  test do
    assert_match "0.2.1", shell_output("#{bin}/aicm --version")
  end
end
