--[[
    LocalScript (LocalScript)
    Path: ReplicatedStorage → ChangeDisplayName
    Parent: ChangeDisplayName
    Properties:
        Disabled: false
    Exported: 2026-04-19 15:57:41
]]
local button = script.Parent
local input = button.Parent:WaitForChild("PseudoInput")
local event = game:GetService("ReplicatedStorage"):WaitForChild("ChangeDisplayName")

button.MouseButton1Click:Connect(function()
	local text = input.Text
	if text ~= "" then
	
		event:FireServer(text)
		
		button.Parent.Parent.Enabled = false
	end
end)
