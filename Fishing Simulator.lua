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
local CoolDown = nil
local CaughtTime = nil
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

function teleport(loc)
    bLocation = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    if game.Players.LocalPlayer.Character.Humanoid.Sit then
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
    end
    wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = loc
end

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

WelcomeI = WelcomeUI.Label({Text = "Updated : To V2"})
WelcomeI = WelcomeUI.Label({Text = "Update Includes - Updates To Automatic Tab"})
WelcomeI = WelcomeUI.Label({Text = "AutoCaught - Auto Catches Fish"})
WelcomeI = WelcomeUI.Label({Text = "AutoSell - Automaticly Sells Items"})
WelcomeI = WelcomeUI.Label({Text = "Fast Caught/Sell - Will Make It So There Is No Delay While Those 2 Settings Are On"})
WelcomeI = WelcomeUI.Label({Text = "Need Help? Join The Discord - https://discord.gg/DYkHGnYeDp"})

WelcomeI = WelcomeUI.Button({Text = "Click To Copy Invite", function()
    setclipboard('https://discord.gg/DYkHGnYeDp')
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
AutoIInfo = AutoUI.Label({Text = "Warning You Might Get Kicked | Req The Setting To Be Turned On!"})
AutoI = AutoUI.Toggle({Text = "Fast Caught/Sell", Callback = function(v)
       if v then
       CaughtTime = 0.1
       else
       CaughtTime = 2.6
    end
end, Enabled = false})

AutoI = AutoUI.Toggle({Text = "Fast Catch", Callback = function(v)
       while v do
        game:GetService("ReplicatedStorage").CloudFrameShared.Communication.Events.FishedDone:FireServer()
		wait()
		game:GetService("ReplicatedStorage").CloudFrameShared.Communication.Events.ResetFishingRod:FireServer()
    end
end, Enabled = false})

AutoIInfo = AutoUI.Label({Text = "Usage Equip FishingRod Then Throw The Fishing Line"})
AutoI = AutoUI.Toggle({Text = "AutoCaught", Callback = function(v)
       while v do
        wait(CaughtTime)
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.FishCaught:FireServer()
    end
end, Enabled = false})

AutoIInfo = AutoUI.Label({Text = "Have Items In Your Hotbar Or Inventory"})
AutoI = AutoUI.Toggle({Text = "AutoSell", Callback = function(v)
       while v do
        wait(CaughtTime)
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.processGameItemSold:InvokeServer("SellEverything")
    end
end, Enabled = false})
--]--End Of Automatic



--[--Teleport/Buy
BANDTUI = UI.New({Title = "Buy/Teleport"})
egglist = {"Royals","Normal","Ruby", "Void", "Silver", "Stone", "Gold"}
TeleportLocations1 = {"Port Jackson", "Ancient Shores", "Shadow Isles", "Pharaoh's Dunes", "Eruption Island", "Monster's Borough", "Suken Ship", "None"}
TeleportLocations2 = {"Pets Store", "Supplies Store", "Raygan's Tavern", "Boat Store", "None"}

--Start Of Code
BANDTI = BANDTUI.Label({Text = "Select Egg Then Press Buy"})

BANDTI = BANDTUI.Dropdown({Text = "Egg ", Callback = function(v)
     eggs = v
end, Options = egglist})

BANDTI = BANDTUI.Button({Text = "Buy", Callback = function()
        if eggs == "Royal" then
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("royalegg")    
        elseif eggs == "Normal" then
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("normalegg")   
        elseif eggs == "Ruby" then
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("rubyegg")   
        elseif eggs == "Void" then
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("voidegg")
        elseif eggs == "Silver" then
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("silverchest")
        elseif eggs == "Stone" then
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("stonechest")    
        elseif eggs == "Gold" then
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("goldchest")            
    end
end, })

BANDTI = BANDTUI.Label({Text = "Select Location And Press Teleport / Choose None Once Done"})

BANDTI = BANDTUI.Dropdown({Text = "Teleport Location ", Callback = function(v)
     TPM2TeleportLocation = v
end, Options = TeleportLocations1})

BANDTI = BANDTUI.Dropdown({Text = "Teleport Store ", Callback = function(v)
     TPM2sTeleportLocation = v
end, Options = TeleportLocations2})

BANDTI = BANDTUI.Button({Text = "Teleport", Callback = function()
        if TPM2sTeleportLocation == "Boat Store" then
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.EnterDoor:InvokeServer("BoatShopInterior", "Inside")
        elseif TPM2sTeleportLocation == "Raygan's Tavern" then
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.EnterDoor:InvokeServer("TavernInterior", "Inside")
        elseif TPM2sTeleportLocation == "Supplies Store" then
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.EnterDoor:InvokeServer("SuppliesStoreInterior", "Inside")  
        elseif TPM2sTeleportLocation == "Pets Store" then
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.EnterDoor:InvokeServer("PetShop", "MainEntrance")
        elseif TPM2TeleportLocation == "Port Jackson" then
        teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))           
        elseif TPM2TeleportLocation == "Ancient Shores" then
        teleport(CFrame.new(-2436.431640625, 43.564971923828, -1683.4526367188))    
        elseif TPM2TeleportLocation == "Shadow Isles" then
        teleport(CFrame.new(2196.9926757812, 43.491630554199, -2216.4543457031))    
        elseif TPM2TeleportLocation == "Pharaoh's Dunes" then
        teleport(CFrame.new(-4142.74609375, 46.71378326416, 262.05679321289))
        elseif TPM2TeleportLocation == "Eruption Island" then
        teleport(CFrame.new(3022.9311523438, 52.347640991211, 1323.74609375))
        elseif TPM2TeleportLocation == "Monster's Borough" then
        teleport(CFrame.new(-3211.9047851562, 41.850345611572, 2735.306640625))  
        elseif TPM2TeleportLocation == "Suken Ship" then
             for i, v in pairs(game.Workspace:GetChildren()) do
                if string.find(v.Name, "ShipModel") then
                        teleport(v.HitBox.CFrame)
                    break
                 end
              end                               
    end
end, })

BANDTI = BANDTUI.Label({Text = "Boat"})

BANDTI = BANDTUI.Button({Text = "TP To Boat", Callback = function()
    for i, v in pairs(game.Workspace:GetChildren()) do
        if v.Name == (game.Players.LocalPlayer.Name .. "'s Boat") then
             teleport(v.Controller.VehicleSeat.CFrame + Vector3.new(0, 3, 0))
        end
    end
end, })

BANDTI = BANDTUI.TextField({Text = "Boat Speed", Callback = function(VA)
 for i, v in pairs(game.Workspace:GetChildren()) do
        if v.Name == (game.Players.LocalPlayer.Name .. "'s Boat") then
             v.Controller.VehicleSeat.MaxSpeed = VA
         end
    end  
end, })
--]--End Of Teleport/Buy



--[--Extra
ExtraUI = UI.New({Title = "Extra"})

--Start Of Code
ExtraI = ExtraUI.Label({Text = "Atmosphere/Other"})
ExtraI = ExtraUI.Button({Text = "Remove Borders", Callback = function()
		for i, v in pairs(game.Workspace.IgnoredByMouse.LockedAreas:GetDescendants()) do 
			v:Destroy()
    end
end, })

ExtraI = ExtraUI.Button({Text = "Remove Boat Borders", Callback = function()
    for i, v in pairs(game.Workspace.IgnoredByMouse.BoatBorders:GetChildren()) do
        v:Destroy()
    end
end, })

ExtraI = ExtraUI.Button({Text = "Remove Fog", Callback = function()
    game.Lighting.FogEnd = 1000000
end, })

ExtraI = ExtraUI.Label({Text = "Will AutoOpen The Chest If Toggled"})

ExtraI = ExtraUI.Toggle({Text = "AutoOpen Chests", Callback = function(TOG)
if TOG then
autoopenchest = true
else
autoopenchest = false
end
end, Enabled = false})

ExtraI = ExtraUI.Label({Text = "Press To Teleport To Chest / If Your Outside Map Use No-Clip"})

ExtraI = ExtraUI.Button({Text = "Daily Chest", Callback = function()
                for i, v in pairs(game.Workspace.Islands:GetDescendants()) do
                    if v:IsA("Model") and string.match(v.Name, "Chest") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                        wait(1)
                        if autoopenchest == true then
                        fireproximityprompt(v.HumanoidRootPart.ProximityPrompt)
                        end
                    end
                end            
end, })
 
ExtraI = ExtraUI.Button({Text = "Random Chest", Callback = function()
                for i, v in pairs(game.Workspace.RandomChests:GetDescendants()) do
                    if v:IsA("Model") and string.match(v.Name, "Chest") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                        wait(1)
                        if autoopenchest == true then
                        fireproximityprompt(v.HumanoidRootPart.ProximityPrompt)
                        end
                    end
                end            
end, })
 
ExtraI = ExtraUI.Button({Text = "Suken Chest", Callback = function()
            wait(1)
             for i, v in pairs(game.Workspace:GetChildren()) do
                if string.find(v.Name, "ShipModel") then
                        teleport(v.HitBox.CFrame)
                        for i, x in pairs(v:GetChildren()) do
                            if string.match(x.Name, "Chest_") then
                                teleport(x.HumanoidRootPart.CFrame)
                                wait(1)
                                if autoopenchest == true then
                                fireproximityprompt(x.HumanoidRootPart.ProximityPrompt)   
                                end
                            end                                
                        end
                    break
                 end
              end
end, })
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
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/log.lua", true))()
RestoreWSJP()
--]--End Of Fix
