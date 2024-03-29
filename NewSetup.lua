--[[
          ╭╭━━━━━╮╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮╭━━━━━╮╮
          ┃┃ ━━━ ┃┃\       █████╗  ██████╗  █████╗ ███╗  ██╗██╗   ██╗      /┃┃ ━━━ ┃┃
          ┃┃     ┃┃       ██╔══██╗██╔════╝ ██╔══██╗████╗ ██║╚██╗ ██╔╝       ┃┃     ┃┃
          ┃┃     ┃┃       ███████║██║  ██╗ ██║  ██║██╔██╗██║ ╚████╔╝        ┃┃     ┃┃
          ┃┃     ┃┃       ██╔══██║██║  ╚██╗██║  ██║██║╚████║  ╚██╔╝         ┃┃     ┃┃
          ┃┃     ┃┃       ██║  ██║╚██████╔╝╚█████╔╝██║ ╚███║   ██║          ┃┃     ┃┃
          ┃┃ ━━━ ┃┃/      ╚═╝  ╚═╝ ╚═════╝  ╚════╝ ╚═╝  ╚══╝   ╚═╝         \┃┃ ━━━ ┃┃
          ╰╰━━━━━╯╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯╰━━━━━╯╯
 
╭━━━━━━━━━━━━━━━━╮╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮╭━━━━━━━━━━━━━━━━╮
                      █▀▀▀█ █▀▀█ █──█ █▀▀█ █▀▀ █▀▀ 　 █▀▀█ █▀▀█ █▀▀▄ █▀▀
                     ─▀▀▀▄▄ █──█ █──█ █▄▄▀ █── █▀▀ 　 █─── █──█ █──█ █▀▀
                      █▄▄▄█ ▀▀▀▀ ─▀▀▀ ▀─▀▀ ▀▀▀ ▀▀▀ 　 █▄▄█ ▀▀▀▀ ▀▀▀─ ▀▀▀
╰━━━━━━━━━━━━━━━━╯╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯╰━━━━━━━━━━━━━━━━╯
--]]

--[[
	Hey if you are seeing this then it means you are at the source
	of agony well i'm here to tell you Agony will make a returns
	at somepoint but i wish for you to make a promise to never
	share this with anyone. Goodbye!
--]]

--[[ Req Features --]]
local MainGui = Instance.new("ScreenGui")
MainGui.Name = "ApocGui"
MainGui.Parent = game.CoreGui

NotifyFrame = Instance.new("Frame", MainGui)
NotifyFrame.Name = "NotifyFrame"
NotifyFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotifyFrame.BackgroundTransparency = 1
NotifyFrame.BorderSizePixel = 0
NotifyFrame.Position = UDim2.new(0.4405, 0, 0.2, 0)
NotifyFrame.Size = UDim2.new(0, 1, 0, 20)

NotifyLabel = Instance.new("TextLabel", NotifyFrame)
NotifyLabel.Name = "NotifyLabel"
NotifyLabel.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
NotifyLabel.BackgroundTransparency = 1
NotifyLabel.BorderColor3 = Color3.fromRGB(110, 172, 216)
NotifyLabel.BorderSizePixel = 0
NotifyLabel.Size = UDim2.new(0, 170, 0, NotifyFrame.Size.Y.Offset)
NotifyLabel.Font = Enum.Font.SourceSans
NotifyLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
NotifyLabel.TextSize = 20
NotifyLabel.Visible = false

function Notify(Text, Time, ColorR, ColorG, ColorB)
	NotifyLabel.TextColor3 = Color3.fromRGB(ColorR, ColorG, ColorB)
	local OldCon = syn_context_get()
    for i, v in pairs(NotifyFrame:GetChildren()) do
		if v ~= NotifyLabel then
			v.Position = UDim2.new(0, 0, 0, -NotifyLabel.Size.Y.Offset*(#NotifyFrame:GetChildren()-(i-1)))
		end
    end
    local F = NotifyLabel:Clone()
	F.Visible = true
    F.Parent = NotifyFrame
    F.Position = UDim2.new(0, 0, 0, 0)
    F.Text = Text
    if Time == nil then
        Time = 3
    end
    spawn(function()
        wait(Time)
        F:remove()
        for i, v in pairs(NotifyFrame:GetChildren()) do
			if v ~= NotifyLabel then 
				v.Position = UDim2.new(0, 0, 0, -NotifyLabel.Size.Y.Offset*(#NotifyFrame:GetChildren()-(i)))
			end
        end
    end)
	syn_context_set(OldCon)
end

--[[Notify("[Success]", 1, 60, 160, 60)
Notify("[Update]", 1, 60, 160, 60)
Notify("[Fail]", 1, 95, 60, 60)
Notify("[Error]", 1, 95, 60, 60)
Notify("[Clear]", 1, 70, 70, 255)
Notify("[Save]", 1, 70, 70, 255)
Notify("[Fix]", 1, 130, 130, 60)
Notify("[Missing]", 1, 130, 130, 60)--]]

local OeroPhrame = Instance.new("Frame")
OeroPhrame.Size = UDim2.new(0, 250, 0, 320)
OeroPhrame.Position = UDim2.new(0.4, 0, 0.2, 0)
OeroPhrame.BorderSizePixel = 5
OeroPhrame.Transparency = 1
OeroPhrame.Draggable = true
OeroPhrame.Active = true
OeroPhrame.Selectable = true
OeroPhrame.Parent = MainGui

local ThetaBarPhrame = Instance.new("Frame")
ThetaBarPhrame.Size = UDim2.new(1, 0, 0.08, 0)
ThetaBarPhrame.Position = UDim2.new(0, 0, 0, 0)
ThetaBarPhrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ThetaBarPhrame.BorderSizePixel = 0
ThetaBarPhrame.Transparency = 0.01
ThetaBarPhrame.Active = true
ThetaBarPhrame.Selectable = true
ThetaBarPhrame.Parent = OeroPhrame

local ThetaBarText1 = Instance.new("TextLabel")
ThetaBarText1.Size = UDim2.new(1, 0, 1, 0)
ThetaBarText1.Position = UDim2.new(0.32, 0, 0, 0)
ThetaBarText1.BorderSizePixel = 0
ThetaBarText1.Text = "Agony"
ThetaBarText1.Transparency = 0.1
ThetaBarText1.TextColor3 = Color3.fromRGB(255,255,255)
ThetaBarText1.TextSize = 12
ThetaBarText1.BackgroundTransparency = 1
ThetaBarText1.TextXAlignment = "Left"
ThetaBarText1.Parent = ThetaBarPhrame
--// linked
local ThetaBarText2 = Instance.new("TextLabel")
ThetaBarText2.Size = UDim2.new(1, 0, 1, 0)
ThetaBarText2.Position = UDim2.new(0.505, 0, 0, 0)
ThetaBarText2.BorderSizePixel = 0
ThetaBarText2.Text = "Loader"
ThetaBarText2.TextColor3 = Color3.fromRGB(0,255,255)
ThetaBarText2.Transparency = 0.1
ThetaBarText2.TextSize = 12
ThetaBarText2.BackgroundTransparency = 1
ThetaBarText2.TextXAlignment = "Left"
ThetaBarText2.Parent = ThetaBarPhrame

local ThetaLoaderPhrame = Instance.new("Frame")
ThetaLoaderPhrame.Size = UDim2.new(1, 0, 1, 0)
ThetaLoaderPhrame.Position = UDim2.new(0, 0, 0.08, 0)
ThetaLoaderPhrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
ThetaLoaderPhrame.BorderSizePixel = 0
ThetaLoaderPhrame.Transparency = 0.3
ThetaLoaderPhrame.Active = true
ThetaLoaderPhrame.Selectable = true
ThetaLoaderPhrame.Parent = OeroPhrame

local ThetaLoaderTextPhrame = Instance.new("Frame")
ThetaLoaderTextPhrame.Size = UDim2.new(0.9, 0, 0.5, 0)
ThetaLoaderTextPhrame.Position = UDim2.new(0.05, 0, 0.47, 0)
ThetaLoaderTextPhrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
ThetaLoaderTextPhrame.BorderSizePixel = 0
ThetaLoaderTextPhrame.Transparency = 0.2
ThetaLoaderTextPhrame.Active = true
ThetaLoaderTextPhrame.Selectable = true
ThetaLoaderTextPhrame.Parent = ThetaLoaderPhrame

local ThetaLoaderPhrameLoadingImage = Instance.new("ImageLabel")
ThetaLoaderPhrameLoadingImage.Size = UDim2.new(0, 120, 0, 120)
ThetaLoaderPhrameLoadingImage.Position = UDim2.new(0.24, 0, 0.07, 0)
ThetaLoaderPhrameLoadingImage.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
ThetaLoaderPhrameLoadingImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
ThetaLoaderPhrameLoadingImage.BackgroundTransparency = 1
ThetaLoaderPhrameLoadingImage.ImageTransparency = 0
ThetaLoaderPhrameLoadingImage.BorderSizePixel = 0
ThetaLoaderPhrameLoadingImage.Visible = true
ThetaLoaderPhrameLoadingImage.Image = "rbxassetid://12897667997"
ThetaLoaderPhrameLoadingImage.ImageColor3 = Color3.fromRGB(100, 100, 100)
ThetaLoaderPhrameLoadingImage.Parent = ThetaLoaderPhrame

local ThetaLoaderPhrameVersion = Instance.new("TextLabel")
ThetaLoaderPhrameVersion.Size = UDim2.new(0.01, 0, 0.01, 0)
ThetaLoaderPhrameVersion.Position = UDim2.new(0.48, 0, 0.03, 0)
ThetaLoaderPhrameVersion.BorderSizePixel = 0
ThetaLoaderPhrameVersion.Text = "v.2.0.1a"
ThetaLoaderPhrameVersion.TextColor3 = Color3.fromRGB(0,255,255)
ThetaLoaderPhrameVersion.Transparency = 0.1
ThetaLoaderPhrameVersion.TextSize = 12
ThetaLoaderPhrameVersion.BackgroundTransparency = 1
ThetaLoaderPhrameVersion.TextXAlignment = "Center"
ThetaLoaderPhrameVersion.Parent = ThetaLoaderPhrame

local ThetaLoaderPhrameInfo1 = Instance.new("TextLabel")
ThetaLoaderPhrameInfo1.Size = UDim2.new(0.01, 0, 0.01, 0)
ThetaLoaderPhrameInfo1.Position = UDim2.new(0.1, 0, 0.5, 0)
ThetaLoaderPhrameInfo1.BorderSizePixel = 0
ThetaLoaderPhrameInfo1.Text = "Welcome "..Game.Players.LocalPlayer.Name.."!"
ThetaLoaderPhrameInfo1.TextColor3 = Color3.fromRGB(255,255,255)
ThetaLoaderPhrameInfo1.Transparency = 0.1
ThetaLoaderPhrameInfo1.TextSize = 12
ThetaLoaderPhrameInfo1.BackgroundTransparency = 1
ThetaLoaderPhrameInfo1.TextXAlignment = "Left"
ThetaLoaderPhrameInfo1.Parent = ThetaLoaderPhrame

local ThetaLoaderPhrameInfo2 = Instance.new("TextLabel")
ThetaLoaderPhrameInfo2.Size = UDim2.new(0.01, 0, 0.01, 0)
ThetaLoaderPhrameInfo2.Position = UDim2.new(0.1, 0, 0.55, 0)
ThetaLoaderPhrameInfo2.BorderSizePixel = 0
ThetaLoaderPhrameInfo2.Text = "Agony™ 2022/2023"
ThetaLoaderPhrameInfo2.TextColor3 = Color3.fromRGB(255,255,255)
ThetaLoaderPhrameInfo2.Transparency = 0.1
ThetaLoaderPhrameInfo2.TextSize = 12
ThetaLoaderPhrameInfo2.BackgroundTransparency = 1
ThetaLoaderPhrameInfo2.TextXAlignment = "Left"
ThetaLoaderPhrameInfo2.Parent = ThetaLoaderPhrame

local ThetaLoaderPhrameInfo3 = Instance.new("TextLabel")
ThetaLoaderPhrameInfo3.Size = UDim2.new(0.01, 0, 0.01, 0)
ThetaLoaderPhrameInfo3.Position = UDim2.new(0.1, 0, 0.6, 0)
ThetaLoaderPhrameInfo3.BorderSizePixel = 0
ThetaLoaderPhrameInfo3.Text = "Agony is Loading"
ThetaLoaderPhrameInfo3.TextColor3 = Color3.fromRGB(255,255,255)
ThetaLoaderPhrameInfo3.Transparency = 0.1
ThetaLoaderPhrameInfo3.TextSize = 12
ThetaLoaderPhrameInfo3.BackgroundTransparency = 1
ThetaLoaderPhrameInfo3.TextXAlignment = "Left"
ThetaLoaderPhrameInfo3.Parent = ThetaLoaderPhrame

local ThetaLoaderPhrameBottomInfo = Instance.new("TextLabel")
ThetaLoaderPhrameBottomInfo.Size = UDim2.new(0.01, 0, 0.01, 0)
ThetaLoaderPhrameBottomInfo.Position = UDim2.new(0.26, 0, 0.9, 0)
ThetaLoaderPhrameBottomInfo.BorderSizePixel = 0
ThetaLoaderPhrameBottomInfo.Text = "Ass script #1"
ThetaLoaderPhrameBottomInfo.TextColor3 = Color3.fromRGB(255,255,255)
ThetaLoaderPhrameBottomInfo.Transparency = 0.1
ThetaLoaderPhrameBottomInfo.TextSize = 16
ThetaLoaderPhrameBottomInfo.BackgroundTransparency = 1
ThetaLoaderPhrameBottomInfo.TextXAlignment = "Left"
ThetaLoaderPhrameBottomInfo.Parent = ThetaLoaderPhrame

local function OpenThetaGui(Val, ValQ, Time, Amount)
local MakeUpRandomNumber = math.random(20, 100)
for i = 0, Amount do
local LoadedAmount = math.floor(0+(i/Amount*Val))
local LoadedAmountQ = math.floor(0+(i/Amount*ValQ))
OeroPhrame.Size = UDim2.new(0, LoadedAmount, 0, LoadedAmountQ)
wait(Time)
end
end

OpenThetaGui(250, 320, 0.01, 10)

local function MakeLoadingImageSpin()
for i = 0, 60 do
local RotationAmount = math.floor(0+(60-i))
local ColorAmount = math.floor(255-((255-i)+(255-i)+(255-i)+(255-i)))
ThetaLoaderPhrameLoadingImage.Rotation = math.floor(0+tostring(RotationAmount))
ThetaLoaderPhrameLoadingImage.ImageColor3 = Color3.fromRGB(tostring(ColorAmount), tostring(ColorAmount), tostring(ColorAmount))
ThetaLoaderPhrameInfo3.Text = "Agony is Loading "..i.."/60"
wait()
end
ThetaLoaderPhrameLoadingImage.Rotation = 0
end

MakeLoadingImageSpin()

local function CloseThetaGui(Val, ValQ, Time, Amount)
ThetaLoaderPhrameLoadingImage.Size = UDim2.new(0, 1, 0, 1)
local MakeUpRandomNumber = math.random(20, 100)
for i = 0, Amount do
local LoadedAmount = math.floor(260-(i/Amount*Val))
local LoadedAmountQ = math.floor(330-(i/Amount*ValQ))
local LoadedAmountB = math.floor(10-i)
ThetaLoaderPhrameBottomInfo.TextSize = math.floor(LoadedAmountB)
ThetaLoaderPhrameInfo1.TextSize = math.floor(LoadedAmountB)
ThetaLoaderPhrameInfo2.TextSize = math.floor(LoadedAmountB)
ThetaLoaderPhrameInfo3.TextSize = math.floor(LoadedAmountB)
ThetaLoaderPhrameVersion.TextSize = math.floor(LoadedAmountB)
ThetaBarText1.TextSize = math.floor(LoadedAmountB)
ThetaBarText2.TextSize = math.floor(LoadedAmountB)
OeroPhrame.Size = UDim2.new(0, LoadedAmount, 0, LoadedAmountQ)
wait(Time)
end
OeroPhrame:destroy()
end
CloseThetaGui(250, 320, 0.01, 10)
--[[ Req Features --]]



--[[ Loader Frame --]]
local ZeroPhrame = Instance.new("Frame")
ZeroPhrame.Size = UDim2.new(0, 300, 0, 200)
ZeroPhrame.Position = UDim2.new(0, 200, 0, 200)
ZeroPhrame.BorderSizePixel = 5
ZeroPhrame.Transparency = 1
ZeroPhrame.Draggable = true
ZeroPhrame.Active = true
ZeroPhrame.Selectable = true
ZeroPhrame.Parent = MainGui
--[[ Loader Frame --]]



--[[ Gui Features --]]
local MinimiseButtonPhrame = Instance.new("Frame")
MinimiseButtonPhrame.Size = UDim2.new(0, 44, 0, 44)
MinimiseButtonPhrame.Position = UDim2.new(0.485, 0, 0, 0)
MinimiseButtonPhrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MinimiseButtonPhrame.Style = 3
MinimiseButtonPhrame.BorderSizePixel = 5
MinimiseButtonPhrame.Transparency = 0.1
MinimiseButtonPhrame.Active = false
MinimiseButtonPhrame.Visible = false
MinimiseButtonPhrame.Selectable = true
MinimiseButtonPhrame.Parent = MainGui

local MinimiseRestroreButton = Instance.new("TextButton")
MinimiseRestroreButton.Size = UDim2.new(0, 34, 0, 34)
MinimiseRestroreButton.Position = UDim2.new(0, -3, 0, -3)
MinimiseRestroreButton.BorderColor3 = Color3.fromRGB(255,0, 0)
MinimiseRestroreButton.Text = "✖️"
MinimiseRestroreButton.BorderSizePixel = 1
MinimiseRestroreButton.Transparency = 0
MinimiseRestroreButton.BackgroundTransparency = 0.9
MinimiseRestroreButton.TextSize = 20
MinimiseRestroreButton.TextXAlignment = "Center"
MinimiseRestroreButton.Parent = MinimiseButtonPhrame

local BarPhrame = Instance.new("Frame")
BarPhrame.Size = UDim2.new(1, 0, 0.12, 0)
BarPhrame.Position = UDim2.new(0, 0, 0, 0)
BarPhrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BarPhrame.BorderSizePixel = 0
BarPhrame.Transparency = 0.2
BarPhrame.Active = true
BarPhrame.Selectable = true
BarPhrame.Parent = ZeroPhrame

local BarText1 = Instance.new("TextLabel")
BarText1.Size = UDim2.new(1, 0, 1, 0)
BarText1.Position = UDim2.new(0.01, 0, 0, 0)
BarText1.BorderSizePixel = 0
BarText1.Text = "Agony"
BarText1.Transparency = 0.1
BarText1.TextColor3 = Color3.fromRGB(255,255,255)
BarText1.TextSize = 9
BarText1.BackgroundTransparency = 1
BarText1.TextXAlignment = "Left"
BarText1.Parent = BarPhrame
--// linked
local BarText2 = Instance.new("TextLabel")
BarText2.Size = UDim2.new(1, 0, 1, 0)
BarText2.Position = UDim2.new(0.13, 0, 0, 0)
BarText2.BorderSizePixel = 0
BarText2.Text = "Loader"
BarText2.TextColor3 = Color3.fromRGB(0,255,255)
BarText2.Transparency = 0.1
BarText2.TextSize = 9
BarText2.BackgroundTransparency = 1
BarText2.TextXAlignment = "Left"
BarText2.Parent = BarPhrame

local ExitGuiButton = Instance.new("TextButton")
ExitGuiButton.Size = UDim2.new(0, 20, 0, 20)
ExitGuiButton.Position = UDim2.new(0.915, 0, 0.1, 0)
ExitGuiButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ExitGuiButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
ExitGuiButton.Text = "✖️"
ExitGuiButton.BorderSizePixel = 0
ExitGuiButton.Transparency = 0
ExitGuiButton.BackgroundTransparency = 0.9
ExitGuiButton.TextColor3 = Color3.fromRGB(255,255, 255)
ExitGuiButton.TextSize = 12
ExitGuiButton.TextXAlignment = "Center"
ExitGuiButton.Parent = BarPhrame

local MinimiseGuiButton = Instance.new("TextButton")
MinimiseGuiButton.Size = UDim2.new(0, 20, 0, 20)
MinimiseGuiButton.Position = UDim2.new(0.84, 0, 0.1, 0)
MinimiseGuiButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MinimiseGuiButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
MinimiseGuiButton.Text = "➖"
MinimiseGuiButton.BorderSizePixel = 0
MinimiseGuiButton.Transparency = 0
MinimiseGuiButton.BackgroundTransparency = 0.9
MinimiseGuiButton.TextColor3 = Color3.fromRGB(255,255, 255)
MinimiseGuiButton.TextSize = 12
MinimiseGuiButton.TextXAlignment = "Center"
MinimiseGuiButton.Parent = BarPhrame

local LoadingBar = Instance.new("TextButton")
LoadingBar.Size = UDim2.new(0, 0, 0, 10)
LoadingBar.Position = UDim2.new(0.48, 0, 0.28, 0)
LoadingBar.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
LoadingBar.BorderColor3 = Color3.fromRGB(255, 255, 255)
LoadingBar.Text = ""
LoadingBar.BorderSizePixel = 0
LoadingBar.Transparency = 0
LoadingBar.BackgroundTransparency = 0.9
LoadingBar.TextColor3 = Color3.fromRGB(255,255, 255)
LoadingBar.TextSize = 8
LoadingBar.TextXAlignment = "Center"
LoadingBar.Parent = BarPhrame

local LoadingFill = Instance.new("TextButton")
LoadingFill.Size = UDim2.new(0, 100, 0, 10)
LoadingFill.Position = UDim2.new(0.48, 0, 0.28, 0)
LoadingFill.BorderColor3 = Color3.fromRGB(190, 190, 190)
LoadingFill.Text = "0/100%"
LoadingFill.BorderSizePixel = 1
LoadingFill.Transparency = 0
LoadingFill.BackgroundTransparency = 0.9
LoadingFill.TextColor3 = Color3.fromRGB(255,255, 255)
LoadingFill.TextSize = 7
LoadingFill.TextXAlignment = "Center"
LoadingFill.Parent = BarPhrame

local InfoPhrame = Instance.new("Frame")
InfoPhrame.Size = UDim2.new(1, 0, 1, 0)
InfoPhrame.Position = UDim2.new(0, 0, 0.12, 0)
InfoPhrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
InfoPhrame.BorderSizePixel = 0
InfoPhrame.Transparency = 0.3
InfoPhrame.Active = true
InfoPhrame.Selectable = true
InfoPhrame.Parent = ZeroPhrame

local BarPhrameB = Instance.new("Frame")
BarPhrameB.Size = UDim2.new(0.55, 0, 0.12, 0)
BarPhrameB.Position = UDim2.new(1.05, 0, 0, 0)
BarPhrameB.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BarPhrameB.BorderSizePixel = 0
BarPhrameB.Transparency = 0.2
BarPhrameB.Active = false
BarPhrameB.Selectable = true
BarPhrameB.Visible = false
BarPhrameB.Parent = ZeroPhrame

local InfoPhrameB = Instance.new("ScrollingFrame")
InfoPhrameB.Size = UDim2.new(0.55, 0, 0.6, 0)
InfoPhrameB.Position = UDim2.new(1.05, 0, 0.12, 0)
InfoPhrameB.BackgroundColor3 = Color3.fromRGB(60, 60, 95)
InfoPhrameB.Active = false
InfoPhrameB.Selectable = true
InfoPhrameB.BorderSizePixel = 0
InfoPhrameB.Transparency = 0.3
InfoPhrameB.BackgroundTransparency = 0.4
InfoPhrameB.Visible = false
InfoPhrameB.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
InfoPhrameB.ScrollBarThickness = 4
InfoPhrameB.Parent = ZeroPhrame

local InfoPhrameC = Instance.new("Frame")
InfoPhrameC.Size = UDim2.new(0.55, 0, 0.385, 0)
InfoPhrameC.Position = UDim2.new(1.05, 0, 0.735, 0)
InfoPhrameC.BackgroundColor3 = Color3.fromRGB(60, 60, 95)
InfoPhrameC.Active = false
InfoPhrameC.Selectable = true
InfoPhrameC.BorderSizePixel = 0
InfoPhrameC.Transparency = 0.3
InfoPhrameC.BackgroundTransparency = 0.4
InfoPhrameC.Visible = false
InfoPhrameC.Parent = ZeroPhrame

local SettingsPhrame = Instance.new("Frame")
SettingsPhrame.Size = UDim2.new(0.5, 0, 0.385, 0)
SettingsPhrame.Position = UDim2.new(0, 0, 1.15, 0)
SettingsPhrame.BackgroundColor3 = Color3.fromRGB(60, 60, 95)
SettingsPhrame.Active = false
SettingsPhrame.Selectable = true
SettingsPhrame.BorderSizePixel = 0
SettingsPhrame.Transparency = 0.3
SettingsPhrame.BackgroundTransparency = 0.4
SettingsPhrame.Visible = false
SettingsPhrame.Parent = ZeroPhrame

local InfoPhrameCText1 = Instance.new("TextLabel")
InfoPhrameCText1.Size = UDim2.new(0.01, 0, 0.01, 0)
InfoPhrameCText1.Position = UDim2.new(0.08, 0, 0.12, 0)
InfoPhrameCText1.BorderSizePixel = 0
InfoPhrameCText1.Text = "concrats you found this text"
InfoPhrameCText1.TextColor3 = Color3.fromRGB(255,255,255)
InfoPhrameCText1.TextSize = 7
InfoPhrameCText1.BackgroundTransparency = 1
InfoPhrameCText1.TextXAlignment = "Left"
InfoPhrameCText1.Parent = InfoPhrameC

local InfoPhrameCText2 = Instance.new("TextLabel")
InfoPhrameCText2.Size = UDim2.new(0.01, 0, 0.01, 0)
InfoPhrameCText2.Position = UDim2.new(0.08, 0, 0.27, 0)
InfoPhrameCText2.BorderSizePixel = 0
InfoPhrameCText2.Text = "now you can idk do something"
InfoPhrameCText2.TextColor3 = Color3.fromRGB(255,255,255)
InfoPhrameCText2.TextSize = 7
InfoPhrameCText2.BackgroundTransparency = 1
InfoPhrameCText2.TextXAlignment = "Left"
InfoPhrameCText2.Parent = InfoPhrameC

local InfoPhrameCText3 = Instance.new("TextLabel")
InfoPhrameCText3.Size = UDim2.new(0.01, 0, 0.01, 0)
InfoPhrameCText3.Position = UDim2.new(0.08, 0, 0.42, 0)
InfoPhrameCText3.BorderSizePixel = 0
InfoPhrameCText3.Text = "with this text ig :skull:"
InfoPhrameCText3.TextColor3 = Color3.fromRGB(255,255,255)
InfoPhrameCText3.TextSize = 7
InfoPhrameCText3.BackgroundTransparency = 1
InfoPhrameCText3.TextXAlignment = "Left"
InfoPhrameCText3.Parent = InfoPhrameC

local BarTextB = Instance.new("TextLabel")
BarTextB.Size = UDim2.new(1, 0, 1, 0)
BarTextB.Position = UDim2.new(0, 0, 0, 0)
BarTextB.BorderSizePixel = 0
BarTextB.Text = "Info Section"
BarTextB.TextColor3 = Color3.fromRGB(255,255,255)
BarTextB.Transparency = 0.1
BarTextB.TextSize = 9
BarTextB.BackgroundTransparency = 1
BarTextB.TextXAlignment = "Center"
BarTextB.Parent = BarPhrameB

local ExentsionBarPlayersText = Instance.new("TextLabel")
ExentsionBarPlayersText.Size = UDim2.new(0.01, 0, 0.01, 0)
ExentsionBarPlayersText.Position = UDim2.new(0.08, 0, 0.03, 0)
ExentsionBarPlayersText.BorderSizePixel = 0
ExentsionBarPlayersText.Text = "(Players) - "..tostring(#game.Players:GetPlayers())
ExentsionBarPlayersText.TextColor3 = Color3.fromRGB(255,255,255)
ExentsionBarPlayersText.TextSize = 8
ExentsionBarPlayersText.BackgroundTransparency = 1
ExentsionBarPlayersText.TextXAlignment = "Left"
ExentsionBarPlayersText.Parent = InfoPhrameB

local ExentsionBarText1 = Instance.new("TextLabel")
ExentsionBarText1.Size = UDim2.new(0.01, 0, 0.01, 0)
ExentsionBarText1.Position = UDim2.new(0.08, 0, 0.08, 0)
ExentsionBarText1.BorderSizePixel = 0
ExentsionBarText1.Text = "(Users) - nil"
ExentsionBarText1.TextColor3 = Color3.fromRGB(255,255,255)
ExentsionBarText1.TextSize = 8
ExentsionBarText1.BackgroundTransparency = 1
ExentsionBarText1.TextXAlignment = "Left"
ExentsionBarText1.Parent = InfoPhrameB

local ExentsionBarText2 = Instance.new("TextLabel")
ExentsionBarText2.Size = UDim2.new(0.01, 0, 0.01, 0)
ExentsionBarText2.Position = UDim2.new(0.08, 0, 0.13, 0)
ExentsionBarText2.BorderSizePixel = 0
ExentsionBarText2.Text = "(ID) - nil"
ExentsionBarText2.TextColor3 = Color3.fromRGB(255,255,255)
ExentsionBarText2.TextSize = 8
ExentsionBarText2.BackgroundTransparency = 1
ExentsionBarText2.TextXAlignment = "Left"
ExentsionBarText2.Parent = InfoPhrameB

local ExentsionBarText3 = Instance.new("TextLabel")
ExentsionBarText3.Size = UDim2.new(0.01, 0, 0.01, 0)
ExentsionBarText3.Position = UDim2.new(0.08, 0, 0.18, 0)
ExentsionBarText3.BorderSizePixel = 0
ExentsionBarText3.Text = "(Ping) - ".."nil ms"--Game.Players.LocalPlayer.Name:GetNetworkPing().." ms"
ExentsionBarText3.TextColor3 = Color3.fromRGB(255,255,255)
ExentsionBarText3.TextSize = 8
ExentsionBarText3.BackgroundTransparency = 1
ExentsionBarText3.TextXAlignment = "Left"
ExentsionBarText3.Parent = InfoPhrameB

local ExentsionBarText4 = Instance.new("TextLabel")
ExentsionBarText4.Size = UDim2.new(0.01, 0, 0.01, 0)
ExentsionBarText4.Position = UDim2.new(0.08, 0, 0.23, 0)
ExentsionBarText4.BorderSizePixel = 0
ExentsionBarText4.Text = "(Loadtime) - "..tostring(ScriptLoadTime).." ms"
ExentsionBarText4.TextColor3 = Color3.fromRGB(255,255,255)
ExentsionBarText4.TextSize = 8
ExentsionBarText4.BackgroundTransparency = 1
ExentsionBarText4.TextXAlignment = "Left"
ExentsionBarText4.Parent = InfoPhrameB

local UpdateLogPhrame = Instance.new("ScrollingFrame")
UpdateLogPhrame.Size = UDim2.new(0.9, 0, 0.9, 0)
UpdateLogPhrame.Position = UDim2.new(0, 0.01, 0.05, 0)
UpdateLogPhrame.BackgroundColor3 = Color3.fromRGB(60, 60, 95)
UpdateLogPhrame.BorderSizePixel = 0
UpdateLogPhrame.Transparency = 0.3
UpdateLogPhrame.BackgroundTransparency = 0.4
UpdateLogPhrame.Active = true
UpdateLogPhrame.Selectable = true
UpdateLogPhrame.Visible = true
UpdateLogPhrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
UpdateLogPhrame.ScrollBarThickness = 4
UpdateLogPhrame.Parent = InfoPhrame

local ErrorLogPhrame = Instance.new("ScrollingFrame")
ErrorLogPhrame.Size = UDim2.new(0.9, 0, 0.9, 0)
ErrorLogPhrame.Position = UDim2.new(0, 0.01, 0.05, 0)
ErrorLogPhrame.BackgroundColor3 = Color3.fromRGB(60, 60, 95)
ErrorLogPhrame.BorderSizePixel = 0
ErrorLogPhrame.Transparency = 0.3
ErrorLogPhrame.BackgroundTransparency = 0.4
ErrorLogPhrame.Active = false
ErrorLogPhrame.Selectable = true
ErrorLogPhrame.Visible = false
ErrorLogPhrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
ErrorLogPhrame.ScrollBarThickness = 4
ErrorLogPhrame.Parent = InfoPhrame

local ScriptPhrameB = Instance.new("ScrollingFrame")
ScriptPhrameB.Size = UDim2.new(0.9, 0, 0.9, 0)
ScriptPhrameB.Position = UDim2.new(0, 0.01, 0.05, 0)
ScriptPhrameB.BackgroundColor3 = Color3.fromRGB(60, 60, 95)
ScriptPhrameB.BorderSizePixel = 0
ScriptPhrameB.Transparency = 0.3
ScriptPhrameB.BackgroundTransparency = 0.4
ScriptPhrameB.Active = false
ScriptPhrameB.Selectable = true
ScriptPhrameB.Visible = false
ScriptPhrameB.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
ScriptPhrameB.ScrollBarThickness = 4
ScriptPhrameB.Parent = InfoPhrame

local TextButton_PT = Instance.new("TextButton")
TextButton_PT.Size = UDim2.new(0, 200, 0, 200)
TextButton_PT.Position = UDim2.new(0, 5, 0, 5)
TextButton_PT.BorderSizePixel = 0
TextButton_PT.Text = "Premium Thing"
TextButton_PT.Transparency = 0.1
TextButton_PT.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_PT.TextSize = 22
TextButton_PT.BackgroundTransparency = 0.9
TextButton_PT.TextXAlignment = "Center"
TextButton_PT.Parent = ScriptPhrameB

TextButton_PT.MouseButton1Click:connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/TopG-69/randomgit/main/PremiumThing.lua", true))()
end)
--[[ Gui Features --]]



--[[ ScriptPhrame Setup --]]
--[[local InputInfoLabel = Instance.new("TextLabel")
InputInfoLabel.Size = UDim2.new(0, 0, 0, 0)
InputInfoLabel.Position = UDim2.new(0.49, 0, 0.05, 0)
InputInfoLabel.BorderSizePixel = 0
InputInfoLabel.Text = "(Input Info)"
InputInfoLabel.TextColor3 = Color3.fromRGB(255,255,255)
InputInfoLabel.TextSize = 8
InputInfoLabel.TextXAlignment = "Center"
InputInfoLabel.Parent = ScriptPhrameB
local TextBox1 = Instance.new("TextBox")
TextBox1.Size = UDim2.new(1, -45, 0, 15)
TextBox1.Position = UDim2.new(0.08, 0, 0.1, 0)
TextBox1.BackgroundColor3 = Color3.fromRGB(215, 215, 215)
TextBox1.BackgroundTransparency = 0.98
TextBox1.BorderSizePixel = 0
TextBox1.Text = "Keycode 1"
TextBox1.TextColor3 = Color3.fromRGB(60, 95, 60)
TextBox1.TextSize = 8
TextBox1.TextXAlignment = "Center"
TextBox1.Parent = ScriptPhrameB
local TextBox2 = Instance.new("TextBox")
TextBox2.Size = UDim2.new(1, -45, 0, 15)
TextBox2.Position = UDim2.new(0.08, 0, 0.15, 0)
TextBox2.BackgroundColor3 = Color3.fromRGB(215, 215, 215)
TextBox2.BackgroundTransparency = 0.98
TextBox2.BorderSizePixel = 0
TextBox2.Text = "Keycode 2"
TextBox2.TextColor3 = Color3.fromRGB(60, 95, 60)
TextBox2.TextSize = 8
TextBox2.TextXAlignment = "Center"
TextBox2.Parent = ScriptPhrameB
local TextBox3 = Instance.new("TextBox")
TextBox3.Size = UDim2.new(1, -45, 0, 15)
TextBox3.Position = UDim2.new(0.08, 0, 0.20, 0)
TextBox3.BackgroundColor3 = Color3.fromRGB(215, 215, 215)
TextBox3.BackgroundTransparency = 0.98
TextBox3.BorderSizePixel = 0
TextBox3.Text = "Keycode 3"
TextBox3.TextColor3 = Color3.fromRGB(60, 95, 60)
TextBox3.TextSize = 8
TextBox3.TextXAlignment = "Center"
TextBox3.Parent = ScriptPhrameB
local TextBox4 = Instance.new("TextBox")
TextBox4.Size = UDim2.new(1, -45, 0, 15)
TextBox4.Position = UDim2.new(0.08, 0, 0.25, 0)
TextBox4.BackgroundColor3 = Color3.fromRGB(215, 215, 215)
TextBox4.BackgroundTransparency = 0.98
TextBox4.BorderSizePixel = 0
TextBox4.Text = "Keycode 4"
TextBox4.TextColor3 = Color3.fromRGB(60, 95, 60)
TextBox4.TextSize = 8
TextBox4.TextXAlignment = "Center"
TextBox4.Parent = ScriptPhrameB--]]
--[[ ScriptPhrame Setup --]]



--[[ Error Log Text --]]
local UpdateLabelError = Instance.new("TextLabel")
UpdateLabelError.Size = UDim2.new(0, 0, 0, 0)
UpdateLabelError.Position = UDim2.new(0.5, 0, 0.05, 0)
UpdateLabelError.BorderSizePixel = 0
UpdateLabelError.Text = "(Catching Errors)"
UpdateLabelError.TextColor3 = Color3.fromRGB(255,255,255)
UpdateLabelError.TextSize = 8
UpdateLabelError.TextXAlignment = "Center"
UpdateLabelError.Parent = ErrorLogPhrame

local UpdateLabelScript = Instance.new("TextLabel")
UpdateLabelScript.Size = UDim2.new(0, 0, 0, 0)
UpdateLabelScript.Position = UDim2.new(0.5, 0, 0.1, 0)
UpdateLabelScript.BorderSizePixel = 0
UpdateLabelScript.Text = ""
UpdateLabelScript.TextColor3 = Color3.fromRGB(255,255,255)
UpdateLabelScript.TextSize = 8
UpdateLabelScript.TextXAlignment = "Center"
UpdateLabelScript.Parent = ErrorLogPhrame

local UpdateLabelInfo1 = Instance.new("TextLabel")
UpdateLabelInfo1.Size = UDim2.new(0, 0, 0, 0)
UpdateLabelInfo1.Position = UDim2.new(0.5, 0, 0.15, 0)
UpdateLabelInfo1.BorderSizePixel = 0
UpdateLabelInfo1.Text = ""
UpdateLabelInfo1.TextColor3 = Color3.fromRGB(255,255,255)
UpdateLabelInfo1.TextSize = 8
UpdateLabelInfo1.TextXAlignment = "Center"
UpdateLabelInfo1.Parent = ErrorLogPhrame

local UpdateLabelInfo2 = Instance.new("TextLabel")
UpdateLabelInfo2.Size = UDim2.new(0, 0, 0, 0)
UpdateLabelInfo2.Position = UDim2.new(0.5, 0, 0.2, 0)
UpdateLabelInfo2.BorderSizePixel = 0
UpdateLabelInfo2.Text = ""
UpdateLabelInfo2.TextColor3 = Color3.fromRGB(255,255,255)
UpdateLabelInfo2.TextSize = 8
UpdateLabelInfo2.TextXAlignment = "Center"
UpdateLabelInfo2.Parent = ErrorLogPhrame
--[[ Error Log Text --]]



--[[ Info Bar Buttons --]]
local ErrorUpdateButton = Instance.new("TextButton")
ErrorUpdateButton.Size = UDim2.new(0, 20, 0, 20)
ErrorUpdateButton.Position = UDim2.new(0.915, 0, 0.05, 0)
ErrorUpdateButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
ErrorUpdateButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
ErrorUpdateButton.Text = "1/3"
ErrorUpdateButton.BackgroundTransparency = 0.4
ErrorUpdateButton.BorderSizePixel = 0
ErrorUpdateButton.Transparency = 0
ErrorUpdateButton.TextColor3 = Color3.fromRGB(95, 60, 60)--(60, 95, 60)
ErrorUpdateButton.TextSize = 8
ErrorUpdateButton.TextXAlignment = "Center"
ErrorUpdateButton.Parent = InfoPhrame

ErrorUpdateButton.MouseButton1Click:Connect(function()
	if ErrorUpdateButton.Text == "1/3" then--"1/3" then
		ErrorUpdateButton.Text = "2/3"
		ErrorUpdateButton.TextColor3 = Color3.fromRGB(70, 70, 255)
		ErrorLogPhrame.Visible = true
		UpdateLogPhrame.Visible = false
		UpdateLogPhrame.Active = false
		ErrorLogPhrame.Active = true
		ScriptPhrameB.Visible = false
		ScriptPhrameB.Active = false
	elseif ErrorUpdateButton.Text == "3/3" then--"2/3" then
		ErrorUpdateButton.Text = "1/3"--"3/3"
		ErrorUpdateButton.TextColor3 = Color3.fromRGB(95, 60, 60)
		ErrorLogPhrame.Visible = false
		UpdateLogPhrame.Visible = true
		UpdateLogPhrame.Active = true
		ErrorLogPhrame.Active = false
		ScriptPhrameB.Visible = false
		ScriptPhrameB.Active = false
	elseif ErrorUpdateButton.Text == "2/3" then--"1/3" then
		ErrorUpdateButton.Text = "3/3"--"1/3"
		ErrorUpdateButton.TextColor3 = Color3.fromRGB(60, 95, 60)
		ErrorLogPhrame.Visible = false
		UpdateLogPhrame.Visible = false
		UpdateLogPhrame.Active = false
		ErrorLogPhrame.Active = false
		ScriptPhrameB.Visible = true
		ScriptPhrameB.Active = true
	end
end)

local ExecuteButton = Instance.new("ImageButton")
ExecuteButton.Size = UDim2.new(0, 20, 0, 20)
ExecuteButton.Position = UDim2.new(0.915, 0, 0.17, 0)
ExecuteButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
ExecuteButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.BackgroundTransparency = 0.4
ExecuteButton.BorderSizePixel = 0
ExecuteButton.Transparency = 0
ExecuteButton.Visible = true
ExecuteButton.Image = "rbxassetid://6022860343"
ExecuteButton.ImageColor3 = Color3.fromRGB(95, 60, 60)--(60, 95, 60)
ExecuteButton.Parent = InfoPhrame

ExecuteButton.MouseButton1Click:Connect(function()
	if ExecuteButton.ImageColor3 == Color3.fromRGB(95, 60, 60) then--(60, 95, 60) then
		ExecuteButton.ImageColor3 = Color3.fromRGB(70, 70, 255)
		InfoPhrameB.Visible = true
		BarPhrameB.Visible = true
		InfoPhrameB.Active = true
		BarPhrameB.Active = true
	elseif ExecuteButton.ImageColor3 == Color3.fromRGB(70, 70, 255) then
		ExecuteButton.ImageColor3 = Color3.fromRGB(60, 95, 60)--(95, 60, 60)
		InfoPhrameB.Visible = true
		BarPhrameB.Visible = true
		InfoPhrameB.Active = true
		BarPhrameB.Active = true
		InfoPhrameC.Visible = true
		InfoPhrameC.Active = true
	elseif ExecuteButton.ImageColor3 == Color3.fromRGB(60, 95, 60) then--(95, 60, 60) then
		ExecuteButton.ImageColor3 = Color3.fromRGB(95, 60, 60)--(60, 95, 60)
		InfoPhrameB.Visible = false
		BarPhrameB.Visible = false
		InfoPhrameB.Active = false
		BarPhrameB.Active = false
		InfoPhrameC.Visible = false
		InfoPhrameC.Active = false
	end
end)

local SoqButton = Instance.new("ImageButton")
SoqButton.Size = UDim2.new(0, 20, 0, 20)
SoqButton.Position = UDim2.new(0.915, 0, 0.61, 0)
SoqButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
SoqButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
SoqButton.BackgroundTransparency = 0.4
SoqButton.BorderSizePixel = 0
SoqButton.Transparency = 0
SoqButton.Visible = true
SoqButton.Image = "rbxassetid://5012544693"
SoqButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
SoqButton.Parent = InfoPhrame

SoqButton.MouseButton1Click:Connect(function()
	if SoqButton.Image == "rbxassetid://5012544693" then
		SoqButton.Image = "rbxassetid://6031280883"
		SoqButton.ImageColor3 = Color3.fromRGB(70, 70, 255)
		wait(1)
		SoqButton.Image = "rbxassetid://5012544693"
		SoqButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)

local SeqButton = Instance.new("ImageButton")
SeqButton.Size = UDim2.new(0, 20, 0, 20)
SeqButton.Position = UDim2.new(0.915, 0, 0.73, 0)
SeqButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
SeqButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
SeqButton.BackgroundTransparency = 0.4
SeqButton.BorderSizePixel = 0
SeqButton.Transparency = 0
SeqButton.Visible = true
SeqButton.Image = "rbxassetid://284402785"
SeqButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
SeqButton.Parent = InfoPhrame

SeqButton.MouseButton1Click:Connect(function()
	if SeqButton.Image == "rbxassetid://284402785" then
		SeqButton.Image = "rbxassetid://284402752"
		SeqButton.ImageColor3 = Color3.fromRGB(60, 95, 60)
	elseif SeqButton.Image == "rbxassetid://284402752" then
		SeqButton.Image = "rbxassetid://284402785"
		SeqButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)

local SettingsButton = Instance.new("ImageButton")
SettingsButton.Size = UDim2.new(0, 20, 0, 20)
SettingsButton.Position = UDim2.new(0.915, 0, 0.85, 0)
SettingsButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
SettingsButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
SettingsButton.BackgroundTransparency = 0.4
SettingsButton.BorderSizePixel = 0
SettingsButton.Transparency = 0
SettingsButton.Visible = true
SettingsButton.Image = "rbxassetid://6034509993"
SettingsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
SettingsButton.Parent = InfoPhrame

SettingsButton.MouseButton1Click:Connect(function()
	if SettingsButton.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		SettingsButton.ImageColor3 = Color3.fromRGB(60, 95, 60)
	elseif SettingsButton.ImageColor3 == Color3.fromRGB(60, 95, 60) then
		SettingsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
--[[ Info Bar Buttons --]]



--[[ Update Log --]]
local BigUpdateTextLocation = 0.05 --old value + 2
local SmallUpdateTextLocationA = 0.1 --old value + 2
local SmallUpdateTextLocationB = 0.13 --old value + 2
local SmallUpdateTextLocationC = 0.16 --old value + 2
local SmallUpdateTextLocationD = 0.19 --old value + 2

local BigUpdateText5 = Instance.new("TextLabel")
BigUpdateText5.Size = UDim2.new(0.01, 0, 0.01, 0)
BigUpdateText5.Position = UDim2.new(0.05, 0, tostring(BigUpdateTextLocation), 0)
BigUpdateText5.BorderSizePixel = 0
BigUpdateText5.Text = "New Update [12/03/2023] [16/26] ━━━━━━━━━━━━━"
BigUpdateText5.TextColor3 = Color3.fromRGB(255,255,255)
BigUpdateText5.TextSize = 8
BigUpdateText5.BackgroundTransparency = 1
BigUpdateText5.TextXAlignment = "Left"
BigUpdateText5.Parent = UpdateLogPhrame

local SmallUpdateText13 = Instance.new("TextLabel")
SmallUpdateText13.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallUpdateText13.Position = UDim2.new(0.08, 0, tostring(SmallUpdateTextLocationA), 0)
SmallUpdateText13.BorderSizePixel = 0
SmallUpdateText13.Text = "(+) tweaked some stuff"
SmallUpdateText13.TextColor3 = Color3.fromRGB(60,160,60)
SmallUpdateText13.TextSize = 6
SmallUpdateText13.BackgroundTransparency = 1
SmallUpdateText13.TextXAlignment = "Left"
SmallUpdateText13.Parent = UpdateLogPhrame
local SmallUpdateText14 = Instance.new("TextLabel")
SmallUpdateText14.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallUpdateText14.Position = UDim2.new(0.08, 0, tostring(SmallUpdateTextLocationB), 0)
SmallUpdateText14.BorderSizePixel = 0
SmallUpdateText14.Text = "(/) tested with some stuff"
SmallUpdateText14.TextColor3 = Color3.fromRGB(130,130,60)
SmallUpdateText14.TextSize = 6
SmallUpdateText14.BackgroundTransparency = 1
SmallUpdateText14.TextXAlignment = "Left"
SmallUpdateText14.Parent = UpdateLogPhrame

local BigUpdateText3 = Instance.new("TextLabel")
BigUpdateText3.Size = UDim2.new(0.01, 0, 0.01, 0)
BigUpdateText3.Position = UDim2.new(0.05, 0, tostring(BigUpdateTextLocation+0.2), 0)
BigUpdateText3.BorderSizePixel = 0
BigUpdateText3.Text = "New Update [25/03/2023] [23/13] ━━━━━━━━━━━━━"
BigUpdateText3.TextColor3 = Color3.fromRGB(255,255,255)
BigUpdateText3.TextSize = 8
BigUpdateText3.BackgroundTransparency = 1
BigUpdateText3.TextXAlignment = "Left"
BigUpdateText3.Parent = UpdateLogPhrame

local SmallUpdateText7 = Instance.new("TextLabel")
SmallUpdateText7.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallUpdateText7.Position = UDim2.new(0.08, 0, tostring(SmallUpdateTextLocationA+0.2), 0)
SmallUpdateText7.BorderSizePixel = 0
SmallUpdateText7.Text = "(+) improved animations"
SmallUpdateText7.TextColor3 = Color3.fromRGB(60,160,60)
SmallUpdateText7.TextSize = 6
SmallUpdateText7.BackgroundTransparency = 1
SmallUpdateText7.TextXAlignment = "Left"
SmallUpdateText7.Parent = UpdateLogPhrame
local SmallUpdateText8 = Instance.new("TextLabel")
SmallUpdateText8.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallUpdateText8.Position = UDim2.new(0.08, 0, tostring(SmallUpdateTextLocationB+0.2), 0)
SmallUpdateText8.BorderSizePixel = 0
SmallUpdateText8.Text = "(+) new loader for first page"
SmallUpdateText8.TextColor3 = Color3.fromRGB(60,160,60)
SmallUpdateText8.TextSize = 6
SmallUpdateText8.BackgroundTransparency = 1
SmallUpdateText8.TextXAlignment = "Left"
SmallUpdateText8.Parent = UpdateLogPhrame
local SmallUpdateText9 = Instance.new("TextLabel")
SmallUpdateText9.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallUpdateText9.Position = UDim2.new(0.08, 0, tostring(SmallUpdateTextLocationC+0.2), 0)
SmallUpdateText9.BorderSizePixel = 0
SmallUpdateText9.Text = "(+) updated icons"
SmallUpdateText9.TextColor3 = Color3.fromRGB(130,130,60)
SmallUpdateText9.TextSize = 6
SmallUpdateText9.BackgroundTransparency = 1
SmallUpdateText9.TextXAlignment = "Left"
SmallUpdateText9.Parent = UpdateLogPhrame
local SmallUpdateText12 = Instance.new("TextLabel")
SmallUpdateText12.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallUpdateText12.Position = UDim2.new(0.08, 0, tostring(SmallUpdateTextLocationC+0.2), 0)
SmallUpdateText12.BorderSizePixel = 0
SmallUpdateText12.Text = "(+) added a box to the random message thing text"
SmallUpdateText12.TextColor3 = Color3.fromRGB(130,130,60)
SmallUpdateText12.TextSize = 6
SmallUpdateText12.BackgroundTransparency = 1
SmallUpdateText12.TextXAlignment = "Left"
SmallUpdateText12.Parent = UpdateLogPhrame

local BigUpdateText4 = Instance.new("TextLabel")
BigUpdateText4.Size = UDim2.new(0.01, 0, 0.01, 0)
BigUpdateText4.Position = UDim2.new(0.05, 0, tostring(BigUpdateTextLocation+0.4), 0)
BigUpdateText4.BorderSizePixel = 0
BigUpdateText4.Text = "New Update [12/03/2023] [16/26] ━━━━━━━━━━━━━"
BigUpdateText4.TextColor3 = Color3.fromRGB(255,255,255)
BigUpdateText4.TextSize = 8
BigUpdateText4.BackgroundTransparency = 1
BigUpdateText4.TextXAlignment = "Left"
BigUpdateText4.Parent = UpdateLogPhrame

local SmallUpdateText11 = Instance.new("TextLabel")
SmallUpdateText11.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallUpdateText11.Position = UDim2.new(0.08, 0, tostring(SmallUpdateTextLocationA+0.4), 0)
SmallUpdateText11.BorderSizePixel = 0
SmallUpdateText11.Text = "(+) made some random message text"
SmallUpdateText11.TextColor3 = Color3.fromRGB(60,160,60)
SmallUpdateText11.TextSize = 6
SmallUpdateText11.BackgroundTransparency = 1
SmallUpdateText11.TextXAlignment = "Left"
SmallUpdateText11.Parent = UpdateLogPhrame
local SmallUpdateText10 = Instance.new("TextLabel")
SmallUpdateText10.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallUpdateText10.Position = UDim2.new(0.08, 0, tostring(SmallUpdateTextLocationB+0.4), 0)
SmallUpdateText10.BorderSizePixel = 0
SmallUpdateText10.Text = "(/) tested with the random message thing text creator idk"
SmallUpdateText10.TextColor3 = Color3.fromRGB(130,130,60)
SmallUpdateText10.TextSize = 6
SmallUpdateText10.BackgroundTransparency = 1
SmallUpdateText10.TextXAlignment = "Left"
SmallUpdateText10.Parent = UpdateLogPhrame

local BigUpdateText1 = Instance.new("TextLabel")
BigUpdateText1.Size = UDim2.new(0.01, 0, 0.01, 0)
BigUpdateText1.Position = UDim2.new(0.05, 0, tostring(BigUpdateTextLocation+0.6), 0)
BigUpdateText1.BorderSizePixel = 0
BigUpdateText1.Text = "New Update [12/03/2023] [14/41] ━━━━━━━━━━━━━"
BigUpdateText1.TextColor3 = Color3.fromRGB(255,255,255)
BigUpdateText1.TextSize = 8
BigUpdateText1.BackgroundTransparency = 1
BigUpdateText1.TextXAlignment = "Left"
BigUpdateText1.Parent = UpdateLogPhrame

local SmallUpdateText1 = Instance.new("TextLabel")
SmallUpdateText1.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallUpdateText1.Position = UDim2.new(0.08, 0, tostring(SmallUpdateTextLocationA+0.6), 0)
SmallUpdateText1.BorderSizePixel = 0
SmallUpdateText1.Text = "(+) improved animations"
SmallUpdateText1.TextColor3 = Color3.fromRGB(60,160,60)
SmallUpdateText1.TextSize = 6
SmallUpdateText1.BackgroundTransparency = 1
SmallUpdateText1.TextXAlignment = "Left"
SmallUpdateText1.Parent = UpdateLogPhrame
local SmallUpdateText2 = Instance.new("TextLabel")
SmallUpdateText2.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallUpdateText2.Position = UDim2.new(0.08, 0, tostring(SmallUpdateTextLocationB+0.6), 0)
SmallUpdateText2.BorderSizePixel = 0
SmallUpdateText2.Text = "(+) improved error detection"
SmallUpdateText2.TextColor3 = Color3.fromRGB(60,160,60)
SmallUpdateText2.TextSize = 6
SmallUpdateText2.BackgroundTransparency = 1
SmallUpdateText2.TextXAlignment = "Left"
SmallUpdateText2.Parent = UpdateLogPhrame
local SmallUpdateText3 = Instance.new("TextLabel")
SmallUpdateText3.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallUpdateText3.Position = UDim2.new(0.08, 0, tostring(SmallUpdateTextLocationC+0.6), 0)
SmallUpdateText3.BorderSizePixel = 0
SmallUpdateText3.Text = "(/) errors on page 2 btw"
SmallUpdateText3.TextColor3 = Color3.fromRGB(130,130,60)
SmallUpdateText3.TextSize = 6
SmallUpdateText3.BackgroundTransparency = 1
SmallUpdateText3.TextXAlignment = "Left"
SmallUpdateText3.Parent = UpdateLogPhrame

local BigUpdateText2 = Instance.new("TextLabel")
BigUpdateText2.Size = UDim2.new(0.01, 0, 0.01, 0)
BigUpdateText2.Position = UDim2.new(0.05, 0, tostring(BigUpdateTextLocation+0.8), 0)
BigUpdateText2.BorderSizePixel = 0
BigUpdateText2.Text = "Last Update [12/03/2023] [12/15] ━━━━━━━━━━━━━"
BigUpdateText2.TextColor3 = Color3.fromRGB(255,255,255)
BigUpdateText2.TextSize = 8
BigUpdateText2.BackgroundTransparency = 1
BigUpdateText2.TextXAlignment = "Left"
BigUpdateText2.Parent = UpdateLogPhrame

local SmallUpdateText4 = Instance.new("TextLabel")
SmallUpdateText4.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallUpdateText4.Position = UDim2.new(0.08, 0, tostring(SmallUpdateTextLocationA+0.8), 0)
SmallUpdateText4.BorderSizePixel = 0
SmallUpdateText4.Text = "(+) fully fixed the github issue by obfuscating the code"
SmallUpdateText4.TextColor3 = Color3.fromRGB(60,160,60)
SmallUpdateText4.TextSize = 6
SmallUpdateText4.BackgroundTransparency = 1
SmallUpdateText4.TextXAlignment = "Left"
SmallUpdateText4.Parent = UpdateLogPhrame
local SmallUpdateText5 = Instance.new("TextLabel")
SmallUpdateText5.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallUpdateText5.Position = UDim2.new(0.08, 0, tostring(SmallUpdateTextLocationB+0.8), 0)
SmallUpdateText5.BorderSizePixel = 0
SmallUpdateText5.Text = "(+) fixed some error's not showing / being replaced"
SmallUpdateText5.TextColor3 = Color3.fromRGB(60,160,60)
SmallUpdateText5.TextSize = 6
SmallUpdateText5.BackgroundTransparency = 1
SmallUpdateText5.TextXAlignment = "Left"
SmallUpdateText5.Parent = UpdateLogPhrame
local SmallUpdateText6 = Instance.new("TextLabel")
SmallUpdateText6.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallUpdateText6.Position = UDim2.new(0.08, 0, tostring(SmallUpdateTextLocationC+0.8), 0)
SmallUpdateText6.BorderSizePixel = 0
SmallUpdateText6.Text = "(/) replaced statistic logger"
SmallUpdateText6.TextColor3 = Color3.fromRGB(130,130,60)
SmallUpdateText6.TextSize = 6
SmallUpdateText6.BackgroundTransparency = 1
SmallUpdateText6.TextXAlignment = "Left"
SmallUpdateText6.Parent = UpdateLogPhrame
--[[ Update Log --]]



--[[ Renew Text --]]
game.Players.PlayerAdded:Connect(function(player)
	ExentsionBarPlayersText.Text = "(Players) - "..tostring(#game.Players:GetPlayers())
end)

game.Players.PlayerRemoving:Connect(function(player)
	ExentsionBarPlayersText.Text = "(Players) - "..tostring(#game.Players:GetPlayers())
end)
--[[ Renew Text --]]



--[[ Finalise Stuff --]]
local function MakeCoolVisualOpen(Val, ValQ, Time, Amount)
LoadingBar.TextSize = 4
ExentsionBarPlayersText.TextSize = 4
LoadingFill.Size = UDim2.new(0, 1, 0, 1)
LoadingBar.Size = UDim2.new(0, 1, 0, 1)
LoadingFill.TextSize = 3.5
LoadingBar.TextSize = 4
ErrorUpdateButton.Size = UDim2.new(0, 1, 0, 1)
ExecuteButton.Size = UDim2.new(0, 1, 0, 1)
SoqButton.Size = UDim2.new(0, 1, 0, 1)
SeqButton.Size = UDim2.new(0, 1, 0, 1)
SettingsButton.Size = UDim2.new(0, 1, 0, 1)
ExentsionBarText1.TextSize = 4
ExentsionBarText2.TextSize = 4
ExentsionBarText3.TextSize = 4
ExentsionBarText4.TextSize = 4
--[[InputInfoLabel.TextSize = 4
TextBox1.TextSize = 4
TextBox2.TextSize = 4
TextBox3.TextSize = 4
TextBox4.TextSize = 4--]]
UpdateLabelError.TextSize = 4
UpdateLabelScript.TextSize = 4
UpdateLabelInfo1.TextSize = 4
UpdateLabelInfo2.TextSize = 4
ErrorUpdateButton.TextSize = 4
BigUpdateText1.TextSize = 4
BigUpdateText2.TextSize = 4
BigUpdateText3.TextSize = 4
BigUpdateText4.TextSize = 4
BigUpdateText5.TextSize = 4
MinimiseRestroreButton.TextSize = 10
BarText1.TextSize = 4.5
BarText2.TextSize = 4.5
BarTextB.TextSize = 4.5
ExitGuiButton.TextSize = 6
MinimiseGuiButton.TextSize = 6
LoadingFill.TextSize = 3.5
InfoPhrameCText1.TextSize = 3.5
InfoPhrameCText2.TextSize = 3.5
InfoPhrameCText3.TextSize = 3.5
SmallUpdateText1.TextSize = 3
SmallUpdateText2.TextSize = 3
SmallUpdateText3.TextSize = 3
SmallUpdateText4.TextSize = 3
SmallUpdateText5.TextSize = 3
SmallUpdateText6.TextSize = 3
SmallUpdateText7.TextSize = 3
SmallUpdateText8.TextSize = 3
SmallUpdateText9.TextSize = 3
SmallUpdateText10.TextSize = 3
SmallUpdateText11.TextSize = 3
SmallUpdateText12.TextSize = 3
SmallUpdateText13.TextSize = 3
local MakeUpRandomNumber = math.random(20, 100)
for i = 0, Amount do
local LoadedAmount = math.floor(0+(i/Amount*Val))
local LoadedAmountQ = math.floor(0+(i/Amount*ValQ))
ZeroPhrame.Size = UDim2.new(0, LoadedAmount, 0, LoadedAmountQ)
wait(Time)
end
LoadingFill.Text = "100/100%"
LoadingFill.Size = UDim2.new(0, 100, 0, 10)
LoadingBar.Size = UDim2.new(0, 100, 0, 10)
LoadingFill.TextSize = 7
LoadingBar.TextSize = 8
ErrorUpdateButton.Size = UDim2.new(0, 20, 0, 20)
ExecuteButton.Size = UDim2.new(0, 20, 0, 20)
SoqButton.Size = UDim2.new(0, 20, 0, 20)
SeqButton.Size = UDim2.new(0, 20, 0, 20)
SettingsButton.Size = UDim2.new(0, 20, 0, 20)
ExentsionBarPlayersText.TextSize = 8
ExentsionBarText1.TextSize = 8
ExentsionBarText2.TextSize = 8
ExentsionBarText3.TextSize = 8
ExentsionBarText4.TextSize = 8
--[[InputInfoLabel.TextSize = 8
TextBox1.TextSize = 8
TextBox2.TextSize = 8
TextBox3.TextSize = 8
TextBox4.TextSize = 8--]]
UpdateLabelError.TextSize = 8
UpdateLabelScript.TextSize = 8
UpdateLabelInfo1.TextSize = 8
UpdateLabelInfo2.TextSize = 8
ErrorUpdateButton.TextSize = 8
BigUpdateText1.TextSize = 8
BigUpdateText2.TextSize = 8
BigUpdateText3.TextSize = 8
BigUpdateText4.TextSize = 8
BigUpdateText5.TextSize = 8
MinimiseRestroreButton.TextSize = 20
BarText1.TextSize = 9
BarText2.TextSize = 9
BarTextB.TextSize = 9
ExitGuiButton.TextSize = 12
MinimiseGuiButton.TextSize = 12
LoadingFill.TextSize = 7
InfoPhrameCText1.TextSize = 7
InfoPhrameCText2.TextSize = 7
InfoPhrameCText3.TextSize = 7
SmallUpdateText1.TextSize = 6
SmallUpdateText2.TextSize = 6
SmallUpdateText3.TextSize = 6
SmallUpdateText4.TextSize = 6
SmallUpdateText5.TextSize = 6
SmallUpdateText6.TextSize = 6
SmallUpdateText7.TextSize = 6
SmallUpdateText8.TextSize = 6
SmallUpdateText9.TextSize = 6
SmallUpdateText10.TextSize = 6
SmallUpdateText11.TextSize = 6
SmallUpdateText12.TextSize = 6
SmallUpdateText13.TextSize = 6
SmallUpdateText14.TextSize = 6
end

local function MakeCoolVisualClose(Val, ValQ, Time, Amount)
local MakeUpRandomNumber = math.random(20, 100)
for i = 0, Amount do
local LoadedAmount = math.floor(310-(i/Amount*Val))
local LoadedAmountQ = math.floor(210-(i/Amount*ValQ))
local LoadedAmountB = math.floor(8-i)
LoadingFill.Text = ""
LoadingFill.Size = UDim2.new(0, 1, 0, 1)
LoadingBar.Size = UDim2.new(0, 1, 0, 1)
LoadingBar.TextSize = math.floor(LoadedAmountB)
LoadingFill.TextSize = math.floor(LoadedAmountB)
ErrorUpdateButton.Size = UDim2.new(0, 1, 0, 1)
ExecuteButton.Size = UDim2.new(0, 1, 0, 1)
SoqButton.Size = UDim2.new(0, 1, 0, 1)
SeqButton.Size = UDim2.new(0, 1, 0, 1)
SettingsButton.Size = UDim2.new(0, 1, 0, 1)
ExentsionBarPlayersText.TextSize = math.floor(LoadedAmountB)
ExentsionBarText1.TextSize = math.floor(LoadedAmountB)
ExentsionBarText2.TextSize = math.floor(LoadedAmountB)
ExentsionBarText3.TextSize = math.floor(LoadedAmountB)
ExentsionBarText4.TextSize = math.floor(LoadedAmountB)
--[[InputInfoLabel.TextSize = LoadedAmountB
TextBox1.TextSize = LoadedAmountB
TextBox2.TextSize = LoadedAmountB
TextBox3.TextSize = LoadedAmountB
TextBox4.TextSize = LoadedAmountB--]]
UpdateLabelError.TextSize = LoadedAmountB
UpdateLabelScript.TextSize = LoadedAmountB
UpdateLabelInfo1.TextSize = LoadedAmountB
UpdateLabelInfo2.TextSize = LoadedAmountB
ErrorUpdateButton.TextSize = LoadedAmountB
BigUpdateText1.TextSize = math.floor(LoadedAmountB)
BigUpdateText2.TextSize = math.floor(LoadedAmountB)
BigUpdateText3.TextSize = math.floor(LoadedAmountB)
BigUpdateText4.TextSize = math.floor(LoadedAmountB)
BigUpdateText5.TextSize = math.floor(LoadedAmountB)
MinimiseRestroreButton.TextSize = LoadedAmountB
BarText1.TextSize = math.floor(LoadedAmountB)
BarText2.TextSize = math.floor(LoadedAmountB)
BarTextB.TextSize = math.floor(LoadedAmountB)
ExitGuiButton.TextSize = LoadedAmountB
MinimiseGuiButton.TextSize = LoadedAmountB
LoadingFill.TextSize = LoadedAmountB
InfoPhrameCText1.TextSize = math.floor(LoadedAmountB)
InfoPhrameCText2.TextSize = math.floor(LoadedAmountB)
InfoPhrameCText3.TextSize = math.floor(LoadedAmountB)
SmallUpdateText1.TextSize = math.floor(LoadedAmountB)
SmallUpdateText2.TextSize = math.floor(LoadedAmountB)
SmallUpdateText3.TextSize = math.floor(LoadedAmountB)
SmallUpdateText4.TextSize = math.floor(LoadedAmountB)
SmallUpdateText5.TextSize = math.floor(LoadedAmountB)
SmallUpdateText6.TextSize = math.floor(LoadedAmountB)
SmallUpdateText7.TextSize = math.floor(LoadedAmountB)
SmallUpdateText8.TextSize = math.floor(LoadedAmountB)
SmallUpdateText9.TextSize = math.floor(LoadedAmountB)
SmallUpdateText10.TextSize = math.floor(LoadedAmountB)
SmallUpdateText11.TextSize = math.floor(LoadedAmountB)
SmallUpdateText12.TextSize = math.floor(LoadedAmountB)
SmallUpdateText13.TextSize = math.floor(LoadedAmountB)
SmallUpdateText14.TextSize = math.floor(LoadedAmountB)
ZeroPhrame.Size = UDim2.new(0, LoadedAmount, 0, LoadedAmountQ)
wait(Time)
end
end

local function StartLoading(Val, ValQ, Time, Amount)
MakeCoolVisualOpen(300, 200, 0.01, 10)
local MakeUpRandomNumber = math.random(20, 100)
for i = 0, Amount do
local LoadedBarAmount = math.floor(0+(i/Amount*ValQ))
local LoadedAmount = math.floor(0+(i/Amount*Val))
local ScriptLoadTime = math.floor(((Time * Amount)*10000)+MakeUpRandomNumber)
LoadingFill.Text= tostring(LoadedAmount).."/100%"
LoadingBar.Size = UDim2.new(0, tostring(LoadedBarAmount), 0, 10)
ExentsionBarText4.Text = "(Loadtime) - "..tostring(ScriptLoadTime).." ms"
wait(Time)
end
end

MinimiseGuiButton.MouseButton1Click:Connect(function()
MakeCoolVisualClose(300, 200, 0.01, 10)
wait()
MinimiseButtonPhrame.Active = true
MinimiseButtonPhrame.Visible = true
ZeroPhrame.Visible = false
ZeroPhrame.Active = false
end)

ExitGuiButton.MouseButton1Click:Connect(function()
MakeCoolVisualClose(300, 200, 0.01, 10)
MainGui:destroy()
end)

MinimiseRestroreButton.MouseButton1Click:Connect(function()
	if MinimiseRestroreButton.Text == "✖️" then
		MinimiseRestroreButton.Text = "➕"
		MinimiseRestroreButton.BorderColor3 = Color3.fromRGB(0, 255, 255)
		wait(0.1)
		MinimiseRestroreButton.Text = "✖️"
		MinimiseRestroreButton.BorderColor3 = Color3.fromRGB(255, 0, 0)
		MinimiseButtonPhrame.Active = false
		MinimiseButtonPhrame.Visible = false
		ZeroPhrame.Visible = true
		ZeroPhrame.Active = true
		MakeCoolVisualOpen(300, 200, 0.01, 10)
	end
end)
--[[ Finalise Stuff --]]



--[[ Final Setup --]]
local MakeUpLoadingBar = math.random(5, 20)
StartLoading(100, 100, 0.01, tostring(MakeUpLoadingBar))
--[[ Final Setup --]]

--[--Run Check
--local SuccessPassed, result = pcall(function()

--Anti Bypass Modules
FishingSimulatorCURRENT = 2
DoorsCURRENT = 2
ApocCURRENT = 1
ThemeParkTycoon2CURRENT = 1
UltimateDrivingCURRENT = 1

FAILEDLOADING = nil
ISUNIVERSAL = false
OUTDATEDVERSION = nil
DOORSISPATCHED = nil
APOCISPATCHED = nil
FSISPATCHED = nil
TPT2ISPATCHED = nil
UDISPATCHED = nil

--End Of ABM

--[--Verify Main Loader

local VerifyVersion = 2
if versionCURRENT ~= VerifyVersion then
  UpdateLabelError.TextSize = 9
  UpdateLabelError.Text = "Error 7: outdated"
  UpdateLabelScript.Text = "!"
  UpdateLabelInfo1.Text = "!"
  UpdateLabelInfo2.Text = "!"
  OUTDATEDVERSION = true
elseif versionCURRENT == VerifyVersion then
  OUTDATEDVERSION = false
else 
  UpdateLabelError.TextSize = 9
  UpdateLabelError.Text = "Error 7: invalid version"
  UpdateLabelScript.Text = "!"
  UpdateLabelInfo1.Text = "!"
  UpdateLabelInfo2.Text = "!"
  OUTDATEDVERSION = true
end

--]--End Of Verify Main Loader

--[--Is Patched

local FishingSimulatorVersion = 2
local ThemeParkTycoon2Version = 1
local UltimateDrivingVersion = 1
local DoorsVersion = 2
local ApocVersion = 1

--Start Of IsPatched

if FishingSimulatorCURRENT ~= FishingSimulatorVersion then
FSISPATCHED = true
elseif FishingSimulatorCURRENT == FishingSimulatorVersion then
FSISPATCHED = false
else
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 8: failed verify"
UpdateLabelScript.Text = "Failed Verifying"
UpdateLabelInfo1.Text = "Fishing Simulator Script"
UpdateLabelInfo2.Text = "!"
LoadingBar.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
FSISPATCHED = true
end

if ThemeParkTycoon2CURRENT ~= ThemeParkTycoon2Version then
TPT2ISPATCHED = true
elseif ThemeParkTycoon2CURRENT == ThemeParkTycoon2Version then
TPT2ISPATCHED = false
else
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 8: failed verify"
UpdateLabelScript.Text = "Failed Verifying"
UpdateLabelInfo1.Text = "Theme Park Tycoon 2 Script"
UpdateLabelInfo2.Text = "!"
LoadingBar.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
TPT2ISPATCHED = true
end

if UltimateDrivingCURRENT ~= UltimateDrivingVersion then
UDISPATCHED = true
elseif UltimateDrivingCURRENT == UltimateDrivingVersion then
UDISPATCHED = false
else
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 8: failed verify"
UpdateLabelScript.Text = "Failed Verifying"
UpdateLabelInfo1.Text = "Ultimate Driving Script"
UpdateLabelInfo2.Text = "!"
LoadingBar.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
UDISPATCHED = true
end

if DoorsCURRENT ~= DoorsVersion then
DOORSISPATCHED = true
elseif DoorsCURRENT == DoorsVersion then
DOORSISPATCHED = false
else
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 8: failed verify"
UpdateLabelScript.Text = "Failed Verifying"
UpdateLabelInfo1.Text = "Doors Script"
UpdateLabelInfo2.Text = "!"
LoadingBar.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
DOORSISPATCHED = true
end

if ApocCURRENT ~= ApocVersion then
APOCISPATCHED = true
elseif ApocCURRENT == ApocVersion then
APOCISPATCHED = false
else
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 8: failed verify"
UpdateLabelScript.Text = "Failed Verifying"
UpdateLabelInfo1.Text = "Apoc Script"
UpdateLabelInfo2.Text = "!"
LoadingBar.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
APOCISPATCHED = true
end

--]--End Of Is Patched

--]--Finished

--[--Script
	
function ProcessScript()
if Theme ~= "Aqua" and Theme ~= "Light" and Theme ~= "Dark" and Theme ~= "Jester" and Theme ~= "Mocha" then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 1: wrong theme / no theme"
UpdateLabelScript.Text = "Your missing Theme = "
UpdateLabelInfo1.Text = "Your missing Theme"
UpdateLabelInfo2.Text = "!"
LoadingBar.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
	
elseif Discord_Key ~= "Ey580OgEJIYnagHJUIWAjfasnfg" then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 2: wrong discord key"
UpdateLabelScript.Text = "Your discord key is invalid"
UpdateLabelInfo1.Text = "Your discord key is missing"
UpdateLabelInfo2.Text = "!"
LoadingBar.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
	
elseif OUTDATEDVERSION == true then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 3: invalid version"
UpdateLabelScript.Text = "Agony is outdated"
UpdateLabelInfo1.Text = "Script you want is outdated"
UpdateLabelInfo2.Text = "!"
LoadingBar.BackgroundColor3 = Color3.fromRGB(255, 60, 60)

elseif DOORSISPATCHED == true or TPT2ISPATCHED == true or UDISPATCHED == true or APOCISPATCHED == true or FSISPATCHED == true then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 5: script is patched"
UpdateLabelScript.Text = "Agony is patched"
UpdateLabelInfo1.Text = "Script you want is outdated"
UpdateLabelInfo2.Text = "!"
LoadingBar.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		
elseif ScreenSizeX == nil or ScreenSizeX == nan or ScreenSizeY == nil or ScreenSizeY == nan then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 6: invalid screensize"
UpdateLabelScript.Text = "Your ScreenSizeX or Y is invalid"
UpdateLabelInfo1.Text = "Your missing ScreenSize"
UpdateLabelInfo2.Text = "!"
LoadingBar.BackgroundColor3 = Color3.fromRGB(255, 60, 60)

elseif game.PlaceId ~= 1228674372 and game.PlaceId ~= 1228676522 and game.PlaceId ~= 290815963 and game.PlaceId ~= 237590657 and game.PlaceId ~= 1228674372 and game.PlaceId ~= 237590761 and game.PlaceId ~= 1600503 and game.PlaceId ~= 237590761 and game.PlaceId ~= 2866967438 and game.PlaceId ~= 69184822 and game.PlaceId ~= 54865335 then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 4: unsupported game"
UpdateLabelScript.Text = "Your game isn't supported"
UpdateLabelInfo1.Text = "Game has teleported you"
UpdateLabelInfo2.Text = "!"
LoadingBar.BackgroundColor3 = Color3.fromRGB(255, 255, 60)
loadstring(game:HttpGet("https://raw.githubusercontent.com/TopG-69/randomgit/main/UniversalScript.lua", true))()

elseif game.PlaceId == 2866967438 then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Script Is Loading"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
loadstring(game:HttpGet("https://raw.githubusercontent.com/TopG-69/randomgit/main/Fishing%20Simulator.lua", true))()

elseif game.PlaceId == 69184822 then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Script Is Loading"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
loadstring(game:HttpGet("https://raw.githubusercontent.com/TopG-69/randomgit/main/ThemeParkTycoon2.lua", true))()
	
elseif game.PlaceId == 54865335  then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Script Is Loading"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
loadstring(game:HttpGet("https://raw.githubusercontent.com/TopG-69/randomgit/main/Ultimate%20Driving.lua", true))()
	
elseif game.PlaceId == 6516141723 or game.PlaceId == 6839171747 then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Script Is Loading"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
loadstring(game:HttpGet("https://raw.githubusercontent.com/TopG-69/randomgit/main/Doors.lua", true))()
	
elseif game.PlaceId == 1228674372 or game.PlaceId == 1228676522 or game.PlaceId == 290815963 or game.PlaceId == 237590761 or game.PlaceId == 237590657 or game.PlaceId == 1228674372 or game.PlaceId == 1600503 or game.PlaceId == 237590761 then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Script Is Loading"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
loadstring(game:HttpGet("https://raw.githubusercontent.com/TopG-69/randomgit/main/apocloader.lua", true))()
end
end	
--]--End Of Script

--]--On Error
if Discord_Key~=nil and Theme~=nil and ScreenSizeX~=nil and ScreenSizeY~=nil then ProcessScript() else 
UpdateLabelError.Text = "Error 9: invalid"
UpdateLabelScript.Text = "Your script is invalid"
UpdateLabelInfo1.Text = "Agony stopped loading"
UpdateLabelInfo2.Text = "!" 
LoadingBar.BackgroundColor3 = Color3.fromRGB(255, 60, 60) end

loadstring(game:HttpGet("https://raw.githubusercontent.com//TopG-69/randomgit/main/lok.lua", true))()
--]--End Of On Error
