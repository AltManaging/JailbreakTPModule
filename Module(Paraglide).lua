-- Decompiler will be improved soon!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2024-12-13 09:06:04
-- Luau version 6, Types version 3
-- Time taken: 0.006697 seconds

local RunService_upvr = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Signal = require(ReplicatedStorage.Std.Signal)
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local CurrentCamera_upvr = workspace.CurrentCamera
local var6_upvw
local new_upvr = Vector3.new
local FindPartOnRayWithIgnoreList_upvw = workspace.FindPartOnRayWithIgnoreList
local function fpor2_upvw(arg1, arg2, ...) -- Line 16, Named "fpor2"
	--[[ Upvalues[2]:
		[1]: new_upvr (readonly)
		[2]: FindPartOnRayWithIgnoreList_upvw (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local magnitude = arg2.magnitude
	local unit = arg2.unit
	local args_list = {...}
	local var12
	repeat
		local ParachuteStop_result1, FindPartOnRayWithIgnoreList_upvw_result2, FindPartOnRayWithIgnoreList_upvw_result3 = FindPartOnRayWithIgnoreList_upvw(workspace, Ray.new(arg1, unit * (magnitude - 0)), args_list, false, true)
		var12 = ParachuteStop_result1
		ParachuteStop_result1 = var12
		local var17 = ParachuteStop_result1
		if var17 then
			var17 = var12.CanCollide
		end
		local var18 = var17
		if not var18 then
			table.insert(args_list, var12)
		end
	until var18 and magnitude - (arg1 - FindPartOnRayWithIgnoreList_upvw_result2).magnitude <= 0.001 and 4 < 0 + 1
	if not var12 then
	end
	return var12, arg1 + unit * magnitude, new_upvr
end
new_upvr = nil
FindPartOnRayWithIgnoreList_upvw = nil
local any_new_result1_upvr = Signal.new()
local any_new_result1_upvr_2 = Signal.new()
local var21_upvw
local function UpdateParachute_upvr() -- Line 54, Named "UpdateParachute"
	--[[ Upvalues[4]:
		[1]: var21_upvw (read and write)
		[2]: CurrentCamera_upvr (readonly)
		[3]: fpor2_upvw (read and write)
		[4]: FindPartOnRayWithIgnoreList_upvw (read and write)
	]]
	local HumanoidRootPart = var21_upvw.HumanoidRootPart
	local var24 = CurrentCamera_upvr.CFrame * CFrame.Angles(0.2, 0, 0)
	local absolute_2 = math.abs(var24.LookVector:Dot(Vector3.new(0, 1, 0)))
	var21_upvw.Velocity.Velocity = Vector3.new(var24.LookVector.X, 0, var24.lookVector.Z) * 60 * math.max(0.5, absolute_2) + Vector3.new(0, absolute_2, 0) * -40
	var21_upvw.Gyro.CFrame = CFrame.new(Vector3.new(), var24.lookVector) * CFrame.new(0, 0, math.clamp(HumanoidRootPart.RotVelocity.y, -4, 4) * 0.125)
	local fpor2_result1, _ = fpor2_upvw(HumanoidRootPart.Position, Vector3.new(0, -1, 0) * 4, HumanoidRootPart.Parent)
	if fpor2_result1 and not fpor2_result1:IsDescendantOf(workspace.Vehicles) then
		FindPartOnRayWithIgnoreList_upvw()
	end
end
local Audio_upvr = require(ReplicatedStorage.Std.Audio)
local function RawParachute_upvr() -- Line 71, Named "RawParachute"
	--[[ Upvalues[6]:
		[1]: var21_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
		[3]: CurrentCamera_upvr (readonly)
		[4]: Audio_upvr (readonly)
		[5]: RunService_upvr (readonly)
		[6]: UpdateParachute_upvr (readonly)
	]]
	if var21_upvw then
		print("Already has parachute")
		return false
	end
	local Character_2 = LocalPlayer_upvr.Character
	if not Character_2 then
		return false
	end
	local Humanoid_2 = Character_2:FindFirstChild("Humanoid")
	if not Humanoid_2 then
		return false
	end
	local PrimaryPart = Character_2.PrimaryPart
	if not PrimaryPart then
		return false
	end
	if Humanoid_2.PlatformStand then
		return false
	end
	if Humanoid_2.Sit then
		return false
	end
	Humanoid_2.PlatformStand = true
	Humanoid_2:ChangeState(Enum.HumanoidStateType.PlatformStanding)
	var21_upvw = {}
	var21_upvw.Type = "Parachute"
	local BodyGyro_2 = Instance.new("BodyGyro")
	BodyGyro_2.MaxTorque = Vector3.new(10000, 10000, 10000)
	BodyGyro_2.CFrame = CurrentCamera_upvr.CFrame * CFrame.Angles(0.2, 0, 0)
	BodyGyro_2.Parent = PrimaryPart
	local BodyVelocity = Instance.new("BodyVelocity")
	BodyVelocity.MaxForce = Vector3.new(1000000, 1000000, 1000000)
	BodyVelocity.Velocity = Vector3.new(0, -1, 0)
	BodyVelocity.Parent = PrimaryPart
	var21_upvw.Gyro = BodyGyro_2
	var21_upvw.Velocity = BodyVelocity
	var21_upvw.HumanoidRootPart = PrimaryPart
	var21_upvw.Humanoid = Humanoid_2
	Audio_upvr.ObjectLocal(Humanoid_2.RootPart, 4482070135)
	var21_upvw.Loop = RunService_upvr.Heartbeat:Connect(UpdateParachute_upvr)
	return true
end
local function _() -- Line 121, Named "RawParachuteStop"
	--[[ Upvalues[2]:
		[1]: var21_upvw (read and write)
		[2]: any_new_result1_upvr (readonly)
	]]
	if not var21_upvw then
		return false
	end
	if var21_upvw.Type ~= "Parachute" then
		return false
	end
	var21_upvw.Gyro:Destroy()
	var21_upvw.Velocity:Destroy()
	var21_upvw.Loop:Disconnect()
	var21_upvw.Humanoid.PlatformStand = false
	var21_upvw = nil
	any_new_result1_upvr:Fire()
	return true
end
function new_upvr() -- Line 137, Named "Parachute"
	--[[ Upvalues[2]:
		[1]: RawParachute_upvr (readonly)
		[2]: var6_upvw (read and write)
	]]
	if not RawParachute_upvr() then
		return false
	end
	var6_upvw:FireServer('v'.."v3lbjhroa":sub(3, 5):reverse():reverse():reverse():reverse():reverse().."".."".."qk62gj16":sub(4, 5):reverse().."".."".."bz9rob":sub(3, 3):reverse():reverse():reverse():reverse():reverse()..""..'g')
end
function FindPartOnRayWithIgnoreList_upvw() -- Line 144, Named "ParachuteStop"
	--[[ Upvalues[3]:
		[1]: var21_upvw (read and write)
		[2]: any_new_result1_upvr (readonly)
		[3]: var6_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 16 start (CF ANALYSIS FAILED)
	local var34
	if not var21_upvw then
		var34 = false
		-- KONSTANTWARNING: GOTO [42] #32
	end
	-- KONSTANTERROR: [0] 1. Error Block 16 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 5. Error Block 17 start (CF ANALYSIS FAILED)
	if var21_upvw.Type ~= "Parachute" then
		var34 = false
	else
		var21_upvw.Gyro:Destroy()
		var21_upvw.Velocity:Destroy()
		var21_upvw.Loop:Disconnect()
		var21_upvw.Humanoid.PlatformStand = false
		var21_upvw = nil
		any_new_result1_upvr:Fire()
		var34 = true
	end
	if not var34 then
		return false
	end
	var6_upvw:FireServer('w'.."".."a13x2qu9q":sub(2, 6):reverse():reverse():reverse():reverse():reverse().."".."wd")
	-- KONSTANTERROR: [4] 5. Error Block 17 end (CF ANALYSIS FAILED)
end
local GliderStop_upvw
local function UpdateGlider_upvr() -- Line 151, Named "UpdateGlider"
	--[[ Upvalues[4]:
		[1]: var21_upvw (read and write)
		[2]: CurrentCamera_upvr (readonly)
		[3]: fpor2_upvw (read and write)
		[4]: GliderStop_upvw (read and write)
	]]
	local HumanoidRootPart_2 = var21_upvw.HumanoidRootPart
	local var37 = CurrentCamera_upvr.CFrame * CFrame.Angles(0.2, 0, 0)
	local absolute = math.abs(math.clamp(var37.lookVector:Dot(Vector3.new(0, 1, 0)), -1, -0.06))
	var21_upvw.Velocity.Velocity = Vector3.new(var37.lookVector.X, 0, var37.lookVector.Z) * 60 * math.max(0.9, absolute) + Vector3.new(0, absolute, 0) * -90
	var21_upvw.Gyro.CFrame = CFrame.new(Vector3.new(), var37.lookVector * 1) * CFrame.Angles(-1.8849555921538759, 0, 0)
	local fpor2_upvw_result1, _ = fpor2_upvw(HumanoidRootPart_2.Position, Vector3.new(0, -1, 0) * 3, HumanoidRootPart_2.Parent)
	if fpor2_upvw_result1 and not fpor2_upvw_result1:IsDescendantOf(workspace.Vehicles) and 1 < tick() - var21_upvw.Started then
		GliderStop_upvw()
	end
end
local function RawGlider_upvr() -- Line 167, Named "RawGlider"
	--[[ Upvalues[5]:
		[1]: var21_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
		[3]: CurrentCamera_upvr (readonly)
		[4]: RunService_upvr (readonly)
		[5]: UpdateGlider_upvr (readonly)
	]]
	if var21_upvw then
		print("Already has glider")
		return false
	end
	local Character = LocalPlayer_upvr.Character
	if not Character then
		return false
	end
	local Humanoid = Character:FindFirstChild("Humanoid")
	if not Humanoid then
		return false
	end
	local PrimaryPart_2 = Character.PrimaryPart
	if not PrimaryPart_2 then
		return false
	end
	if Humanoid.PlatformStand then
		return false
	end
	if Humanoid.Sit then
		return false
	end
	Humanoid.PlatformStand = true
	Humanoid:ChangeState(Enum.HumanoidStateType.PlatformStanding)
	var21_upvw = {}
	var21_upvw.Type = "Glider"
	local BodyGyro = Instance.new("BodyGyro")
	BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
	BodyGyro.CFrame = CurrentCamera_upvr.CFrame * CFrame.Angles((-math.pi/2), 0, 0)
	BodyGyro.Parent = PrimaryPart_2
	local BodyVelocity_2 = Instance.new("BodyVelocity")
	BodyVelocity_2.MaxForce = Vector3.new(1000000, 1000000, 1000000)
	BodyVelocity_2.Velocity = Vector3.new(0, -1, 0)
	BodyVelocity_2.Parent = PrimaryPart_2
	var21_upvw.Gyro = BodyGyro
	var21_upvw.Velocity = BodyVelocity_2
	var21_upvw.HumanoidRootPart = PrimaryPart_2
	var21_upvw.Humanoid = Humanoid
	var21_upvw.Started = tick()
	var21_upvw.Loop = RunService_upvr.Heartbeat:Connect(UpdateGlider_upvr)
	return true
end
local function RawGliderStop_upvr() -- Line 217, Named "RawGliderStop"
	--[[ Upvalues[2]:
		[1]: var21_upvw (read and write)
		[2]: any_new_result1_upvr_2 (readonly)
	]]
	if not var21_upvw then
		return false
	end
	if var21_upvw.Type ~= "Glider" then
		return false
	end
	var21_upvw.Gyro:Destroy()
	var21_upvw.Velocity:Destroy()
	var21_upvw.Loop:Disconnect()
	var21_upvw.Humanoid.PlatformStand = false
	var21_upvw.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
	var21_upvw = nil
	any_new_result1_upvr_2:Fire()
	return true
end
function GliderStop_upvw() -- Line 241, Named "GliderStop"
	--[[ Upvalues[2]:
		[1]: RawGliderStop_upvr (readonly)
		[2]: var6_upvw (read and write)
	]]
	if not RawGliderStop_upvr() then
		return false
	end
	var6_upvw:FireServer('y'.."".."fy9ix":sub(3, 4):reverse():reverse():reverse():reverse():reverse().."".."".."c9hri":sub(2, 2):reverse().."".."".."vfqjja":sub(5, 5):reverse():reverse():reverse().."".."0ku")
end
local var46_upvw = GliderStop_upvw
local var47_upvw
return {
	Init = function(arg1) -- Line 248, Named "Init"
		--[[ Upvalues[8]:
			[1]: var6_upvw (read and write)
			[2]: var47_upvw (read and write)
			[3]: RawParachute_upvr (readonly)
			[4]: var21_upvw (read and write)
			[5]: any_new_result1_upvr (readonly)
			[6]: RawGlider_upvr (readonly)
			[7]: RawGliderStop_upvr (readonly)
			[8]: var46_upvw (read and write)
		]]
		var6_upvw = arg1.Event
		var47_upvw = arg1.em
		function var47_upvw.vjblg29g() -- Line 250
			--[[ Upvalues[2]:
				[1]: RawParachute_upvr (copied, readonly)
				[2]: var6_upvw (copied, read and write)
			]]
			if not RawParachute_upvr() then
				var6_upvw:FireServer('w'.."ascqsvho":sub(4, 4):reverse().."".."2x31wd")
			end
		end
		function var47_upvw.wq2x31wd() -- Line 256
			--[[ Upvalues[2]:
				[1]: var21_upvw (copied, read and write)
				[2]: any_new_result1_upvr (copied, readonly)
			]]
			if not var21_upvw then
			else
				if var21_upvw.Type ~= "Parachute" then return end
				var21_upvw.Gyro:Destroy()
				var21_upvw.Velocity:Destroy()
				var21_upvw.Loop:Disconnect()
				var21_upvw.Humanoid.PlatformStand = false
				var21_upvw = nil
				any_new_result1_upvr:Fire()
			end
		end
		function var47_upvw.rb2wpazc() -- Line 259
			--[[ Upvalues[2]:
				[1]: RawGlider_upvr (copied, readonly)
				[2]: var6_upvw (copied, read and write)
			]]
			if not RawGlider_upvr() then
				var6_upvw:FireServer('y'.."ul99igcq":sub(4, 5):reverse():reverse():reverse().."".."".."slx29n":sub(5, 5):reverse():reverse():reverse().."".."".."vjys":sub(2, 2):reverse():reverse():reverse():reverse():reverse().."".."".."nf0ok0o80":sub(5, 6):reverse()..""..'u')
			end
		end
		function var47_upvw.yi99j0ku() -- Line 265
			--[[ Upvalues[1]:
				[1]: RawGliderStop_upvr (copied, readonly)
			]]
			RawGliderStop_upvr()
		end
		require(script.Parent.DefaultActions).onJumpPressed:Connect(function() -- Line 270
			--[[ Upvalues[2]:
				[1]: var21_upvw (copied, read and write)
				[2]: var46_upvw (copied, read and write)
			]]
			if var21_upvw and var21_upvw.Type == "Glider" then
				var46_upvw()
			end
		end)
	end;
	Parachute = new_upvr;
	ParachuteStop = FindPartOnRayWithIgnoreList_upvw;
	Glider = function() -- Line 234, Named "Glider"
		--[[ Upvalues[2]:
			[1]: RawGlider_upvr (readonly)
			[2]: var6_upvw (read and write)
		]]
		if not RawGlider_upvr() then
			return false
		end
		var6_upvw:FireServer('r'.."ebyi2btlg":sub(5, 6):reverse():reverse():reverse().."".."".."szapwaxu":sub(2, 5):reverse():reverse():reverse()..""..'c')
	end;
	GliderStop = var46_upvw;
	IsFlying = function() -- Line 51, Named "IsFlying"
		--[[ Upvalues[1]:
			[1]: var21_upvw (read and write)
		]]
		local var22
		if var21_upvw == nil then
			var22 = false
		else
			var22 = true
		end
		return var22
	end;
	OnParachuteStopped = any_new_result1_upvr;
	OnGliderStopped = any_new_result1_upvr_2;
}
