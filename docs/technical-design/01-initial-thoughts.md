# Initial thoughts

## The problem

When using lists and checkboxes in Markdown files as To Do lists whilst working on tasks, I’d like to have a way to easily check a checkbox once an item is complete or to uncheck it if needed.

## Example

This is an example of a list of Markdown checkboxes:

```markdown
- [x] A complete task
- [ ] An incomplete task
```

## Existing approaches

This could be done by entering replace mode by typing `r` followed by the appropriate character to check or uncheck the checkbox. I'd prefer though to have a consistent way to check and uncheck a checkbox where I can reuse the same function and keymap.

There's an also an existing Vim plugin - [jkramer/vim-checkbox](https://github.com/jkramer/vim-checkbox) - that I could use.

## Solution

I’d like to create my own Neovim plugin for this written in Lua as I haven’t written one yet and it would be a good learning experience and an opportunity to start contributing to the Neovim ecosystem.

There are built-in Neovim APIs to get the current window, buffer, and cursor, and to get and set lines, so it should be possible to get the current line, check or uncheck a checkbox, and update the line’s contents.

Doing this would also be a good start point for other and more complicated plugins in the future.

## Plugin structure

I’d like to follow the same structure as [https://github.com/tjdevries/stackmap.nvim](https://github.com/tjdevries/stackmap.nvim) - a plugin that TJ and bashbunni wrote recently.

This includes writing tests with [Plenary](https://github.com/nvim-lua/plenary.nvim).

## Checking, unchecking and toggling

I was originally thinking that there would be three public methods: `check`, `uncheck`, and `toggle`.

However I don't think that there's a need to expose methods for checking and unchecking.

if a checkbox is already checked or unchecked then you wouldn’t need to perform the same action again, so we just need the option to toggle a checkbox and expose a single public function.

For example:

```lua
-- lua/toggle-checkbox.lua

local M = {}

M.toggle = function()
  -- Toggle the checkbox.
end

return M
```

I could still create and use methods for checking and unchecking but keep them private by not adding them to the returned module.

## Customisation

Customisation could be done by implementing `require('toggle-checkbox').setup()` if there is anything that would be worth configuring.

It would be up to the user to add a keymap to their own configuration rather than hard-coding one into the plugin.

## Out of scope

Features such as customising and cycling through symbols would be out of scope initially in order to keep the code minimal, but could be added at a later date if there is a need for them.
