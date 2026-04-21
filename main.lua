local player = require("src/player")
local mapManager = require("src/mapManager")
local shop = require("src/shop")
local reputation = require("src/reputation")
local menu = require("src/menu")

function love.load()
end

function love.update(dt)
	player:update(dt)
	mapManager:update()
	reputation:update()

	--key combination
	if love.keyboard.isDown("lctrl") and love.keyboard.isDown("m") then
		menu.active = true
	end
end

function love.draw()
	if menu.active then
		menu:draw()
	else
		mapManager:draw()
		player:draw()
		shop:draw()
		reputation:draw()
	end
end

function love.mousepressed(x, y, button)
	if button == 1 then
		player:click()
		reputation:click()
		print("x : " .. x .. " y: " .. y .. " click")
	end

end

function love.keypressed(key)

	if menu.active then
		menu.keypressed(key)
		return
	end

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

	if key == "z" then
		reputation.give()
	end

	if key == "space" then
		reputation:click()
		player:click()
		print("space click")
	end
	
	if shop.active then
		shop:buy(key)
	end
end
