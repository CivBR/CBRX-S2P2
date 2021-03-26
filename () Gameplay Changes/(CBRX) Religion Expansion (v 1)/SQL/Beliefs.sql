INSERT INTO Beliefs
		(Type, 						Description, 						ShortDescription, 							Founder, 	Follower)
VALUES 	('BELIEF_GUARDIAN_SPIRITS', 'TXT_KEY_BELIEF_GUARDIAN_SPIRITS', 	'TXT_KEY_BELIEF_GUARDIAN_SPIRITS_SHORT', 	1, 			0),
		('BELIEF_CHARITY', 			'TXT_KEY_BELIEF_CHARITY', 			'TXT_KEY_BELIEF_CHARITY_SHORT', 			1, 			0),
		('BELIEF_ASTRAL_PROJECTION','TXT_KEY_BELIEF_ASTRAL_PROJECTION', 'TXT_KEY_BELIEF_ASTRAL_PROJECTION_SHORT', 	1, 			0),
		('BELIEF_TUTELARY_DEITIES',	'TXT_KEY_BELIEF_TUTELARY_DEITIES', 	'TXT_KEY_BELIEF_TUTELARY_DEITIES_SHORT', 	1, 			0),
		('BELIEF_ALTARS',			'TXT_KEY_BELIEF_ALTARS', 			'TXT_KEY_BELIEF_ALTARS_SHORT', 				0, 			1),
		('BELIEF_TORII_GATES',		'TXT_KEY_BELIEF_TORII_GATES', 		'TXT_KEY_BELIEF_TORII_GATES_SHORT', 		0, 			1);
		
INSERT INTO Belief_BuildingClassTourism
		(BeliefType, 			BuildingClassType, 							Tourism)
VALUES	('BELIEF_ALTARS', 		'BUILDINGCLASS_CBRX_FOLLOWER_ALTARS', 		1),
		('BELIEF_TORII_GATES', 	'BUILDINGCLASS_CBRX_FOLLOWER_TORII_GATES', 	1);
		
INSERT INTO Belief_BuildingClassHappiness
		(BeliefType, 			BuildingClassType, 							Happiness)
VALUES	('BELIEF_ALTARS', 		'BUILDINGCLASS_CBRX_FOLLOWER_ALTARS', 		2),
		('BELIEF_TORII_GATES', 	'BUILDINGCLASS_CBRX_FOLLOWER_TORII_GATES', 	2);
		
INSERT INTO Belief_BuildingClassFaithPurchase
		(BeliefType, BuildingClassType)
VALUES	('BELIEF_ALTARS', 		'BUILDINGCLASS_CBRX_FOLLOWER_ALTARS'),
		('BELIEF_TORII_GATES', 	'BUILDINGCLASS_CBRX_FOLLOWER_TORII_GATES');

INSERT INTO Belief_BuildingClassYieldChanges
		(BeliefType, 			BuildingClassType, 							YieldType, 		YieldChange)
VALUES	('BELIEF_ALTARS', 		'BUILDINGCLASS_CBRX_FOLLOWER_ALTARS', 		'YIELD_GOLD', 	1),
		('BELIEF_TORII_GATES', 	'BUILDINGCLASS_CBRX_FOLLOWER_TORII_GATES', 	'YIELD_FAITH', 	1);