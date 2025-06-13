# Homebrew Formula Update Guide

このドキュメントでは、aicd Homebrewフォーミュラを新しいバージョンに更新する手順を説明します。

## 前提条件

- 新しいバイナリリリースが [morooka-akira/aicm](https://github.com/morooka-akira/aicm/releases) で利用可能であること
- 以下のプラットフォーム用バイナリが含まれていること：
  - `aicm-aarch64-apple-darwin` (macOS ARM64)
  - `aicm-x86_64-apple-darwin` (macOS Intel)
  - `aicm-x86_64-unknown-linux-gnu` (Linux x86_64)
  - `aicm-aarch64-unknown-linux-gnu` (Linux ARM64)

## 更新手順

### 1. 新しいバイナリのSHA256ハッシュを取得

```bash
# 各プラットフォームのハッシュを計算
curl -sL https://github.com/morooka-akira/aicm/releases/download/v{VERSION}/aicm-aarch64-apple-darwin | shasum -a 256
curl -sL https://github.com/morooka-akira/aicm/releases/download/v{VERSION}/aicm-x86_64-apple-darwin | shasum -a 256
curl -sL https://github.com/morooka-akira/aicm/releases/download/v{VERSION}/aicm-x86_64-unknown-linux-gnu | shasum -a 256
curl -sL https://github.com/morooka-akira/aicm/releases/download/v{VERSION}/aicm-aarch64-unknown-linux-gnu | shasum -a 256
```

### 2. Formula/aicd.rbを更新

```ruby
class Aicd < Formula
  desc      "AI Code Agent Context management tool"
  homepage  "https://github.com/morooka-akira/aicd"
  license "MIT"

  on_macos do
    on_arm do
      url     "https://github.com/morooka-akira/aicm/releases/download/v{VERSION}/aicm-aarch64-apple-darwin",
              using: :nounzip
      sha256  "{MACOS_ARM64_HASH}"
    end

    on_intel do
      url     "https://github.com/morooka-akira/aicm/releases/download/v{VERSION}/aicm-x86_64-apple-darwin",
              using: :nounzip
      sha256  "{MACOS_INTEL_HASH}"
    end
  end

  on_linux do
    on_intel do
      url     "https://github.com/morooka-akira/aicm/releases/download/v{VERSION}/aicm-x86_64-unknown-linux-gnu",
              using: :nounzip
      sha256  "{LINUX_X86_64_HASH}"
    end

    on_arm do
      url     "https://github.com/morooka-akira/aicm/releases/download/v{VERSION}/aicm-aarch64-unknown-linux-gnu",
              using: :nounzip
      sha256  "{LINUX_ARM64_HASH}"
    end
  end

  def install
    platform_bin = Dir["*"].first
    chmod "+x", platform_bin
    bin.install platform_bin => "aicd"
  end

  test do
    assert_match "{VERSION}", shell_output("#{bin}/aicd --version")
  end
end
```

### 3. 更新内容の確認

```bash
# スタイルチェック
brew style morooka-akira/aicm

# Auditチェック
brew audit --except=installed --tap=morooka-akira/aicm

# 構文チェック
brew readall --aliases --os=all --arch=all morooka-akira/aicm
```

### 4. PR作成とテスト

1. 新しいブランチを作成
```bash
git checkout -b update-to-v{VERSION}
```

2. 変更をコミット
```bash
git add Formula/aicd.rb
git commit -m "Update aicd to v{VERSION}

- Update all platform binaries to v{VERSION}
- Update SHA256 hashes for all supported platforms
- Update version in test assertion

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>"
```

3. PRを作成
```bash
git push -u origin update-to-v{VERSION}
gh pr create --title "Update aicd to v{VERSION}" --body "Update aicd formula to v{VERSION} with latest binary releases"
```

### 5. テスト確認

GitHub Actionsで以下のテストが全て通ることを確認：
- ✅ `brew style` (コードスタイル)
- ✅ `brew audit` (フォーミュラ検証)
- ✅ `brew readall` (構文チェック)
- ✅ `brew test-bot --only-cleanup-before`
- ✅ `brew test-bot --only-setup`
- ✅ `brew test-bot --only-tap-syntax`
- ✅ `brew test-bot --only-formulae`

### 6. マージ

テストが全て通ったら、PRをマージします。

## 重要なポイント

- **`using: :nounzip`は必須**: バイナリファイルは拡張子がないため、Homebrewが展開を試行しないように明示する
- **`chmod "+x"`は必須**: Linuxでダウンロード後の実行権限を確保する
- **プラットフォーム固有のURL**: 各OS/アーキテクチャに対応したバイナリを指定する
- **正確なSHA256**: セキュリティのため、各バイナリの正確なハッシュが必要

## トラブルシューティング

### `No such file or directory` エラー
- `using: :nounzip` が抜けている可能性があります
- installブロックで `Dir["*"].first` を使用しているか確認

### `version is redundant` エラー
- 明示的な `version` 行は削除し、URLから自動検出させる

### テストが失敗する場合
- 新しいバイナリが実際にリリースされているか確認
- SHA256ハッシュが正確であるか再計算
- バイナリファイル名が正しいか確認