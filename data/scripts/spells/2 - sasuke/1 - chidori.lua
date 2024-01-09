local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_RAITONDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 10)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 1.403) + 8
	local max = (level / 5) + (maglevel * 2.203) + 13
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local config = {
	name = "jutsu - storage 1",
	cooldown = 1 * 1000
}

local spell = Spell("instant")
function spell.onCastSpell(player, var)
	if SpellCooldownSystem.canUseSpell(player:getId(), config.name, config.cooldown) then
		combat:execute(player, var)
		return true
	end
	
	player:sendCancelMessage("You are exhausted, wait a few seconds.")
	player:getPosition():sendMagicEffect(3)
	return false
end

spell:group("attack")
spell:id(1)
spell:name("")
spell:words("Chidori")
spell:level(20)
spell:mana(120)
spell:needTarget(true)
spell:range(3)
spell:vocation("naruto uzumaki;true")
spell:register()