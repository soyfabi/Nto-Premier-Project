local mType = Game.createMonsterType("Gamabunta")
local monster = {}

monster.description = "gamabunta"
monster.experience = 0
monster.outfit = {
	lookType = 247
}

monster.health = 5000
monster.maxHealth = monster.health
monster.race = "blood"
monster.corpse = 0
monster.speed = 500
monster.manaCost = 300

monster.changeTarget = {
	interval = 4000,
	chance = 12
}

monster.flags = {
	summonable = true,
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

monster.attacks = {
	{name ="melee", interval = 1200, chance = 100, minDamage = 0, maxDamage = -200},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_PHYSICALDAMAGE, range = 1, minDamage = -200, maxDamage = -300, effect = 10, target = true},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_PHYSICALDAMAGE, range = 4, minDamage = -150, maxDamage = -250, shootEffect = 65, effect = 775, target = true},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_PHYSICALDAMAGE, range = 4, minDamage = -70, maxDamage = -90, shootEffect = 70, effect = 196, target = true},
}

monster.defenses = {
	defense = 5,
	armor = 8,
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_HEALING, minDamage = 300, maxDamage = 400, effect = 5, target = false},
	{name ="speed", interval = 2000, chance = 8, speedChange = 480, effect = 332, target = false, duration = 6000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
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
