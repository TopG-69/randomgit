local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Module.lua"))()
local UI = Library.Load({
	Title = "Fishing Simulator",
	Style = 1,
	SizeX = 600,
	SizeY = 400,
	Theme = "Light",
	ColorOverrides = {
		MainFrame = Color3.fromRGB(25,25,25 ),
		Minimise = Color3.fromRGB(0, 0, 0 )
	}
})

WelcomeUI = UI.New({Title = "Welcome"})

if PremiumKey == "EJOHFDNSIBTREKPQWNDIASDHUBEJNOWBNTEORBNJSACNJOSVNIDASNOVUESNAVUBORTB" then
WelcomeI = WelcomeUI.Label({Text = "Premium is True"})
	local Premium = true
else
WelcomeI = WelcomeUI.Label({Text = "Premium is false"})
	local Premium = false
end

WelcomeI = WelcomeUI.SliderDot({Text = "Click To Copy Invite", function()
    setclipboard("https://discord.gg/DYkHGnYeDp")
end, })
