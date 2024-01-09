local mType = Game.createMonsterType("Trainer")
local monster = {}

monster.description = "trainer"
monster.experience = 20
monster.outfit = {
	lookType = 1109
}

monster.health = 99999
monster.maxHealth = monster.health
monster.race = "blood"
monster.corpse = 0
monster.speed = 0

monster.changeTarget = {
	interval = 4000,
	chance = 12
}

monster.flags = {
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	ignoreSpawnBlock = true,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Zzzzs", yell = false},
	{text = "zzzmmz", yell = false}
}

monster.attacks = {
	{name ="melee", interval = 1200, chance = 100, minDamage = 0, maxDamage = -20}
}

monster.defenses = {
	defense = 5,
	armor = 8,
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_HEALING, minDamage = 5000, maxDamage = 8000, effect = 5, target = false},
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
