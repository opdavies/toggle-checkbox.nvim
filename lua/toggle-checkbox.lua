local checked_character = "x"

local line_contains_a_checked_checkbox = function(line)
	return string.find(line, "[" .. checked_character .. "]")
end

local M = {}

M.check = function(line)
	return line:gsub("%[ %]", "[" .. checked_character .. "]")
end

M.uncheck = function(line)
	return line:gsub("%[" .. checked_character .. "%]", "[]")
end

return M
