local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 6)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 3) + 8
	local max = (level / 5) + (maglevel * 5) + 13
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local config = {
	name = "jutsu - storage 1",
	cooldown = 700
}

local spell = Spell("instant")
function spell.onCastSpell(player, var)
	local target = player:getTarget()
	if SpellCooldownSystem.canUseSpell(player:getId(), config.name, config.cooldown) then
	
        local randomValue = math.random(6) 
		
		if randomValue == 1 then
			combat:execute(player, var)
		elseif randomValue == 2 then
			combat:execute(player, var)
			addEvent(function() combat:execute(player, var) end, 300)
			addEvent(function() target:getPosition():sendMagicEffect(7) end, 200)
		elseif randomValue == 3 then
			combat:execute(player, var)
		elseif randomValue == 4 then
			combat:execute(player, var)
		elseif randomValue == 5 then
			combat:execute(player, var)
		elseif randomValue == 6 then
			combat:execute(player, var)
			addEvent(function() combat:execute(player, var) end, 300)
			addEvent(function() target:getPosition():sendMagicEffect(7) end, 200)
		end
	
		return true
	end
	
	
	player:sendCancelMessage("You are exhausted, wait a few seconds.")
	player:getPosition():sendMagicEffect(3)
	return false
end

spell:group("attack")
spell:id(1)
spell:words("Throw Shuriken")
spell:level(5)
spell:mana(45)
spell:needTarget(true)
spell:range(5)
spell:register()