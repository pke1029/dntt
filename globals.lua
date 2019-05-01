
-- load utility functions
require('lib/util')

-- excecute state.lua (note that only the local 'state' var is returned)
state = require('lib/state')

-- name generator
namegen = require('lib/namegen/namegen')

COLOR = {
	black = {0, 0, 0},
	white = {0.9, 0.9, 0.9},
}

FONT = {
	small = love.graphics.newFont("assets/font/cubecavern.ttf", math.floor(love.graphics.getWidth() * 0.02)),
	medium = love.graphics.newFont("assets/font/cubecavern.ttf", math.floor(love.graphics.getWidth() * 0.04)),
	large = love.graphics.newFont("assets/font/cubecavern.ttf", math.floor(love.graphics.getWidth() * 0.06)),
	huge = love.graphics.newFont("assets/font/cubecavern.ttf", math.floor(love.graphics.getWidth() * 0.09)),
}