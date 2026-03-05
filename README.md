# claude-languages

> LSP language servers for [Claude Code](https://claude.ai/code) — code completion, diagnostics, hover, and go-to-definition for every language you work in.

[![Validate](https://github.com/claude-contrib/claude-languages/actions/workflows/validate.yml/badge.svg)](https://github.com/claude-contrib/claude-languages/actions/workflows/validate.yml)
[![Release](https://img.shields.io/github/v/release/claude-contrib/claude-languages)](https://github.com/claude-contrib/claude-languages/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Language servers extend what Claude *understands* — not just what it can do. Install a language plugin and Claude gains deep code intelligence: real-time errors, symbol navigation, and context-aware completions, powered by the same LSP servers your editor uses.

## Quickstart

**1. Register the marketplace** in `~/.claude/settings.json`:

```json
{
  "extraKnownMarketplaces": {
    "claude-languages": {
      "source": {
        "source": "github",
        "repo": "claude-contrib/claude-languages"
      }
    }
  }
}
```

**2. Install a language server** inside Claude Code:

```
/plugin install golang@claude-languages
```

Claude now has Go language intelligence available in every session.

## Available Language Servers

| Plugin | Language | Powered by | Description |
|--------|----------|------------|-------------|
| [`golang`](plugins/golang/README.md) | Go | [gopls](https://github.com/golang/tools/tree/master/gopls) | Official Go language server by the Go team |
| [`rust`](plugins/rust/README.md) | Rust | [rust-analyzer](https://github.com/rust-lang/rust-analyzer) | Official Rust language server |
| [`terraform`](plugins/terraform/README.md) | Terraform / HCL | [terraform-ls](https://github.com/hashicorp/terraform-ls) | Official Terraform language server by HashiCorp |

## Publish Your Own Language Server

Have an LSP server your team relies on? Package it for one-command install:

```
plugins/your-language/
├── .claude-plugin/plugin.json   # name, version, description
├── .lsp.json                    # server command + args + file extension mapping
└── README.md                   # what it unlocks + install instructions
```

1. **Fork** this repo and drop your plugin under `plugins/`
2. **Register** it in `.claude-plugin/marketplace.json`
3. **Open a PR** — CI validates structure automatically

→ [Read the full authoring guide](docs/README.md)

## The claude-contrib Ecosystem

| Marketplace | Install key | What it provides |
|-------------|------------|-----------------|
| [claude-extensions](https://github.com/claude-contrib/claude-extensions) | `@claude-extensions` | Hooks, context rules, session automation |
| [claude-services](https://github.com/claude-contrib/claude-services) | `@claude-services` | MCP servers — browser, filesystem, sequential thinking |
| **claude-languages** ← you are here | `@claude-languages` | LSP language servers — completions, diagnostics, hover |

## License

MIT — use it, fork it, extend it.
