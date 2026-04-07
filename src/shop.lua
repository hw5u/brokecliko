shop = {}

shop.active = false

local items = require("src/items")

local aller = love.graphics.newFont("assets/Aller/Aller_Bd.ttf", 28)
local aller_title = love.graphics.newFont("assets/Aller/Aller_Bd.ttf", 50)

function shop:act() -- inside love.keypressed in lua
	self.active = not self.active
end

function shop:draw()
	if self.active then
		local y = 400
		for i, item in ipairs(items) do
			love.graphics.setFont(aller_title)
			love.graphics.print(item.name, 60 , y)
			y = y + 54
			love.graphics.setFont(aller)
			love.graphics.print(item.price, 60, y)
			y = y + 30
			love.graphics.print(item.give, 60, y)
			y = y + 60
		end
	end
end

return shop
