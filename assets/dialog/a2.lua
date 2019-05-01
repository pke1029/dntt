
local dialog = {

	{"A", "Thanks for the purchase."},

}

function dialog.next()
	state:setState('game')
	state:load(level)
end

return dialog