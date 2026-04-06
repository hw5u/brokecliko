
mapManager = {}

mapManager.current = 1

local maps = require("src/maps")
local player = require("src/player")

mapManager.background = love.graphics.newImage(maps[mapManager.current].background)
mapManager.music = love.audio.newSource(maps[mapManager.current].music, "stream")
mapManager.music:play()
function mapManager:change()
	self.current = self.current + 1
	if self.current > #maps then
		self.current = 1
	end
	self.background = love.graphics.newImage(maps[bkg.current].background)
	
end

function mapManager:update()
	for i = #maps, 1, -1 do
		if player.points >= maps[i].need then
			if self.current ~= i then
				self.current = i
				self.background = love.graphics.newImage(maps[mapManager.current].background)
				self.music:stop()
				self.music = love.audio.newSource(maps[mapManager.current].music, "stream")
				self.music:play()
			end
			break
		end
	end
end

function mapManager:draw()
	love.graphics.draw(self.background, 0, 0)
end


return mapManager
