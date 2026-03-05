# rust-analyzer

Official Rust language server for Claude Code, providing rich language intelligence for Rust projects.

## Features

- Code completion
- Diagnostics (compiler errors, warnings)
- Hover documentation
- Go-to-definition
- Find references
- Rename symbol
- Code actions (auto-import, fill match arms, add missing fields)
- Inlay hints

## Prerequisites

`rust-analyzer` must be installed and available on `$PATH`:

```bash
rustup component add rust-analyzer
```

Or via your system package manager:

```bash
# macOS
brew install rust-analyzer

# Nix
nix-shell -p rust-analyzer
```

## Configuration

The default `.lsp.json` configuration works for most Rust projects:

```json
{
  "rust": {
    "command": "rust-analyzer",
    "args": [],
    "extensionToLanguage": { ".rs": "rust" },
    "transport": "stdio",
    "initializationOptions": {},
    "settings": {},
    "maxRestarts": 3
  }
}
```

To customize rust-analyzer settings, add them under `settings`:

```json
{
  "rust": {
    "settings": {
      "rust-analyzer": {
        "checkOnSave": true,
        "check.command": "clippy"
      }
    }
  }
}
```

## License

Apache-2.0 OR MIT (upstream rust-analyzer)
