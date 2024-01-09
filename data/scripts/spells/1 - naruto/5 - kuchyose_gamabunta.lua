local exhaust = {}
local exhaustTime = 120
local timer = 10

local spell = Spell("instant")
function spell.onCastSpell(player, var)
	local randomText = {
		"I have come to help you in case of doubt.",
		"Have you called me?",
		"I will help you with the time needed.",
		"I come to break hearts.",
		"let's fight "..player:getName()..".",
	}
	
    local maxSummons = 1
	local summonsCount = #player:getSummons()
	
	local playerId = player:getId()
	local currentTime = os.time()
	
	if exhaust[playerId] and exhaust[playerId] > currentTime then
		local timeRemaining = exhaust[playerId] - currentTime
		local displays = 0  -- Contador para realizar un seguimiento de cuántas veces se ha mostrado el mensaje

		local function sendExhaustMessage()
			if displays < 2 and timeRemaining > 0 then
				player:sendCancelMessage("Wait (" .. timeRemaining .. "s) for repeat Kuchyose: Gamabunta, again.")
				timeRemaining = timeRemaining - 1  -- Reducir el tiempo restante
				displays = displays + 1  -- Incrementar el contador de visualizaciones
				addEvent(sendExhaustMessage, 1000)  -- Llamar nuevamente después de 1 segundo
			end
		end

		player:getPosition():sendMagicEffect(3)
		sendExhaustMessage()

		return false
	end
	
	function removeGamabunta(cid)
    local creature = Creature(cid)
		if creature then
			creature:getPosition():sendMagicEffect(332)
			creature:remove()
			player:say("In another we will meet again.")
			exhaust[playerId] = currentTime + exhaustTime
		end
	end

	local randomPosition = randomText[math.random(#randomText)]

    if summonsCount < maxSummons then
            local Gamabunta = Game.createMonster("Gamabunta", player:getPosition())
            player:addSummon(Gamabunta)
			Gamabunta:say(randomPosition)
            addEvent(removeGamabunta, timer * 60 * 1000, Gamabunta:getId()) --timer * 60 * 1000
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You have summoned the Gamabunta so it has a limited time, it would be about ".. timer .." minutes.")
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You already have the maximum of Gamabunta, use [Kai no Jutsu] to undo.")
        player:getPosition():sendMagicEffect(3)
        return false
    end
    return true
end

spell:group("support")
spell:id(1)
spell:name("")
spell:words("Kuchyose: Gamabunta")
spell:vocation("naruto uzumaki;true")
spell:level(120)
spell:mana(3500)
spell:register()