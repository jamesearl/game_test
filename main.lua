-- library extensions
require("utils/math")

-- base class
require("class")
Object = class()


function love.load()

	--Classes
	require("camera")
	require("map")
	require("character")
	require("player")
	require("enemy")
	require("item")

	game = {
		map = Map(),
		keys = {},
		player = Player("Player 1"),
		items = {}
	}

	--Data
	require("items")
	require("npcs")
end

function love.update(dt)
	if game.keys.escape then love.event.push("q") end

	--game.map:update(dt)

	if true then -- if game.player.in_play -- IE, if the player is currently playing, not in an inventory screen, etc
		game.player:update(dt)
	end
end

function love.draw()
	--game.map:draw()

	if true then -- if game.player.in_play -- IE, if the player is currently playing, not in an inventory screen, etc
		game.player:draw()
	end
end

function love.keypressed(key)
	 game.keys[key] = true
--[[    
    if (key == " ") then -- space = next mal
        gMapNum = (gMapNum or 1) + 1
        if (gMapNum > 10) then gMapNum = 1 end
        TiledMap_Load(string.format("map/map%02d.tmx",gMapNum))
        gCamX,gCamY = 100,100
    end
]]--
end

function love.keyreleased(key)
    game.keys[key] = nil
end

