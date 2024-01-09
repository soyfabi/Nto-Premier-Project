local rewardsTable = {
    [20] = {type = "bank", id = {20000, 0}, msg = "[Reward Level]\n\nThey were deposited in your bank 20.000 gold coins\nto reach the level 20!"},
	[30] = {type = "bank", id = {30000, 0}, msg = "[Reward Level]\n\nThey were deposited in your bank 30.000 gold coins\nto reach the level 30!"},
	[50] = {type = "bank", id = {50000, 0}, msg = "[Reward Level]\n\nThey were deposited in your bank 50.000 gold coins\nto reach the level 50!"},
	[80] = {type = "bank", id = {50000, 0}, msg = "[Reward Level]\n\nThey were deposited in your bank 50.000 gold coins\nto reach the level 50!"},
	[100] = {type = "bank", id = {100000, 0}, msg = "[Reward Level]\n\nThey were deposited in your bank 100.000 gold coins\nto reach the level 100!"},
	[150] = {type = "bank", id = {100000, 0}, msg = "[Reward Level]\n\nThey were deposited in your bank 100.000 gold coins\nto reach the level 150!"},
	--[200] = {type = "addon", id = {154, 158}, msg = "[Reward Level]\n\nYou have unlocked the outfit ssdsdsds\nto reach the level 200!"},
	[250] = {type = "bank", id = {100000, 0}, msg = "[Reward Level]\n\nThey were deposited in your bank 100.000 gold coins\nto reach the level 250!"},
	[300] = {type = "bank", id = {100000, 0}, msg = "[Reward Level]\n\nThey were deposited in your bank 100.000 gold coins\nto reach the level 300!"},
	[350] = {type = "bank", id = {100000, 0}, msg = "[Reward Level]\n\nThey were deposited in your bank 100.000 gold coins\nto reach the level 350!"},
}

local storage = 673737

local rewardLevelEvent = CreatureEvent("reward_level")

function rewardLevelEvent.onAdvance(player, skill, oldLevel, newLevel)
    if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
        return true
    end

    for level, reward in pairs(rewardsTable) do
        if newLevel >= level and player:getStorageValue(storage) < level then
            if reward.type == "item" then
                player:addItem(reward.id[1], reward.id[2])
            elseif reward.type == "bank" then
                player:setBankBalance(player:getBankBalance() + reward.id[1])
            elseif reward.type == "addon" then
                player:addOutfitAddon(reward.id[1], 3)
                player:addOutfitAddon(reward.id[2], 3)
            else
                return false
            end

			player:popupFYI(reward.msg)
			player:getPosition():sendMagicEffect(math.random(CONST_ME_FIREWORK_YELLOW, CONST_ME_FIREWORK_BLUE))
            player:setStorageValue(storage, level)
        end
    end

    player:save()

    return true
end

rewardLevelEvent:register()