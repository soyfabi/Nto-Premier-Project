local items = {
    {
		-- obito glasses
		itemid = 8852,
		type = "equip",
		slot = "head",
	},
	{
		-- obito glasses
		itemid = 8852,
		type = "deequip",
		slot = "head"
	},
	{
		-- yin yang amulet
		itemid = 8832,
		type = "equip",
		slot = "necklace",
	},
	{
		-- yin yang amulet
		itemid = 8832,
		type = "deequip",
		slot = "necklace"
	},
	{
		-- orochimaru tshirt
		itemid = 8845,
		type = "equip",
		slot = "armor",
	},
	{
		-- orochimaru tshirt
		itemid = 8845,
		type = "deequip",
		slot = "armor"
	},
	{
		-- jounin legs
		itemid = 8841,
		type = "equip",
		slot = "legs",
	},
	{
		-- jounin legs
		itemid = 8841,
		type = "deequip",
		slot = "legs"
	},
	{
		-- jounin boots
		itemid = 8850,
		type = "equip",
		slot = "feet",
	},
	{
		-- jounin boots
		itemid = 8850,
		type = "deequip",
		slot = "feet"
	},
	{
		-- glove forearm
		itemid = 8851,
		type = "equip",
		slot = "shield",
	},
	{
		-- glove forearm
		itemid = 8851,
		type = "deequip",
		slot = "shield"
	},
}

for _, i in ipairs(items) do
	local movement = MoveEvent()
	movement:id(i.itemid or i.itemId)

	if(i.type) then
		movement:type(i.type)
	end
	if(i.slot) then
		movement:slot(i.slot)
	end
	if(i.level) then
		movement:level(i.level)
	end
	if(i.vocation) then
		for _, v in ipairs(i.vocation) do
			movement:vocation(v[1], v[2] or false, v[3] or false)
		end
	end
	movement:register()
end