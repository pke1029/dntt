
local game = {}


function game:load(difficulty)
	
	enemy_img = love.graphics.newImage('assets/img/enemy.png')
	house_img = love.graphics.newImage('assets/img/house.png')

	hit_se = love.audio.newSource("assets/audio/sfx_damage_hit3.wav", "static")
	lose_se = love.audio.newSource("assets/audio/sfx_sounds_pause3_out.wav", "static")

	bgm2:setPitch(1/slow)

	bgm1:stop()
	bgm2:play()

	game:waveStart(difficulty)
end


function game.createEnemy(radius)
	enemy = {}
	enemy.theta = 6.283 * love.math.random()
	enemy.radius = radius
	enemy.speed = 40
	name = namegen.generate('human male')
	enemy.name = string.lower(name)
	table.insert(game.enemies, enemy)
end


function game:waveStart(difficulty)
	math.randomseed(os.time())
	self.enemies = {}
	number = 3*difficulty + 1
	for i = 1,number do
		radius = 432 + i * 50
		game.createEnemy(radius)
	end
end


function game:update(dt)

	if next(self.enemies) == nil then
		love.timer.sleep(1)
		event = event + 1
		level = level + 1
		
		state:setState('dialog')
		if event == 2 then
			state:load('chapter2.lua')
		elseif event == 3 then
			state:load('chapter3.lua')
		elseif event == 4 then
			state:load('epilogue.lua')
		end

	end

	for i,v in ipairs(game.enemies) do
		
		-- despawn
		if v.name == '' then
			table.remove(game.enemies, i)
			hit_se:play()
		elseif v.radius <= 30 then
			table.remove(game.enemies, i)
			lose_se:play()
			state:setState('dialog')
			if slow > 1 then
				state:load('a3.lua')
			else
				state:load('a1.lua')
			end
		end
		
		-- moving
		v.radius = v.radius - dt/slow*v.speed
	end

end


function game:draw()

	-- background
	love.graphics.setColor(COLOR.black)
	love.graphics.rectangle('fill', 0, 0, 800, 600)

	-- enemy
	love.graphics.setColor(COLOR.white)
	love.graphics.setFont(FONT.small)
	for i,v in ipairs(game.enemies) do
		x = v.radius * math.sin(v.theta) + 400
		y = v.radius * math.cos(v.theta) + 300
		love.graphics.draw(enemy_img, x-16, y-32)
		love.graphics.print(v.name, x-16, y-45)
	end

	-- house
	love.graphics.draw(house_img, 400-32, 300-64)

end


function game:keypressed(key)
	
	-- update enemy name
	for i,v in ipairs(game.enemies) do
		if v.radius <= 532 then
			if key == v.name:sub(1,1) then
				v.name = v.name:sub(2,string.len(v.name))
			end
		end
	end

end


return game