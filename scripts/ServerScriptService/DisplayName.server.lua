--[[
    DisplayName (Script)
    Path: ServerScriptService
    Parent: ServerScriptService
    Properties:
        Disabled: false
        RunContext: Enum.RunContext.Legacy
    Exported: 2026-04-19 15:57:41
]]
local event = game:GetService("ReplicatedStorage"):WaitForChild("ChangeDisplayName")

event.OnServerEvent:Connect(function(player, nouveauPseudo)
	player.DisplayName = nouveauPseudo
	print("Le serveur a changé le nom de " .. player.Name .. " en " .. nouveauPseudo)
end)