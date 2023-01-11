FAILEDLOADING = false
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Module.lua"))()
local UI = Library.Load({
	Title = "Fishing Simulator V3",
	Style = 3,
        SizeX = ScreenSizeX,
	SizeY = ScreenSizeY,
	Theme = Theme,
	ColorOverrides = {
		MainFrame = Color3.fromRGB(235,235,235 ),
		Minimise = Color3.fromRGB(0, 0, 0 )
	}
})
--[--Set Values/Guis
local CoolDown = nil
local CaughtTime = nil

local Welcome = UI.New({
	Title = "Info {👋}"
})
local Local = UI.New({
	Title = "Local {👤}"
})
local People = UI.New({
	Title = "Other {👥}"
})
local Automatic = UI.New({
	Title = "Automatic {🤖}"
})
local Buy = UI.New({
	Title = "Buy {💲}"
})
local Teleport = UI.New({
	Title = "Teleport {🌀}"
})
local Extra = UI.New({
	Title = "Extra {❓}"
})
local Config = UI.New({
	Title = "Config {⚙️}"
})
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

--Start Of Code
if PremiumKey == "EJOHFDNSIBTREKPQWNDIASDHUBEJNOWBNTEORBNJSACNJOSVNIDASNOVUESNAVUBORTB" then
WelcomeI = Welcome.Label({Text = "Premium is True"})
	Premium = true
	PremiumUI = UI.New({Title = "Premium {💎}"})
else
WelcomeI = Welcome.Label({Text = "Premium is false"})
	Premium = false
end

WelcomeI = Welcome.Label({Text = "Version : V3 (Current Gui)"})
WelcomeI = Welcome.Label({Text = "Update Includes - Ui Changes"})
WelcomeI = Welcome.Label({Text = "--// --// --// --// --// --// --// --// --// --// --// --// --// --// --// --// --// --// --// --// --// --// --// --// --//"})
WelcomeI = Welcome.Label({Text = "Need Help? Join The Discord - https://discord.gg/DYkHGnYeDp"})

WelcomeI = Welcome.Button({
	Text = "Click To Copy Invite",
	Callback = function()
		setclipboard('https://discord.gg/DYkHGnYeDp')
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "nil"
			})
		end
	}
})
--]--End Of Welcome



--[--Local

--Start Of Code

LocalI = Local.TextField({
	Text = "Walk Speed",
	Callback = function(v)
		SetWalkSpeed(v)
	end,
	Menu = {
		Normal = function(self)
			self.SetText("16")
			SetWalkSpeed(16)
		end
	}
})
LocalI = Local.TextField({
	Text = "Jump Power",
	Callback = function(v)
		SetJumpPower(v)
	end,
	Menu = {
		Normal = function(self)
			self.SetText("50")
			SetJumpPower(50)
		end
	}
})

LocalI = Local.TextField({
	Text = "Cooldown (JP)",
	Callback = function(v)
		CoolDownJP = v
	end,
	Menu = {
		Normal = function(self)
			self.SetText("0.5")
			CoolDownJP = 0.5
		end
	}
})

LocalI = Local.Toggle({
	Text = "No Clip",
	Callback = function(Value)
		if Value then
			NoClip = true
		else
			NoClip = false
		end
	end,
	Enabled = false
})
LocalI = Local.Toggle({
	Text = "InfJump",
	Callback = function(Value)
		if Value then
			InfiniteJump = true
		else
			InfiniteJump = false
		end
	end,
	Enabled = false
})

--]--End Of Local



--[--Other

--Start Of Code
OtherI = People.Toggle({
	Text = "ToggleESP",
	Callback = function(Value)
	end,
	Enabled = false
})

OtherI = People.ChipSet({
	Text = "ESP Options",
	Callback = function(ChipSet)
		table.foreach(ChipSet, function(Option, Value)
			print(Option, Value)
		end)
	end,
	Options = {
		PlayerESP = false,
		FriendESP = false,
		BoatESP = false,
		ChestESP = false,
		SharkESP = false,
		OrcaESP = false,
	}
})
--]--End Of Other



--[--Automatic

--Start Of Code
AutoIInfo = Automatic.Label({Text = "Warning: can couse issues or kick you"})

AutoI = Automatic.TextField({
	Text = "Cooldown (CT)",
	Callback = function(v)
		CoolDownCT = v
	end,
	Menu = {
		Normal = function(self)
			self.SetText("2.6")
			CoolDownCT = 2.6
		end
	}
})

AutoI = Automatic.Toggle({
	Text = "Fast Catch",
	Callback = function(Value)
		while Value do
			game:GetService("ReplicatedStorage").CloudFrameShared.Communication.Events.FishedDone:FireServer()
			wait(2.6)
			game:GetService("ReplicatedStorage").CloudFrameShared.Communication.Events.ResetFishingRod:FireServer()
		end
	end,
	Enabled = false
})

AutoIInfo = Automatic.Label({Text = "Throw fishing rod in water"})
AutoI = Automatic.Toggle({
	Text = "AutoCaught",
	Callback = function(Value)
		while Value do
			wait(2.6)
			game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.FishCaught:FireServer()
		end
	end,
	Enabled = false
})

AutoIInfo = Automatic.Label({Text = "AutoSells Sellebol Items"})
AutoI = Automatic.Toggle({
	Text = "AutoSell",
	Callback = function(Value)
		while Value do
			wait(CoolDownCT)
			game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.processGameItemSold:InvokeServer("SellEverything")
		end
	end,
	Enabled = false
})

AutoIInfo = Automatic.Label({Text = "Equip Spear"})
AutoI = Automatic.Toggle({Text = "Auto Kill", Callback = function(bool)
    ToggleThis = bool
     if ToggleThis == true then
     for i, v in pairs(game.Workspace:GetChildren()) do
     if v:FindFirstChild("Health") and v:FindFirstChild("IsSeaMonster") and v.Name == "GreatWhiteShark" or v.Name == "BigGreatWhiteShark" or v.Name == "KillerWhale" or v.Name == "NeonGreatWhiteShark" then
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
 
 
                    for i, getTools in pairs(player.Character:GetChildren()) do
                        if getTools:IsA("Tool") and  getTools:FindFirstChild("GripC1") then
                            plrTools = getTools.Name
                        end
                    end
 
                    teleport(v.HumanoidRootPart.CFrame + Vector3.new(0, 30, 0))
                    wait(0.25)
                    game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.MonsterHit:FireServer(workspace[v.Name], tostring(plrTools), true)
                    break
                elseif not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
 
               break
            end
        end
     end
    else
          teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))
        end
end, Enabled = false})

--]--End Of Automatic



--[--Teleport/Buy

--Start Of Code
BANDTI = Buy.Label({Text = "Select Egg Then Press Buy"})
BANDTI = Buy.Dropdown({
	Text = "Egg",
	Callback = function(Value)
		eggs = Value
	end,
	Options = {
		"Normal",
		"Stone",
		"Silver",
		"Gold",
		"Void",
		"Royals"
	},
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Select an egg then press buy"
			})
		end
	}
})
BANDTI = Buy.Button({
	Text = "Buy",
	Callback = function(Value)
		if Value == "Royal" then
			game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("royalegg")
		elseif Value == "Normal" then
			game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("normalegg")
		elseif Value == "Ruby" then
			game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("rubyegg")
		elseif Value == "Void" then
			game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("voidegg")
		elseif Value == "Silver" then
			game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("silverchest")
		elseif Value == "Stone" then
			game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("stonechest")
		elseif Value == "Gold" then
			game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("goldchest")
		end
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Select an egg then press buy"
			})
		end
	}
})

BANDTI = Teleport.Label({Text = "Select Location And Press Teleport"})
BANDTI = Teleport.Dropdown({
	Text = "Location Store",
	Callback = function(Value)
		TPM2sTeleportLocation = Value
	end,
	Options = {
		"None",
		"Boat Store",
		"Raygan's Tavern",
		"Supplies Store",
		"Pets Store",
	},
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Select an store then press teleport"
			})
		end
	}
})
BANDTI = Teleport.Dropdown({
	Text = "Location",
	Callback = function(Value)
		TPM2TeleportLocation = Value
	end,
	Options = {
		"None",
		"Port Jackson",
		"Ancient Shores",
		"Pharaoh's Dunes",
		"Eruption Island",
		"Suken Ship",
	},
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Select an location then press teleport"
			})
		end
	}
})
BANDTI = Teleport.Button({
	Text = "Teleport",
	Callback = function(Value)
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
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Select an location then press buy"
			})
		end
	}
})

BANDTI = Teleport.Label({Text = "Teleports to Boat"})
BANDTI = Teleport.Button({
	Text = "TP To Boat",
	Callback = function()
	for i, v in pairs(game.Workspace:GetChildren()) do
		if v.Name == (game.Players.LocalPlayer.Name .. "'s Boat") then
             teleport(v.Controller.VehicleSeat.CFrame + Vector3.new(0, 3, 0))
        end
      end
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Teleports to your boat"
			})
		end
	}
})
--]--End Of Teleport/Buy



--[--Extra

--Start Of Code

ExtraI = Extra.Slider({
	Text = "Boat Speed",
	Callback = function(Value)
	for i, v in pairs(game.Workspace:GetChildren()) do
        if v.Name == (game.Players.LocalPlayer.Name .. "'s Boat") then
             v.Controller.VehicleSeat.MaxSpeed = Value
         end
       end  
	end,
	Min = 1,
	Max = 500,
	Def = 70
})

ExtraI = Extra.ChipSet({
	Text = "Atmosphere/Other",
	Callback = function(ChipSet)
		table.foreach(ChipSet, function(Option, Value)
			print(Option, Value)
		end)
	end,
	Options = {
		RemoveBorders = false,
		RemoveBoatBorders = false,
		RemoveFog = false,
	}
})

--fog
--game.Lighting.FogEnd = 1000000
--Remove Boat Borders
--for i, v in pairs(game.Workspace.IgnoredByMouse.BoatBorders:GetChildren()) do
--	v:Destroy()
--Remove Borders
--for i, v in pairs(game.Workspace.IgnoredByMouse.LockedAreas:GetDescendants()) do 
--	v:Destroy()

ExtraI = Extra.Label({Text = "Will AutoOpen The Chest If Toggled"})
ExtraI = Extra.Toggle({
	Text = "AutoOpen Chests",
	Callback = function(Value)
		if Value then
		autoopenchest = true
		else
		autoopenchest = false
		end
	end,
	Enabled = false
})

ExtraI = Extra.Label({Text = "Press To Teleport To Chest"})
ExtraI = Extra.Button({
	Text = "Daily Chest",
	Callback = function()
                for i, v in pairs(game.Workspace.Islands:GetDescendants()) do
                    if v:IsA("Model") and string.match(v.Name, "Chest") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                        wait(1)
                        if autoopenchest == true then
                        fireproximityprompt(v.HumanoidRootPart.ProximityPrompt)
                        end
                    end
                end 
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Teleports to daily chest"
			})
		end
	}
})
ExtraI = Extra.Button({
	Text = "Random Chest",
	Callback = function()
            for i, v in pairs(game.Workspace.RandomChests:GetDescendants()) do
                    if v:IsA("Model") and string.match(v.Name, "Chest") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                        wait(1)
                        if autoopenchest == true then
                        fireproximityprompt(v.HumanoidRootPart.ProximityPrompt)
                        end
                    end
                end 
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Teleports to random chest"
			})
		end
	}
})
ExtraI = Extra.Button({
	Text = "Suken Chest",
	Callback = function()
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
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Teleports to suken chest"
			})
		end
	}
})
--]--End Of Extra



--[--Config

--Start Of Code
ConfigI = Config.Button({
	Text = "Save Settings",
	Callback = function()
		print("hello")
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Saves all settings"
			})
		end
	}
})
ConfigI = Config.Button({
	Text = "Load Settings",
	Callback = function()
		print("hello")
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Loads saved settings"
			})
		end
	}
})
ConfigI = Config.Button({
	Text = "Beta Test Login/Register Gui",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/login.lua", true))()
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Give us feedback in discord"
			})
		end
	}
})
ConfigI = Config.Button({
	Text = "Restart Agony",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/LoadModules.lua", true))()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Setup.lua", true))()
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Restarts Agony"
			})
		end
	}
})
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
--Actual Fixes
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/log.lua", true))()
--]--End Of Fix
