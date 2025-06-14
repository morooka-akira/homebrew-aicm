# homebrew-aicm

A Homebrew tap for the [aicm](https://github.com/morooka-akira/aicm) (AI Code Agent Context management tool).

## What is aicm?

`aicm` is an AI Code Agent Context management tool that helps developers manage context for AI-assisted coding sessions. It provides utilities for organizing and maintaining code context across different development workflows.

## Installation

### Install directly

```bash
brew install morooka-akira/aicm/aicm
```

### Or tap first, then install

```bash
brew tap morooka-akira/aicm
brew install aicm
```

### Using Brewfile

Add to your `Brewfile`:

```ruby
tap "morooka-akira/aicm"
brew "aicm"
```

Then run:

```bash
brew bundle
```

## Usage

After installation, you can use the `aicm` command:

```bash
aicm --version
aicm --help
```

## For Maintainers

- [Homebrew Formula Update Guide](docs/homebrew-update.md) - Detailed instructions for updating the formula

## Links

- **Project Repository**: [morooka-akira/aicm](https://github.com/morooka-akira/aicm)
- **Homebrew Documentation**: [docs.brew.sh](https://docs.brew.sh)
- **License**: MIT
