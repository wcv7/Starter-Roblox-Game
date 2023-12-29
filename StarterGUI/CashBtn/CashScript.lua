local GUI = script.Parent
local CashBtn = GUI.CashBtn
local ReplicatedStorage = game.ReplicatedStorage
local RemoteEvents = ReplicatedStorage.RemoteEvents
local GiveCash = RemoteEvents.GiveCash
local Player = game.Players.LocalPlayer
local Power = Player.Power

CashBtn.MouseButton1Click:Connect(function()
	GiveCash:FireServer(Power)
end)
