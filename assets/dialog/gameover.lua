
local dialog = {

	{"A", "Well, that's a shame."},

}

function dialog.next()
	state:setState('menu')
	state:load()
end

return dialog