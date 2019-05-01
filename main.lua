
require('globals')

function love.load()

	bgm1 = love.audio.newSource("assets/audio/Window_Demons.mp3", "stream")
	bgm2 = love.audio.newSource("assets/audio/Splashing_Around.mp3", "stream")
	bgm1:setLooping(true)
	bgm2:setLooping(true)

	state:loadState('assets/state')
	state:setState('menu')
	state:load()

end


function love.update(dt)
	state:update(dt)
end


function love.draw()
	state:draw()
end


function love.keypressed(key)
	state:keypressed(key)
end

