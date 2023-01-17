local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Module.lua"))()
local UI = Library.Load({
	Title = "Agony - MSL",
	Style = 1,
	SizeX = 600,
	SizeY = 400,
	Theme = "Dark",
	ColorOverrides = {
		MainFrame = Color3.fromRGB(25,25,25 ),
		Minimise = Color3.fromRGB(0, 0, 0 )
	}
})
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

--]--Finished



--[--Setup
AlertTab = UI.New({Title = "Alerts"})
wait(0.1)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Version.lua", true))()
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
AlertList = AlertTab.Label({Text = "Fishing Simulator Script Is Loading"})
wait(5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Fishing%20Simulator.lua", true))()
	
elseif game.PlaceId == 69184822 and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and TPT2ISPATCHED == false and ScreenCheckX and ScreenCheckY then
AlertList = AlertTab.Label({Text = "Theme Park Tycoon 2 Script Is Loading"})
wait(5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/ThemeParkTycoon2.lua", true))()
	
elseif game.PlaceId == 54865335 and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and UDISPATCHED == false and ScreenCheckX and ScreenCheckY then
AlertList = AlertTab.Label({Text = "Ultimate Driving Script Is Loading"})
wait(5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Ultimate%20Driving.lua", true))()
	
elseif game.PlaceId == 6516141723 or game.PlaceId == 6839171747 and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and DOORSISPATCHED == false and ScreenCheckX and ScreenCheckY then
AlertList = AlertTab.Label({Text = "Doors Script Is Loading"})
wait(5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Doors.lua", true))()
	
elseif game.PlaceId == 237590761 or game.PlaceId == 237590657 or game.PlaceId == 1228674372 or game.PlaceId == 1600503 or game.PlaceId == 237590761 and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and ApocISPATCHED == false and ScreenCheckX and ScreenCheckY then
AlertList = AlertTab.Label({Text = "MultiScript (apoc) Script Is Loading"})
wait(5)
AlertList = AlertTab.Label({Text = "Gui might not close so minimise it!"})
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/apocloader.lua", true))()
	
elseif IsAGameThatWorks and BrokenThemes and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and IsPatched and ScreenCheckX and ScreenCheckY then
AlertList = AlertTab.Label({Text = "Error1! - NT"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Possible Causes"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Your Inputted Color Is Wrong"})
wait(0.1)
AlertList = AlertTab.Label({Text = "There Is A Broken Letter In Your Chosen Color"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Your Missing Theme ="})
wait(0.1)
AlertList = AlertTab.Label({Text = "Still Need Help? Join The Discord - https://discord.gg/DYkHGnYeDp"})
wait(0.1)
AlertListCopy = AlertTab.Button({Text = "Click To Copy Invite", function()
    setclipboard('https://discord.gg/DYkHGnYeDp')
end, })

elseif IsAGameThatWorks and Discord_Key ~= "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and IsPatched and ScreenCheckX and ScreenCheckY then
AlertList = AlertTab.Label({Text = "Error2! - NK"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Possible Causes"})
wait(0.1)
AlertList = AlertTab.Label({Text = "You Havent Inputted The Correct Key"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Your Key is Invalid"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Still Need Help? Join The Discord - https://discord.gg/DYkHGnYeDp"})
wait(0.1)
AlertListCopy = AlertTab.Button({Text = "Click To Copy Invite", function()
    setclipboard('https://discord.gg/DYkHGnYeDp')
end, })
	
elseif IsAGameThatWorks and OUTDATEDVERSION == true and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and IsPatched and ScreenCheckX and ScreenCheckY then
AlertList = AlertTab.Label({Text = "Error3! - ODV/VT"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Possible Causes"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Your Version Is Invalid Update At Discord Server"})
wait(0.1)
AlertList = AlertTab.Label({Text = "You Copied The Script Falsely"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Still Need Help? Join The Discord - https://discord.gg/DYkHGnYeDp"})
wait(0.1)
AlertListCopy = AlertTab.Button({Text = "Click To Copy Invite", function()
    setclipboard('https://discord.gg/DYkHGnYeDp')
end, })
	
elseif game.PlaceId ~= 237590657 or game.PlaceId ~= 1228674372 or game.PlaceId ~= 237590761 or game.PlaceId ~= 1600503 or game.PlaceId ~= 237590761 or game.PlaceId ~= 2866967438 or game.PlaceId ~= 69184822 or game.PlaceId ~= 54865335 and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and IsPatched and ScreenCheckX and ScreenCheckY then
AlertList = AlertTab.Label({Text = "Error4! - NG/WD"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Possible Causes"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Your Game Isint Supported"})
wait(0.1)
AlertList = AlertTab.Label({Text = "The Game Wasent Detected"})
wait(0.1)
AlertList = AlertTab.Label({Text = "You Have Been Teleported To Another Game"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Still Need Help? Join The Discord - https://discord.gg/DYkHGnYeDp"})
wait(0.1)
AlertListCopy = AlertTab.Button({Text = "Click To Copy Invite", function()
    setclipboard('https://discord.gg/DYkHGnYeDp')
end, })
	
AlertList = AlertTab.Label({Text = "Loading Universal Version In 10 Secs"})
wait(10)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/UniversalScript.lua", true))()

elseif IsAGameThatWorks and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and DOORSISPATCHED == true or TPT2ISPATCHED == true or UDISPATCHED == true or APOCISPATCHED == true or FSISPATCHED == true and ScreenCheckX and ScreenCheckY then
AlertList = AlertTab.Label({Text = "Error5! - SIP"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Possible Causes"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Script Is Patched"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Your Using A Modded Version Of The Script"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Still Need Help? Join The Discord - https://discord.gg/DYkHGnYeDp"})
wait(0.1)
AlertListCopy = AlertTab.Button({Text = "Click To Copy Invite", function()
    setclipboard('https://discord.gg/DYkHGnYeDp')
end, })
	
elseif IsAGameThatWorks and ScreenSizeX == nil or ScreenSizeX == nan or ScreenSizeY == nil or ScreenSizeY == nan and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and IsAGameThatWorks then
AlertList = AlertTab.Label({Text = "Error6! - BSX/BSY"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Possible Causes"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Screensize Is nan or nil"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Screensize Is Invalid"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Still Need Help? Join The Discord - https://discord.gg/DYkHGnYeDp"})
wait(0.1)
AlertListCopy = AlertTab.Button({Text = "Click To Copy Invite", function()
    setclipboard('https://discord.gg/DYkHGnYeDp')
end, })
	
end

--]--End Of Script
