--!strict
local DataStoreService = game:GetService("DataStoreService")

local PlayerManager = {}
PlayerManager.__index = PlayerManager

export type ClassType = typeof(setmetatable(
	{} :: {
		Owner: Player,
		KingdomPosition: Vector3,
	},
	PlayerManager
))

function PlayerManager.new(owner: Player, kingdomPosition: Vector3): ClassType
	local self = {
		Owner = owner,
		KingdomPosition = kingdomPosition,
	}

	setmetatable(self, PlayerManager)

	return self
end

function PlayerManager.Destroy(self: ClassType)
	-- FIXME
	print("PlayerManager has been destroyed")
end

return PlayerManager
