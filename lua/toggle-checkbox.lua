local checked_character = "x"

local checked_checkbox = "[" .. checked_character .. "]"
local unchecked_checkbox = "[ ]"

local bufnr = vim.api.nvim_buf_get_number(0)
local cursor = vim.api.nvim_win_get_cursor(0)
local current_line = vim.api.nvim_buf_get_lines(bufnr, cursor[1] - 1, cursor[1], false)[1] or ""

-- local line_contains_a_checked_checkbox = function(line)
-- 	return string.find(line, checked_checkbox)
-- end

local M = {}

M.check = function()
	local new_line = current_line:gsub("%[ %]", checked_checkbox)
	vim.api.nvim_buf_set_lines(bufnr, cursor[1] - 1, cursor[1], false, { new_line })
	vim.api.nvim_win_set_cursor(0, cursor)
end

M.uncheck = function()
	local new_line = current_line:gsub("%[" .. checked_character .. "%]", unchecked_checkbox)
	vim.api.nvim_buf_set_lines(bufnr, cursor[1] - 1, cursor[1], false, { new_line })
	vim.api.nvim_win_set_cursor(0, cursor)
end

return M
