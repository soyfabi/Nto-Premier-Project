local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FUUTONDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 30)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 20) + 2
	local max = (level / 5) + (maglevel * 50) + 2
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
    local playerPos = player:getPosition()
    
    if SpellCooldownSystem.canUseSpell(player:getId(), config.name, config.cooldown) then    
        doSendMagicEffect({x = pos.x+1, y = pos.y+1, z = pos.z}, 342)

        local deltaX = (pos.x - playerPos.x)
        local deltaY = (pos.y - playerPos.y)
        local distance = math.max(math.abs(deltaX), math.abs(deltaY))

        for i = 1, distance do
            local stepX = math.floor(playerPos.x + deltaX * i / distance)
            local stepY = math.floor(playerPos.y + deltaY * i / distance)
            local stepPos = {x = stepX, y = stepY, z = playerPos.z}
			
            local tile = Tile(stepPos)
			if tile then
				local creatures = tile:getCreatures()

				for _, creature in ipairs(creatures) do
					if creature:isPlayer() then
						combat:execute(creature, var)
					end
				end
			end

            combat:execute(player, var)  -- Agregar daño al jugador que lanzó el hechizo

            doSendMagicEffect(stepPos, 332) -- Cambiar el número del efecto según tus preferencias
        end

        return true
    end

    player:sendCancelMessage("You are exhausted, wait a few seconds.")
    player:getPosition():sendMagicEffect(3)
    return false
end

spell:group("attack")
spell:id(1)
spell:name("")
spell:words("Fuuton Rasenshuriken")
spell:level(175)
spell:mana(5200)
spell:needTarget(true)
spell:range(5)
spell:vocation("naruto uzumaki;true")
spell:register()