local ReplicatedStorage = game.ReplicatedStorage
local RemoteEvents = ReplicatedStorage.RemoteEvents
local GiveCash = RemoteEvents.GiveCash
local PowerUP = RemoteEvents.PowerUP

game.Players.PlayerAdded:Connect(function(Player)
	local Leaderstats = Instance.new("Folder", Player)
	Leaderstats.Name = "leaderstats"
	
	local Cash = Instance.new("NumberValue", Leaderstats)
	Cash.Name = "Cash"
	Cash.Value = 0
	
	local Power = Instance.new("NumberValue", Player)
	Power.Name = "Power"
	Power.Value = 1
	
	local Powercost = Instance.new("IntValue", Leaderstats)
	Powercost.Name = "PowerCost"
	Powercost.Value = 25
end)

GiveCash.OnServerEvent:Connect(function(Player, Amount)
	local Leaderstats = Player.leaderstats
	local Cash = Leaderstats.Cash
	Cash.Value += Amount.Value
end)

PowerUP.OnServerEvent:Connect(function(Player)
	local Leaderstats = Player.leaderstats
	local Cash = Leaderstats.Cash
	local PowerPrice = Leaderstats.PowerCost
	local Power = Player.Power
	if Cash.Value >= PowerPrice.Value then
		Cash.Value -= PowerPrice.Value
		PowerPrice.Value = PowerPrice.Value * 2
		Power.Value += 1
	end
end)
