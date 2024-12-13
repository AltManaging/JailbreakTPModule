-- Decompiler will be improved soon!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2024-12-13 09:04:51
-- Luau version 6, Types version 3
-- Time taken: 0.002320 seconds

local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local Settings_upvr = require(ReplicatedStorage_upvr.Resource.Settings)
local Players_upvr = game:GetService("Players")
local LocalPlayer_upvr = Players_upvr.LocalPlayer
local var5_upvw
local module_upvr = {
	init = function() -- Line 17, Named "init"
		--[[ Upvalues[2]:
			[1]: var5_upvw (read and write)
			[2]: ReplicatedStorage_upvr (readonly)
		]]
		var5_upvw = require(ReplicatedStorage_upvr.Inventory.InventoryItemSystem)
	end;
}
local PlayerConsts_upvr = require(script.Parent.PlayerConsts)
function module_upvr.getLastVehicleSpawnedAt() -- Line 20
	--[[ Upvalues[2]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: PlayerConsts_upvr (readonly)
	]]
	local SOME = LocalPlayer_upvr:FindFirstChild(PlayerConsts_upvr.LAST_VEHICLE_SPAWNED_AT_VALUE_NAME)
	assert(SOME)
	return SOME.Value
end
function module_upvr.getHumanoid(arg1) -- Line 25
	local Character = arg1.Character
	if not Character then return end
	return Character:FindFirstChild("Humanoid")
end
function module_upvr.getRootPart(arg1) -- Line 32
	local Character_2 = arg1.Character
	if not Character_2 then return end
	return Character_2.PrimaryPart
end
function module_upvr.getTeam(arg1) -- Line 40
	local TeamValue = arg1:FindFirstChild("TeamValue")
	local var12 = TeamValue
	if var12 then
		var12 = TeamValue.Value
	end
	return var12
end
local Teams_upvr = game:GetService("Teams")
function module_upvr.getTeamId(arg1) -- Line 44
	--[[ Upvalues[2]:
		[1]: Teams_upvr (readonly)
		[2]: Settings_upvr (readonly)
	]]
	if arg1.Team == Teams_upvr:FindFirstChild("Prisoner") then
		return Settings_upvr.EnumTeam.Prisoner
	end
	if arg1.Team == Teams_upvr:FindFirstChild("Criminal") then
		return Settings_upvr.EnumTeam.Criminal
	end
	if arg1.Team == Teams_upvr:FindFirstChild("Police") then
		return Settings_upvr.EnumTeam.Police
	end
	return nil
end
local GameUtil_upvr = require(ReplicatedStorage_upvr.Game.GameUtil)
function module_upvr.hasKey() -- Line 54
	--[[ Upvalues[4]:
		[1]: GameUtil_upvr (readonly)
		[2]: Settings_upvr (readonly)
		[3]: var5_upvw (read and write)
		[4]: LocalPlayer_upvr (readonly)
	]]
	if GameUtil_upvr.Team == Settings_upvr.EnumTeam.Police then
		return true
	end
	return var5_upvw.playerHasItem(LocalPlayer_upvr, "Key")
end
function module_upvr.getPlayerFromDescendant(arg1) -- Line 60
	--[[ Upvalues[1]:
		[1]: Players_upvr (readonly)
	]]
	if not arg1 then
	else
		for _, v in ipairs(Players_upvr:GetPlayers()) do
			if v.Character and arg1:IsDescendantOf(v.Character) then
				return v
			end
		end
	end
end
local CharacterUtils_upvr = require(ReplicatedStorage_upvr.Std.CharacterUtils)
function module_upvr.isInVehicle(arg1) -- Line 72
	--[[ Upvalues[2]:
		[1]: CharacterUtils_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	return module_upvr.isHumanoidInVehicle(CharacterUtils_upvr.getHumanoid(arg1.Character))
end
function module_upvr.isHumanoidInVehicle(arg1) -- Line 76
	if not arg1 then
		return false
	end
	local Sit = arg1.Sit
	if not Sit then
		Sit = arg1.PlatformStand
	end
	return Sit
end
return module_upvr
