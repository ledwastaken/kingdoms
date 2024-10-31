--!strict
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local PlayerManager = require(ServerScriptService.Server.PlayerManager)
local Utils = require(ReplicatedStorage.Shared.Utils)

local playerManagers = {} :: {[Player]: PlayerManager.ClassType}
local kingdomPositions = {Vector3.zero}

Utils.safePlayerAdded(function(player: Player)
    playerManagers[player] = PlayerManager.new(
        player,
        assert(table.remove(kingdomPositions))
    )
end)

Players.PlayerRemoving:Connect(function(player: Player)
    playerManagers[player]:Destroy()
end)

print("Hello world, from server!")
