--!strict
local Players = game:GetService("Players")

local Utils = {}

function Utils.safePlayerAdded(callback: (Player) -> ())
	for _, player in ipairs(Players:GetPlayers()) do
		callback(player)
	end

	return Players.PlayerAdded:Connect(callback)
end

return Utils
