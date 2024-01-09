local spell = Spell("instant")
function spell.onCastSpell(cid, var)
    local creature = Creature(cid)
    local cid = creature:getId()
    local summons = getCreatureSummons(cid)
    
    if #summons < 1 then
        doRemoveCondition(cid, CONDITION_OUTFIT)
        creature:getPosition():sendMagicEffect(3)
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You do not have any summons. Check your jutsus.")
        return false
    end

    local summon = Creature(summons[1])
    if summon then
        local maxHealth = summon:getMaxHealth()
        local currentHealth = summon:getHealth()
        
        if currentHealth > maxHealth * 0.5 then
            doSendMagicEffect(getThingPosition(summon:getId()), 332)
            doRemoveCreature(summon:getId())
            doRemoveCondition(cid, CONDITION_OUTFIT)
        else
            creature:sendTextMessage(MESSAGE_INFO_DESCR, "You cannot remove the summon if it has less than 50% health.")
            creature:getPosition():sendMagicEffect(3)
            return false
        end
    end
    
    return true
end

spell:group("support")
spell:id(1)
spell:words("Kai no Jutsu")
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(10)
spell:mana(25)
spell:register()