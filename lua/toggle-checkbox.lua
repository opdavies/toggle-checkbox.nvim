local checked_character = "x"

local checked_checkbox = "[" .. checked_character .. "]"
local unchecked_checkbox = "%[ %]"

local bufnr = vim.api.nvim_buf_get_number(0)
local cursor = vim.api.nvim_win_get_cursor(0)
local current_line = vim.api.nvim_buf_get_lines(bufnr, cursor[1] - 1, cursor[1], false)[1] or ""

local line_contains_an_unchecked_checkbox = function(line)
	return string.find(line, unchecked_checkbox)
end

local write_line = function(new_line)
	vim.api.nvim_buf_set_lines(bufnr, cursor[1] - 1, cursor[1], false, { new_line })
	vim.api.nvim_win_set_cursor(0, cursor)
end

local M = {}

M.check = function()
	local new_line = current_line:gsub("%[ %]", checked_checkbox)
	write_line(new_line)
end

M.toggle = function()
	-- If the line contains a checked checkbox then uncheck it.
	-- Otherwise, if it contains an unchecked checkbox, check it.
	if line_contains_an_unchecked_checkbox(current_line) then
		M.check()
	else
		M.uncheck()
	end
end

M.uncheck = function()
	local new_line = current_line:gsub("%[" .. checked_character .. "%]", unchecked_checkbox)
	write_line(new_line)
end

return M
