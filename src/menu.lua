
menu = {}

menu.active = true
menu.options = {"play", "quit"}
menu.selected = 1

allerf = love.graphics.newFont("assets/Aller/Aller_Bd.ttf", 30)
gta_sounds = love.audio.newSource("assets/sounds/gta-menu.mp3", "static")

function menu.keypressed(key)
    if key == "up" or key =="k" then
	gta_sounds:play()
        menu.selected = menu.selected - 1
        if menu.selected < 1 then
            menu.selected = #menu.options
        end
    end

    if key == "down" or key =="j" then
	gta_sounds:play()
        menu.selected = menu.selected + 1
        if menu.selected > #menu.options then
            menu.selected = 1
        end
    end

    if key == "return" then
        local choice = menu.options[menu.selected]

        if choice == "play" then
            menu.active = false
        elseif choice == "quit" then
            love.event.quit()
        end
    end
end

function menu:draw()
    love.graphics.setFont(allerf)

    for i, option in ipairs(self.options) do
        local y = 200 + (i - 1) * 40

        if i == menu.selected then
            love.graphics.setColor(1, 1, 0) -- yellow highlight
            love.graphics.print("> " .. option, 300, y)
        else
            love.graphics.setColor(1, 1, 1)
            love.graphics.print(option, 320, y)
        end
    end
end

return menu
