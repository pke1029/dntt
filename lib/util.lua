-- utility
-- pke1029
-- https://github.com/v3p/zack-from-space/blob/master/data/class/util.lua


-- check if is lua file
function isLuaFile(file)
	if string.match(file, "%.lua") then
		return true
	else
		return false
	end
end
