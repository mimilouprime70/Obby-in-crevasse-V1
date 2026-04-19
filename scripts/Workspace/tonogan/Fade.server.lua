--[[
    Fade (Script)
    Path: Workspace → tonogan
    Parent: tonogan
    Properties:
        Disabled: false
        RunContext: Enum.RunContext.Legacy
    Exported: 2026-04-19 15:57:41
]]
local slab = script.Parent


local function dissapear()
	for count = 0.5, 10, 0.5 do
		slab.Transparency = count / 10
		wait(0.01)
	end
	slab.CanCollide = false
end


local function appear()
	for count = 10, 0, -0.5 do
		slab.Transparency = count / 10
		wait(0.01)
	end
	slab.CanCollide = true
end


local function fade()
	if slab.Transparency == 0 then
		dissapear()
		wait(2)
		appear()
	end
end


slab.Touched:Connect(fade)