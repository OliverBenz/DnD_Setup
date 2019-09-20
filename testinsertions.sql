-- Insertions
INSERT INTO alignments VALUES
	(0, "Lawful Good"),
	(0, "Neutral Good"),
	(0, "Chaotic Good"),
	(0, "Lawful Neutral"),
	(0, "Neutral"),
	(0, "Chaotic Neutral"),
	(0, "Lawful Evil"),
	(0, "Neutral Evil"),
	(0, "Chaotic Evil");
	
INSERT INTO `backgrounds` VALUES
	(0, "Acolyte"),
	(0, "Charlatan"),
	(0, "Criminal"),
	(0, "Entertainer"),
	(0, "Folk Hero"),
	(0, "Gladiator"),
	(0, "Guild Merchant"),
	(0, "Hermit"),
	(0, "Knight"),
	(0, "Noble"),
	(0, "Outlander"),
	(0, "Pirate"),
	(0, "Sage"),
	(0, "Sailor"),
	(0, "Soldier"),
	(0, "Urchin");

INSERT INTO charSpells VALUES
	((SELECT id FROM `characters` WHERE firstname="Kairon"), (SELECT id FROM spells WHERE name="Eldritch Blast")),
	((SELECT id FROM `characters` WHERE firstname="Kairon"), (SELECT id FROM spells WHERE name="Mage Hand")),
	((SELECT id FROM `characters` WHERE firstname="Kairon"), (SELECT id FROM spells WHERE name="Thaumaturgy")),
	((SELECT id FROM `characters` WHERE firstname="Kairon"), (SELECT id FROM spells WHERE name="Hexblade's Curse")),
	((SELECT id FROM `characters` WHERE firstname="Kairon"), (SELECT id FROM spells WHERE name="Armor of Agathys")),
	((SELECT id FROM `characters` WHERE firstname="Kairon"), (SELECT id FROM spells WHERE name="Charm Person")),
	((SELECT id FROM `characters` WHERE firstname="Kairon"), (SELECT id FROM spells WHERE name="Hex"));