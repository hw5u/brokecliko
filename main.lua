local player = require("src/player")
local bkg = require("src/bkg")

function love.load()
end

function love.update(dt)
	player:update(dt)
end

function love.draw()
	bkg:draw()
	player:draw()
end

function love.mousepressed(x, y, button)
	if button == 1 then
		player:click()
		print("x : " .. x .. " y: " .. y .. " click")
	end

end

function love.keypressed(key)
	if key == "r" and player.can_rebirth then
		player:rebirth()
		print("rebirth!")
	end

	if key == "escape" then
		love.event.quit()
	end

	if key == "d" then
		bkg:change()
	end
end
