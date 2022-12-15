# telescope-dapzzzz

---
🔗[Telescope](https://github.com/nvim-telescope/telescope.nvim) a highly extendable fuzzy finder over lists,and 🔗[nvim-dap](https://github.com/mfussenegger/nvim-dap) is a Debug Adapter Protocol client implementation for Neovim. this telescope extension facilitate DAP to load vscode adapter configure file.

## Features

---

- load configuration from default location
- load configuration from custom location

## Requirement

---

- 🔗[Telescope](https://github.com/nvim-telescope/telescope.nvim)
- 🔗[nvim-dap](https://github.com/mfussenegger/nvim-dap)
- recommend  
    🔗[telescope-dap.nvim](https://github.com/nvim-telescope/telescope-dap.nvim)

## Installation

---

### using packer.nvim

```lua
use({
 "nvim-telescope/telescope.nvim",
 -- tag = "0.1.0",
 branch = "0.1.x",
 requires = { { "nvim-lua/plenary.nvim" }, { "HUAHUAI23/telescope-dapzzzz" } },
 config = function()
  require("telescope").setup({})
  require("telescope").load_extension("i23")
 end,
})
```

## usage

---
`:Telescope i23 dap23`
input your configuration file directory, `/path/of/project/.vscode` is default

**note**: the adapter type corresponds to the configuration `type`, and filetype is which the configuration will attach to

### demo

---
