-- 6 March 2017
-- pke1019
-- learning state/event handeling
-- https://github.com/v3p/zack-from-space/blob/master/data/class/state.lua

-- initialise container
local state = {
		states = {},			-- all state in the state directory (key: stateName, item: stateData)
		currentState = false	-- current stateData
}

-- load all state specify in the state directory
function state:loadState(path)
	-- check if path exist
	if not love.filesystem.getInfo(path) then
		error("'"..path.."' doesn't exist.")
	else
		-- for each file in the directory
		for i, v in ipairs(love.filesystem.getDirectoryItems(path)) do
			-- for each lua file in the directory
			if isLuaFile(v) then
				-- get state name (gsub remove .lua extension)
				local n = string.gsub(v, '.lua', '')
				-- excecute state and store in states (.. means concatination)
				self.states[n] = require(path.."/"..n)
			end
		end
	end
end

-- set currentState by specifying state name
function state:setState(name)
	self.currentState = self.states[name]
end

-- return currentState data
function state:getState()
	return self.currentState
end

-- call the load, update, draw function of the desire state
function state:load(data)
	-- check if the load function exist
	if type(self.currentState.load) == 'function' then
		self.currentState:load(data)
	end
end

function state:update(dt)
	if type(self.currentState.update) == 'function' then
		self.currentState:update(dt)
	end
end

function state:draw()
	if type(self.currentState.draw) == 'function' then
		self.currentState:draw()
	end
end

-- call the input function of the disire state
function state:keypressed(key)
	if type(self.currentState.keypressed) == "function" then
		self.currentState:keypressed(key)
	end
end

-- call the quit function of the desire state
function state:quit()
	if type(self.currentState.quit) == "function" then
		self.currentState:quit()
	end
end

-- return state to main
return state
