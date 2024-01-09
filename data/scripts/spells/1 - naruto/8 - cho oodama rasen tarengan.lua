local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_KATONDAMAGE)
combat:setArea(createCombatArea({{1, 1, 1},
{1, 3, 1},
{1, 1, 1}}))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 25) + 2
	local max = (level / 5) + (maglevel * 55) + 2
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local config = {
	name = "jutsu - storage 3",
	cooldown = 2 * 1000
}

local spell = Spell("instant")
function spell.onCastSpell(player, var)
	local target = player:getTarget()
	local pos = target:getPosition()
	if SpellCooldownSystem.canUseSpell(player:getId(), config.name, config.cooldown) then	
		combat:execute(player, var)
		local randomValue
        repeat
            randomValue = math.random(5)  -- Genera un nÃºmero aleatorio del 1 al 5
		until randomValue ~= lastRandomValue -- Prevenir que se repita el mismo randomValue
		lastRandomValue = randomValue
		
		if player:getStorageValue(BUFF_NARUTO) <= 1 then
			if randomValue == 1 then
				doSendMagicEffect({x = pos.x, y = pos.y, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x+1, y = pos.y, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x+1, y = pos.y+1, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x+2, y = pos.y+1, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x, y = pos.y, z = pos.z}, 1228)
				doSendMagicEffect({x = pos.x+1, y = pos.y-1, z = pos.z}, 1228)
			elseif randomValue == 2 then
				doSendMagicEffect({x = pos.x-1, y = pos.y-1, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x-1, y = pos.y-2, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x, y = pos.y, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x, y = pos.y+1, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x+1, y = pos.y, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x+2, y = pos.y, z = pos.z}, 1228)
				doSendMagicEffect({x = pos.x+2, y = pos.y+1, z = pos.z}, 1228)
				doSendMagicEffect({x = pos.x, y = pos.y, z = pos.z}, 1228)
			elseif randomValue == 3 then
				doSendMagicEffect({x = pos.x, y = pos.y, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x-1, y = pos.y, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x-1, y = pos.y+1, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x-2, y = pos.y+1, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x+1, y = pos.y-1, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x, y = pos.y-1, z = pos.z}, 1228)
				doSendMagicEffect({x = pos.x+2, y = pos.y+1, z = pos.z}, 1228)
			elseif randomValue == 4 then
				doSendMagicEffect({x = pos.x, y = pos.y, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x-1, y = pos.y-1, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x-2, y = pos.y-1, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x-2, y = pos.y, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x+2, y = pos.y-1, z = pos.z}, 1228)
				doSendMagicEffect({x = pos.x, y = pos.y+1, z = pos.z}, 1228)
			elseif randomValue == 5 then
				doSendMagicEffect({x = pos.x-1, y = pos.y, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x, y = pos.y+1, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x+1, y = pos.y-1, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x+2, y = pos.y-1, z = pos.z}, 10)
				doSendMagicEffect({x = pos.x+1, y = pos.y-1, z = pos.z}, 1228)
			end
		else
			if randomValue == 1 then
				doSendMagicEffect({x = pos.x, y = pos.y, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x+1, y = pos.y, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x+1, y = pos.y+1, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x+2, y = pos.y+1, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x, y = pos.y, z = pos.z}, 1228)
				doSendMagicEffect({x = pos.x+1, y = pos.y-1, z = pos.z}, 1228)
			elseif randomValue == 2 then
				doSendMagicEffect({x = pos.x-1, y = pos.y-1, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x-1, y = pos.y-2, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x, y = pos.y, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x, y = pos.y+1, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x+1, y = pos.y, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x+2, y = pos.y, z = pos.z}, 1228)
				doSendMagicEffect({x = pos.x+2, y = pos.y+1, z = pos.z}, 1228)
				doSendMagicEffect({x = pos.x, y = pos.y, z = pos.z}, 1228)
			elseif randomValue == 3 then
				doSendMagicEffect({x = pos.x, y = pos.y, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x-1, y = pos.y, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x-1, y = pos.y+1, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x-2, y = pos.y+1, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x+1, y = pos.y-1, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x, y = pos.y-1, z = pos.z}, 1228)
				doSendMagicEffect({x = pos.x+2, y = pos.y+1, z = pos.z}, 1228)
			elseif randomValue == 4 then
				doSendMagicEffect({x = pos.x, y = pos.y, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x-1, y = pos.y-1, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x-2, y = pos.y-1, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x-2, y = pos.y, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x+2, y = pos.y-1, z = pos.z}, 1228)
				doSendMagicEffect({x = pos.x, y = pos.y+1, z = pos.z}, 1228)
			elseif randomValue == 5 then
				doSendMagicEffect({x = pos.x-1, y = pos.y, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x, y = pos.y+1, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x+1, y = pos.y-1, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x+2, y = pos.y-1, z = pos.z}, 312)
				doSendMagicEffect({x = pos.x+1, y = pos.y-1, z = pos.z}, 1228)
			end
		end
		
		return true
	end
	
	player:sendCancelMessage("You are exhausted, wait a few seconds.")
	player:getPosition():sendMagicEffect(3)
	return false
end

spell:group("attack")
spell:id(1)
spell:name("Combo Jutsu 2")
spell:words("Cho Oodama Rasen Tarengan")
spell:level(200)
spell:mana(3000)
spell:needTarget(true)
spell:range(5)
spell:vocation("naruto uzumaki;true")
spell:register()