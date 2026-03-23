# Claude Languages

> LSP language servers for [Claude Code](https://claude.ai/code) — code completion, diagnostics, hover, and go-to-definition for every language you work in.

[![Claude](https://img.shields.io/badge/Claude-AI-black?logo=anthropic)](https://claude.ai)
[![Validate](https://github.com/claude-contrib/claude-languages/actions/workflows/validate.yml/badge.svg)](https://github.com/claude-contrib/claude-languages/actions/workflows/validate.yml)
[![Release](https://img.shields.io/github/v/release/claude-contrib/claude-languages)](https://github.com/claude-contrib/claude-languages/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Language servers extend what Claude *understands* — not just what it can do. Install a language plugin and Claude gains deep code intelligence: real-time errors, symbol navigation, and context-aware completions, powered by the same LSP servers your editor uses.

## How Language Servers Work

Each plugin bundles an [LSP (Language Server Protocol)](https://microsoft.github.io/language-server-protocol/) server that Claude Code connects to as an external process. Once installed, Claude gains deep code intelligence for that language — the same completions, diagnostics, and navigation your editor uses.

| Capability | What it gives Claude |
|------------|---------------------|
| **Completions** | Context-aware symbol and method suggestions |
| **Diagnostics** | Real-time type errors, lint warnings, undefined references |
| **Hover** | Type signatures and documentation on demand |
| **Go-to-definition** | Navigate to declarations across the codebase |

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code/setup) (`claude`)

The individual language servers (`gopls`, `rust-analyzer`, `terraform-ls`) are downloaded and installed automatically by the plugin — no manual setup required.

Install `claude` separately: [Claude Code installation guide](https://docs.anthropic.com/en/docs/claude-code/setup)

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

| Repo | What it provides |
|------|-----------------|
| [claude-extensions](https://github.com/claude-contrib/claude-extensions) | Hooks, context rules, session automation |
| [claude-features](https://github.com/claude-contrib/claude-features) | Devcontainer features for Claude Code and Anthropic tools |
| **claude-languages** ← you are here | LSP language servers — completions, diagnostics, hover |
| [claude-sandbox](https://github.com/claude-contrib/claude-sandbox) | Sandboxed Docker environment for Claude Code |
| [claude-services](https://github.com/claude-contrib/claude-services) | MCP servers — browser, filesystem, sequential thinking |
| [claude-skills](https://github.com/claude-contrib/claude-skills) | Slash commands for Claude Code |
| [claude-status](https://github.com/claude-contrib/claude-status) | Live status line — context, cost, model, branch, worktree |

## License

MIT — use it, fork it, extend it.
