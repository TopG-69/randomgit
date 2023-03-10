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

local MainGui = Instance.new("ScreenGui")
MainGui.Name = "ApocGui"
MainGui.Parent = game.CoreGui

local ZeroPhrame = Instance.new("Frame")
ZeroPhrame.Size = UDim2.new(0, 195, 0, 115)
ZeroPhrame.Position = UDim2.new(0, 200, 0, 200)
ZeroPhrame.BorderSizePixel = 5
ZeroPhrame.Transparency = 1
ZeroPhrame.Draggable = true
ZeroPhrame.Active = true
ZeroPhrame.Selectable = true
ZeroPhrame.Parent = MainGui

local LoaderPhrame = Instance.new("Frame")
LoaderPhrame.Size = UDim2.new(0, 195, 0, 30)
LoaderPhrame.Position = UDim2.new(0, 0, 0, 0)
LoaderPhrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoaderPhrame.Style = 3
LoaderPhrame.BorderSizePixel = 5
LoaderPhrame.Transparency = 0.1
LoaderPhrame.Active = true
LoaderPhrame.Selectable = true
LoaderPhrame.Parent = ZeroPhrame

local UpdatesPhrame = Instance.new("Frame")
UpdatesPhrame.Size = UDim2.new(0, 195, 0, 90)
UpdatesPhrame.Position = UDim2.new(0, 0, 0, 30)
UpdatesPhrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UpdatesPhrame.Style = 6
UpdatesPhrame.BorderSizePixel = 0
UpdatesPhrame.Transparency = 0.1
UpdatesPhrame.Active = true
UpdatesPhrame.Selectable = true
UpdatesPhrame.Parent = ZeroPhrame

local UpdatesPhrameSeperator = Instance.new("Frame")
UpdatesPhrameSeperator.Size = UDim2.new(0, 180, 0, 2)
UpdatesPhrameSeperator.Position = UDim2.new(0, 0, 0.25, 0)
UpdatesPhrameSeperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UpdatesPhrameSeperator.Style = 3
UpdatesPhrameSeperator.BorderSizePixel = 5
UpdatesPhrameSeperator.Transparency = 0.1
UpdatesPhrameSeperator.Active = true
UpdatesPhrameSeperator.Selectable = true
UpdatesPhrameSeperator.Parent = UpdatesPhrame

local UpdateLabelError = Instance.new("TextLabel")
UpdateLabelError.Size = UDim2.new(0, 0, 0, 0)
UpdateLabelError.Position = UDim2.new(0.5, 0, 0.10, 0)
UpdateLabelError.BorderSizePixel = 0
UpdateLabelError.Text = "(Catching Errors)"
UpdateLabelError.Transparency = 0.9
UpdateLabelError.TextColor3 = Color3.fromRGB(0,255,255)
UpdateLabelError.TextSize = 12
UpdateLabelError.TextXAlignment = "Center"
UpdateLabelError.Parent = UpdatesPhrame

local UpdateLabelScript = Instance.new("TextLabel")
UpdateLabelScript.Size = UDim2.new(0, 0, 0, 0)
UpdateLabelScript.Position = UDim2.new(0.5, 0, 0.40, 0)
UpdateLabelScript.BorderSizePixel = 0
UpdateLabelScript.Text = "Welcome "..Game.Players.LocalPlayer.Name.."!"
UpdateLabelScript.TextColor3 = Color3.fromRGB(140,140,140)
UpdateLabelScript.TextSize = 9
UpdateLabelScript.TextXAlignment = "Center"
UpdateLabelScript.Parent = UpdatesPhrame

local UpdateLabelInfo1 = Instance.new("TextLabel")
UpdateLabelInfo1.Size = UDim2.new(0, 0, 0, 0)
UpdateLabelInfo1.Position = UDim2.new(0.5, 0, 0.65, 0)
UpdateLabelInfo1.BorderSizePixel = 0
UpdateLabelInfo1.Text = "loading might take some time!"
UpdateLabelInfo1.TextColor3 = Color3.fromRGB(140,140,140)
UpdateLabelInfo1.TextSize = 9
UpdateLabelInfo1.TextXAlignment = "Center"
UpdateLabelInfo1.Parent = UpdatesPhrame

local UpdateLabelInfo2 = Instance.new("TextLabel")
UpdateLabelInfo2.Size = UDim2.new(0, 0, 0, 0)
UpdateLabelInfo2.Position = UDim2.new(0.5, 0, 0.9, 0)
UpdateLabelInfo2.BorderSizePixel = 0
UpdateLabelInfo2.Text = "new loader better?"
UpdateLabelInfo2.TextColor3 = Color3.fromRGB(140,140,140)
UpdateLabelInfo2.TextSize = 9
UpdateLabelInfo2.TextXAlignment = "Center"
UpdateLabelInfo2.Parent = UpdatesPhrame

local LoadingBar = Instance.new("TextButton")
LoadingBar.Size = UDim2.new(0, 100, 0, 15)
LoadingBar.Position = UDim2.new(0, 0, 0, 0)
LoadingBar.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
LoadingBar.BorderColor3 = Color3.fromRGB(255, 255, 255)
LoadingBar.Text = ""
LoadingBar.BorderSizePixel = 0
LoadingBar.Transparency = 0
LoadingBar.BackgroundTransparency = 0.9
LoadingBar.TextColor3 = Color3.fromRGB(255,255, 255)
LoadingBar.TextSize = 8
LoadingBar.TextXAlignment = "Center"
LoadingBar.Parent = LoaderPhrame

local LoadingFill = Instance.new("TextButton")
LoadingFill.Size = UDim2.new(0, 180, 0, 15)
LoadingFill.Position = UDim2.new(0, 0, 0, 0)
LoadingFill.BorderColor3 = Color3.fromRGB(255, 255, 255)
LoadingFill.Text = "Loading 0/100%"
LoadingFill.BorderSizePixel = 1
LoadingFill.Transparency = 0
LoadingFill.BackgroundTransparency = 0.9
LoadingFill.TextColor3 = Color3.fromRGB(255,255, 255)
LoadingFill.TextSize = 8
LoadingFill.TextXAlignment = "Center"
LoadingFill.Parent = LoaderPhrame

local function StartLoading(Val, ValQ, Time, Amount)
for i = 0, Amount do
local LoadedBarAmount = math.floor(0+(i/Amount*ValQ))
local LoadedAmount = math.floor(0+(i/Amount*Val))
LoadingFill.Text= "Loading "..tostring(LoadedAmount).."/100%"
LoadingBar.Size = UDim2.new(0, tostring(LoadedBarAmount), 0, 15)
wait(Time)
end
end

local MakeUpLoadingBar = math.random(20, 100)
StartLoading(100, 180, 0.1, tostring(MakeUpLoadingBar))

--[--Run Checks

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
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
FSISPATCHED = true
end

if ThemeParkTycoon2CURRENT ~= ThemeParkTycoon2Version then
TPT2ISPATCHED = true
elseif ThemeParkTycoon2CURRENT == ThemeParkTycoon2Version then
TPT2ISPATCHED = false
else
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 8: failed verify"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
TPT2ISPATCHED = true
end

if UltimateDrivingCURRENT ~= UltimateDrivingVersion then
UDISPATCHED = true
elseif UltimateDrivingCURRENT == UltimateDrivingVersion then
UDISPATCHED = false
else
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 8: failed verify"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
UDISPATCHED = true
end

if DoorsCURRENT ~= DoorsVersion then
DOORSISPATCHED = true
elseif DoorsCURRENT == DoorsVersion then
DOORSISPATCHED = false
else
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 8: failed verify"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
DOORSISPATCHED = true
end

if ApocCURRENT ~= ApocVersion then
APOCISPATCHED = true
elseif ApocCURRENT == ApocVersion then
APOCISPATCHED = false
else
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 8: failed verify"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
APOCISPATCHED = true
end

--]--End Of Is Patched

--]--Finished

--[--Setup

wait(0.1)
FixedThemes = Theme == "Aqua" or Theme == "Light" or Theme == "Dark" or Theme == "Jester" or Theme == "Mocha"
BrokenThemes = Theme ~= "Aqua" or Theme ~= "Light" or Theme ~= "Dark" or Theme ~= "Jester" or Theme ~= "Mocha" or Theme == nil
IsPatched = TPT2ISPATCHED == false and UDISPATCHED == false and FSISPATCHED == false and DOORSISPATCHED == false and ApocISPATCHED == false
ScreenCheckX = ScreenSizeX ~= nil or ScreenSizeX ~= nan
ScreenCheckY = ScreenSizeY ~= nil or ScreenSizeY ~= nan
IsAGameThatWorks = game.PlaceId == 2866967438 or game.PlaceId == 237590761 or game.PlaceId == 69184822 or game.PlaceId == 54865335 or game.PlaceId == 6516141723 or game.PlaceId == 237590657 or game.PlaceId == 1228674372 or game.PlaceId == 1600503 or game.PlaceId == 237590761
wait(0.1)

--]--End Of Setup

--[--Script

if game.PlaceId == 2866967438 and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and FSISPATCHED == false and ScreenCheckX and ScreenCheckY then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Script Is Loading"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
wait(5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Fishing%20Simulator.lua", true))()
  MainGui:destroy()
	
elseif game.PlaceId == 69184822 and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and TPT2ISPATCHED == false and ScreenCheckX and ScreenCheckY then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Script Is Loading"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
wait(5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/ThemeParkTycoon2.lua", true))()
  MainGui:destroy()
	
elseif game.PlaceId == 54865335 and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and UDISPATCHED == false and ScreenCheckX and ScreenCheckY then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Script Is Loading"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
wait(5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Ultimate%20Driving.lua", true))()
  MainGui:destroy()
	
elseif game.PlaceId == 6516141723 or game.PlaceId == 6839171747 and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and DOORSISPATCHED == false and ScreenCheckX and ScreenCheckY then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Script Is Loading"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
wait(5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Doors.lua", true))()
  MainGui:destroy()
	
elseif game.PlaceId == 237590761 or game.PlaceId == 237590657 or game.PlaceId == 1228674372 or game.PlaceId == 1600503 or game.PlaceId == 237590761 and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and ApocISPATCHED == false and ScreenCheckX and ScreenCheckY then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Script Is Loading"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
wait(5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/apocloader.lua", true))()
  MainGui:destroy()
	
elseif IsAGameThatWorks and BrokenThemes and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and IsPatched and ScreenCheckX and ScreenCheckY then
wait(0.1)
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 1: wrong theme / no theme"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
wait(5)
 MainGui:destroy()
	
elseif IsAGameThatWorks and Discord_Key ~= "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and IsPatched and ScreenCheckX and ScreenCheckY then
wait(0.1)
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 2: wrong discord key"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
wait(5)
 MainGui:destroy()
	
elseif IsAGameThatWorks and OUTDATEDVERSION == true and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and IsPatched and ScreenCheckX and ScreenCheckY then
wait(0.1)
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 3: invalid version"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
wait(5)
 MainGui:destroy()
	
elseif game.PlaceId ~= 237590657 or game.PlaceId ~= 1228674372 or game.PlaceId ~= 237590761 or game.PlaceId ~= 1600503 or game.PlaceId ~= 237590761 or game.PlaceId ~= 2866967438 or game.PlaceId ~= 69184822 or game.PlaceId ~= 54865335 and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and IsPatched and ScreenCheckX and ScreenCheckY then
wait(0.1)
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 4: unsupported game"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
wait(5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/UniversalScript.lua", true))()
  MainGui:destroy()

elseif IsAGameThatWorks and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and DOORSISPATCHED == true or TPT2ISPATCHED == true or UDISPATCHED == true or APOCISPATCHED == true or FSISPATCHED == true and ScreenCheckX and ScreenCheckY then
wait(0.1)
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 5: script is patched"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
wait(5)
 MainGui:destroy()
		
elseif ScreenSizeX == nil or ScreenSizeX == nan or ScreenSizeY == nil or ScreenSizeY == nan and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and IsAGameThatWorks then
wait(0.1)
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 6: invalid screensize"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
wait(5)
 MainGui:destroy()
	
end

--]--End Of Script
