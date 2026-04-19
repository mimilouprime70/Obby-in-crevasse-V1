--[[
    GameManager (Script)
    Path: ServerScriptService
    Parent: ServerScriptService
    Properties:
        Disabled: false
        RunContext: Enum.RunContext.Legacy
    Exported: 2026-04-19 15:57:41
]]
local replicatedStorage = game:GetService("ReplicatedStorage")
local startEvent = replicatedStorage:WaitForChild("StartTimer")
local stopEvent = replicatedStorage:WaitForChild("StopTimer")

local startPart = workspace:WaitForChild("StartPart")
local finishPart = workspace:WaitForChild("FinishPart")

-- Tableau pour stocker les temps de départ des joueurs
local playerStartTimes = {}

-- DEPART
startPart.Touched:Connect(function(hit)
	local character = hit.Parent
	local player = game.Players:GetPlayerFromCharacter(character)

	if player then
		playerStartTimes[player.UserId] = os.clock()
		startEvent:FireClient(player)
		print("Chrono lancé pour : " .. player.Name)
	end
end)

-- ARRIVÉE
finishPart.Touched:Connect(function(hit)
	local character = hit.Parent
	local player = game.Players:GetPlayerFromCharacter(character)

	-- On vérifie si c'est bien un joueur ET s'il a un chrono en cours
	if player and playerStartTimes[player.UserId] then
		local timeTaken = os.clock() - playerStartTimes[player.UserId]

		-- 1. On supprime son temps de départ pour qu'il ne puisse pas valider deux fois
		playerStartTimes[player.UserId] = nil

		-- 2. On envoie l'ordre d'arrêt au chrono visuel
		stopEvent:FireClient(player)

		-- 3. On formate le temps pour le classement
		local minutes = math.floor(timeTaken / 60)
		local seconds = math.floor(timeTaken % 60)
		local ms = math.floor((timeTaken * 100) % 100)
		local finalString = string.format("%02d:%02d:%02d", minutes, seconds, ms)

		-- 4. Mise à jour du Leaderboard
		if player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Meilleur Temps") then
			player.leaderstats["Meilleur Temps"].Value = finalString
		end

		print("Chrono terminé pour " .. player.Name .. " en " .. finalString)
	end
end)