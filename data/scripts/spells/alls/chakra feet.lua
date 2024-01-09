local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 5)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_TICKS, 33000)
condition:setFormula(0.3, -24, 0.3, -24)
combat:addCondition(condition)

local spell = Spell("instant")
function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:group("support")
spell:id(1)
spell:name("")
spell:words("Chakra Feet")
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(25)
spell:mana(120)
spell:register()
