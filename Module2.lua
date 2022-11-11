local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Module.lua"))()
local UI = Library.Load({
	Title = "Fishing Simulator - Script By ?...",
	Style = 1,
	SizeX = 600,
	SizeY = 400,
	Theme = "Light",
	ColorOverrides = {
		MainFrame = Color3.fromRGB(25,25,25 ),
		Minimise = Color3.fromRGB(0, 0, 0 )
	}
})

Alert = UI.New({Title = "Welcome"})
if PremiumKey = "EJOHFDNSIBTREKPQWNDIASDHUBEJNOWBNTEORBNJSACNJOSVNIDASNOVUESNAVUBORTB" then
AlertUI = Alert.Label({Text = "Premium is True"})
	local Premium = true
Else
AlertUI = Alert.Label({Text = "Premium is false"})
	local Premium = false
end
