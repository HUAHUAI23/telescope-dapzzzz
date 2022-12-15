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

## some luasnip snippet

```lua
{
 s({ trig = "pydapconf", dscr = "Python dap configuration" }, {
  c(1, {
   sn(nil, {
    i(1),
    t({ "{", [[  "configurations": []], "    " }),
    i(2, "conf"),
    t({ [[]], "  ]", "}" }),
   }),
   sn(nil, {
    i(1),
    t({ "{", [[  "configurations": []], "    " }),
    i(2, "conf"),
    t({ [[]], "  ],", [[  "inputs": []], "    " }),
    i(3, "input_node"),
    t({ [[]], "  ]", "}" }),
   }),
  }),
 }),
 s({ trig = "dapconf", dscr = "dap configuration node" }, {
  t({ "{", [[  "name": "]] }),
  i(1, "name"),
  t({ [[",]], [[  "type": "]] }),
  i(2, "type"),
  t({ [[",]], [[  "request": "]] }),
  -- OPTIM: use choice node "attach", "launch"
  i(3, "request"),
  t({ [[",]], [[  "program": "]] }),
  i(4, "${file}"),
  t({ [[",]], [[  "console": "]] }),
  c(5, { t("integratedTerminal"), t("externalTerminal"), t("internalConsole") }),
  t({ [[",]], [[  "justMycode": ]] }),
  c(6, { t("true"), t("false") }),
  t({ [[]], [[}]] }),
 }),
 s({ trig = "inputconf", dscr = "dap input node" }, {
  t({ "{", [[  "id": "]] }),
  i(1, "ID"),
  t({ [[",]], [[  "type": "]] }),
  c(2, { t("promptString"), t("pickString") }),
  t({ [[",]], [[  "description": "]] }),
  i(3, "description"),
  t({ [[",]], [[  "default": "]] }),
  i(4, "default"),
  d(5, function(args)
   print(vim.inspect(args))
   if args[1][1] == "pickString" then
    return sn(nil, {
     t({ [[",]], [[  "options": ]] }),
     i(1, "options:Array"),
     t({ [[]], [[}]] }),
    })
   else
    return sn(nil, {
     t({ [["]], [[}]] }),
    })
   end
  end, { 2 }),
  i(0),
 }),
}
```
