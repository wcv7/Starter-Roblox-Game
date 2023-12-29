local GUI = script.Parent
local AutoBtn = GUI.AutoClickBtn
local ReplicatedStorage = game.ReplicatedStorage
local RemoteEvents = ReplicatedStorage.RemoteEvents
local GiveCash = RemoteEvents.GiveCash
local Player = game.Players.LocalPlayer
local Power = Player.Power
local AutoClicking = false
local UIStroke = AutoBtn.UIStroke
local OffColour = Color3.fromRGB(124, 0, 2)
local OnColour = Color3.fromRGB(1, 63, 0)

AutoBtn.MouseButton1Click:Connect(function()
	if not AutoClicking then
		AutoClicking = true
		UIStroke.Color = OnColour
	else
		AutoClicking = false
		UIStroke.Color = OffColour
	end
end)

while wait() do
	if AutoClicking then
		Power.Value = Power.Value * 1.5
		GiveCash:FireServer(Power)
		wait(.01)
	end
end
