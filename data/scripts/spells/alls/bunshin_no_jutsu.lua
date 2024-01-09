local spell = Spell("instant")
function spell.onCastSpell(cid, var)
	local creature = Creature(cid)
	local cid = creature:getId()
    local maxSummons = 2
	local summonsCount = #getCreatureSummons(cid)
	
    if summonsCount < maxSummons then
        local bunshin = Game.createMonster("Clone", creature:getPosition())
		local playername = creature:getName()
		bunshin:rename(playername)
        doConvinceCreature(cid, bunshin)
        setCreatureMaxHealth(bunshin, getCreatureMaxHealth(cid))
        doCreatureAddHealth(bunshin, getCreatureHealth(cid))
		doChangeSpeed(bunshin, getCreatureSpeed(cid))
        doSetCreatureOutfit(bunshin, getCreatureOutfit(cid), -1)
        creature:getPosition():sendMagicEffect(5)
    else
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You already have the maximum of clones, use [Kai no Jutsu] to undo.")
        creature:getPosition():sendMagicEffect(3)
        return false
    end
	
    return true
end

spell:group("attack")
spell:id(2)
spell:words("Bunshin no Jutsu")
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(15)
spell:mana(80)
spell:register()