
local dialog = {

	{"L", "*tv broadcast*"},

	{"L", "Hi KIRA, you know what's weird?"},

	{"L", "It looks like the length of the name affect the play."},

	{"L", "As if you need to, I don't know, write down the name in order to kill someone."},

	{"L", "Worry not, I made sure to have the people to oficially change their name in favour of a longer one."},

	{"L", "Hope to see you soon, friend."},

	{"N", "wave 3"}

}

function dialog.next()
	state:setState('game')
	state:load(level)
end

return dialog