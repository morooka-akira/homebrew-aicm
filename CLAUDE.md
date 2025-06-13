# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Homebrew tap for the `aicm` (AI Code Agent Context management tool) binary. The repository contains:

- `Formula/aicm.rb` - Homebrew formula for cross-platform binary installation
- `docs/homebrew-update.md` - Detailed update procedures in Japanese

## Key Commands

### Testing and Validation
```bash
# Style check
brew style morooka-akira/aicm

# Audit check  
brew audit --except=installed --tap=morooka-akira/aicm

# Syntax check
brew readall --aliases --os=all --arch=all morooka-akira/aicm
```

### Formula Updates
When updating to a new version, calculate SHA256 hashes for all platforms:
```bash
curl -sL https://github.com/morooka-akira/aicm/releases/download/v{VERSION}/aicm-aarch64-apple-darwin | shasum -a 256
curl -sL https://github.com/morooka-akira/aicm/releases/download/v{VERSION}/aicm-x86_64-apple-darwin | shasum -a 256
curl -sL https://github.com/morooka-akira/aicm/releases/download/v{VERSION}/aicm-x86_64-unknown-linux-gnu | shasum -a 256
curl -sL https://github.com/morooka-akira/aicm/releases/download/v{VERSION}/aicm-aarch64-unknown-linux-gnu | shasum -a 256
```

## Formula Architecture

The formula supports 4 platforms:
- macOS ARM64 (`aarch64-apple-darwin`)
- macOS Intel (`x86_64-apple-darwin`) 
- Linux x86_64 (`x86_64-unknown-linux-gnu`)
- Linux ARM64 (`aarch64-unknown-linux-gnu`)

Key formula requirements:
- `using: :nounzip` is required for binary files without extensions
- `chmod "+x"` ensures executable permissions on Linux
- URLs point to GitHub releases with exact version tags
- SHA256 hashes must be accurate for security

## Update Process

1. New binaries must be available on GitHub releases
2. Calculate SHA256 for all 4 platform binaries
3. Update `Formula/aicm.rb` with new version URLs and hashes
4. Update version assertion in test block
5. Run validation commands before committing
6. Use branch naming: `update-to-v{VERSION}`

The formula was migrated from `aicd` to `aicm` for consistency.