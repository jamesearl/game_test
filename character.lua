Character = class(Object, function(c, name)
	c.name = name
	print("Character.init("..name..")")

	-- position
	c.x = 0
	c.y = 0

	-- stats
	c.strength = 1
	c.stamina = 1
	c.dexterity = 1
	c.speed = 5
	c.willpower = 1
	c.intelligence = 1

	-- resists
	c.poison = .1
	c.disease = .1
	c.heat = .1
	c.cold = .1
	c.magic = .05

	-- calculated
	c._fatigue_max = 20 + (5*c.stamina)
	c._fatigue_expenditure_rate = 5 - math.clamp(.2 * c.willpower, 0, 4.7) -- per second
	c._fatigue_regen_rate = 1 -- per second
	c._fatigue = c._fatigue_max
	
	-- calculated
	c._hp_max = 30 + (4*c.stamina) + (2*c.strength)
	c._hp_regen_rate = .25
	c._hp = c._hp_max

	c._exp = 0

	c.inventory = {}
end)


function Character:draw()
	print("Character:draw")

	love.graphics.print("Name: "..self.name, love.graphics.getWidth()-200, 10)
end