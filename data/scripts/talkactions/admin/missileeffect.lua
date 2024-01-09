local missileEffect = TalkAction("/x")

function missileEffect.onSay(cid, words, param)
	local player = Player(cid)
	if param == "" then
		player:sendCancelMessage("Command param required.")
		return false
	end

	local position = getCreaturePosition(cid)
	for i = 1, 30 do
		doSendDistanceShoot(position, {x = position.x + math.random(-7, 7), y = position.y + math.random(-5, 5), z = position.z}, param)
	end

	return false
end

missileEffect:separator(" ")
missileEffect:register()
