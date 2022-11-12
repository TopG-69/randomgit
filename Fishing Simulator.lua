local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Module.lua"))()
local UI = Library.Load({
	Title = "Fishing Simulator",
	Style = 1,
	SizeX = ScreenSizeX,
	SizeY = ScreenSizeY,
	Theme = Theme,
	ColorOverrides = {
		MainFrame = Color3.fromRGB(25,25,25 ),
		Minimise = Color3.fromRGB(0, 0, 0 )
	}
})
--[--Set Values
local CoolDown = nan
--]--End Of Set Values



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

game:GetService("UserInputService").JumpRequest:connect(function()
if InfiniteJump then
game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
wait(CoolDown)
end
end)

function SetWalkSpeed(value)
if value == nan or value == nil then
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
else
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end
end
	
function SetJumpPower(value)
if value == nan or value == nil then
game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
else
game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end
end

function RestoreWSJP()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end

if God then
	local Cam = workspace.CurrentCamera
	local Pos, Char = Cam.CFrame, speaker.Character
	local Human = Char and Char.FindFirstChildWhichIsA(Char, "Humanoid")
	local nHuman = Human.Clone(Human)
	nHuman.Parent, speaker.Character = Char, nil
	nHuman.SetStateEnabled(nHuman, 15, false)
	nHuman.SetStateEnabled(nHuman, 1, false)
	nHuman.SetStateEnabled(nHuman, 0, false)
	nHuman.BreakJointsOnDeath, Human = true, Human.Destroy(Human)
	speaker.Character, Cam.CameraSubject, Cam.CFrame = Char, nHuman, wait() and Pos
	nHuman.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	local Script = Char.FindFirstChild(Char, "Animate")
	if Script then
		Script.Disabled = true
		wait()
		Script.Disabled = false
	end
	nHuman.Health = nHuman.MaxHealth
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

PremiumUI = WelcomeUI.Label({Text = "Updated : To V2"})
PremiumUI = WelcomeUI.Label({Text = "Update Includes - Updates To Automatic Tab"})
PremiumUI = WelcomeUI.Label({Text = "AutoCaught - Auto Catches Fish"})
PremiumUI = WelcomeUI.Label({Text = "AutoSell - Automaticly Sells Items"})

WelcomeI = WelcomeUI.Button({Text = "Click To Copy Invite", function()
    setclipboard("https://discord.gg/DYkHGnYeDp")
end, })
--]--End Of Welcome



--[--Local
LocalUI = UI.New({Title = "Local"})

--Start Of Code
LocalI = LocalUI.TextField({Text = "WalkSpeed", Callback = function(v)
	SetWalkSpeed(v)
	LoopValueOfWSpeed = v
end, })

LocalI = LocalUI.TextField({Text = "JumpPower", Callback = function(v)
	SetJumpPower(v)
	LoopValueOfJumpP = v
end, })

LocalI = LocalUI.Button({Text = "Restore WS/JP", Callback = function()
        RestoreWSJP()
end, })

LocalI = LocalUI.TextField({Text = "Cooldown -Applys To InfJump", Callback = function(v)
	if CoolDown == nil or CoolDown == nan then
        CoolDown = 0.1
	else
	CoolDown = v
   end		
end, })

LocalI = LocalUI.Toggle({Text = "Loop WalkSpeed", Callback = function()
    SetWalkSpeed(LoopValueOfWSpeed)
end, Enabled = false})

LocalI = LocalUI.Toggle({Text = "Loop JumpPower", Callback = function()
    SetJumpPower(LoopValueOfJumpP)
end, Enabled = false})

LocalI = LocalUI.Toggle({Text = "No Clip", Callback = function(v)
       if v then
         NoClip = true
       elseif not v then
	 NoClip = false
    end
end, Enabled = false})

LocalI = LocalUI.Toggle({Text = "Inf Jump", Callback = function(v)
       if v then
         InfiniteJump = true
       elseif not v then
	 InfiniteJump = false
    end
end, Enabled = false})

LocalI = LocalUI.Toggle({Text = "Fly - Will Be Added Sometime", Callback = function(v)
       if v then
         Fly = true
       elseif not v then
	 Fly = false
    end
end, Enabled = false})
--]--End Of Local



--[--Automatic
AutoUI = UI.New({Title = "Automatic"})

--Start Of Code
AutoIInfo = AutoUI.Label({Text = "Usage Equip FishingRod Then Throw The Fishing Line"})
AutoI = AutoUI.Toggle({Text = "AutoCaught", Callback = function(v)
       while v do
        wait(2.6)
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.FishCaught:FireServer()
    end
end, Enabled = false})

AutoIInfo = AutoUI.Label({Text = "Have Items In Your Hotbar Or Inventory"})
AutoI = AutoUI.Toggle({Text = "AutoSell", Callback = function(v)
       while v do
        wait(2.6)
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.processGameItemSold:InvokeServer("SellEverything")
    end
end, Enabled = false})
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
--Will Be Shown Once Premium Is Active

--Start Of Code
PremiumI = PremiumUI.Label({Text = "Experimental Setting"})

PremiumI = PremiumUI.Toggle({Text = "God", Callback = function(v)
       if v then
         God = true
       elseif not v then
	 God = false
    end
end, Enabled = false})
--]--End Of Premium



--[--Fix
wait(0.1)
RestoreWSJP()
--]--End Of Fix
