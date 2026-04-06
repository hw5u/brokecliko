local player = require("src/player")
local mapManager = require("src/mapManager")

function love.load()
end

function love.update(dt)
	player:update(dt)
	mapManager:update()
end

function love.draw()
	mapManager:draw()
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
end
