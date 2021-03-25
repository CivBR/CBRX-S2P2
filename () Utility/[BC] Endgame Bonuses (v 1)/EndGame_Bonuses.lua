--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
include("UnitSpawnHandler.lua")
----------------------------------------------------------------------------------------------------------------------------
-- Debug Printing
----------------------------------------------------------------------------------------------------------------------------

local bDebug = true
local tag = "Endgame Bonuses"

function dprint(...)
	if (bDebug) then
		if ... ~= nil then
			print(tag .. ": " .. string.format(...))
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- Generate Unit Table
----------------------------------------------------------------------------------------------------------------------------
local unitTable = {}

local i = 1
for row in DB.Query("SELECT ID, Domain, Combat, PrereqTech FROM Units WHERE (Domain = 'DOMAIN_LAND') OR (Domain = 'DOMAIN_SEA') AND (Combat > 0) AND (RangedCombat = 0)") do
	unitTable[i] = {ID=row.ID, Domain=row.Domain, MeleeStr=row.Combat, Tech=GameInfoTypes[row.PrereqTech]}
	i = i + 1
end

----------------------------------------------------------------------------------------------------------------------------
-- GLOBAL DEFINES
----------------------------------------------------------------------------------------------------------------------------
local cbrxTSLs = {}

cbrxTSLs["CIVILIZATION_BABYLON"] = {X=46, Y=0, S="F", O="F"}
cbrxTSLs["CIVILIZATION_MC_GAUL"] = {X = 7, Y = 39, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_GREATEREUROPE_GERMANY"] = {X = 11, Y = 43, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_SF_KOSOVO"] = {X = 21, Y = 38, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_FINNS"] = {X = 15, Y = 58, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_JFD_SOVIET_RUSSIA_LENIN"] = {X = 23, Y = 48, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_JFD_VANDALS_GENSERIC"] = {X = 11, Y = 31, S = "T", O = "F"}
cbrxTSLs["CIVILIZATION_CL_NIGERIA"] = {X = 12, Y = 20, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_DMS_ZAIRE"] = {X = 20, Y = 19, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_CSLESOTHO"] = {X = 18, Y = 5, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_JWW_UZBEKISTAN"] = {X = 34, Y = 42, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_JFD_PUNJAB"] = {X = 35, Y = 34, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_MC_CHOLA"] = {X = 38, Y = 23, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_EW_PARG"] = {X = 33, Y = 51, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_THP_NORTHYUAN"] = {X = 43, Y = 50, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_SENSHI_CHUKCHI"] = {X = 60, Y = 58, S = "T", O = "F"}
cbrxTSLs["CIVILIZATION_PB_TAIPING"] = {X = 47, Y = 42, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_ORG_MALACCA"] = {X = 47, Y = 22, S = "T", O = "F"}
cbrxTSLs["CIVILIZATION_CL_KULIN"] = {X = 61, Y = 5, S = "T", O = "F"}
cbrxTSLs["CIVILIZATION_DENEFIRSTNATION"] = {X = 77, Y = 56, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_JWW_RIO_GRANDE"] = {X = 77, Y = 38, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_EW_NEUTRAL"] = {X = 86, Y = 49, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_SENSHI_MARAJO"] = {X = 93, Y = 25, S = "F", O = "F"}

local endgameBonuses = {}

endgameBonuses['CIVILIZATION_MC_GAUL'] = {pop=5, food=3, prod=2, cul=2, sci=7, stg=545, gold=12, mil=4, city=4, grp=3, fai=5, reli=0}
endgameBonuses['CIVILIZATION_GREATEREUROPE_GERMANY'] = {pop=5, food=3, prod=3, cul=2, sci=5, stg=0, gold=6, mil=5, city=7, grp=3, fai=4, reli=0}
endgameBonuses['CIVILIZATION_SF_KOSOVO'] = {pop=1, food=1, prod=0, cul=0, sci=0, stg=591, gold=14, mil=1, city=1, grp=0, fai=1, reli=0}
endgameBonuses['CIVILIZATION_FINNS'] = {pop=1, food=0, prod=1, cul=1, sci=5, stg=0, gold=18, mil=1, city=1, grp=0, fai=0, reli=1}
endgameBonuses['CIVILIZATION_JFD_SOVIET_RUSSIA_LENIN'] = {pop=5, food=2, prod=3, cul=3, sci=8, stg=909, gold=19, mil=6, city=6, grp=5, fai=2, reli=0}
endgameBonuses['CIVILIZATION_JFD_VANDALS_GENSERIC'] = {pop=6, food=3, prod=4, cul=4, sci=0, stg=0, gold=4, mil=6, city=6, grp=3, fai=2, reli=0}
endgameBonuses['CIVILIZATION_CL_NIGERIA'] = {pop=8, food=4, prod=5, cul=5, sci=10, stg=864, gold=5, mil=10, city=8, grp=4, fai=5, reli=1}
endgameBonuses['CIVILIZATION_DMS_ZAIRE'] = {pop=3, food=2, prod=3, cul=4, sci=8, stg=682, gold=11, mil=5, city=2, grp=4, fai=4, reli=0}
endgameBonuses['CIVILIZATION_CSLESOTHO'] = {pop=3, food=2, prod=1, cul=1, sci=6, stg=773, gold=16, mil=4, city=3, grp=3, fai=1, reli=0}
endgameBonuses['CIVILIZATION_JWW_UZBEKISTAN'] = {pop=4, food=2, prod=2, cul=2, sci=5, stg=0, gold=4, mil=4, city=2, grp=1, fai=2, reli=1}
endgameBonuses['CIVILIZATION_JFD_PUNJAB'] = {pop=8, food=4, prod=4, cul=3, sci=9, stg=955, gold=13, mil=10, city=8, grp=4, fai=3, reli=1}
endgameBonuses['CIVILIZATION_MC_CHOLA'] = {pop=4, food=4, prod=3, cul=3, sci=9, stg=727, gold=10, mil=7, city=3, grp=1, fai=2, reli=0}
endgameBonuses['CIVILIZATION_EW_PARG'] = {pop=3, food=1, prod=2, cul=2, sci=7, stg=818, gold=17, mil=4, city=4, grp=2, fai=1, reli=0}
endgameBonuses['CIVILIZATION_THP_NORTHYUAN'] = {pop=4, food=2, prod=1, cul=1, sci=4, stg=0, gold=7, mil=3, city=4, grp=1, fai=3, reli=0}
endgameBonuses['CIVILIZATION_SENSHI_CHUKCHI'] = {pop=9, food=5, prod=4, cul=4, sci=4, stg=500, gold=1, mil=8, city=9, grp=3, fai=4, reli=0}
endgameBonuses['CIVILIZATION_PB_TAIPING'] = {pop=2, food=1, prod=1, cul=1, sci=0, stg=409, gold=15, mil=1, city=1, grp=0, fai=1, reli=1}
endgameBonuses['CIVILIZATION_ORG_MALACCA'] = {pop=10, food=5, prod=5, cul=5, sci=10, stg=1000, gold=5, mil=10, city=10, grp=4, fai=4, reli=0}
endgameBonuses['CIVILIZATION_CL_KULIN'] = {pop=10, food=5, prod=5, cul=5, sci=10, stg=100, gold=1, mil=9, city=11, grp=5, fai=5, reli=1}
endgameBonuses['CIVILIZATION_DENEFIRSTNATION'] = {pop=6, food=3, prod=3, cul=3, sci=6, stg=0, gold=8, mil=5, city=8, grp=3, fai=3, reli=1}
endgameBonuses['CIVILIZATION_JWW_RIO_GRANDE'] = {pop=6, food=3, prod=2, cul=3, sci=6, stg=455, gold=9, mil=5, city=6, grp=2, fai=1, reli=0}
endgameBonuses['CIVILIZATION_EW_NEUTRAL'] = {pop=1, food=0, prod=0, cul=0, sci=0, stg=10, gold=20, mil=0, city=1, grp=0, fai=0, reli=0}
endgameBonuses['CIVILIZATION_SENSHI_MARAJO'] = {pop=6, food=4, prod=4, cul=4, sci=4, stg=0, gold=2, mil=4, city=7, grp=4, fai=2, reli=1}


local techDummy1 = GameInfoTypes["POLICY_LIME_TECH_DUMMY_1"]
local techDummy2 = GameInfoTypes["POLICY_LIME_TECH_DUMMY_2"]
local techDummy3 = GameInfoTypes["POLICY_LIME_TECH_DUMMY_3"]
local techDummy4 = GameInfoTypes["POLICY_LIME_TECH_DUMMY_4"]
local techDummy5 = GameInfoTypes["POLICY_LIME_TECH_DUMMY_5"]
local techDummy6 = GameInfoTypes["POLICY_LIME_TECH_DUMMY_6"]
local techDummy7 = GameInfoTypes["POLICY_LIME_TECH_DUMMY_7"]
local techDummy8 = GameInfoTypes["POLICY_LIME_TECH_DUMMY_8"]
local techDummy9 = GameInfoTypes["POLICY_LIME_TECH_DUMMY_9"]
local techDummy10 = GameInfoTypes["POLICY_LIME_TECH_DUMMY_10"]

local policyTechBonuses = {techDummy1, techDummy2, techDummy3, techDummy4, techDummy4, techDummy5, techDummy6, techDummy7, techDummy8, techDummy9, techDummy10}
local observerTechs = {1, 2, 4, 6, 7, 10, 25}

local sailing = GameInfoTypes["TECH_SAILING"]
local optics = GameInfoTypes["TECH_OPTICS"]
local bronze = GameInfoTypes["TECH_BRONZE_WORKING"]

local dummy_foodBuilding = GameInfoTypes["BUILDING_LIME_ENDGAME_FOOD"]
local dummy_productionBuilding = GameInfoTypes["BUILDING_LIME_ENDGAME_PRODUCTION"]
local dummy_cultureBuilding = GameInfoTypes["BUILDING_LIME_ENDGAME_CULTURE"]
local dummy_goldBuilding = GameInfoTypes["BUILDING_LIME_ENDGAME_GOLD"]
local dummy_faithBuilding = GameInfoTypes["BUILDING_LIME_ENDGAME_FAITH"]

local unitSettler = GameInfoTypes["UNIT_SETTLER"]
local unitWorker = GameInfoTypes["UNIT_WORKER"]

----------------------------------------------------------------------------------------------------------------------------
-- Give Bonuses
----------------------------------------------------------------------------------------------------------------------------

local function Lime_GiveTurnBonuses(city, sCivilizationType)
	dprint("amount of food: " .. endgameBonuses[sCivilizationType].food)
	city:SetNumRealBuilding(dummy_foodBuilding, endgameBonuses[sCivilizationType].food)
	city:SetNumRealBuilding(dummy_productionBuilding, endgameBonuses[sCivilizationType].prod)
	city:SetNumRealBuilding(dummy_cultureBuilding, endgameBonuses[sCivilizationType].cul)
	city:SetNumRealBuilding(dummy_goldBuilding, endgameBonuses[sCivilizationType].gold)
	city:SetNumRealBuilding(dummy_faithBuilding, endgameBonuses[sCivilizationType].fai)
end

function Lime_MainBonuses(iPlayer)
	local player = Players[iPlayer]
	if not player then return end
	local sCivilizationType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	local team = Teams[player:GetTeam()]
	if not endgameBonuses[sCivilizationType] then return end
	if Game.GetGameTurn() > 2 then return end
	
	
	dprint(player:GetName())
	
	if Game.GetGameTurn() == 0 then
		dprint("Giving starting gold")
		player:SetGold(player:GetGold() + endgameBonuses[sCivilizationType].stg)

	elseif Game.GetGameTurn() == 1 then
		local city = player:GetCapitalCity()
		dprint("Giving free techs")
		if endgameBonuses[sCivilizationType].sci > 0 then
			player:SetHasPolicy(policyTechBonuses[endgameBonuses[sCivilizationType].sci], true)
		end

		dprint("Giving turn by turn bonuses")
		Lime_GiveTurnBonuses(city, sCivilizationType)
		
		dprint("Giving settlers and workers")
		local numCity = endgameBonuses[sCivilizationType].city
		local tmpUnit = nil
		
		if numCity > 0 then
			player:InitUnit(unitSettler, city:GetX(), city:GetY())
			--tmpUnit:JumpToNearestValidPlot()
			if numCity > 1 then
				player:InitUnit(unitWorker, city:GetX(), city:GetY())
				--tmpUnit:JumpToNearestValidPlot()
				if numCity > 2 then
					player:InitUnit(unitSettler, city:GetX(), city:GetY())
					--tmpUnit:JumpToNearestValidPlot()
					if numCity > 3 then
						player:InitUnit(unitWorker, city:GetX(), city:GetY())
						--tmpUnit:JumpToNearestValidPlot()
						if numCity > 4 then
							player:InitUnit(unitSettler, city:GetX(), city:GetY())
							--tmpUnit:JumpToNearestValidPlot()
							if numCity > 5 then
								player:InitUnit(unitWorker, city:GetX(), city:GetY())
								--tmpUnit:JumpToNearestValidPlot()
								if numCity > 6 then
									player:InitUnit(unitSettler, city:GetX(), city:GetY())
									--tmpUnit:JumpToNearestValidPlot()
									if numCity > 7 then
										player:InitUnit(unitWorker, city:GetX(), city:GetY())
										--tmpUnit:JumpToNearestValidPlot()
										if numCity > 8 then
											player:InitUnit(unitSettler, city:GetX(), city:GetY())
											--tmpUnit:JumpToNearestValidPlot()
											if numCity > 9 then
												player:InitUnit(unitWorker, city:GetX(), city:GetY())
												--tmpUnit:JumpToNearestValidPlot()
												if numCity > 10 then
													player:InitUnit(unitWorker, city:GetX(), city:GetY())
													player:InitUnit(unitSettler, city:GetX(), city:GetY())
													player:InitUnit(unitSettler, city:GetX(), city:GetY())
													--tmpUnit:JumpToNearestValidPlot()
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
		
		dprint("Giving Great People")
		local numGP = endgameBonuses[sCivilizationType].grp
		
		if numGP > 0 then
			tmpUnit = player:InitUnit(6, city:GetX(), city:GetY())
			tmpUnit:JumpToNearestValidPlot()
			if numGP > 1 then
				tmpUnit = player:InitUnit(5, city:GetX(), city:GetY())
				tmpUnit:JumpToNearestValidPlot()
				if numGP > 2 then
					tmpUnit = player:InitUnit(147, city:GetX(), city:GetY())
					tmpUnit:JumpToNearestValidPlot()
					if numGP > 3 then
						tmpUnit = player:InitUnit(3, city:GetX(), city:GetY())
						tmpUnit:JumpToNearestValidPlot()
						if numGP > 4 then
							tmpUnit = player:InitUnit(6, city:GetX(), city:GetY())
							tmpUnit:JumpToNearestValidPlot()
						end
					end
				end
			end
		end
		
		dprint("Giving Great Prophets")
		
		if endgameBonuses[sCivilizationType].reli == 1 then
			player:InitUnit(128, city:GetX(), city:GetY())
		end
		
		
	elseif Game.GetGameTurn() == 2 then	
		local iHighestStrength = 0
		local iChosenType = nil
		local city = player:GetCapitalCity()
		
		dprint("Placing best melee units")
		for k, v in pairs(unitTable) do
			if player:CanTrain(v.ID, true, true, true, false) then
				if team:IsHasTech(v.Tech) or (v.Tech == nil) then
					if cbrxTSLs[sCivilizationType].S == "T" and city:IsCoastal() then
						if v.Domain == "DOMAIN_LAND" then
							if v.MeleeStr >= iHighestStrength then
								iHighestStrength = v.MeleeStr
								iChosenType = v.ID
							end
						end
					elseif v.MeleeStr >= iHighestStrength then
						if v.Domain == "DOMAIN_LAND" then
							iHighestStrength = v.MeleeStr
							iChosenType = v.ID
						end
					end
				end
			end
		end
	
		for var = 1, endgameBonuses[sCivilizationType].mil do
			SpawnAtPlot(player, iChosenType, city:GetX(), city:GetY(), 0, 0, "NO_NAME")
			--local newUnit = player:InitUnit(iChosenType, city:GetX(), city:GetY())
			--newUnit:JumpToNearestValidPlot()
			--dprint(newUnit:GetName() .. " has been placed")
		end
	end
end
GameEvents.PlayerDoTurn.Add(Lime_MainBonuses)

function Lime_NewCapitalBonuses(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	dprint(bIsCapital)
	if not bIsCapital == 1 then return end
	
	local player = Players[iOldOwner]
	if not player then return end
	local sCivilizationType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	if not sCivilizationType then return end
	
	for city in player:Cities() do
		if city then
			Lime_GiveTurnBonuses(city, sCivilizationType)
			break
		end
	end
end
GameEvents.CityCaptureComplete.Add(Lime_NewCapitalBonuses)

function addHarbors(iPlayer)
	local player = Players[iPlayer]
	if not player then return end
	if (player:GetNumCities() > 3 or Game.GetGameTurn() > 100) then return end
	local sCivilizationType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	if not sCivilizationType then return end
	if cbrxTSLs[sCivilizationType].S == "T" then
		for city in player:Cities() do
			if city:IsCoastal() then city:SetNumRealBuilding(24, 1) end
		end
	end
end
--GameEvents.PlayerDoTurn.Add(addHarbors)

function addOptics(iPlayer)
	if not (Game.GetGameTurn() == 1) then return end
	local pPlayer = Players[iPlayer]
	if not pPlayer then return end
	local sCivilizationType = GameInfo.Civilizations[pPlayer:GetCivilizationType()].Type
	if not sCivilizationType then return end
	local pTeam = Teams[pPlayer:GetTeam()]
	if not cbrxTSLs[sCivilizationType] then return end

	if cbrxTSLs[sCivilizationType] then
		for v in pPlayer:Units() do
			if v:GetUnitType() == 0 then
				v:SetXY(cbrxTSLs[sCivilizationType].X, cbrxTSLs[sCivilizationType].Y)
			end
		end
	end

	if cbrxTSLs[sCivilizationType].S == "T" then
		pTeam:SetHasTech(12, false)
		pTeam:SetHasTech(12, true)
		pTeam:SetHasTech(5, false)
		pTeam:SetHasTech(5, true)
	end
end
GameEvents.PlayerDoTurn.Add(addOptics)

function setTSLs()
	if Game.GetGameTurn() < 2 then
		dprint("Setting TSLs")
		for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
			local pPlayer = Players[iPlayer]
			if not pPlayer then return end
			if pPlayer:IsBarbarian() then return end
			local sCivilizationType = GameInfo.Civilizations[pPlayer:GetCivilizationType()].Type
			local pTeam = Teams[pPlayer:GetTeam()]
			local currentTeamID = pTeam:GetID()

			if sCivilizationType == 'CIVILIZATION_BABYLON' then
				for index, val in ipairs(observerTechs) do
					pTeam:SetHasTech(val, true)
				end
				pPlayer:InitUnit(13, cbrxTSLs[sCivilizationType].X, cbrxTSLs[sCivilizationType].Y)
				for unit in pPlayer:Units() do
					if not unit == 13 then
						unit:Kill()
					end
				end
			end

			for i = 0, Map.GetNumPlots()-1, 1 do
				local plot = Map.GetPlotByIndex(i);
				local oldVisibility = plot:GetVisibilityCount(currentTeamID)

				if oldVisibility > 0 then
					plot:ChangeVisibilityCount(currentTeamID, -1, -1, true, true)
					plot:SetRevealed(currentTeamID, false)
					plot:UpdateFog()
				end
			end
			Game.UpdateFOW(true);
			UI.RequestMinimapBroadcast();

			if cbrxTSLs[sCivilizationType] then
				dprint(sCivilizationType)
				-- local hasWarrior = false
				-- local hasWorker = false
				-- local hasSettler = false
				
				for v in pPlayer:Units() do
					v:SetXY(cbrxTSLs[sCivilizationType].X, cbrxTSLs[sCivilizationType].Y)
				end
					-- if hasWorker and hasWarrior and hasSettler then v:Kill() end
					
					-- if v:GetUnitType() == 1 and not hasWorker then
						-- v:SetXY(cbrxTSLs[sCivilizationType].X, cbrxTSLs[sCivilizationType].Y)
						-- hasWorker = true
					-- elseif v:GetUnitType() == 83 and not hasWarrior then
						-- v:SetXY(cbrxTSLs[sCivilizationType].X, cbrxTSLs[sCivilizationType].Y)
						-- hasWarrior = true
					-- elseif v:GetUnitType() == 0 and not hasSettler then
						-- v:SetXY(cbrxTSLs[sCivilizationType].X, cbrxTSLs[sCivilizationType].Y)
						-- hasSettler = true
					-- else
						-- v:Kill()
					-- end
				-- end
				if cbrxTSLs[sCivilizationType].S == "T" then
					pTeam:SetHasTech(sailing, true)
					pTeam:SetHasTech(optics, true)
					pTeam:SetHasTech(bronze, true)

					local worker = false

					for u in pPlayer:Units() do
						if u:GetUnitType() == 83 then
							local newTrireme = pPlayer:InitUnit(22, u:GetX(), u:GetY())
							newTrireme:JumpToNearestValidPlot()
							u:Kill()
						elseif u:GetUnitType() == 1 and (cbrxTSLs[sCivilizationType].O == "T" or worker == false) then
							local newWorkBoat = pPlayer:InitUnit(2, u:GetX(), u:GetY())
							newWorkBoat:JumpToNearestValidPlot()
							u:Kill()
							worker = true
						end
					end
				end
			end
		end
	end
end
Events.SequenceGameInitComplete.Add(setTSLs)

print("EndGame Bonuses have loaded")
