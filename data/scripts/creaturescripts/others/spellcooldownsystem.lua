SpellCooldownSystem = {
    storages = {},
    cooldowns = {},
    reduction = 0.10 -- 10%
}

local spellCooldownEvent = CreatureEvent("SpellCooldownSystemLogin")
function spellCooldownEvent.onLogin(player)
    SpellCooldownSystem.storages[player:getId()] = {}
    player:registerEvent("SpellCooldownSystemReduction")
    return true
end
spellCooldownEvent:register()

local spellCooldownEvent = CreatureEvent("SpellCooldownSystemLogout")
function spellCooldownEvent.onLogout(player)
    SpellCooldownSystem.storages[player:getId()] = nil
    return true
end
spellCooldownEvent:register()

function SpellCooldownSystem.canUseSpell(playerId, name, cooldown)
    if not SpellCooldownSystem.storages[playerId] then
        SpellCooldownSystem.storages[playerId] = {}
    end

    if not SpellCooldownSystem.storages[playerId][name] or SpellCooldownSystem.storages[playerId][name] <= os.mtime() then
        SpellCooldownSystem.storages[playerId][name] = os.mtime() + cooldown
        SpellCooldownSystem.cooldowns[name] = cooldown
        return true
    end
    return false
end

local event = CreatureEvent("SpellCooldownSystemReduction")
function event.onKill(player, target)
    local playerId = player:getId()
    if SpellCooldownSystem.storages[playerId] then
        for k, v in pairs(SpellCooldownSystem.storages[playerId]) do
            local reduced = (SpellCooldownSystem.cooldowns[k] * SpellCooldownSystem.reduction)
            SpellCooldownSystem.storages[playerId][k] = SpellCooldownSystem.storages[playerId][k] - reduced
            player:sendCancelMessage(string.format("[SpellCooldownSystem] The spell %s cooldown has reduced on %d seconds.", k, math.ceil(reduced / 1000)))
        end
    end
    return true
end
event:register()