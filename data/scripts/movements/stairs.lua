local stair_up = MoveEvent()
stair_up:type("stepin")

function stair_up.onStepIn(creature, item, position, fromPosition)
    local pos = creature:getPosition()
    pos.z = pos.z - 1
    pos.x = pos.x + 1
    
    if creature:isPlayer() then
        creature:teleportTo(pos)
    end
    
    return true
end

stair_up:id(2902, 2909, 6088)
stair_up:register()

---------------------------

local stair_down = MoveEvent()
stair_down:type("stepin")

function stair_down.onStepIn(creature, item, position, fromPosition)
    local pos = creature:getPosition()
    pos.z = pos.z + 1
    pos.x = pos.x - 1
    
    if creature:isPlayer() then
        creature:teleportTo(pos)
    end
    
    return true
end

stair_down:id(2614, 2900)
stair_down:register()

---------------------------

local stair_cave = MoveEvent()
stair_cave:type("stepin")

function stair_cave.onStepIn(creature, item, position, fromPosition)
    local pos = creature:getPosition()
    pos.z = pos.z + 1
   
    
    if creature:isPlayer() then
        creature:teleportTo(pos)
    end
    
    return true
end

stair_cave:id(2940, 2611, 2121)
stair_cave:register()

---------------------------

local stair_up_cave = MoveEvent()
stair_up_cave:type("stepin")

function stair_up_cave.onStepIn(creature, item, position, fromPosition)
    local pos = creature:getPosition()
    pos.z = pos.z - 1
   
   
    
    if creature:isPlayer() then
        creature:teleportTo(pos)
    end
    
    return true
end

stair_up_cave:id(4724)
stair_up_cave:register()

--------------------

local stair_dungeon = MoveEvent()

function stair_dungeon.onStepIn(creature, item, position, fromPosition)

	if creature:isPlayer() then
        creature:teleportTo(Position(1236, 1032, 7))
    end
    
    return true
end

stair_dungeon:position(Position(1236, 1033, 8))
stair_dungeon:register()

local stair_dungeon2 = MoveEvent()

function stair_dungeon2.onStepIn(creature, item, position, fromPosition)

	if creature:isPlayer() then
        creature:teleportTo(Position(1236, 1034, 8))
    end
	
    return true
end

stair_dungeon2:position(Position(1236, 1033, 7))
stair_dungeon2:register()

	
	
	
	
