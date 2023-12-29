local GUI = script.Parent
local PowerBtn = GUI.PowerBtn
local ReplicatedStorage = game.ReplicatedStorage
local RemoteEvents = ReplicatedStorage.RemoteEvents
local GiveCash = RemoteEvents.GiveCash
local Player = game.Players.LocalPlayer
local Power = Player.Power
local PowerUP = RemoteEvents.PowerUP
local Player = game.Players.LocalPlayer
local Leaderstats = Player.leaderstats
local PowerPrice = Leaderstats.PowerCost
local Cash = Leaderstats.Cash

PowerBtn.MouseButton1Click:Connect(function()
	PowerUP:FireServer()
end)

while wait() do
	PowerBtn.Text = "$"..Cash.Value.." / $"..PowerPrice.Value
end
