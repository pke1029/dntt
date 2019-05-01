
local dialog = {

	{"N", "*phone ringing*"},

	{"K", "Hey L, what's the matter? Calling at this time."},

	{"K", "Do you have any progress regarding the misterious serial killer case?"},

	{"L", "..."},

	{"L", "Yes I do, Light ..."},

	{"L", "... or should I call you 'KIRA'?"},

	{"K", "..."},

	{"K", "Man, I thougth I might be able to keep it for a little bit longer."},

	{"L", "You should give up, Light. Police are on the way to your house."},

	{"K", "..."},

	{"K", "I won't lose."},

	{"N", "*hang up*"},

	{"N", "Instructions: Type in the name of the cops to send them to a better place :)"},

	{"N", "Wave 1"}

}

function dialog.next()
	state:setState('game')
	state:load(level)
end

return dialog