# toggle-checkbox.nvim

A Neovim plugin for checking, unchecking and toggling Markdown checkboxes, written in Lua.

Inspired by [jkramer/vim-checkbox](https://github.com/jkramer/vim-checkbox).

## Example

This is an example of the TODOs that I had whilst writing this plugin:

```markdown
- [ ] Check an unchecked checkbox
- [x] Uncheck a checked checkbox
- [ ] Make check symbol customisable
- [x] Make checking toggleable
  - [x] Determine if a line contains a checked checkbox
- [x] Add README
- [x] Add example keymaps
```

## Keymaps

There are no default keymaps but these can be added using `vim.keymap.set()`:

```lua
vim.keymap.set("n", "<leader>tt", ":lua require('toggle-checkbox').toggle()<CR>")
```
