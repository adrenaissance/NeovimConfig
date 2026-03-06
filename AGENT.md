# Neovim Config — Agent Instructions

## Overview
This is a personal Neovim configuration written in Lua, using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Structure
- `init.lua` — entry point; sets editor options and loads keymaps + lazy
- `lua/config/lazy.lua` — lazy.nvim bootstrap and plugin spec loading
- `lua/mappings/` — key mappings
- `lua/plugins/` — one file per plugin configuration:
  - `cmp.lua` — completion (nvim-cmp)
  - `colorscheme.lua` — colorscheme
  - `copilot.lua` — GitHub Copilot
  - `dap.lua` — debug adapter protocol
  - `git.lua` — git integration
  - `lsp.lua` — language server protocol
  - `mason.lua` — LSP/linter/formatter installer
  - `oil.lua` — file explorer
  - `rust.lua` — Rust-specific tooling
  - `telescope.lua` — fuzzy finder
  - `treesitter.lua` — syntax highlighting / parsing

## Conventions
- Indentation: **2 spaces** (no tabs)
- Plugin configs live in `lua/plugins/<plugin-name>.lua` as lazy.nvim spec tables
- Keymaps are centralized in `lua/mappings/`
- The active colorscheme name is persisted to `colorscheme.txt` automatically

## Common Tasks

### Add a new plugin
Create `lua/plugins/<name>.lua` returning a lazy.nvim spec table:
```lua
return {
  "author/plugin-name",
  config = function()
    require("plugin-name").setup({})
  end,
}
```

### Update plugins
```
:Lazy update
```

### Update LSP servers / formatters
```
:Mason
```

### Reload config without restarting
```
:source $MYVIMRC
```

## Notes
- Do **not** commit `lazy-lock.json` changes unless intentionally pinning plugin versions.
- Do **not** store secrets or tokens in config files.
- Keep plugin configs minimal and self-contained.
