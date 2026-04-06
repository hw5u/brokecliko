
bkg = {}

bkg.images = {
	love.graphics.newImage("assets/girl_wings.jpg"),
	love.graphics.newImage("assets/view.png")
}

bkg.current_index = 1

function bkg:change()
	self.current_index = self.current_index + 1
	if self.current_index > #self.images then
		self.current_index = 1
	end

	print("background changed " .. bkg.current_index)
end

function bkg:draw()
	love.graphics.draw(self.images[self.current_index], 0, 0)
end

return bkg
