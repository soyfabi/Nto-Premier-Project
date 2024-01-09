local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
function onGetFormulaValues(player, level, maglevel)
	local min = (level / 50) + (maglevel * 20) + 5
	local max = (level / 50) + (maglevel * 40) + 7
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local config = {
	name = "jutsu - storage 1",
	cooldown = 3 * 1500,
	hit = 1,
	time = 1000,
}

function removeClone(cid)
    local creature = Creature(cid)
	if creature then
		creature:getPosition():sendMagicEffect(615)
		creature:remove()
	end
end

local function naruto_rendan(creature, target)
	if isCreature(target) then
		local pos = getCreaturePosition(target)
		addEvent(doSendMagicEffect, 0, {x = pos.x+1, y = pos.y+1, z = pos.z}, 338)
	end
end

local spell = Spell("instant")
function spell.onCastSpell(player, var)
    local target = player:getTarget()
    local pos = target:getPosition()
    if SpellCooldownSystem.canUseSpell(player:getId(), config.name, config.cooldown) then	
        addEvent(function()combat:execute(player, var) end, 1000)
        if 3 - #player:getSummons() > 0 then
            local bunshinPositions = {
                {x = pos.x, y = pos.y - 1, z = pos.z, dir = DIRECTION_SOUTH, text = "Let's go for him."},
                {x = pos.x + 1, y = pos.y, z = pos.z, dir = DIRECTION_WEST, text = "You will fall uselessly."},
                {x = pos.x, y = pos.y + 1, z = pos.z, dir = DIRECTION_NORTH, text = "LET'S GOOOOOOOOS!"}
            }
            
            for i = 1, 3 - #player:getSummons() do
                local bunshin = Game.createMonster("Clone", bunshinPositions[i])
				local playername = player:getName()
				bunshin:rename(playername)
                player:addSummon(bunshin)
                bunshin:changeSpeed(-1000)
				setCreatureMaxHealth(bunshin, 1000)
				doCreatureAddHealth(bunshin, 1000)
                addEvent(removeClone, 2000, bunshin:getId())
                local outfit = {lookType = 2, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookAddons = 3}
                doSetCreatureOutfit(bunshin, outfit, -1)
                bunshin:setDirection(bunshinPositions[i].dir)
				bunshin:say(bunshinPositions[i].text)
            end
        end
		
		for fbn = 1, config.hit do
			addEvent(naruto_rendan, config.time * fbn, i, target:getId())
		end	
		
        return true
    end
	
    player:sendCancelMessage("You are exhausted, wait a few seconds.")
    player:getPosition():sendMagicEffect(3)
    return false
end

spell:group("attack")
spell:id(1)
spell:words("Naruto Rendan")
spell:level(50)
spell:mana(550)
spell:needTarget(true)
spell:range(3)
spell:vocation("naruto uzumaki;true")
spell:register()