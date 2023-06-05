--[[
	Hey if you are seeing this then it means you are at the source
	of agony well i'm here to tell you Agony will make a returns
	at somepoint but i wish for you to make a promise to never
	share this with anyone. Goodbye!
--]]

--// --// --// --// --// --// --// --// --// --// --//
    -- Setup
    
    
    -- End
--// --// --// --// --// --// --// --// --// --// --//
    
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScriptLoader"
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 450, 0, 150)
Frame.Position = UDim2.new(0.5, -100, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderSizePixel = 5
Frame.Parent = ScreenGui

local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(1, 0, 0, 25)
TextLabel.Position = UDim2.new(0, 0, 0, 0)
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BorderSizePixel = 1
TextLabel.Text = "Agony Script Loader (v2)"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 14
TextLabel.TextXAlignment = "Center"
TextLabel.Parent = Frame

local TextBox1 = Instance.new("TextBox")
TextBox1.Size = UDim2.new(1, -45, 0, 25)
TextBox1.Position = UDim2.new(0.05, 0, 0.01, 25)
TextBox1.BackgroundColor3 = Color3.fromRGB(215, 215, 215)
TextBox1.BorderSizePixel = 1
TextBox1.Text = "Enter Discord Key"
TextBox1.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox1.TextSize = 14
TextBox1.TextXAlignment = "Left"
TextBox1.Parent = Frame

local TextBox2 = Instance.new("TextBox")
TextBox2.Size = UDim2.new(1, -45, 0, 25)
TextBox2.Position = UDim2.new(0.05, 0, 0.05, 50)
TextBox2.BackgroundColor3 = Color3.fromRGB(215, 215, 215)
TextBox2.BorderSizePixel = 1
TextBox2.Text = "Enter Premium Key"
TextBox2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox2.TextSize = 14
TextBox2.TextXAlignment = "Left"
TextBox2.Parent = Frame

--[[local ButtonFrame = Instance.new("Frame")
ButtonFrame.Size = UDim2.new(1, 0, 0, 50)
ButtonFrame.Position = UDim2.new(0, 0, 1, -50)
ButtonFrame.BackgroundTransparency = 1
ButtonFrame.Parent = Frame

local LoadButton = Instance.new("TextButton")
LoadButton.Size = UDim2.new(0.51, -5, 1, 0)
LoadButton.Position = UDim2.new(0, 0, 0, 0)
LoadButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadButton.BorderSizePixel = 5
LoadButton.Text = "Load Script"
LoadButton.TextColor3 = Color3.fromRGB(0, 126, 0)
LoadButton.TextSize = 14
LoadButton.TextXAlignment = "Center"
LoadButton.Parent = ButtonFrame

local DestroyButton = Instance.new("TextButton")
DestroyButton.Size = UDim2.new(0.5, -5, 1, 0)
DestroyButton.Position = UDim2.new(0.5, 5, 0, 0)
DestroyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DestroyButton.BorderSizePixel = 5
DestroyButton.Text = "Destroy UI"
DestroyButton.TextColor3 = Color3.fromRGB(96, 0, 0)
DestroyButton.TextSize = 14
DestroyButton.TextXAlignment = "Center"
DestroyButton.Parent = ButtonFrame--]]

local LoadButton = Instance.new("TextButton")
Frame.Size = UDim2.new(0, 450, 0, 150)
LoadButton.Size = UDim2.new(1, 0, 0, 25)
LoadButton.Position = UDim2.new(0, 0, 0.05, 95)--75
LoadButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadButton.BorderSizePixel = 5
LoadButton.Text = "Load Script"
LoadButton.TextColor3 = Color3.fromRGB(0, 126, 0)
LoadButton.TextSize = 14
LoadButton.TextXAlignment = "Center"
LoadButton.Parent = Frame

local DestroyButton = Instance.new("TextButton")
DestroyButton.Size = UDim2.new(1, 0, 0, 25)
DestroyButton.Position = UDim2.new(0, 0, 0.05, 120)--100
DestroyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DestroyButton.BorderSizePixel = 0
DestroyButton.Text = "Destroy UI"
DestroyButton.TextColor3 = Color3.fromRGB(96, 0, 0)--76
DestroyButton.TextSize = 14
DestroyButton.TextXAlignment = "Center"
DestroyButton.Parent = Frame

local FrameO = Instance.new("Frame")
FrameO.Size = UDim2.new(0, 250, 0, 97)
FrameO.Position = UDim2.new(0, 1100, 0, 321)
FrameO.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FrameO.BorderSizePixel = 5
FrameO.Parent = ScreenGui

local TextLabelO = Instance.new("TextLabel")
TextLabelO.Size = UDim2.new(1, 0, 0, 25)
TextLabelO.Position = UDim2.new(0, 0, 0, 0)
TextLabelO.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabelO.BorderSizePixel = 1
TextLabelO.Text = "Settings"
TextLabelO.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabelO.TextSize = 14
TextLabelO.TextXAlignment = "Center"
TextLabelO.Parent = FrameO

local TextBox1O = Instance.new("TextBox")
TextBox1O.Size = UDim2.new(1, -25, 0, 25)
TextBox1O.Position = UDim2.new(0.05, 0, 0.01, 32)
TextBox1O.BackgroundColor3 = Color3.fromRGB(215, 215, 215)
TextBox1O.BorderSizePixel = 1
TextBox1O.Text = "Screen X"
TextBox1O.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox1O.TextSize = 14
TextBox1O.TextXAlignment = "Center"
TextBox1O.Parent = FrameO

local TextBox2O = Instance.new("TextBox")
TextBox2O.Size = UDim2.new(1, -25, 0, 25)
TextBox2O.Position = UDim2.new(0.05, 0, 0.05, 57)
TextBox2O.BackgroundColor3 = Color3.fromRGB(215, 215, 215)
TextBox2O.BorderSizePixel = 1
TextBox2O.Text = "Screen Y"
TextBox2O.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox2O.TextSize = 14
TextBox2O.TextXAlignment = "Center"
TextBox2O.Parent = FrameO

local FrameOQ = Instance.new("Frame")
FrameOQ.Size = UDim2.new(0, 250, 0, 30)
FrameOQ.Position = UDim2.new(0, 1100, 0, 440)
FrameOQ.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FrameOQ.BorderSizePixel = 5
FrameOQ.Parent = ScreenGui

local TextButton2O = Instance.new("TextButton")
TextButton2O.Size = UDim2.new(1, -230, 0, 19)
TextButton2O.Position = UDim2.new(0.05, 0, 0.05, 4)
TextButton2O.BackgroundColor3 = Color3.fromRGB(215, 215, 215)
TextButton2O.BorderSizePixel = 1.5
TextButton2O.Text = ""
TextButton2O.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton2O.TextSize = 9
TextButton2O.TextXAlignment = "Center"
TextButton2O.Parent = FrameOQ

local TextLabelOQ = Instance.new("TextLabel")
TextLabelOQ.Size = UDim2.new(1, -175, 0, 10)
TextLabelOQ.Position = UDim2.new(0, 40, 0, 12)
TextLabelOQ.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabelOQ.BorderSizePixel = 0
TextLabelOQ.Text = "Universal"
TextLabelOQ.TextColor3 = Color3.fromRGB(140,140,140)--(161,161,161)
TextLabelOQ.TextSize = 14
TextLabelOQ.TextXAlignment = "Center"
TextLabelOQ.Parent = FrameOQ

local TextButton2OZ = Instance.new("TextButton")
TextButton2OZ.Size = UDim2.new(1, -230, 0, 19)
TextButton2OZ.Position = UDim2.new(0.05, 120, 0.05, 4)
TextButton2OZ.BackgroundColor3 = Color3.fromRGB(215, 215, 215)
TextButton2OZ.BorderSizePixel = 1.5
TextButton2OZ.Text = ""
TextButton2OZ.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton2OZ.TextSize = 9
TextButton2OZ.TextXAlignment = "Center"
TextButton2OZ.Parent = FrameOQ

local TextLabelOQZ = Instance.new("TextLabel")
TextLabelOQZ.Size = UDim2.new(1, -175, 0, 10)
TextLabelOQZ.Position = UDim2.new(0, 163, 0, 12)
TextLabelOQZ.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabelOQZ.BorderSizePixel = 0
TextLabelOQZ.Text = "TestMode"
TextLabelOQZ.TextColor3 = Color3.fromRGB(140,140,140)--(161,161,161)
TextLabelOQZ.TextSize = 14
TextLabelOQZ.TextXAlignment = "Center"
TextLabelOQZ.Parent = FrameOQ

TextButton2OZToggle = false
TextButton2OToggle = false

TextButton2OZ.MouseButton1Click:Connect(function()
	if TextButton2OZ.Text == "" then
		TextButton2OZ.Text = "x"
		TextButton2OZToggle = true
	elseif TextButton2OZ.Text == "x" then
		TextButton2OZ.Text = ""
		TextButton2OZToggle = false
	end
end)

TextButton2O.MouseButton1Click:Connect(function()
	if TextButton2O.Text == "" then
		TextButton2O.Text = "x"
		TextButton2OToggle = true
	elseif TextButton2O.Text == "x" then
		TextButton2O.Text = ""
		TextButton2OToggle = false
	end
end)

local function beginDecent()
	ScreenGui.Transparency = 50
end

local function MakeGuiTransparency(Val, Time)
Start = 0
if Val < 0 then
    Start = 1
end
for i = 0, 20 do
TextLabelO.Transparency = Start+(i/20*Val)
TextBox1O.Transparency = Start+(i/20*Val)
TextBox2O.Transparency = Start+(i/20*Val)
TextButton2O.Transparency = Start+(i/20*Val)
TextButton2OZ.Transparency = Start+(i/20*Val)
TextLabelOQZ.Transparency = Start+(i/20*Val)
TextLabelOQ.Transparency = Start+(i/20*Val)
FrameOQ.Transparency = Start+(i/20*Val)
FrameO.Transparency = Start+(i/20*Val)
Frame.Transparency = Start+(i/20*Val)
TextLabel.Transparency = Start+(i/20*Val)
TextBox1.Transparency = Start+(i/20*Val)
TextBox2.Transparency = Start+(i/20*Val)
LoadButton.Transparency = Start+(i/20*Val)
DestroyButton.Transparency = Start+(i/20*Val)
wait(Time)
end
end

DestroyButton.MouseButton1Click:Connect(function()
	MakeGuiTransparency(1, 0.05)
	wait(0.35)
	ScreenGui:Destroy()
end)

LoadButton.MouseButton1Click:Connect(function()
	if TextBox1.Text == "Ey580OgEJIYnagHJUIWAjfasnfg" then
		TextBox1.TextColor3 = Color3.fromRGB(0, 255, 0)
		Discord_Key = "Ey580OgEJIYnagHJUIWAjfasnfg"
		MakeGuiTransparency(1, 0.05)
		wait(0.35)
		ScreenGui:Destroy()
		wait()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Setup.lua", true))()
	elseif TextBox1.Text ~= "Ey580OgEJIYnagHJUIWAjfasnfg" then
		TextBox1.TextColor3 = Color3.fromRGB(255, 0, 0)
		wait(1)
		TextBox1.TextColor3 = Color3.fromRGB(0, 0, 0)
	end
end)
LoadButton.MouseButton1Click:Connect(function()
	if TextBox2.Text == "EJOHFDNSIBTREKPQWNDIASDHUBEJNOWBNTEORBNJSACNJOSVNIDASNOVUESNAVUBORTB" then
		TextBox2.TextColor3 = Color3.fromRGB(0, 255, 0)
		PremiumKey = "EJOHFDNSIBTREKPQWNDIASDHUBEJNOWBNTEORBNJSACNJOSVNIDASNOVUESNAVUBORTB"
	elseif TextBox2.Text ~= "EJOHFDNSIBTREKPQWNDIASDHUBEJNOWBNTEORBNJSACNJOSVNIDASNOVUESNAVUBORTB" then
		TextBox2.TextColor3 = Color3.fromRGB(255, 0, 0)
		wait(1)
		TextBox2.TextColor3 = Color3.fromRGB(0, 0, 0)
	end
end)
LoadButton.MouseButton1Click:Connect(function()
	if TextBox1O.Text == "Screen X" or TextBox2O.Text == "Screen Y" then
		ScreenSizeX = 600
		ScreenSizeY = 400
		TextBox1O.Text = "600"
		TextBox2O.Text = "400"
		TextBox1O.TextColor3 = Color3.fromRGB(255, 135, 0)
		TextBox2O.TextColor3 = Color3.fromRGB(255, 135, 0)
		wait(1)
		TextBox1O.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextBox2O.TextColor3 = Color3.fromRGB(0, 0, 0)
	else
		ScreenSizeX = TextBox1O.Text
		ScreenSizeY = TextBox2O.Text
	end
end)
