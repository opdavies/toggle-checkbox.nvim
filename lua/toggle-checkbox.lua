local checked_character = "x"

local M = {}

M.check = function(line)
	return line:gsub("%[ %]", "[" .. checked_character .. "]")
end

M.uncheck = function(line)
	return line:gsub("%[" .. checked_character .. "%]", "[]")
end

return M
