local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FUUTONDAMAGE)
function onGetFormulaValues(player, level, maglevel)
	local min = (level / 175) + (maglevel * 70) + 12
	local max = (level / 200) + (maglevel * 80) + 15
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local config = {
	name = "jutsu - storage 2",
	cooldown = 2 * 1000
}

local spell = Spell("instant")
function spell.onCastSpell(player, var)
	local target = player:getTarget()
	local pos = target:getPosition()
	if SpellCooldownSystem.canUseSpell(player:getId(), config.name, config.cooldown) then	
		combat:execute(player, var)
		doSendMagicEffect({x = pos.x, y = pos.y+1, z = pos.z}, 1037)
		return true
	end
	
	player:sendCancelMessage("You are exhausted, wait a few seconds.")
	player:getPosition():sendMagicEffect(3)
	return false
end

spell:group("attack")
spell:id(1)
spell:name("")
spell:words("Rasenshuriken")
spell:level(150)
spell:mana(3000)
spell:needTarget(true)
spell:range(5)
spell:vocation("naruto uzumaki;true")
spell:register()