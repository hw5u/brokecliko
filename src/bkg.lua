
bkg = {}

bkg.current = 1

local maps = require("src/maps")

bkg.image = love.graphics.newImage(maps[bkg.current].background)

function bkg:change()
	self.current = self.current + 1
	if self.current > #maps then
		self.current = 1
	end
	bkg.image = love.graphics.newImage(maps[bkg.current].background)
	
end

function bkg:draw()
	love.graphics.draw(bkg.image, 0, 0)
end


return bkg
