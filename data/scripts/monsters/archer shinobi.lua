local mType = Game.createMonsterType("Archer Shinobi")
local monster = {}

monster.description = "archer shinobi"
monster.experience = 1250
monster.outfit = {
	lookType = 1273
}

monster.health = 5000
monster.maxHealth = monster.health
monster.race = "blood"
monster.corpse = 9918
monster.speed = 220

monster.changeTarget = {
	interval = 4000,
	chance = 12
}

monster.flags = {
	attackable = true,
	hostile = true,
	convinceable = true,
	staticAttackChance = 90,
	targetDistance = 2,
	runHealth = 0,
	ignoreSpawnBlock = true
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "I'm a better archer", yell = false},
}

monster.attacks = {
	{name ="melee", interval = 1200, chance = 100, minDamage = -120, maxDamage = -400},
	{name ="combat", interval = 2000, chance = 80, type = COMBAT_PHYSICALDAMAGE, range = 2, minDamage = -200, maxDamage = -300, effect = 1, shootEffect = 9, target = true},
	{name ="combat", interval = 2000, chance = 80, type = COMBAT_PHYSICALDAMAGE, range = 2, minDamage = -200, maxDamage = -300, effect = 1, shootEffect = 6, target = true},
}

monster.defenses = {
	defense = 5,
	armor = 8,
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_HEALING, minDamage = 100, maxDamage = 200, effect = 5, target = false},
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_RAITONDAMAGE, percent = 0},
	{type = COMBAT_DOTONDAMAGE, percent = 0},
	{type = COMBAT_KATONDAMAGE, percent = 10},
	{type = COMBAT_HYOTONDAMAGE, percent = 10},
	{type = COMBAT_SUITONDAMAGE , percent = 0},
	{type = COMBAT_FUUTONDAMAGE , percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
