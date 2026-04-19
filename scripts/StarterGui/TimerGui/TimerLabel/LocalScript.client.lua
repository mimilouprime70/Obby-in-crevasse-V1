--[[
    LocalScript (LocalScript)
    Path: StarterGui → TimerGui → TimerLabel
    Parent: TimerLabel
    Properties:
        Disabled: false
    Exported: 2026-04-19 15:57:41
]]
local label = script.Parent
local runService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")

local startTime = _G.ObbyStartTime or 0
local running = _G.ObbyRunning or false

label.Visible = running

local function updateTimer()
	if running then
		local currentTime = os.clock() - startTime
		local minutes = math.floor(currentTime / 60)
		local seconds = math.floor(currentTime % 60)
		local ms = math.floor((currentTime * 100) % 100)

		label.Text = string.format("%02d:%02d:%02d", minutes, seconds, ms)
	end
end

replicatedStorage:WaitForChild("StartTimer").OnClientEvent:Connect(function()
	startTime = os.clock()
	running = true
	_G.ObbyStartTime = startTime
	_G.ObbyRunning = true

	label.Visible = true 
end)

replicatedStorage:WaitForChild("StopTimer").OnClientEvent:Connect(function()
	running = false
	_G.ObbyRunning = false

end)

runService.RenderStepped:Connect(updateTimer)


replicatedStorage:WaitForChild("StopTimer").OnClientEvent:Connect(function()
	label.Visible = false
	_G.ObbyRunning = false
	_G.ObbyStartTime = 0
end)