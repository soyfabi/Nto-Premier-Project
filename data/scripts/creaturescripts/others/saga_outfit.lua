local config = {
	-- [VOC 1], Level--
    [1] = { -- NARUTO
		[25] = 3,
		[50] = 4,
		[100] = 5,
		[150] = 7,
		[200] = 9,
		[250] = 10,
		[300] = 11,
		[350] = 13,
		[400] = 14,
	},
}

local advanceSave = CreatureEvent("SagaOutfit")
function advanceSave.onAdvance(player, skill, oldLevel, newLevel)
	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end
		
	local saga = config[player:getVocation():getId()]	
	if saga then
		local highestUnlockedLevel = player:getStorageValue(Storage.STORAGEVALUE_SAGAOUTFIT) or 0
        for level, outfitId in pairs(saga) do
             if newLevel >= level and level > highestUnlockedLevel then
                highestUnlockedLevel = level
            end
        end
		
		if highestUnlockedLevel > player:getStorageValue(Storage.STORAGEVALUE_SAGAOUTFIT) then
            player:setStorageValue(Storage.STORAGEVALUE_SAGAOUTFIT, highestUnlockedLevel)
            local outfitId = saga[highestUnlockedLevel]
            player:addOutfit(outfitId)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "You have unlocked a new saga by reaching the level " .. highestUnlockedLevel .. ".")
        end
    end

	return true
end
advanceSave:register()

local adv = CreatureEvent("Saga")

local config_login = {
-- [VOC 1], LOOKTYPE--
	[1] = 2, -- Naruto
	[2] = 17, -- Sasuke
}

function adv.onLogin(player)
	player:registerEvent("SagaOutfit")
	
	local first_outfit = config_login[player:getVocation():getId()]	
	if player:getStorageValue(Storage.STORAGEVALUE_SAGAOUTFIT_LOGIN) == 1 then
		return true
	end
	
	if first_outfit then
		player:addOutfit(first_outfit)
		player:setStorageValue(Storage.STORAGEVALUE_SAGAOUTFIT_LOGIN, 1)
	end
	
	return true
end

adv:register()