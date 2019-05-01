

local ending = {}


function ending.sign(n)
	if n < 0 then
		return -1
	else
		return 1
	end
end


function ending:load()
	house_img = love.graphics.newImage('assets/img/house.png')
	heli_img = love.graphics.newImage('assets/img/heli.png')
	self.credit = "Story, Program, Art \n pke1029 \n\n music \n Window Demons  by  roljui \n Splashing Around  by  The Green Orbs \n\n SE \n SubspaceAudio \n\n special thanks to the LOVE2D community \n\n\n\n\n\n thank you for playing"
	self.scroll = 4
	self.y = 0
end


function ending:update(dt)
	self.scroll = self.scroll - dt/slow
	self.y = self.y + self.sign(self.scroll)*dt*60/slow

	if self.y < -1200 then
		state:setState('menu')
		state:load()
	end
end


function ending:draw()
	-- background
	love.graphics.setColor(COLOR.black)
	love.graphics.rectangle('fill', 0, 0, 800, 600)

	-- house
	love.graphics.setColor(COLOR.white)
	love.graphics.draw(house_img, 400-32, 300-64)

	-- heli
	love.graphics.setColor(COLOR.white)
	love.graphics.draw(heli_img, 400-32, self.y)

	if self.scroll < 0 then
		love.graphics.setColor(COLOR.white)
		love.graphics.setFont(FONT.medium)
		love.graphics.printf(self.credit, 100, self.y + 400, 700)
	end
end


function ending:keypressed(key)

end


return ending