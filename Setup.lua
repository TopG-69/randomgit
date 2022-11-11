local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Module.lua"))()
local UI = Library.Load({
	Title = "MultiRobloxScript",
	Style = 1,
	SizeX = 600,
	SizeY = 400,
	Theme = Theme,
	ColorOverrides = {
		MainFrame = Color3.fromRGB(25,25,25 ),
		Minimise = Color3.fromRGB(0, 0, 0 )
	}
})
--[--Run Checks
--]--Finished

--[--Setup
AlertTab = UI.New({Title = "Alerts"})
wait(0.1)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Version.lua", true))()
BrokenThemes = Theme ~= "Aqua" or Theme ~= "Light" or Theme ~= "Dark" or Theme ~= "Jester" or Theme ~= "Mocha" or Theme == nil
FixedThemes = Theme == "Aqua" or Theme == "Light" or Theme == "Dark" or Theme == "Jester" or Theme == "Mocha"
--]--End Of Setup

--[--Script
if game.PlaceId == 2866967438 and OUTDATEDVERSION == false and Discord_Key == "123" and FixedThemes then
AlertList = AlertTab.Label({Text = "Fishing Simulator Script Is Loading"})
wait(5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Fishing%20Simulator.lua", true))()
elseif game.PlaceId == 69184822 and OUTDATEDVERSION == false and Discord_Key == "123" and FixedThemes then
AlertList = AlertTab.Label({Text = "Theme Park Tycoon 2 Script Is Loading"})
wait(5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/ThemeParkTycoon2.lua", true))()
elseif game.PlaceId == 54865335 and OUTDATEDVERSION == false and Discord_Key == "123" and FixedThemes then
AlertList = AlertTab.Label({Text = "Ultimate Driving Script Is Loading"})
wait(5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Ultimate%20Driving.lua", true))()
elseif BrokenThemes then
AlertList = AlertTab.Label({Text = "Error1! - NT"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Possible Causes"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Your Inputted Color Is Wrong"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Your Missing Theme ="})
wait(0.1)
AlertList = AlertTab.Label({Text = "To Disable This Error Put Theme = 1"})
wait(0.1)
AlertList = AlertTab.Label({Text = "Still Need Help? Join The Discord - https://discord.gg/DYkHGnYeDp"})
wait(0.1)
AlertListCopy = AlertTab.Button({Text = "Click To Copy Invite", function()
    setclipboard("https://discord.gg/DYkHGnYeDp")
end, })
elseif Discord_Key ~= "123" and FixedThemes then
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
    setclipboard("https://discord.gg/DYkHGnYeDp")
end, })
elseif OUTDATEDVERSION == true and Discord_Key == "123" and FixedThemes then
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
    setclipboard("https://discord.gg/DYkHGnYeDp")
end, })
elseif game.PlaceId ~= 2866967438 or game.PlaceId == 69184822 or game.PlaceId == 54865335 and OUTDATEDVERSION == false and Discord_Key == "123" and FixedThemes then
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
    setclipboard("https://discord.gg/DYkHGnYeDp")
end, })
end
--]--End Of Script
