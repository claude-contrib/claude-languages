# Contributing an LSP Plugin

This guide explains how to add a new language server to the `claude-languages` marketplace.

## Plugin Structure

Each plugin lives under `plugins/<name>/` and requires three files:

```
plugins/<name>/
├── .claude-plugin/
│   └── plugin.json      # Plugin metadata
├── .lsp.json            # LSP server configuration
├── README.md            # Plugin documentation
└── CHANGELOG.md         # Version history
```

## Step 1: Create `.lsp.json`

The `.lsp.json` file configures how Claude Code launches and communicates with the language server.

```json
{
  "<language-id>": {
    "command": "<executable>",
    "args": [],
    "extensionToLanguage": { ".<ext>": "<language-id>" },
    "transport": "stdio",
    "initializationOptions": {},
    "settings": {},
    "maxRestarts": 3
  }
}
```

### Field Reference

| Field | Required | Type | Description |
|-------|----------|------|-------------|
| `command` | yes | string | Executable to launch (must be on `$PATH`) |
| `args` | yes | array | Arguments passed to the executable |
| `extensionToLanguage` | yes | object | Maps file extensions to language IDs (e.g. `{".go": "go"}`) |
| `transport` | no | `"stdio"` | Communication transport (only `stdio` is supported) |
| `initializationOptions` | no | object | Passed to the server during LSP `initialize` |
| `settings` | no | object | Workspace settings sent after initialization |
| `maxRestarts` | no | integer ≥ 0 | How many times to restart on crash (default: no limit) |

### Example: gopls

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

## Step 2: Create `.claude-plugin/plugin.json`

```json
{
  "name": "<name>",
  "version": "1.0.0",
  "description": "<short description>",
  "author": {
    "name": "<your-github-username>",
    "url": "https://github.com/<your-github-username>"
  },
  "repository": "<upstream-repo-url>",
  "license": "<SPDX-identifier>",
  "keywords": ["lsp", "<language>", "<name>"]
}
```

## Step 3: Register in `marketplace.json`

Add an entry to `.claude-plugin/marketplace.json`:

```json
{
  "name": "<name>",
  "description": "<short description>",
  "version": "1.0.0",
  "author": { "name": "<your-github-username>" },
  "source": "./plugins/<name>",
  "category": "language-servers",
  "tags": ["lsp", "<language>"]
}
```

## Step 4: Local Testing

Validate schemas before opening a PR:

```bash
pip install check-jsonschema
check-jsonschema --schemafile .github/schemas/marketplace.schema.json .claude-plugin/marketplace.json
check-jsonschema --schemafile .github/schemas/plugin.schema.json plugins/<name>/.claude-plugin/plugin.json
check-jsonschema --schemafile .github/schemas/lsp.schema.json plugins/<name>/.lsp.json
```

Run CI scripts locally:

```bash
.github/scripts/check-plugin-dirs.sh
.github/scripts/check-version-sync.sh
.github/scripts/check-duplicate-names.sh
```

Test the plugin in Claude Code:

```bash
claude
/plugin marketplace add .
/plugin install <name>@claude-languages
```

## CI Validation Checklist

All of the following must pass before a PR can merge:

- [ ] `marketplace.json` validates against `marketplace.schema.json`
- [ ] `plugin.json` validates against `plugin.schema.json`
- [ ] `.lsp.json` validates against `lsp.schema.json`
- [ ] Plugin directory exists at the `source` path listed in `marketplace.json`
- [ ] Version in `plugin.json` matches version in `marketplace.json`
- [ ] No duplicate plugin names in `marketplace.json`
