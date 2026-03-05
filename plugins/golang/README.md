# gopls

Official Go language server for Claude Code, providing rich language intelligence for Go projects.

## Features

- Code completion
- Diagnostics (compile errors, vet warnings)
- Hover documentation
- Go-to-definition
- Find references
- Rename symbol
- Code actions (organize imports, fix suggestions)

## Prerequisites

`gopls` must be installed and available on `$PATH`:

```bash
go install golang.org/x/tools/gopls@latest
```

Or via your system package manager:

```bash
# macOS
brew install gopls

# Nix
nix-shell -p gopls
```

## Configuration

The default `.lsp.json` configuration works for most Go projects:

```json
{
  "go": {
    "command": "gopls",
    "args": [],
    "extensionToLanguage": { ".go": "go" },
    "transport": "stdio",
    "initializationOptions": {},
    "settings": {},
    "maxRestarts": 3
  }
}
```

To customize gopls settings (e.g. enable experimental features), add them under `settings`:

```json
{
  "go": {
    "settings": {
      "gopls": {
        "ui.completion.usePlaceholders": true,
        "ui.diagnostic.staticcheck": true
      }
    }
  }
}
```

## License

BSD-3-Clause (upstream gopls)
