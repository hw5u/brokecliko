shop = {}

shop.active = false

local items = require("src/items")
local player = require("src/player")

local aller = love.graphics.newFont("assets/Aller/Aller_Bd.ttf", 28)
local aller_title = love.graphics.newFont("assets/Aller/Aller_Bd.ttf", 50)

function shop:act() -- inside love.keypressed in lua
	self.active = not self.active
end

function shop:buy(key)
	for i, item in ipairs(items) do
		if key == item.key then
			if player.points >= item.price then
				player.points = player.points - item.price
				player.power = player.power + item.give
			end
		end
	end
			
end

function shop:draw()
	if self.active then
		local y = 400
		for i, item in ipairs(items) do

			love.graphics.setFont(aller_title)
			love.graphics.print(item.name, 340, y)
			
			y  = y + 54

			love.graphics.setFont(aller)
			love.graphics.print(item.price .. item.give, 340, y)

			y = y + 58
		end
	end
end

return shop
