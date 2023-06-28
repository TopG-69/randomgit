	local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/TopG-69/randomgit/main/AgonyLib"))()
	
	UI.CreateBase() --Create UI
	
	--(Category, Text, Image, RGBInput, Callback)
	--[[
		Category = Tab category (same category = under same frame)
		Text = Tabs name
		Image = Image tab uses
		RGBInput = {Red, Green, Blue}
		Callback = Function what is executed if button is pressed
	--]]
	CreateTab("General", "Local", 12899885269, {60, 60, 255}, function() 
		Tabs("Local")
	end)
	
	--(Category, Colum, Tab)
	--[[
		Category = TabName_Section / Local_Section
		Colum = Left / Right
		Tab = Tabs(Devision) / Tabs("Local")
	--]]
	CreateModule("Local_SelfModding", 1, "Local")

	--(Module, Text, Callback)
	--[[
		Module = Module it attaches to "Local_SelfModding"
		Text = Text on box
		Callback = function what is executed if the focus is lost (enter pressed)
	--]]
	CreateTextBox("Local_SelfModding", "TextBox", function(Value)
		LocalPlayer.Character:FindFirstChildOfClass('Humanoid').WalkSpeed = Value
	end)

	--(Module, Text, Callback)
	--[[
		Module = Module it attaches to "Local_SelfModding"
		Text = Text on button
		Callback = Function what is executed if button is pressed
	--]]
	CreateButton("Local_SelfModding", "Button", function(Value)
		LocalPlayer.Character:FindFirstChildOfClass('Humanoid').WalkSpeed = Value
	end)

	--(Module, Text, Callback)
	--[[
		Module = Module it attaches to "Local_SelfModding"
		Text = Text on label
		Callback = Function what is executed if button is pressed
	--]]
	CreateLabel("Local_SelfModding", "Label")

	--(Module, Text, Array, Callback)
	--[[
		Module = Module it attaches to "Local_SelfModding"
		Text = Text on button
		Array = Items listed on dropdown
		Callback = Function what is executed if button is pressed
	--]]
	DropDownSelection = ""
	CreateDropDown("Local_SelfModding", "DropDown", {"Stuff", 23, 66}, function(Return)
		DropDownSelection = Return
	end)

	--(Module, Min, Max, Start, Text, Callback)
	--[[
		Module = Module it attaches to "Local_SelfModding"
		Min = Minimum Value
		Max = Maximum Value
		Start = Starting Value --Size = Value*16 / don't make too big
		Text = Text on label
		Callback = Function what is executed if slider is being dragged
	--]]
	SliderValue = 0
	CreateSlider("Local_SelfModding", 0, 100, 0, "Slider", function(Value)
		SliderValue = Value
	end)

	--(Module, Text, Callback, Boolean)
	--[[
		Module = Module it attaches to "Local_SelfModding"
		Text = Text on button
		Callback = Function what is executed if button is pressed
		Boolean = If toggle is shown as True or False
	--]]
	Toggle = false
	CreateToggle("Local_SelfModding", "Toggle", function(Boolean)
		Toggle = Boolean
	end, false)
	
	--(Module, Text, RGBInput, Callback)
	--[[
		Module = Module it attaches to "Local_SelfModding"
		Text = Text on button
		RGBInput = Starting color
		Callback = Function what is executed if button is pressed
	--]]
	RGBArray = {0, 0, 0}
	CreateColorPicker("Local_SelfModding", "ColorPicker", {255, 255, 255}, function(Red, Green, Blue)
		RGBArray = {Red, Green, Blue}
	end)
	
	-- Read
	--[[
		--! Invalid Example:
		CreateModule("Local_T1", 1, "Local")
		CreateModule("Local_T2", 1, "Local")

		CreateButton("Local_T1", "Button", function(Value)
			LocalPlayer.Character:FindFirstChildOfClass('Humanoid').WalkSpeed = Value
		end)
		CreateButton("Local_T2", "Button", function(Value)
			LocalPlayer.Character:FindFirstChildOfClass('Humanoid').WalkSpeed = Value
		end)
		--! This will cause the module yOffset to be calculated wrong
		
		
	--]]
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
