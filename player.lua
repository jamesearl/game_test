Player = class(Character, function(p, name)
	Character.init(p, name)

	print("Player.init("..p.name..")")

end)

function Player:_keys(dt)

	local speed = self.speed
	local moving = game.keys.up or game.keys.down or game.keys.left or game.keys.right

	--check for sprint
	if moving and game.keys.lshift and self:fatigue() > 1 then 
		speed = speed * 2
		self:fatigue(-dt*self._fatigue_expenditure_rate)
	else
		self:fatigue(dt*self._fatigue_regen_rate)
	end

	--regeneration
	self:hp(dt * self._hp_regen_rate)

	if moving then
		if game.keys.up then self.y = self.y - (dt * speed * 10) end
		if game.keys.down then self.y = self.y + (dt * speed * 10) end
		if game.keys.left then self.x = self.x - (dt * speed * 10) end
		if game.keys.right then self.x = self.x + (dt * speed * 10) end
	end

	if game.keys[" "] then
		self:hp(-1)
	end
end

function Player:update(dt)
	--print("Player:update "..dt)
	self:_keys(dt)

	self.x = math.clamp(self.x, 0, love.graphics.getWidth())
	self.y = math.clamp(self.y, 0, love.graphics.getHeight())

end


function Player:draw()
	love.graphics.print("Name: "..self.name, love.graphics.getWidth()-200, 10)

	love.graphics.print(
		string.format("HP: %d",self:hp()),
		love.graphics.getWidth()-200,
		25
	)

	love.graphics.print(
		string.format("F: %2d", self:fatigue(nil)),
		love.graphics.getWidth()-200,
		40
	)

	love.graphics.print("@", self.x, self.y)
end

--Base HP is 30
function Player:hp(delta)
	if delta then
		self._hp = math.clamp(
			self._hp + delta,
			0,
			self._hp_max
		)
	end
	return self._hp
end

function Player:fatigue(delta)
	if delta then
		self._fatigue = math.clamp(
			self._fatigue + delta,
			0,
			self._fatigue_max
		)
	end
	return self._fatigue
end

function Player:exp(delta)
	if delta then
		self._exp = self._exp + delta
	end
	return self._exp
end