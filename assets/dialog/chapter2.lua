
local dialog = {

	{"N", "*playing voice mail*"},

	{"M", "Hi KIRA, this is MISA."}, 

	{"M", "I saw it on the news, it looks like you are in a pinch."},

	{"M", "I will think of something to help you, hang in there."},

	{"M", "*voice mail ends*"},

	{"N", "wave 2"}

}

function dialog.next()
	state:setState('game')
	state:load(level)
end

return dialog