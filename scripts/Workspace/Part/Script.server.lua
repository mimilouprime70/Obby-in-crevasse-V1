--[[
    Script (Script)
    Path: Workspace → Part
    Parent: Part
    Properties:
        Disabled: false
        RunContext: Enum.RunContext.Legacy
    Exported: 2026-04-19 15:57:41
]]
function onTouch(part)
local humanoid = part.Parent:findFirstChild("Humanoid")
if (humanoid ~=nil) then
humanoid.Health = 0
end
end

script.Parent.Touched:connect(onTouch)
