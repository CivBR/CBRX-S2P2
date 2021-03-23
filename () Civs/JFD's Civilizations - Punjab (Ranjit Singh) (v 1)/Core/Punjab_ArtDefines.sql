--==========================================================================================================================
-- UNIT/RESOURCE GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_AKALI',	'Unit', 	'sv_Akali.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 						DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_AKALI',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_PIKEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,				UnitMemberInfoType,				 NumMembers)
SELECT	'ART_DEF_UNIT_JFD_AKALI', 	'ART_DEF_UNIT_MEMBER_JFD_AKALI', NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_PIKEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius,  ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_AKALI',	EnableActions, DisableActions, MoveRadius,  ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin,  VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_AKALI',	"Index", SubIndex, ID, VisKillStrengthMin,  VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,	ZOffset, Domain, Model, 		 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_AKALI',	Scale,	ZOffset, Domain, 'Akali.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_PIKEMAN';
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									 Filename, 					LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_RANJIT_SINGH_PEACE',  'JFD_RanjitSingh_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_RANJIT_SINGH_WAR', 	 'JFD_RanjitSingh_War', 	'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_RANJIT_SINGH_PEACE', 	'SND_LEADER_MUSIC_JFD_RANJIT_SINGH_PEACE', 	'GAME_MUSIC', 	-1.0,					45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_RANJIT_SINGH_WAR', 		'SND_LEADER_MUSIC_JFD_RANJIT_SINGH_WAR', 	'GAME_MUSIC', 	-1.0,					45, 		45, 		1,		 0);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 									Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_PUNJAB_ICON', 		0.07,	0.21,	0.39,	1),
		('COLOR_PLAYER_JFD_PUNJAB_BACKGROUND',	0.89,	0.47,	0.11,	1);
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 						PrimaryColor, 					 SecondaryColor, 					    TextColor)
VALUES	('PLAYERCOLOR_JFD_PUNJAB',	'COLOR_PLAYER_JFD_PUNJAB_ICON',  'COLOR_PLAYER_JFD_PUNJAB_BACKGROUND',  'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- ICON ATLAS
--==========================================================================================================================	
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 						IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_PUNJAB_ICON_ATLAS', 		256, 		'JFD_Punjab_IconAtlas_256.dds',		2, 				2),
		('JFD_PUNJAB_ICON_ATLAS', 		128, 		'JFD_Punjab_IconAtlas_128.dds',		2, 				2),
		('JFD_PUNJAB_ICON_ATLAS', 		80, 		'JFD_Punjab_IconAtlas_80.dds',		2, 				2),
		('JFD_PUNJAB_ICON_ATLAS', 		64, 		'JFD_Punjab_IconAtlas_64.dds',		2, 				2),
		('JFD_PUNJAB_ICON_ATLAS', 		45, 		'JFD_Punjab_IconAtlas_45.dds',		2, 				2),
		('JFD_PUNJAB_ICON_ATLAS', 		32, 		'JFD_Punjab_IconAtlas_32.dds',		2, 				2),
		('JFD_PUNJAB_ALPHA_ATLAS', 		128, 		'JFD_Punjab_AlphaAtlas_128.dds',	1,				1),
		('JFD_PUNJAB_ALPHA_ATLAS', 		80, 		'JFD_Punjab_AlphaAtlas_80.dds',		1, 				1),
		('JFD_PUNJAB_ALPHA_ATLAS', 		64, 		'JFD_Punjab_AlphaAtlas_64.dds',		1, 				1),
		('JFD_PUNJAB_ALPHA_ATLAS', 		48, 		'JFD_Punjab_AlphaAtlas_48.dds',		1, 				1),
		('JFD_PUNJAB_ALPHA_ATLAS', 		45, 		'JFD_Punjab_AlphaAtlas_45.dds',		1, 				1),
		('JFD_PUNJAB_ALPHA_ATLAS', 		32, 		'JFD_Punjab_AlphaAtlas_32.dds',		1, 				1),
		('JFD_PUNJAB_ALPHA_ATLAS', 		24, 		'JFD_Punjab_AlphaAtlas_24.dds',		1, 				1),
		('JFD_PUNJAB_ALPHA_ATLAS', 		16, 		'JFD_Punjab_AlphaAtlas_16.dds',		1, 				1),
		('JFD_PUNJAB_UNIT_FLAG_ATLAS', 	32, 		'JFD_Punjab_UnitFlagAtlas_32.dds',	1, 				1);
--==========================================================================================================================	
--==========================================================================================================================	



