local CharacterUtils = {
    -- Adding a large block of text
    description = [[
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
    ]],
}

local Paraglide = {
    -- Adding a large block of text
    description = [[
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
    ]],
}

--// services

local replicated_storage = game:GetService("ReplicatedStorage");
local run_service = game:GetService("RunService");
local pathfinding_service = game:GetService("PathfindingService");
local players = game:GetService("Players");
local tween_service = game:GetService("TweenService");

--// variables

local player = players.LocalPlayer;

local dependencies = {
    variables = {
        up_vector = Vector3.new(0, 500, 0),
        raycast_params = RaycastParams.new(),
        path = pathfinding_service:CreatePath({WaypointSpacing = 3}),
        player_speed = 75, 
        vehicle_speed = 300,
        teleporting = false,
        stopVelocity = false
    },
    modules = {
        ui = loadstring(gameHttpGet("https://raw.githubusercontent.com/AltManaging/JailbreakTPModule/refs/heads/main/Module(UI).lua"))(),
        store = loadstring(gameHttpGet("https://raw.githubusercontent.com/AltManaging/JailbreakTPModule/refs/heads/main/Module(Store).lua"))(),
        player_utils = loadstring(gameHttpGet("https://raw.githubusercontent.com/AltManaging/JailbreakTPModule/refs/heads/main/Module(PlayerUtils).lua"))(),
        vehicle_data = loadstring(gameHttpGet("https://raw.githubusercontent.com/AltManaging/JailbreakTPModule/refs/heads/main/Module(VehicleData).lua"))(),
        character_util = loadstring(gameHttpGet("https://raw.githubusercontent.com/AltManaging/JailbreakTPModule/refs/heads/main/Module(CharacterUtils).lua"))(),
        paraglide = loadstring(gameHttpGet("https://raw.githubusercontent.com/AltManaging/JailbreakTPModule/refs/heads/main/Module(Paraglide).lua"))()
    },
    helicopters = { Heli = true }, -- heli is included in free vehicles
    motorcycles = { Volt = true }, -- volt type is "custom" but works the same as a motorcycle
    free_vehicles = { Camaro = true },
    unsupported_vehicles = { SWATVan = true },
    door_positions = { }    
};

local movement = { };
local utilities = { };

--// function to toggle if a door can be collided with

function utilities:toggle_door_collision(door, toggle)
    for index, child in next, door.Model:GetChildren() do 
        if child:IsA("BasePart") then 
            child.CanCollide = toggle;
        end; 
    end;
end;

--// function to get the nearest vehicle that can be entered

function utilities:get_nearest_vehicle(tried) -- unoptimized
    local nearest;
    local distance = math.huge;

    for index, action in next, dependencies.modules.ui.CircleAction.Specs do -- all of the interations
        if action.IsVehicle and action.ShouldAllowEntry == true and action.Enabled == true and action.Name == "Enter Driver" then -- if the interaction is to enter the driver seat of a vehicle
            local vehicle = action.ValidRoot;

            if not table.find(tried, vehicle) and workspace.VehicleSpawns:FindFirstChild(vehicle.Name) then
                if not dependencies.unsupported_vehicles[vehicle.Name] and (dependencies.modules.store._state.garageOwned.Vehicles[vehicle.Name] or dependencies.free_vehicles[vehicle.Name]) and not vehicle.Seat.Player.Value then -- check if the vehicle is supported, owned and not already occupied
                    if not workspace:Raycast(vehicle.Seat.Position, dependencies.variables.up_vector, dependencies.variables.raycast_params) then
                        local magnitude = (vehicle.Seat.Position - player.Character.HumanoidRootPart.Position).Magnitude; 

                        if magnitude < distance then 
                            distance = magnitude;
                            nearest = action;
                        end;
                    end;
                end;
            end;
        end;
    end;

    return nearest;
end;

--// function to pathfind to a position with no collision above

function movement:pathfind(tried)
    local distance = math.huge;
    local nearest;

    local tried = tried or { };
    
    for index, value in next, dependencies.door_positions do -- find the nearest position in our list of positions without collision above
        if not table.find(tried, value) then
            local magnitude = (value.position - player.Character.HumanoidRootPart.Position).Magnitude;
            
            if magnitude < distance then 
                distance = magnitude;
                nearest = value;
            end;
        end;
    end;

    table.insert(tried, nearest);

    utilities:toggle_door_collision(nearest.instance, false);

    local path = dependencies.variables.path;
    path:ComputeAsync(player.Character.HumanoidRootPart.Position, nearest.position);

    if path.Status == Enum.PathStatus.Success then -- if path making is successful
        local waypoints = path:GetWaypoints();

        for index = 1, #waypoints do 
            local waypoint = waypoints[index];
            
            player.Character.HumanoidRootPart.CFrame = CFrame.new(waypoint.Position + Vector3.new(0, 2.5, 0)); -- walking movement is less optimal

            if not workspace:Raycast(player.Character.HumanoidRootPart.Position, dependencies.variables.up_vector, dependencies.variables.raycast_params) then -- if there is nothing above the player
                utilities:toggle_door_collision(nearest.instance, true);

                return;
            end;

            task.wait(0.05);
        end;
    end;

    utilities:toggle_door_collision(nearest.instance, true);

    movement:pathfind(tried);
end;

--// function to interpolate characters position to a position

function movement:move_to_position(part, cframe, speed, car, target_vehicle, tried_vehicles)
    local vector_position = cframe.Position;
    
    if not car and workspace:Raycast(part.Position, dependencies.variables.up_vector, dependencies.variables.raycast_params) then -- if there is an object above us, use pathfind function to get to a position with no collision above
        movement:pathfind();
        task.wait(0.5);
    end;
    
    local y_level = 500;
    local higher_position = Vector3.new(vector_position.X, y_level, vector_position.Z); -- 500 studs above target position

    repeat -- use velocity to move towards the target position
        local velocity_unit = (higher_position - part.Position).Unit * speed;
        part.Velocity = Vector3.new(velocity_unit.X, 0, velocity_unit.Z);

        task.wait();

        part.CFrame = CFrame.new(part.CFrame.X, y_level, part.CFrame.Z);

        if target_vehicle and target_vehicle.Seat.Player.Value then -- if someone occupies the vehicle while we're moving to it, we need to move to the next vehicle
            table.insert(tried_vehicles, target_vehicle);

            local nearest_vehicle = utilities:get_nearest_vehicle(tried_vehicles);
            local vehicle_object = nearest_vehicle and nearest_vehicle.ValidRoot;

            if vehicle_object then 
                movement:move_to_position(player.Character.HumanoidRootPart, vehicle_object.Seat.CFrame, 135, false, vehicle_object);
            end;

            return;
        end;
    until (part.Position - higher_position).Magnitude < 10;

    part.CFrame = CFrame.new(part.Position.X, vector_position.Y, part.Position.Z);
    part.Velocity = Vector3.zero;
end;

--// raycast filter

dependencies.variables.raycast_params.FilterType = Enum.RaycastFilterType.Blacklist;
dependencies.variables.raycast_params.FilterDescendantsInstances = { player.Character, workspace.Vehicles, workspace:FindFirstChild("Rain") };

workspace.ChildAdded:Connect(function(child) -- if it starts raining, add rain to collision ignore list
    if child.Name == "Rain" then 
        table.insert(dependencies.variables.raycast_params.FilterDescendantsInstances, child);
    end;
end);

player.CharacterAdded:Connect(function(character) -- when the player respawns, add character back to collision ignore list
    table.insert(dependencies.variables.raycast_params.FilterDescendantsInstances, character);
end);

--// get free vehicles, owned helicopters, motorcycles and unsupported/new vehicles

for index, vehicle_data in next, dependencies.modules.vehicle_data do
    if vehicle_data.Type == "Heli" then -- helicopters
        dependencies.helicopters[vehicle_data.Make] = true;
    elseif vehicle_data.Type == "Motorcycle" then --- motorcycles
        dependencies.motorcycles[vehicle_data.Make] = true;
    end;

    if vehicle_data.Type ~= "Chassis" and vehicle_data.Type ~= "Motorcycle" and vehicle_data.Type ~= "Heli" and vehicle_data.Type ~= "DuneBuggy" and vehicle_data.Make ~= "Volt" then -- weird vehicles that are not supported
        dependencies.unsupported_vehicles[vehicle_data.Make] = true;
    end;
    
    if not vehicle_data.Price then -- free vehicles
        dependencies.free_vehicles[vehicle_data.Make] = true;
    end;
end;

--// get all positions near a door which have no collision above them

for index, value in next, workspace:GetDescendants() do
    if value.Name:sub(-4, -1) == "Door" then 
        local touch_part = value:FindFirstChild("Touch");

        if touch_part and touch_part:IsA("BasePart") then
            for distance = 5, 100, 5 do 
                local forward_position, backward_position = touch_part.Position + touch_part.CFrame.LookVector * (distance + 3), touch_part.Position + touch_part.CFrame.LookVector * -(distance + 3); -- distance + 3 studs forward and backward from the door
                
                if not workspace:Raycast(forward_position, dependencies.variables.up_vector, dependencies.variables.raycast_params) then -- if there is nothing above the forward position from the door
                    table.insert(dependencies.door_positions, { instance = value, position = forward_position });

                    break;
                elseif not workspace:Raycast(backward_position, dependencies.variables.up_vector, dependencies.variables.raycast_params) then -- if there is nothing above the backward position from the door
                    table.insert(dependencies.door_positions, { instance = value, position = backward_position });

                    break;
                end;
            end;
        end;
    end;
end;

--// no fall damage or ragdoll 

local old_is_point_in_tag = dependencies.modules.player_utils.isPointInTag;
dependencies.modules.player_utils.isPointInTag = function(point, tag)
    if dependencies.variables.teleporting and tag == "NoRagdoll" or tag == "NoFallDamage" then
        return true;
    end;
    
    return old_is_point_in_tag(point, tag);
end;

--// anti skydive

local oldIsFlying = dependencies.modules.paraglide.IsFlying
dependencies.modules.paraglide.IsFlying = function(...)
    if dependencies.variables.teleporting and getinfo(2, "s").source:find("Falling") then
        return true
    end
    
    return oldIsFlying(...)
end

--// stop velocity

task.spawn(function()
    while task.wait() do
        if dependencies.variables.stopVelocity and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.Velocity = Vector3.zero;
        end;
    end;
end);

--// main teleport function (not returning a new function directly because of recursion)

local function teleport(cframe, tried) -- unoptimized
    local relative_position = (cframe.Position - player.Character.HumanoidRootPart.Position);
    local target_distance = relative_position.Magnitude;

    if target_distance <= 20 and not workspace:Raycast(player.Character.HumanoidRootPart.Position, relative_position.Unit * target_distance, dependencies.variables.raycast_params) then 
        player.Character.HumanoidRootPart.CFrame = cframe; 
        
        return;
    end; 

    local tried = tried or { };
    local nearest_vehicle = utilities:get_nearest_vehicle(tried);
    local vehicle_object = nearest_vehicle and nearest_vehicle.ValidRoot;

    dependencies.variables.teleporting = true;

    if vehicle_object then 
        local vehicle_distance = (vehicle_object.Seat.Position - player.Character.HumanoidRootPart.Position).Magnitude;

        if target_distance < vehicle_distance then -- if target position is closer than the nearest vehicle
            movement:move_to_position(player.Character.HumanoidRootPart, cframe, dependencies.variables.player_speed);
        else 
            if vehicle_object.Seat.PlayerName.Value ~= player.Name then
                movement:move_to_position(player.Character.HumanoidRootPart, vehicle_object.Seat.CFrame, dependencies.variables.player_speed, false, vehicle_object, tried);

                dependencies.variables.stopVelocity = true;

                local enter_attempts = 1;

                repeat -- attempt to enter car
                    nearest_vehicle:Callback(true)
                    
                    enter_attempts = enter_attempts + 1;

                    task.wait(0.1);
                until enter_attempts == 10 or vehicle_object.Seat.PlayerName.Value == player.Name;

                dependencies.variables.stopVelocity = false;

                if vehicle_object.Seat.PlayerName.Value ~= player.Name then -- if it failed to enter, try a new car
                    table.insert(tried, vehicle_object);

                    return teleport(cframe, tried or { vehicle_object });
                end;
            end;

            movement:move_to_position(vehicle_object.Engine, cframe, dependencies.variables.vehicle_speed, true);

            repeat -- attempt to exit car
                task.wait(0.15);
                dependencies.modules.character_util.OnJump();
            until vehicle_object.Seat.PlayerName.Value ~= player.Name;
        end;
    else
        movement:move_to_position(player.Character.HumanoidRootPart, cframe, dependencies.variables.player_speed);
    end;

    task.wait(0.5);
    dependencies.variables.teleporting = false;
end;

return teleport;
