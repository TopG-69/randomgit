local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Module.lua"))()
local UI = Library.Load({
	Title = "Fishing Simulator",
	Style = 1,
	SizeX = 600,
	SizeY = 400,
	Theme = Theme,
	ColorOverrides = {
		MainFrame = Color3.fromRGB(25,25,25 ),
		Minimise = Color3.fromRGB(0, 0, 0 )
	}
})
--[--Functions
local runservice = game:GetService("RunService")
local player = game:GetService("Players").LocalPlayer
runservice.Stepped:Connect(function()
for i,v in pairs(player.Character:GetDescendants()) do
if v:IsA("BasePart") then
if NoClip then
v.CanCollide = false
end
end
end
end)

function SetWalkSpeed(value)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end

function SetJumpPower(value)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end

function RestoreWSJP()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end
--]--End Of Functions



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

WelcomeI = WelcomeUI.Button({Text = "Click To Copy Invite", function()
    setclipboard("https://discord.gg/DYkHGnYeDp")
end, })
--]--End Of Welcome



--[--Local
LocalUI = UI.New({Title = "Local"})

--Start Of Code
LocalI = LocalUI.TextField({Text = "WalkSpeed", Callback = function(v)
	SetWalkSpeed(v)
end, })

LocalI = LocalUI.TextField({Text = "JumpPower", Callback = function(v)
	SetJumpPower(v)
end, })

LocalI = LocalUI.Button({Text = "Restore WS/JP", Callback = function()
        RestoreWSJP()
end, })

LocalI = LocalUI.Toggle({Text = "No Clip", Callback = function(v)
       if v then
         NoClip = true
       elseif not v then
	 NoClip = false
    end
end, Enabled = false})
--]--End Of Local



--[--Automatic
AutoUI = UI.New({Title = "Automatic"})

--Start Of Code
--]--End Of Automatic



--[--Extra
ExtraUI = UI.New({Title = "Extra"})

--Start Of Code
--]--End Of Extra



--[--Config
ConfigUI = UI.New({Title = "Config"})

--Start Of Code
--]--End Of Config



--[--Premium
--*

--Start Of Code
PremiumI = PremiumUI.Label({Text = "No Options Yet"})
--]--End Of Premium
