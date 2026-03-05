# terraform-ls

Official Terraform language server for Claude Code, providing rich language intelligence for Terraform projects.

## Features

- Syntax highlighting for `.tf` and `.tfvars` files
- Code completion for resources, data sources, variables, and built-in functions
- Hover documentation for providers, resources, and attributes
- Diagnostics for configuration errors and invalid references
- Go-to-definition for variables, locals, and modules

## Prerequisites

`terraform-ls` must be installed and available on `$PATH`:

```bash
# macOS (Homebrew)
brew install hashicorp/tap/terraform-ls

# Nix
nix-shell -p terraform-ls
```

Or download the binary directly from [GitHub releases](https://github.com/hashicorp/terraform-ls/releases).

## Usage

Install the plugin via:

```
/plugin install terraform@claude-languages
```

## Configuration

The default `.lsp.json` configuration works for most Terraform projects:

```json
{
  "terraform": {
    "command": "terraform-ls",
    "args": ["serve"],
    "extensionToLanguage": {
      ".tf": "terraform",
      ".tfvars": "terraform-vars"
    },
    "transport": "stdio",
    "initializationOptions": {},
    "settings": {},
    "maxRestarts": 3
  }
}
```

## License

MPL-2.0 (upstream terraform-ls)
