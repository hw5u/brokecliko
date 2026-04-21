player = {}

player.points = 0
player.power = 1
player.rebirths = 0
player.rebirth_need = 10
player.multiplier = 1
player.can_rebirth = false

-- click per second variables

player.clicks = 0
player.cps = 0
player.timer = 0

local utils = require("src/utils")

aller_font = love.graphics.newFont("assets/Aller/Aller_Bd.ttf", 350)
aller_font_small = love.graphics.newFont("assets/Aller/Aller_Bd.ttf", 50)

function player:click() -- player clicks or press spoace
	self.points = self.points + (self.power * self.multiplier)
	self.clicks = self.clicks + 1 -- timer
end

function player:update(dt)
	if self.points >= self.rebirth_need then
		self.can_rebirth = true
	end

	player.timer = player.timer + dt
	if self.timer >= 1 then
		self.cps = self.clicks
		self.clicks = 0
		self.timer = self.timer - 1
	end
end

function player:rebirth()
	if self.points >= self.rebirth_need then
		self.points = 0
		self.power = 1
		self.rebirths = self.rebirths + 1
		self.rebirth_need = self.rebirth_need * 10
		self.multiplier = self.multiplier + 1
	end
end

function player:draw()
	love.graphics.setFont(aller_font)
	love.graphics.print(utils:abbreviateNumber(self.points), 1, 1) -- prints points on screen (holy obvious)
	love.graphics.setFont(aller_font_small)
	love.graphics.print("CPS : " .. self.cps, 1, 1000)
	love.graphics.print(utils:abbreviateNumber(player.power * 10) .. " to give", 1, 800 )

	if self.points >= self.rebirth_need then
		love.graphics.print(" ! YOU CAN REBIRTH !", 500, 500)
	end
end

return player
