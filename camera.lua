Camera = class(Object)

function Camera:init(map)
	self.map = map
end

function Camera:update(dt)
	print("Camera:update"..dt)
end

function Camera:draw()
	print("Camera:draw")
end