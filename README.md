# claude-languages

A curated collection of LSP (Language Server Protocol) servers for Claude Code — providing code completion, diagnostics, hover info, and other language intelligence features.

## Quickstart

Register this marketplace in Claude Code:

```bash
claude
/plugin marketplace add https://github.com/claude-contrib/claude-languages
```

Then install a language server plugin:

```bash
/plugin install gopls@claude-languages
```

Open a `.go` file and gopls language features (completions, diagnostics, hover) will be available.

## Available Language Servers

| Plugin | Language | Description |
|--------|----------|-------------|
| [gopls](./plugins/gopls) | Go | Official Go language server by the Go team |

## How to Add Your Own Language Server

See the [contributor guide](./docs/README.md) for step-by-step instructions on packaging and submitting an LSP plugin.

## License

MIT
