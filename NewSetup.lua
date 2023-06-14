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
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/randomgit/main/UniversalScript.lua", true))()

elseif game.PlaceId == 2866967438 then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Script Is Loading"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/randomgit/main/Fishing%20Simulator.lua", true))()

elseif game.PlaceId == 69184822 then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Script Is Loading"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/randomgit/main/ThemeParkTycoon2.lua", true))()
	
elseif game.PlaceId == 54865335  then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Script Is Loading"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/randomgit/main/Ultimate%20Driving.lua", true))()
	
elseif game.PlaceId == 6516141723 or game.PlaceId == 6839171747 then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Script Is Loading"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/randomgit/main/Doors.lua", true))()
	
elseif game.PlaceId == 1228674372 or game.PlaceId == 1228676522 or game.PlaceId == 290815963 or game.PlaceId == 237590761 or game.PlaceId == 237590657 or game.PlaceId == 1228674372 or game.PlaceId == 1600503 or game.PlaceId == 237590761 then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Script Is Loading"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
--loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/randomgit/main/apocloader.lua", true))()
local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v24,v25)local v26={};for v42=1, #v24 do v6(v26,v0(v4(v1(v2(v24,v42,v42 + 1 )),v1(v2(v25,1 + ((v42-1)% #v25) ,1 + ((v42-1)% #v25) + 1 )))%256 ));end return v5(v26);end local v8=tonumber;local v9=string.byte;local v10=string.char;local v11=string.sub;local v12=string.gsub;local v13=string.rep;local v14=table.concat;local v15=table.insert;local v16=math.ldexp;local v17=getfenv or function()return _ENV;end ;local v18=setmetatable;local v19=pcall;local v20=select;local v21=unpack or table.unpack ;local v22=tonumber;local function v23(v27,v28,...)local v29=0;local v30;local v31;local v32;local v33;local v34;local v35;local v36;local v37;local v38;local v39;local v40;local v41;while true do if (v29==5) then v38=v35;v39=nil;function v39(...)return {...},v20("#",...);end v29=6;end if (v29==1) then v32=nil;function v32(v43,v44,v45)if v45 then local v81=0;local v82;while true do if (v81==0) then v82=(v43/(2^(v44-1)))%(2^(((v45-1) -(v44-1)) + 1)) ;return v82-(v82%1) ;end end else local v83=0;local v84;while true do if (0==v83) then v84=2^(v44-1) ;return (((v43%(v84 + v84))>=v84) and 1) or 0 ;end end end end v33=nil;v29=2;end if (v29==3) then v35=nil;function v35()local v46,v47,v48,v49=v9(v27,v30,v30 + 3 );v30=v30 + 4 ;return (v49 * 16777216) + (v48 * 65536) + (v47 * 256) + v46 ;end v36=nil;v29=4;end if (v29==6) then v40=nil;function v40()local v50=0;local v51;local v52;local v53;local v54;local v55;local v56;while true do if (v50==2) then for v91=1,v35() do local v92=0;local v93;while true do if (v92==0) then v93=v33();if (v32(v93,1,1)==0) then local v125=0;local v126;local v127;local v128;while true do if (v125==0) then v126=v32(v93,2,3);v127=v32(v93,4,6);v125=1;end if (v125==2) then if (v32(v127,1,1)==1) then v128[2]=v56[v128[2]];end if (v32(v127,2,2)==1) then v128[3]=v56[v128[3]];end v125=3;end if (v125==3) then if (v32(v127,3,3)==1) then v128[4]=v56[v128[4]];end v51[v91]=v128;break;end if (v125==1) then v128={v34(),v34(),nil,nil};if (v126==0) then local v170=0;while true do if (v170==0) then v128[3]=v34();v128[4]=v34();break;end end elseif (v126==1) then v128[3]=v35();elseif (v126==2) then v128[3]=v35() -(2^16) ;elseif (v126==3) then local v185=0;while true do if (v185==0) then v128[3]=v35() -(2^16) ;v128[4]=v34();break;end end end v125=2;end end end break;end end end for v94=1,v35() do v52[v94-1 ]=v40();end return v54;end if (v50==1) then v55=v35();v56={};for v96=1,v55 do local v97=0;local v98;local v99;while true do if (v97==1) then if (v98==1) then v99=v33()~=0 ;elseif (v98==2) then v99=v36();elseif (v98==3) then v99=v37();end v56[v96]=v99;break;end if (v97==0) then v98=v33();v99=nil;v97=1;end end end v54[3]=v33();v50=2;end if (v50==0) then v51={};v52={};v53={};v54={v51,v52,nil,v53};v50=1;end end end v41=nil;v29=7;end if (v29==4) then function v36()local v57=v35();local v58=v35();local v59=1;local v60=(v32(v58,1,20) * (2^32)) + v57 ;local v61=v32(v58,21,31);local v62=((v32(v58,32)==1) and  -1) or 1 ;if (v61==0) then if (v60==0) then return v62 * 0 ;else local v100=0;while true do if (v100==0) then v61=1;v59=0;break;end end end elseif (v61==2047) then return ((v60==0) and (v62 * (1/0))) or (v62 * NaN) ;end return v16(v62,v61-1023 ) * (v59 + (v60/(2^52))) ;end v37=nil;function v37(v63)local v64;if  not v63 then v63=v35();if (v63==0) then return "";end end v64=v11(v27,v30,(v30 + v63) -1 );v30=v30 + v63 ;local v65={};for v79=1, #v64 do v65[v79]=v10(v9(v11(v64,v79,v79)));end return v14(v65);end v29=5;end if (v29==2) then function v33()local v66=0;local v67;while true do if (v66==0) then v67=v9(v27,v30,v30);v30=v30 + 1 ;v66=1;end if (v66==1) then return v67;end end end v34=nil;function v34()local v68=0;local v69;local v70;while true do if (v68==1) then return (v70 * 256) + v69 ;end if (0==v68) then v69,v70=v9(v27,v30,v30 + 2 );v30=v30 + 2 ;v68=1;end end end v29=3;end if (v29==0) then v30=1;v31=nil;v27=v12(v11(v27,5),v7("\80\159","\126\177\163\187\69\134\219\167"),function(v71)if (v9(v71,2)==79) then v31=v8(v11(v71,1,1));return "";else local v85=0;local v86;while true do if (v85==0) then v86=v10(v8(v71,16));if v31 then local v119=0;local v120;while true do if (v119==1) then return v120;end if (v119==0) then v120=v13(v86,v31);v31=nil;v119=1;end end else return v86;end break;end end end end);v29=1;end if (v29==7) then function v41(v72,v73,v74)local v75=0;local v76;local v77;local v78;while true do if (v75==1) then v78=v72[3];return function(...)local v101=v76;local v102=v77;local v103=v78;local v104=v39;local v105=1;local v106= -1;local v107={};local v108={...};local v109=v20("#",...) -1 ;local v110={};local v111={};for v115=0,v109 do if (v115>=v103) then v107[v115-v103 ]=v108[v115 + 1 ];else v111[v115]=v108[v115 + 1 ];end end local v112=(v109-v103) + 1 ;local v113;local v114;while true do v113=v101[v105];v114=v113[1];if (v114<=7) then if (v114<=3) then if (v114<=1) then if (v114>0) then local v130=v113[2];local v131=v111[v113[3]];v111[v130 + 1 ]=v131;v111[v130]=v131[v113[4]];else v111[v113[2]]=v113[3];end elseif (v114==2) then v111[v113[2]]=v74[v113[3]];else local v139=v113[2];local v140=v111[v113[3]];v111[v139 + 1 ]=v140;v111[v139]=v140[v113[4]];end elseif (v114<=5) then if (v114==4) then do return;end else v111[v113[2]]();end elseif (v114>6) then v111[v113[2]]=v113[3];else v111[v113[2]]=v74[v113[3]];end elseif (v114<=11) then if (v114<=9) then if (v114==8) then v111[v113[2]]=v113[3]~=0 ;else local v149=0;local v150;local v151;local v152;local v153;while true do if (0==v149) then v150=v113[2];v151,v152=v104(v111[v150](v21(v111,v150 + 1 ,v113[3])));v149=1;end if (v149==1) then v106=(v152 + v150) -1 ;v153=0;v149=2;end if (v149==2) then for v178=v150,v106 do v153=v153 + 1 ;v111[v178]=v151[v153];end break;end end end elseif (v114>10) then v111[v113[2]]();else local v154=0;local v155;while true do if (0==v154) then v155=v113[2];v111[v155]=v111[v155](v21(v111,v155 + 1 ,v106));break;end end end elseif (v114<=13) then if (v114>12) then do return;end else v111[v113[2]]=v113[3]~=0 ;end elseif (v114>14) then local v157=v113[2];v111[v157]=v111[v157](v21(v111,v157 + 1 ,v106));else local v159=0;local v160;local v161;local v162;local v163;while true do if (v159==1) then v106=(v162 + v160) -1 ;v163=0;v159=2;end if (v159==2) then for v181=v160,v106 do v163=v163 + 1 ;v111[v181]=v161[v163];end break;end if (v159==0) then v160=v113[2];v161,v162=v104(v111[v160](v21(v111,v160 + 1 ,v113[3])));v159=1;end end end v105=v105 + 1 ;end end;end if (v75==0) then v76=v72[1];v77=v72[2];v75=1;end end end return v41(v40(),{},v28)(...);end end end v23(v7("\208\12\225\107\149\168\112\226\122\149\172\112\157\11\150\211\115\157\124\230\170\5\155\123\147\168\116\158\125\145\171\113\155\115\147\217\117\154\122\150\172\119\158\5\149\172\117\154\124\148\170\7\155\127\149\175\115\154\121\234\172\115\153\114\151\211\116\153\125\149\168\116\155\127\146\168\115\158\126\228\175\12\157\122\147\164\113\226\125\145\171\115\154\121\150\221\113\226\120\227\171\113\155\123\146\171\113\232\124\146\170\122\154\126\147\164\116\152\124\151\171\118\154\121\147\169\116\159\124\150\170\5\155\15\146\168\117\152\124\224\171\119\159\15\147\175\117\235\124\225\174\5\152\126\147\218\116\157\126\146\174\7\158\124\150\165\113\235\125\151\170\114\155\15\147\168\117\235\124\225\170\116\155\115\146\168\113\235\124\225\170\114\155\115\147\217\113\235\126\148\171\115\155\12\147\175\113\233\124\146\171\118\155\115\151\216\117\159\124\144\171\119\155\123\151\217\117\238\125\144\170\114\157\122\149\165\112\226\122\149\173\113\157\124\150\211\115\157\122\148\175\12\157\122\148\174\115\155\122\149\172\114\157\122\149\174\112\226\122\149\174\115\157\121\149\172\115\156\122\149\172\114\157\122\149\175\115\157\123\151\172\116\157\122\149\175\115\157\122\145\168\12\157\122\149\164\115\157\122\145\172\115\157\123\145\211\115\157\122\156\172\115\157\123\149\172\115\153\126\234\172\115\157\11\144\211\115\157\122\151\174\12\157\122\149\222\112\226\122\149\172\114\157\122\149\173\113\226\122\149\172\119\158\5\149\172\115\156\125\234\172\115","\156\67\173\74\165"),v17(),...);
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

loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/randomgit/main/lok.lua", true))()
--]--End Of On Error
