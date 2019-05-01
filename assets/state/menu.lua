-- create menu scene/state
-- https://github.com/v3p/zack-from-space/blob/master/data/state/menu.lua


-- init
local menu = {}


function menu:load()
	
	event = 1
	level = 1
	slow = 1

	bgm1:play()
	bgm2:stop()

	title_img = love.graphics.newImage('assets/img/title.png')

end


function menu:update(dt)

end


function menu:draw()
	love.graphics.setColor(COLOR.white)
	love.graphics.draw(title_img, 0, 0)
end


function menu:keypressed(key)
	state:setState('dialog')
	state:load('prologue.lua')
end


return menu
