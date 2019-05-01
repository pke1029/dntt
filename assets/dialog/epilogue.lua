
local dialog = {

	{"M", "Hop in the copter!"},

	{"K", "I am going to come back one day ..."}

}

function dialog.next()
	state:setState('ending')
	state:load()
end

return dialog