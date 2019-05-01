

local dialogHandeler = {}


function dialogHandeler:next()
	if self.current == self.length then
		self.dialog.next()
	end
	self.current = self.current + 1
end


function dialogHandeler:load(filename)
	self.dialog = love.filesystem.load('assets/dialog/' .. filename)()
	self.length = #self.dialog
	self.current = 1
	self.character = nil

	house_img = love.graphics.newImage('assets/img/house.png')
	apple_img = love.graphics.newImage('assets/img/apple.png')
	L_img = love.graphics.newImage('assets/img/L.png')
	K_img = love.graphics.newImage('assets/img/K.png')
	misa_img = love.graphics.newImage('assets/img/misa.png')
end


function dialogHandeler:update(dt)
	if self.dialog[self.current][1] == 'N' then
		self.character = nil
	elseif self.dialog[self.current][1] == 'K' then
		self.character = K_img
	elseif self.dialog[self.current][1] == 'L' then
		self.character = L_img
	elseif self.dialog[self.current][1] == 'A' then
		self.character = apple_img
	elseif self.dialog[self.current][1] == 'M' then
		self.character = misa_img
	end
end


function dialogHandeler:draw()
	-- background
	love.graphics.setColor(COLOR.black)
	love.graphics.rectangle('fill', 0, 0, 800, 600)

	-- house
	love.graphics.setColor(COLOR.white)
	love.graphics.draw(house_img, 400-32, 300-64)

	-- text
	love.graphics.setColor(COLOR.white)
	love.graphics.setFont(FONT.medium)
	love.graphics.printf(self.dialog[self.current][2], 200, 400, 500)
	if self.character ~= nil then
		love.graphics.draw(self.character, 100, 400)
	end
	love.graphics.setFont(FONT.small)
	-- love.graphics.print('press any key to continue', 500, 550)
end


function dialogHandeler:keypressed(key)
	if self.dialog.choice == false and self.current == self.length then
		if key == 'y' then
			slow = slow + 0.2
			state:load('a2.lua')
		elseif key == 'n' then
			state:load('gameover.lua')
		end
	else
		self:next()
	end
end


return dialogHandeler
