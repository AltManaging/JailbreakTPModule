-- Decompiler will be improved soon!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2024-12-13 09:05:37
-- Luau version 6, Types version 3
-- Time taken: 0.001602 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local module_upvr = {
	OnJump = nil;
	IsCrawling = false;
	WalkSpeedSpring = require(ReplicatedStorage.Std.Spring).new(1, 0, 0.8, 10);
	IsJuiced = false;
	setHumanoidEnabled = function(arg1, arg2) -- Line 11, Named "setHumanoidEnabled"
		for _, v in ipairs(Enum.HumanoidStateType:GetEnumItems()) do
			if v ~= Enum.HumanoidStateType.Dead and v ~= Enum.HumanoidStateType.None and v ~= Enum.HumanoidStateType.Jumping then
				arg1:SetStateEnabled(v, arg2)
			end
		end
	end;
	stopAnims = function(arg1) -- Line 22, Named "stopAnims"
		for _, v_2 in ipairs(arg1:FindFirstChildOfClass("Animator"):GetPlayingAnimationTracks()) do
			v_2:Stop(0)
		end
	end;
}
local HumanoidUnloadConsts_upvr = require(ReplicatedStorage.HumanoidUnload.HumanoidUnloadConsts)
function module_upvr.getPositionFromCharacter(arg1) -- Line 28
	--[[ Upvalues[1]:
		[1]: HumanoidUnloadConsts_upvr (readonly)
	]]
	local Humanoid = arg1:FindFirstChild("Humanoid")
	if not Humanoid then
		return nil
	end
	local SOME = Humanoid:FindFirstChild(HumanoidUnloadConsts_upvr.SERVER_POSITION_OBJ_NAME)
	if not SOME then
		return nil
	end
	return SOME.Value
end
local Players_upvr = game:GetService("Players")
function module_upvr.getAllCharacterPositions() -- Line 39
	--[[ Upvalues[2]:
		[1]: Players_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	for _, v_3 in Players_upvr:GetPlayers() do
		local Character = v_3.Character
		if Character then
			local any_getPositionFromCharacter_result1_2 = module_upvr.getPositionFromCharacter(Character)
			if any_getPositionFromCharacter_result1_2 then
				({})[Character] = any_getPositionFromCharacter_result1_2
			end
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return {}
end
return module_upvr
