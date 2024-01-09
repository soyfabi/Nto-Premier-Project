local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FUUTONDAMAGE)
function onGetFormulaValues(player, level, maglevel)
	local min = (level / 100) + (maglevel * 50) + 12
	local max = (level / 100) + (maglevel * 60) + 15
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
		doSendMagicEffect({x = pos.x+2, y = pos.y, z = pos.z}, 336)
		return true
	end
	
	player:sendCancelMessage("You are exhausted, wait a few seconds.")
	player:getPosition():sendMagicEffect(3)
	return false
end

spell:group("attack")
spell:id(1)
spell:name("Combo Jutsu 1")
spell:words("Oodama Rasengan")
spell:level(100)
spell:mana(2000)
spell:needTarget(true)
spell:range(5)
spell:vocation("naruto uzumaki;true")
spell:register()