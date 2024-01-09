local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_KATONDAMAGE)
function onGetFormulaValues(player, level, maglevel)
	local min = (level / 75) + (maglevel * 30) + 12
	local max = (level / 75) + (maglevel * 35) + 15
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local config = {
	name = "jutsu - storage 1",
	cooldown = 1 * 1500
}

local spell = Spell("instant")
function spell.onCastSpell(player, var)
	local target = player:getTarget()
	local pos = target:getPosition()
	if SpellCooldownSystem.canUseSpell(player:getId(), config.name, config.cooldown) then	
		combat:execute(player, var)
		doSendMagicEffect({x = pos.x+1, y = pos.y+1, z = pos.z}, 250)
		return true
	end
	
	player:sendCancelMessage("You are exhausted, wait a few seconds.")
	player:getPosition():sendMagicEffect(3)
	return false
end

spell:group("attack")
spell:id(1)
spell:name("")
spell:words("Youbiko Rasengan")
spell:level(75)
spell:mana(180)
spell:needTarget(true)
spell:range(3)
spell:vocation("naruto uzumaki;true")
spell:register()