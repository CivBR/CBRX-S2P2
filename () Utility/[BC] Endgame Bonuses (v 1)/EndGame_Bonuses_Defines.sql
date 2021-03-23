 --=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses
		(Type, 							DefaultBuilding, 						Description, 							MaxGlobalInstances, MaxTeamInstances,	MaxPlayerInstances)
VALUES	('BUILDINGCLASS_LIME_ENDGAME', 	'BUILDING_LIME_ENDGAME_PRODUCTION', 	'TXT_KEY_BUILDINGCLASS_LIME_ENDGAME', 	-1, 				-1, 				-1);

--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
------------------------------
INSERT INTO Buildings
		(Type, 									BuildingClass, 			  		Cost, 	FaithCost, 	GoldMaintenance, 	NeverCapture, Description, 						Help, 								Strategy,						Civilopedia, 					PortraitIndex,	IconAtlas)
VALUES	('BUILDING_LIME_ENDGAME_FOOD',			'BUILDINGCLASS_LIME_ENDGAME', 	-1, 	-1, 		0, 					1, 			 'TXT_KEY_BUILDING_LIME_DUMMY', 	'TXT_KEY_BUILDING_LIME_DUMMY',		'TXT_KEY_BUILDING_LIME_DUMMY',	'TXT_KEY_BUILDING_LIME_DUMMY',	0, 				'BW_ATLAS_1'),
		('BUILDING_LIME_ENDGAME_PRODUCTION',	'BUILDINGCLASS_LIME_ENDGAME', 	-1, 	-1, 		0, 					1, 			 'TXT_KEY_BUILDING_LIME_DUMMY', 	'TXT_KEY_BUILDING_LIME_DUMMY',		'TXT_KEY_BUILDING_LIME_DUMMY',	'TXT_KEY_BUILDING_LIME_DUMMY',	0, 				'BW_ATLAS_1'),
		('BUILDING_LIME_ENDGAME_CULTURE',		'BUILDINGCLASS_LIME_ENDGAME', 	-1, 	-1, 		0, 					1, 			 'TXT_KEY_BUILDING_LIME_DUMMY', 	'TXT_KEY_BUILDING_LIME_DUMMY',		'TXT_KEY_BUILDING_LIME_DUMMY',	'TXT_KEY_BUILDING_LIME_DUMMY',	0, 				'BW_ATLAS_1'),
		('BUILDING_LIME_ENDGAME_GOLD',			'BUILDINGCLASS_LIME_ENDGAME', 	-1, 	-1, 		0, 					1, 			 'TXT_KEY_BUILDING_LIME_DUMMY', 	'TXT_KEY_BUILDING_LIME_DUMMY',		'TXT_KEY_BUILDING_LIME_DUMMY',	'TXT_KEY_BUILDING_LIME_DUMMY',	0, 				'BW_ATLAS_1'),
		('BUILDING_LIME_ENDGAME_FAITH',			'BUILDINGCLASS_LIME_ENDGAME', 	-1, 	-1, 		0, 					1, 			 'TXT_KEY_BUILDING_LIME_DUMMY', 	'TXT_KEY_BUILDING_LIME_DUMMY',		'TXT_KEY_BUILDING_LIME_DUMMY',	'TXT_KEY_BUILDING_LIME_DUMMY',	0, 				'BW_ATLAS_1');

------------------------------
-- Building_YieldChanges
------------------------------
INSERT INTO Building_YieldChanges
		(BuildingType, 						YieldType,			Yield)
VALUES	('BUILDING_LIME_ENDGAME_FOOD',		'YIELD_FOOD',		1),
		('BUILDING_LIME_ENDGAME_PRODUCTION','YIELD_PRODUCTION',	1),
		('BUILDING_LIME_ENDGAME_CULTURE',	'YIELD_CULTURE',	1),
		('BUILDING_LIME_ENDGAME_GOLD',		'YIELD_GOLD',		1),
		('BUILDING_LIME_ENDGAME_FAITH',		'YIELD_FAITH',		1);

------------------------------
-- Building_Flavors
------------------------------
INSERT INTO Building_Flavors
		(BuildingType, 							FlavorType,			Flavor)
VALUES	('BUILDING_LIME_ENDGAME_FOOD',			'FLAVOR_GROWTH',	1),
		('BUILDING_LIME_ENDGAME_PRODUCTION',	'FLAVOR_GROWTH',	1),
		('BUILDING_LIME_ENDGAME_CULTURE',		'FLAVOR_GROWTH',	1),
		('BUILDING_LIME_ENDGAME_GOLD',			'FLAVOR_GROWTH',	1),
		('BUILDING_LIME_ENDGAME_FAITH',			'FLAVOR_GROWTH',	1);
		
--==========================================================================================================================
-- POLICIES
--==========================================================================================================================

INSERT INTO Policies
		(Type, 							Description, 						Civilopedia, 							Help, 								GridX, GridY, 	NumFreeTechs, 	PortraitIndex, 	IconAtlas, 		IconAtlasAchieved)
VALUES	('POLICY_LIME_TECH_DUMMY_1', 	'TXT_KEY_POLICY_LIME_TECH_DUMMY_1', 'TXT_KEY_POLICY_LIME_TECH_DUMMY_1', 	'TXT_KEY_POLICY_LIME_TECH_DUMMY_1', 1000, 1000, 	1, 				47, 			'POLICY_ATLAS', 'POLICY_A_ATLAS'),
		('POLICY_LIME_TECH_DUMMY_2', 	'TXT_KEY_POLICY_LIME_TECH_DUMMY_2', 'TXT_KEY_POLICY_LIME_TECH_DUMMY_2', 	'TXT_KEY_POLICY_LIME_TECH_DUMMY_2', 1000, 1000, 	2, 				47, 			'POLICY_ATLAS', 'POLICY_A_ATLAS'),
		('POLICY_LIME_TECH_DUMMY_3', 	'TXT_KEY_POLICY_LIME_TECH_DUMMY_3', 'TXT_KEY_POLICY_LIME_TECH_DUMMY_3', 	'TXT_KEY_POLICY_LIME_TECH_DUMMY_3', 1000, 1000, 	3, 				47, 			'POLICY_ATLAS', 'POLICY_A_ATLAS'),
		('POLICY_LIME_TECH_DUMMY_4', 	'TXT_KEY_POLICY_LIME_TECH_DUMMY_4', 'TXT_KEY_POLICY_LIME_TECH_DUMMY_4', 	'TXT_KEY_POLICY_LIME_TECH_DUMMY_4', 1000, 1000, 	4, 				47, 			'POLICY_ATLAS', 'POLICY_A_ATLAS'),
		('POLICY_LIME_TECH_DUMMY_5', 	'TXT_KEY_POLICY_LIME_TECH_DUMMY_5', 'TXT_KEY_POLICY_LIME_TECH_DUMMY_5', 	'TXT_KEY_POLICY_LIME_TECH_DUMMY_5', 1000, 1000, 	5, 				47, 			'POLICY_ATLAS', 'POLICY_A_ATLAS'),
		('POLICY_LIME_TECH_DUMMY_6', 	'TXT_KEY_POLICY_LIME_TECH_DUMMY_6', 'TXT_KEY_POLICY_LIME_TECH_DUMMY_6', 	'TXT_KEY_POLICY_LIME_TECH_DUMMY_6', 1000, 1000, 	6, 				47, 			'POLICY_ATLAS', 'POLICY_A_ATLAS'),
		('POLICY_LIME_TECH_DUMMY_7', 	'TXT_KEY_POLICY_LIME_TECH_DUMMY_7', 'TXT_KEY_POLICY_LIME_TECH_DUMMY_7', 	'TXT_KEY_POLICY_LIME_TECH_DUMMY_7', 1000, 1000, 	7, 				47, 			'POLICY_ATLAS', 'POLICY_A_ATLAS'),
		('POLICY_LIME_TECH_DUMMY_8', 	'TXT_KEY_POLICY_LIME_TECH_DUMMY_8', 'TXT_KEY_POLICY_LIME_TECH_DUMMY_8', 	'TXT_KEY_POLICY_LIME_TECH_DUMMY_8', 1000, 1000, 	8, 				47, 			'POLICY_ATLAS', 'POLICY_A_ATLAS'),
		('POLICY_LIME_TECH_DUMMY_9', 	'TXT_KEY_POLICY_LIME_TECH_DUMMY_9', 'TXT_KEY_POLICY_LIME_TECH_DUMMY_9', 	'TXT_KEY_POLICY_LIME_TECH_DUMMY_9', 1000, 1000, 	9, 				47, 			'POLICY_ATLAS', 'POLICY_A_ATLAS'),
		('POLICY_LIME_TECH_DUMMY_10', 	'TXT_KEY_POLICY_LIME_TECH_DUMMY_10','TXT_KEY_POLICY_LIME_TECH_DUMMY_10', 	'TXT_KEY_POLICY_LIME_TECH_DUMMY_10',1000, 1000, 	10, 			47, 			'POLICY_ATLAS', 'POLICY_A_ATLAS');
		
--==========================================================================================================================
-- AI BONUSES
--==========================================================================================================================	
UPDATE HandicapInfos SET AIStartingWorkerUnits = 0 WHERE Type = "HANDICAP_DEITY";
UPDATE HandicapInfos SET AIStartingDefenseUnits = 0 WHERE Type = "HANDICAP_DEITY";
UPDATE HandicapInfos SET AIStartingExploreUnits = 0 WHERE Type = "HANDICAP_DEITY";
UPDATE HandicapInfos SET AIStartingUnitMultiplier = 0 WHERE Type = "HANDICAP_DEITY";


