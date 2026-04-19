--[[
    Script (Script)
    Path: Workspace → tonogan → hamdoula 3
    Parent: hamdoula 3
    Properties:
        Disabled: false
        RunContext: Enum.RunContext.Legacy
    Exported: 2026-04-19 15:57:41
]]
script.Parent.Touched:Connect(function(HitPart)
	local Character = HitPart.Parent
	local Humanoid = Character:FindFirstChild("Humanoid")
	if Humanoid ~= nil then
		Humanoid.Sit = true
	end
end)