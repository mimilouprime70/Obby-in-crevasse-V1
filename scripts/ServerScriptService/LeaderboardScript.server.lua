--[[
    LeaderboardScript (Script)
    Path: ServerScriptService
    Parent: ServerScriptService
    Properties:
        Disabled: false
        RunContext: Enum.RunContext.Legacy
    Exported: 2026-04-19 15:57:41
]]
local DataStoreService = game:GetService("DataStoreService")
local timeStore = DataStoreService:GetDataStore("ObbyRecords")

game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local timerValue = Instance.new("StringValue") 
	timerValue.Name = "Meilleur Temps"
	timerValue.Value = "---"
	timerValue.Parent = leaderstats

	-- Charger le record
	local success, savedTime = pcall(function()
		return timeStore:GetAsync(player.UserId)
	end)
	if success and savedTime then
		timerValue.Value = savedTime
	end
end)