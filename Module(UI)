-- Decompiler will be improved soon!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2024-12-13 09:03:17
-- Luau version 6, Types version 3
-- Time taken: 0.014398 seconds

local UserInputService_upvr = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local tbl_upvw = {
	MakeGroup = function() -- Line 13, Named "MakeGroup"
		return {
			Running = nil;
		}
	end;
	MakeSpec = function() -- Line 18, Named "MakeSpec"
		return {
			Duration = nil;
			Start = nil;
			End = nil;
			Cancel = nil;
			Update = nil;
		}
	end;
	Cancel = function(arg1) -- Line 27, Named "Cancel"
		local Running_2 = arg1.Running
		if Running_2 then
			Running_2:Cancel()
			arg1.Running = nil
		end
	end;
}
function tbl_upvw.Push(arg1, arg2) -- Line 34
	--[[ Upvalues[1]:
		[1]: tbl_upvw (read and write)
	]]
	tbl_upvw.Cancel(arg1)
	assert(arg2.Duration)
	assert(arg2.Start)
	assert(arg2.End)
	assert(arg2.Update)
	if not arg2.Cancel then
		arg2.Cancel = arg2.End
	end
	arg1.Running = arg2
end
local function Update(arg1, arg2) -- Line 45
	local Running = arg1.Running
	if not Running then
	else
		local os_clock_result1 = os.clock()
		if not Running.Started then
			Running.Started = os_clock_result1
			Running:Start()
		end
		local var9 = os_clock_result1 - Running.Started
		if Running.Elapsed then
			var9 += Running.Elapsed
		end
		local var10 = var9 / Running.Duration
		if 1 <= var10 then
			var10 = 1
		end
		Running:Update(var10, arg2)
		if 1 <= var10 then
			Running:End()
			arg1.Running = nil
		end
	end
end
tbl_upvw.Update = Update
local tbl_upvw_2 = {
	onVisibilityChanged = require(ReplicatedStorage.Std.Signal).new();
}
local any_MakeGroup_result1_upvr = tbl_upvw.MakeGroup()
local tbl_upvr = {}
tbl_upvw_2.Specs = tbl_upvr
function tbl_upvw_2.Add(arg1, arg2) -- Line 81
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: tbl_upvw_2 (read and write)
	]]
	assert(arg2, "No key found, second param to Add must be nil")
	arg1.Tag = arg2
	if not arg1.Enabled then
		arg1.Enabled = true
	end
	if not arg1.Priority then
		arg1.Priority = 1
	end
	table.insert(tbl_upvr, arg1)
	return function() -- Line 91
		--[[ Upvalues[2]:
			[1]: tbl_upvw_2 (copied, read and write)
			[2]: arg2 (readonly)
		]]
		return tbl_upvw_2.Remove(arg2)
	end
end
function tbl_upvw_2.Remove(arg1) -- Line 95
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	for i = #tbl_upvr, 1, -1 do
		if tbl_upvr[i].Tag == arg1 then
			table.remove(tbl_upvr, i)
			return true
		end
	end
	return false
end
local var16_upvw = 1
local function _() -- Line 108, Named "GetCirclePct"
	--[[ Upvalues[1]:
		[1]: var16_upvw (read and write)
	]]
	return var16_upvw
end
local function SetCirclePct_upvr(arg1) -- Line 111, Named "SetCirclePct"
	--[[ Upvalues[2]:
		[1]: var16_upvw (read and write)
		[2]: tbl_upvw_2 (read and write)
	]]
	var16_upvw = arg1
	local Frame_16 = tbl_upvw_2.Frame
	local Image = Frame_16.OuterFrame.Left.Image
	local Image_2 = Frame_16.OuterFrame.Right.Image
	local clamped = math.clamp(arg1 * 360, 0, 360)
	Image.UIGradient.Rotation = math.clamp(clamped, 180, 360)
	local clamped_2 = math.clamp(clamped, 0, 180)
	Image_2.UIGradient.Rotation = clamped_2
	if arg1 >= 0.999 then
		clamped_2 = false
	else
		clamped_2 = true
	end
	Image.Visible = clamped_2
	Image_2.Visible = clamped_2
	Frame_16.OuterFrame.OuterFull.Visible = not clamped_2
end
local function _(arg1) -- Line 126, Named "SetCircleColor"
	--[[ Upvalues[1]:
		[1]: tbl_upvw_2 (read and write)
	]]
	local Frame_2 = tbl_upvw_2.Frame
	Frame_2.OuterFrame.Left.Image.ImageColor3 = arg1
	Frame_2.OuterFrame.Right.Image.ImageColor3 = arg1
	Frame_2.OuterFrame.OuterFull.ImageColor3 = arg1
end
local function _(arg1) -- Line 134, Named "SetCircleRadius"
	--[[ Upvalues[1]:
		[1]: tbl_upvw_2 (read and write)
	]]
	local Frame_3 = tbl_upvw_2.Frame
	Frame_3.OuterFrame.Size = UDim2.new(1, 2 * arg1, 1, 2 * arg1)
	Frame_3.OuterFrame.Position = UDim2.new(0, -arg1, 0, -arg1)
end
local function afSpin_Start_upvw() -- Line 142, Named "afSpin_Start"
	--[[ Upvalues[2]:
		[1]: SetCirclePct_upvr (readonly)
		[2]: tbl_upvw_2 (read and write)
	]]
	SetCirclePct_upvr(0)
	local Frame_13 = tbl_upvw_2.Frame
	Frame_13.OuterFrame.Size = UDim2.new(1, 8, 1, 8)
	Frame_13.OuterFrame.Position = UDim2.new(0, -4, 0, -4)
	local Color3_fromRGB_result1_2 = Color3.fromRGB(214, 214, 214)
	local Frame_6 = tbl_upvw_2.Frame
	Frame_6.OuterFrame.Left.Image.ImageColor3 = Color3_fromRGB_result1_2
	Frame_6.OuterFrame.Right.Image.ImageColor3 = Color3_fromRGB_result1_2
	Frame_6.OuterFrame.OuterFull.ImageColor3 = Color3_fromRGB_result1_2
end
local function afSpin_End_upvw() -- Line 147, Named "afSpin_End"
	--[[ Upvalues[2]:
		[1]: SetCirclePct_upvr (readonly)
		[2]: tbl_upvw_2 (read and write)
	]]
	SetCirclePct_upvr(1)
	local Frame_12 = tbl_upvw_2.Frame
	Frame_12.OuterFrame.Size = UDim2.new(1, 16, 1, 16)
	Frame_12.OuterFrame.Position = UDim2.new(0, -8, 0, -8)
	local Color3_fromRGB_result1_3 = Color3.fromRGB(214, 214, 214)
	local Frame_14 = tbl_upvw_2.Frame
	Frame_14.OuterFrame.Left.Image.ImageColor3 = Color3_fromRGB_result1_3
	Frame_14.OuterFrame.Right.Image.ImageColor3 = Color3_fromRGB_result1_3
	Frame_14.OuterFrame.OuterFull.ImageColor3 = Color3_fromRGB_result1_3
end
local sin_upvr = math.sin
local function afSpin_Update_upvw(arg1, arg2, arg3) -- Line 152, Named "afSpin_Update"
	--[[ Upvalues[3]:
		[1]: sin_upvr (readonly)
		[2]: SetCirclePct_upvr (readonly)
		[3]: tbl_upvw_2 (read and write)
	]]
	local var31 = sin_upvr(arg2) / 0.8414709848078965
	SetCirclePct_upvr(var31)
	local var32 = 214 - 64 * (1 - var31)
	local Color3_fromRGB_result1 = Color3.fromRGB(var32, var32, var32)
	local Frame_9 = tbl_upvw_2.Frame
	Frame_9.OuterFrame.Left.Image.ImageColor3 = Color3_fromRGB_result1
	Frame_9.OuterFrame.Right.Image.ImageColor3 = Color3_fromRGB_result1
	Frame_9.OuterFrame.OuterFull.ImageColor3 = Color3_fromRGB_result1
	local var35 = 4 * var31 + 4
	local Frame_7 = tbl_upvw_2.Frame
	Frame_7.OuterFrame.Size = UDim2.new(1, 2 * var35, 1, 2 * var35)
	Frame_7.OuterFrame.Position = UDim2.new(0, -var35, 0, -var35)
end
sin_upvr = 1
local var37_upvw = sin_upvr
local function _(arg1, arg2, arg3, arg4, arg5) -- Line 166, Named "Ease_outBack"
	if not arg5 then
		local const_number = 1.70158
	end
	local var39 = arg1 / arg4 - 1
	return arg3 * (var39 * var39 * ((const_number + 1) * var39 + const_number) + 1) + arg2
end
local function afPulse_Start_upvw() -- Line 173, Named "afPulse_Start"
	--[[ Upvalues[1]:
		[1]: tbl_upvw_2 (read and write)
	]]
	local Color3_fromRGB_result1_5 = Color3.fromRGB(214, 214, 214)
	local Frame_8 = tbl_upvw_2.Frame
	Frame_8.OuterFrame.Left.Image.ImageColor3 = Color3_fromRGB_result1_5
	Frame_8.OuterFrame.Right.Image.ImageColor3 = Color3_fromRGB_result1_5
	Frame_8.OuterFrame.OuterFull.ImageColor3 = Color3_fromRGB_result1_5
	local Frame_11 = tbl_upvw_2.Frame
	Frame_11.OuterFrame.Size = UDim2.new(1, 0, 1, 0)
	Frame_11.OuterFrame.Position = UDim2.new(0, -0, 0, -0)
end
local function afPulse_End_upvw() -- Line 178, Named "afPulse_End"
	--[[ Upvalues[3]:
		[1]: SetCirclePct_upvr (readonly)
		[2]: var37_upvw (read and write)
		[3]: tbl_upvw_2 (read and write)
	]]
	SetCirclePct_upvr(1)
	var37_upvw = 1
	local Color3_fromRGB_result1_4 = Color3.fromRGB(214, 214, 214)
	local Frame_5 = tbl_upvw_2.Frame
	Frame_5.OuterFrame.Left.Image.ImageColor3 = Color3_fromRGB_result1_4
	Frame_5.OuterFrame.Right.Image.ImageColor3 = Color3_fromRGB_result1_4
	Frame_5.OuterFrame.OuterFull.ImageColor3 = Color3_fromRGB_result1_4
	local Frame_15 = tbl_upvw_2.Frame
	Frame_15.OuterFrame.Size = UDim2.new(1, 16, 1, 16)
	Frame_15.OuterFrame.Position = UDim2.new(0, -8, 0, -8)
end
local function afPulse_Update_upvw(arg1, arg2, arg3) -- Line 185, Named "afPulse_Update"
	--[[ Upvalues[3]:
		[1]: SetCirclePct_upvr (readonly)
		[2]: var37_upvw (read and write)
		[3]: tbl_upvw_2 (read and write)
	]]
	SetCirclePct_upvr(var37_upvw * (1 - arg2) + arg2)
	local var46 = 6
	if not var46 then
		var46 = 1.70158
	end
	local var47 = arg2 / 1 - 1
	local var48 = 8 * (1 * (var47 * var47 * ((var46 + 1) * var47 + var46) + 1) + 0)
	local Frame = tbl_upvw_2.Frame
	Frame.OuterFrame.Size = UDim2.new(1, 2 * var48, 1, 2 * var48)
	Frame.OuterFrame.Position = UDim2.new(0, -var48, 0, -var48)
	if arg1.Red then
		local var50 = 40 - 40 * arg2
		local var51 = 1 - arg2
		local Color3_fromRGB_result1_6 = Color3.fromRGB(214 * var51 + 214 * arg2 + var50, 69 * var51 + 214 * arg2 + var50, 69 * var51 + 214 * arg2 + var50)
		local Frame_4 = tbl_upvw_2.Frame
		Frame_4.OuterFrame.Left.Image.ImageColor3 = Color3_fromRGB_result1_6
		Frame_4.OuterFrame.Right.Image.ImageColor3 = Color3_fromRGB_result1_6
		Frame_4.OuterFrame.OuterFull.ImageColor3 = Color3_fromRGB_result1_6
	end
end
function tbl_upvw_2.NotAllowed() -- Line 198
	--[[ Upvalues[5]:
		[1]: tbl_upvw (read and write)
		[2]: afPulse_Start_upvw (read and write)
		[3]: afPulse_End_upvw (read and write)
		[4]: afPulse_Update_upvw (read and write)
		[5]: any_MakeGroup_result1_upvr (readonly)
	]]
	local any_MakeSpec_result1 = tbl_upvw.MakeSpec()
	any_MakeSpec_result1.Duration = 0.3
	any_MakeSpec_result1.Start = afPulse_Start_upvw
	any_MakeSpec_result1.End = afPulse_End_upvw
	any_MakeSpec_result1.Update = afPulse_Update_upvw
	any_MakeSpec_result1.Red = true
	tbl_upvw.Push(any_MakeGroup_result1_upvr, any_MakeSpec_result1)
end
local function Press_upvr() -- Line 208, Named "Press"
	--[[ Upvalues[9]:
		[1]: tbl_upvw_2 (read and write)
		[2]: tbl_upvw (read and write)
		[3]: afSpin_Start_upvw (read and write)
		[4]: afSpin_End_upvw (read and write)
		[5]: afSpin_Update_upvw (read and write)
		[6]: any_MakeGroup_result1_upvr (readonly)
		[7]: afPulse_Start_upvw (read and write)
		[8]: afPulse_End_upvw (read and write)
		[9]: afPulse_Update_upvw (read and write)
	]]
	local Spec_6 = tbl_upvw_2.Spec
	if not Spec_6 then
	else
		Spec_6:Callback(false)
		if Spec_6.Timed then
			Spec_6.Pressed = true
			Spec_6.PressedAt = os.clock()
			local any_MakeSpec_result1_3 = tbl_upvw.MakeSpec()
			any_MakeSpec_result1_3.Duration = Spec_6.Duration
			any_MakeSpec_result1_3.Start = afSpin_Start_upvw
			any_MakeSpec_result1_3.End = afSpin_End_upvw
			any_MakeSpec_result1_3.Update = afSpin_Update_upvw
			if Spec_6.GetAccumulation then
				any_MakeSpec_result1_3.Elapsed = Spec_6.GetAccumulation()
			end
			tbl_upvw.Push(any_MakeGroup_result1_upvr, any_MakeSpec_result1_3)
			Spec_6.Animation = any_MakeSpec_result1_3
			return
		end
		if Spec_6:Callback(true) then
			local any_MakeSpec_result1_7 = tbl_upvw.MakeSpec()
			any_MakeSpec_result1_7.Duration = 0.3
			any_MakeSpec_result1_7.Start = afPulse_Start_upvw
			any_MakeSpec_result1_7.End = afPulse_End_upvw
			any_MakeSpec_result1_7.Update = afPulse_Update_upvw
			tbl_upvw.Push(any_MakeGroup_result1_upvr, any_MakeSpec_result1_7)
			return
		end
		local any_MakeSpec_result1_6 = tbl_upvw.MakeSpec()
		any_MakeSpec_result1_6.Duration = 0.3
		any_MakeSpec_result1_6.Start = afPulse_Start_upvw
		any_MakeSpec_result1_6.End = afPulse_End_upvw
		any_MakeSpec_result1_6.Update = afPulse_Update_upvw
		any_MakeSpec_result1_6.Red = true
		tbl_upvw.Push(any_MakeGroup_result1_upvr, any_MakeSpec_result1_6)
	end
end
local function Release_upvr() -- Line 243, Named "Release"
	--[[ Upvalues[8]:
		[1]: tbl_upvw_2 (read and write)
		[2]: any_MakeGroup_result1_upvr (readonly)
		[3]: var37_upvw (read and write)
		[4]: var16_upvw (read and write)
		[5]: tbl_upvw (read and write)
		[6]: afPulse_Start_upvw (read and write)
		[7]: afPulse_End_upvw (read and write)
		[8]: afPulse_Update_upvw (read and write)
	]]
	local Spec = tbl_upvw_2.Spec
	if Spec then
		Spec.Pressed = false
		Spec.PressedAt = nil
		if any_MakeGroup_result1_upvr.Running ~= nil and any_MakeGroup_result1_upvr.Running == Spec.Animation then
			var37_upvw = var16_upvw
			tbl_upvw.Cancel(any_MakeGroup_result1_upvr)
			local any_MakeSpec_result1_2 = tbl_upvw.MakeSpec()
			any_MakeSpec_result1_2.Duration = 0.3
			any_MakeSpec_result1_2.Start = afPulse_Start_upvw
			any_MakeSpec_result1_2.End = afPulse_End_upvw
			any_MakeSpec_result1_2.Update = afPulse_Update_upvw
			any_MakeSpec_result1_2.Red = true
			tbl_upvw.Push(any_MakeGroup_result1_upvr, any_MakeSpec_result1_2)
		end
		Spec.Animation = nil
		Spec.ScreenPosition = nil
		tbl_upvw_2.Spec = nil
		if Spec.ReleaseCallback then
			Spec:ReleaseCallback(false)
		end
	end
end
tbl_upvw_2.Press = Press_upvr
tbl_upvw_2.Release = Release_upvr
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local zero_vector3_upvr = Vector3.new()
local Raycast_upvr = require(ReplicatedStorage.Std.Raycast)
local CurrentCamera_upvr = workspace.CurrentCamera
local function UpdateUI_upvr() -- Line 272, Named "UpdateUI"
	--[[ Upvalues[6]:
		[1]: tbl_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
		[3]: zero_vector3_upvr (readonly)
		[4]: Raycast_upvr (readonly)
		[5]: tbl_upvw_2 (read and write)
		[6]: CurrentCamera_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 112 start (CF ANALYSIS FAILED)
	local var101
	for i_2 = #tbl_upvr, 1, -1 do
		if tbl_upvr[i_2].Kill then
			table.remove(tbl_upvr, i_2)
		end
	end
	local Character_2 = LocalPlayer_upvr.Character
	if not Character_2 then return end
	if not Character_2.PrimaryPart then return end
	;({})[1] = Character_2
	local _ = #tbl_upvr
	-- KONSTANTERROR: [0] 1. Error Block 112 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [169] 123. Error Block 51 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [169] 123. Error Block 51 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [43] 36. Error Block 94 start (CF ANALYSIS FAILED)
	local function INLINED_6() -- Internal function, doesn't exist in bytecode
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [169.13]
		return nil == nil
	end
	local function INLINED_7() -- Internal function, doesn't exist in bytecode
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [169.12]
		return nil == nil
	end
	if not var101 and (INLINED_6() or not var101) or INLINED_7() or not var101 then
	end
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [169.19]
	-- KONSTANTERROR: [43] 36. Error Block 94 end (CF ANALYSIS FAILED)
end
local function ProcessSpec_upvr() -- Line 405, Named "ProcessSpec"
	--[[ Upvalues[6]:
		[1]: tbl_upvw_2 (read and write)
		[2]: tbl_upvw (read and write)
		[3]: afPulse_Start_upvw (read and write)
		[4]: afPulse_End_upvw (read and write)
		[5]: afPulse_Update_upvw (read and write)
		[6]: any_MakeGroup_result1_upvr (readonly)
	]]
	local Spec_3 = tbl_upvw_2.Spec
	local var106
	if not Spec_3 then
	else
		if not Spec_3.Pressed then return end
		var106 = Spec_3.PressedAt
		local var107 = os.clock() - var106
		var106 = Spec_3.GetAccumulation
		if var106 then
			var106 = Spec_3.GetAccumulation()
			var107 += var106
		end
		var106 = var107 / Spec_3.Duration
		if 1 <= var106 then
			var106 = 1
		end
		if Spec_3.WhilePressedUpdate then
			Spec_3.WhilePressedUpdate(var106)
		end
		if var106 == 1 then
			Spec_3.Pressed = false
			Spec_3.PressedAt = nil
			if Spec_3.ReleaseCallback then
				Spec_3:ReleaseCallback(true)
			end
			if Spec_3:Callback(true) then
				local any_MakeSpec_result1_4 = tbl_upvw.MakeSpec()
				any_MakeSpec_result1_4.Duration = 0.5
				any_MakeSpec_result1_4.Start = afPulse_Start_upvw
				any_MakeSpec_result1_4.End = afPulse_End_upvw
				any_MakeSpec_result1_4.Update = afPulse_Update_upvw
				tbl_upvw.Push(any_MakeGroup_result1_upvr, any_MakeSpec_result1_4)
				return
			end
			local any_MakeSpec_result1_5 = tbl_upvw.MakeSpec()
			any_MakeSpec_result1_5.Duration = 0.3
			any_MakeSpec_result1_5.Start = afPulse_Start_upvw
			any_MakeSpec_result1_5.End = afPulse_End_upvw
			any_MakeSpec_result1_5.Update = afPulse_Update_upvw
			any_MakeSpec_result1_5.Red = true
			tbl_upvw.Push(any_MakeGroup_result1_upvr, any_MakeSpec_result1_5)
		end
	end
end
local function UpdatePlatform_upvr() -- Line 445, Named "UpdatePlatform"
	--[[ Upvalues[2]:
		[1]: tbl_upvw_2 (read and write)
		[2]: UserInputService_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 38 start (CF ANALYSIS FAILED)
	local var110
	if UserInputService_upvr.TouchEnabled then
		var110 = nil
		-- KONSTANTWARNING: GOTO [34] #26
	end
	-- KONSTANTERROR: [0] 1. Error Block 38 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [14] 12. Error Block 39 start (CF ANALYSIS FAILED)
	if UserInputService_upvr:GetLastInputType() == Enum.UserInputType.Gamepad1 then
		var110 = UserInputService_upvr:GetStringForKeyCode(Enum.KeyCode.ButtonY)
		if var110 == "ButtonTriangle" then
			var110 = "â–³"
		elseif var110 == "ButtonY" then
			var110 = 'Y'
			-- KONSTANTWARNING: GOTO [34] #26
		end
	else
		var110 = 'E'
	end
	if var110 == nil then
		-- KONSTANTWARNING: GOTO [40] #30
	end
	-- KONSTANTERROR: [14] 12. Error Block 39 end (CF ANALYSIS FAILED)
end
local var111_upvw
function tbl_upvw_2.Update(arg1) -- Line 470
	--[[ Upvalues[8]:
		[1]: UpdateUI_upvr (readonly)
		[2]: tbl_upvw_2 (read and write)
		[3]: Release_upvr (readonly)
		[4]: UpdatePlatform_upvr (readonly)
		[5]: tbl_upvw (read and write)
		[6]: any_MakeGroup_result1_upvr (readonly)
		[7]: ProcessSpec_upvr (readonly)
		[8]: var111_upvw (read and write)
	]]
	if not UpdateUI_upvr() then
		tbl_upvw_2.Frame.Visible = false
		if tbl_upvw_2.Spec then
			if tbl_upvw_2.Spec.HideFun then
				tbl_upvw_2.Spec:HideFun()
			end
			Release_upvr()
		end
	end
	UpdatePlatform_upvr()
	local var113 = arg1
	tbl_upvw.Update(any_MakeGroup_result1_upvr, var113)
	ProcessSpec_upvr()
	if tbl_upvw_2.Spec ~= var111_upvw then
		if tbl_upvw_2.Spec == nil then
			var113 = false
		else
			var113 = true
		end
		tbl_upvw_2.onVisibilityChanged:Fire(var113)
	end
	var111_upvw = tbl_upvw_2.Spec
end
local var115_upvw
UserInputService_upvr.InputBegan:connect(function(arg1, arg2) -- Line 515, Named "InputBegan"
	--[[ Upvalues[3]:
		[1]: tbl_upvw_2 (read and write)
		[2]: Press_upvr (readonly)
		[3]: var115_upvw (read and write)
	]]
	if arg2 then
	else
		local UserInputType = arg1.UserInputType
		if UserInputType == Enum.UserInputType.MouseButton1 then
			local Spec_4 = tbl_upvw_2.Spec
			if not Spec_4 then
				UserInputType = nil
			elseif (arg1.Position - Spec_4.ScreenPosition).Magnitude < tbl_upvw_2.Frame.AbsoluteSize.X * 0.5 then
				Press_upvr()
				UserInputType = true
			else
				UserInputType = false
			end
			if UserInputType then
				var115_upvw = Enum.UserInputType.MouseButton1
			end
		end
	end
end)
UserInputService_upvr.InputEnded:connect(function(arg1, arg2) -- Line 526, Named "InputEnded"
	--[[ Upvalues[2]:
		[1]: var115_upvw (read and write)
		[2]: Release_upvr (readonly)
	]]
	if arg2 then
	elseif arg1.UserInputType == Enum.UserInputType.MouseButton1 and var115_upvw == Enum.UserInputType.MouseButton1 then
		Release_upvr()
	end
end)
UserInputService_upvr.TouchStarted:connect(function(arg1) -- Line 498, Named "TouchStarted"
	--[[ Upvalues[2]:
		[1]: tbl_upvw_2 (read and write)
		[2]: Press_upvr (readonly)
	]]
	local Spec_2 = tbl_upvw_2.Spec
	if not Spec_2 then return end
	if (arg1.Position - Spec_2.ScreenPosition).Magnitude < tbl_upvw_2.Frame.AbsoluteSize.X * 0.5 then
		Press_upvr()
		return true
	end
	return false
end)
UserInputService_upvr.TouchEnded:connect(function(arg1) -- Line 511, Named "TouchEnded"
	--[[ Upvalues[1]:
		[1]: Release_upvr (readonly)
	]]
	Release_upvr()
end)
any_MakeGroup_result1_upvr = {}
local var118 = any_MakeGroup_result1_upvr
var118.CircleAction = tbl_upvw_2
var118.Animation = tbl_upvw
return var118
