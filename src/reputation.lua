-- reputation bar system

reputation = {}
reputation.max = 20
reputation.current = 20

local player = require("src/player")
aller_font_small = love.graphics.newFont("assets/Aller/Aller_Bd.ttf", 50)

-- every time the player clicks the reputation bar goes down
function reputation:click()
	self.current = self.current - 1
end

function reputation:give()
	local amount = player.points / 10
	local need = player.power * 10

	if player.points >= need then
		reputation.current = reputation.max
		player.points = player.points - amount
	end
end

function reputation:update()
	if self.current == 0 then
		player.points = 0
		self.current = self.max
	end
end

function reputation:draw()
	love.graphics.setFont(aller_font_small)
	love.graphics.print(reputation.current .. " / " .. reputation.max, 5, 400)
end


return reputation
