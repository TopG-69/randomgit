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
--[--Sound
local s = Instance.new ("Sound", workspace)
s.SoundId = 'rbxassetid://530637073'
s.Volume = 1
s:Play()
--]--End Of Sound

--[--Welcome
WelcomeUI = UI.New({Title = "Welcome"})

--Start Of Code
if PremiumKey == "EJOHFDNSIBTREKPQWNDIASDHUBEJNOWBNTEORBNJSACNJOSVNIDASNOVUESNAVUBORTB" then
WelcomeI = WelcomeUI.Label({Text = "Premium is True"})
	Premium = true
	PremiumUI = UI.New({Title = "Premium"})
else
WelcomeI = WelcomeUI.Label({Text = "Premium is false"})
	Premium = false
end

WelcomeI = WelcomeUI.CircleButton({Text = "Click To Copy Invite", function()
    setclipboard("https://discord.gg/DYkHGnYeDp")
end, })
--]--End Of Welcome



--[--Premium
--*

--Start Of Code
PremiumI = PremiumUI.Label({Text = "No Options Yet"})
--]--End Of Premium
