local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, 5)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(_player, level, magicLevel)
	local min = (level * 0.2 + magicLevel * 7.22) + 44
	local max = (level * 0.2 + magicLevel * 12.79) + 79
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local config = {
	name = "jutsu - regeneration",
	cooldown = 1 * 1500
}

local spell = Spell("instant")

function spell.onCastSpell(player, variant)

	if SpellCooldownSystem.canUseSpell(player:getId(), config.name, config.cooldown) then
		return combat:execute(player, variant)
	end
	
	player:sendCancelMessage("You are exhausted, wait a few seconds.")
	player:getPosition():sendMagicEffect(3)
	return false
end

spell:words("Regeneration")
spell:group("healing")
spell:vocation("naruto uzumaki;true")
spell:id(1)
spell:level(5)
spell:mana(20)
spell:isSelfTarget(true)
spell:register()
