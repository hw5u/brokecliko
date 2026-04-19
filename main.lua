local player = require("src/player")
local mapManager = require("src/mapManager")
local shop = require("src/shop")
local reputation = require("src/reputation")

function love.load()
end

function love.update(dt)
	player:update(dt)
	mapManager:update()
	reputation:update()
end

function love.draw()
	mapManager:draw()
	player:draw()
	shop:draw()
	reputation:draw()
end

function love.mousepressed(x, y, button)
	if button == 1 then
		player:click()
		reputation:click()
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

	if key == "s" then
		shop:act()
	end

	if key == "space" then
		player:click()
	end
	
	if shop.active then
		shop:buy(key)
	end
end
