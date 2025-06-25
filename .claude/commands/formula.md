# formula

Homebrew formula management commands for aicm tap.

https://github.com/morooka-akira/aicm のリポジトリから最新のreleaseを参照し、更新バージョンとする

## Formula Update Process

Update the aicm formula to a new version by calculating SHA256 hashes and updating the formula file.

### Steps:
1. Calculate SHA256 hashes for all 4 platform binaries
2. Update Formula/aicm.rb with new version URLs and hashes  
3. Run validation commands
4. Create branch and commit changes
5. Create pull request

### Hash Calculation Commands:
```bash
curl -sL https://github.com/morooka-akira/aicm/releases/download/v{VERSION}/aicm-aarch64-apple-darwin | shasum -a 256
curl -sL https://github.com/morooka-akira/aicm/releases/download/v{VERSION}/aicm-x86_64-apple-darwin | shasum -a 256
curl -sL https://github.com/morooka-akira/aicm/releases/download/v{VERSION}/aicm-x86_64-unknown-linux-gnu | shasum -a 256
curl -sL https://github.com/morooka-akira/aicm/releases/download/v{VERSION}/aicm-aarch64-unknown-linux-gnu | shasum -a 256
```

### Validation Commands:
```bash
brew style morooka-akira/aicm
brew audit --except=installed --tap=morooka-akira/aicm
brew readall --aliases --os=all --arch=all morooka-akira/aicm
```

### Formula Structure:
- Supports 4 platforms: macOS ARM64/Intel, Linux x86_64/ARM64
- Uses `using: :nounzip` for binary files without extensions
- Requires `chmod "+x"` for executable permissions on Linux
- URLs point to GitHub releases with exact version tags
- SHA256 hashes must be accurate for security

### Branch and PR Creation:
```bash
# Create and switch to new branch
git checkout -b update-to-v{VERSION}

# Add and commit changes
git add Formula/aicm.rb
git commit -m "$(cat <<'EOF'
aicm {VERSION}

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
EOF
)"

# Push branch to remote
git push -u origin update-to-v{VERSION}

# Create pull request
gh pr create --title "aicm {VERSION}" --body "$(cat <<'EOF'
## Summary
- Updated aicm formula to version {VERSION}
- Updated SHA256 hashes for all 4 platform binaries (macOS ARM64/Intel, Linux x86_64/ARM64)
- Updated version assertion in test block

## Test plan
- [x] Calculated SHA256 hashes for all platform binaries
- [x] Ran `brew style` validation - passed
- [x] Ran `brew audit` validation - passed  
- [x] Ran `brew readall` syntax check - passed

🤖 Generated with [Claude Code](https://claude.ai/code)
EOF
)"
```

### Branch Naming Convention:
`update-to-v{VERSION}`