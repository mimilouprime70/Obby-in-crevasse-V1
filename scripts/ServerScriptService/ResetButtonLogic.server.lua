--[[
    ResetButtonLogic (Script)
    Path: ServerScriptService
    Parent: ServerScriptService
    Properties:
        Disabled: false
        RunContext: Enum.RunContext.Legacy
    Exported: 2026-04-19 15:57:41
]]
local boutonPart = workspace:WaitForChild("BoutonReset")
local clickDetector = boutonPart:WaitForChild("ClickDetector")


local spawnDebut = workspace:WaitForChild("SpawnDebut")


local stopEvent = game:GetService("ReplicatedStorage"):WaitForChild("StopTimer")

clickDetector.MouseClick:Connect(function(player)
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then


		stopEvent:FireClient(player)


		local destination = spawnDebut.CFrame + Vector3.new(0, 3, 0)
		player.Character.HumanoidRootPart.CFrame = destination

		print("Téléportation réussie : " .. player.Name .. " est de retour au SpawnDebut.")
	end
end)