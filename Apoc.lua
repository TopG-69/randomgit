--[[
               ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
               ┃┃ ━━━ ┃┃\  \━\    /━/ |━|━━━\   /┃┃ ━━━ ┃┃
               ┃┃     ┃┃    \ \  / /  | | O |    ┃┃     ┃┃
               ┃┃     ┃┃     \ \/ /   | |___/    ┃┃     ┃┃
               ┃┃     ┃┃     / /\ \   | |\ \     ┃┃     ┃┃
               ┃┃     ┃┃    / /  \ \  | | \ \    ┃┃     ┃┃
               ┃┃ ━━━ ┃┃/  /━/    \━\ |━|  \ \  \┃┃ ━━━ ┃┃
               ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
┃─────────────────────────────────────────────────────────────────────────┃
 -\           ┃                                                         /-
              ┃
   XR Founder ┃ Aurora Vibes - [AR1 / AR2]
   XR Founder ┃ empire - [?]
   XR Founder ┃ Rebo3rn - [?]
              ┃
 -/           ┃                                                         \-
┃─────────────────────────────────────────────────────────────────────────┃
 -\           ┃                                                         /-
              ┃
   DEV        ┃ audiszy - [?]
   DEV        ┃ Aurora Vibes - [AR1 / AR2]
   DEV        ┃ Death X Angel - [AR1]
   DEV        ┃ glator - [?]
   DEV        ┃ PinkyPeaker - [?]
   DEV        ┃ Rebo3rn - [?]
   DEV        ┃ Tunex - [?]
              ┃
 -/           ┃                                                         \-
┃─────────────────────────────────────────────────────────────────────────┃
 -\           ┃                                                         /-
              ┃
   SUPPORT    ┃ Death X Angel
   SUPPORT    ┃ VastGuner
              ┃
 -/           ┃                                                         \-
┃─────────────────────────────────────────────────────────────────────────┃
               ╰                                          ╯
]]--


local function callback(Text)
 if Text == "Button1 text" then
  print ("Answer")
elseif Text == ("Button2 text") then
 print ("Answer2")
 end
end

local NotificationBindable = Instance.new("BindableFunction")
NotificationBindable.OnInvoke = callback

game.StarterGui:SetCore("SendNotification",  {
 Title = "XR";
 Text = "New Version of XR";
 Icon = "";
 Duration = 10000;
 Button1 = "ok";
 Callback = NotificationBindable;
})


local library = loadstring(game:HttpGet("https://pastebin.com/raw/yKdTYbTe")) ()
--local library2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/HELLLO1073/Roblox-scripts-2.0/main/UIS/venyxUI-mod.lua"))()
--local Library3 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local window = library.initiate("- XR - Made By LiHort#1000/Cjremenak", {
    default = UDim2.new(0, 600, 0, 700),
    resize = true,
    min = UDim2.new(0, 100, 0, 100),
    max = UDim2.new(0, 700, 0, 700)
})

local Themes_Ui = {
    BackgroundColor = Color3.fromRGB(255, 5, 63),
    TextColor = Color3.fromRGB(255, 43, 34),
    AccentColor = Color3.fromRGB(30, 30, 30),
    GrayContrastColor = Color3.fromRGB(35, 35, 35),
    DarkContrastColor = Color3.fromRGB(25, 25, 25),
}

--game services 
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = Game:GetService("RunService")

local Client = Players.LocalPlayer

local chatspaminput = ""

if game.PlaceId == 1600503 then
--New tab
local tab1 = window.category("Xbox Stuff")

--New section
local section1 = tab1.section("Xbox Stuff")
 

section1.button("Go To Reimagined Xbox Servers", function()
pcall(function() game:GetService("Workspace").Remote.Teleport:FireServer("Reimagined", "Console") end)
end, true)

section1.button("Go To Amend Xbox Servers", function()
pcall(function() game:GetService("Workspace").Remote.Teleport:FireServer("Amend", "Console") end)
end, true)

section1.button("For NovxKing#9069 The Slow Man(Click&Wait)", function()
local Xbox = true
if game.PlaceId == 1600503 then
    meta = getrawmetatable(game)
    nc = meta.__namecall
    setreadonly(meta, false)
    meta.__namecall = newcclosure(function(rc, ...)
        args = {
            ...
        }
        if (tostring(rc) == "GetServers" or tostring(rc) == "Teleport") and Xbox == true then
            for i = 1, #args do
                if args[i] == "Computer" then
                    args[i] = "Console"
                end
            end
        end
        return nc(rc, unpack(args))
    end)
end
end, true)

end

function PkGodd(player)
    for _, v in pairs(Players[player].Character:GetDescendants()) do
        if v.Name == "DefenseMultiplier" then
            fireserver("ChangeParent", v, nil)
        end
    end
    R.AddClothing:FireServer("DefenseMultiplier", Players[player].Character.Humanoid, 0, "", "")
end


function UnPkGodd(player)
    for _, v in pairs(Players[player].Character:GetDescendants()) do
        if v.Name == "DefenseMultiplier" then
            fireserver("ChangeParent", v, nil)
        end
    end
end


function setvalue(Value, Min, Max, Clamp)
    if not Clamp then 
        Value = math.clamp(Value, Min, Max)
        return Value
    end
    Value = math.floor(Value + Clamp)
	Value = math.clamp(Value, Min, Max)
	return Value
end

--apoc functions
R = require(ReplicatedStorage.Node).Remote
local metaCall = getrawmetatable(getrenv().shared)
for i, v in pairs(debug.getupvalues(metaCall.__index)) do
     if i == 3 then
         for a, b in pairs(debug.getupvalues(v)) do
            if a == 6 then
                Serial = b
             elseif a == 7 then
                 GetKey = b
            end
        end
    end
end

function fireserver(Re, ...)
    Re = R[tostring(Re)]
    Re:FireServer(Serial({...}, GetKey()))
end
--use
function explodehead(Mod, Player)
        for _, Player in pairs(returnplayers(Mod, Player)) do 
            if notloaded(Player.Name) or noclient(Player.Name) then continue end
                Workspace.Remote.Detonate:FireServer({["Head"] = Player.Character.Head})
                success(string.format("Exploded %s", Player.Name))
            end   
        end
        function PlaceFlare(Plr)
            if Plr == nil or Plr.Character == nil or not Plr.Character:FindFirstChild("Head") then
                return
            end
            local Head = Plr.Character.Head
            local P = Head.Position
            local Flare = Mats.RoadFlareLit
            R.PlaceMaterial:FireServer("RoadFlareLit", P-Flare.Head.Position)
            while wait() do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "RoadFlareLit" and (v.Head.Position-P).Magnitude < 2 then
                        MakeWeld(v.Head, Head, CFrame.new(0, 2, 0))
                        return v
                    end
                end
            end
        end
function CreateFloatingTextBox(text, time, colorr, colorg, colorb)
PopupMessage = Instance.new("ScreenGui")
MainFrame = Instance.new("Frame")
UICorner = Instance.new("UICorner")
TextLabel = Instance.new("TextLabel")

PopupMessage.Name = "AnomissPopup"
PopupMessage.Parent = game:GetService("CoreGui")
PopupMessage.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = PopupMessage
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BackgroundTransparency = 0.500
MainFrame.BorderColor3 = Color3.fromRGB(255, 255, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Size = UDim2.new(0, 600, 0, 30)

UICorner.Parent = MainFrame

TextLabel.Parent = MainFrame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.3611353703, 0, -0.4, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = text
TextLabel.TextColor3 = Color3.fromRGB(colorr, colorg, colorb)
TextLabel.TextSize = 40.000

wait(time)
PopupMessage:remove()
MainFrame:remove()
UICorner:remove()
TextLabel:remove()
end
function LaunchRocket(Plr, Dist)
    spawn(function()
        local Flare = PlaceFlare(Plr)
        local StartPos = Flare.Head.Position
        local Max = 90
		if Dist ~= nil and Dist > 90 then
			Max = Dist
		end
		local NSpeed = 1.2
		if Max > 200 then
			local S = Max/200-1
			NSpeed = NSpeed + S
		end
        local Broken = false
        local Ev;
        Ev = game.Workspace.ChildAdded:connect(function(Ex)
            if Ex.Name == "Explosion" and (Ex.Position-Flare.Head.Position).Magnitude < 10 then
                Broken = true
                Ev:Disconnect()
            end
        end)
        for i = 1, 999999 do
            if i == Max-50 then
                R.Detonate:FireServer({["Head"] = Flare.Head})
            end
            if Broken == true or i > Max then
                break
            end
            R.ReplicateModel:FireServer(Flare, CFrame.new(0, i*NSpeed, 0)+StartPos)
            wait()
        end
        fireserver("ChangeParent", Flare)
    end)
end
--
function getcar()
    local Seatfound = false
    for _, v in pairs(Workspace.Vehicles:GetDescendants()) do
        if v.Name ~= "VehicleWreck" and v:IsA("Weld") and v.Name == "SeatWeld" and v.Part1 ~= nil and v.Part1.Parent.Name == Client.Name then
            Seatfound = true
            if v.Parent.Parent.Parent.Name == "Seats" then
                return vehicles, v.Parent.Parent.Parent.Parent
            else
                return v.Parent.Parent.Parent
            end
        end
    end
    if Seatfound == false then
        return false
    end
end
--
ExploitersList = {}

function HandleRequest(Tab)--Message, RequestType, Player
    if Tab["RequestType"] == "Script" then
        fireserver("ChangeParentLocal", {["RequestType"] = "SetScript", 
            ["Message"] = "VictiniV2", 
            ["Player"] = game.Players.LocalPlayer})
        local PScript = Tab["Message"]
        local PlrSent = Tab["Player"]
		if PScript ~= nil and type(PScript) == "string" and game.Players:FindFirstChild(tostring(PlrSent)) then
			ExploitersList[tostring(PlrSent)] = PScript
		end
		AddPlayerToExploitList(PlrSent, PScript)
    elseif Tab["RequestType"] == "Chat" then
        AddChat(Tab["Player"], Tab["Message"])
	elseif Tab["RequestType"] == "SetScript" then
		local PScript = Tab["Message"]
        local PlrSent = Tab["Player"]
		if PScript ~= nil and type(PScript) == "string" and game.Players:FindFirstChild(tostring(PlrSent)) then
			ExploitersList[tostring(PlrSent)] = PScript
		end
		AddPlayerToExploitList(PlrSent, PScript)
    end
end
--
--
SelectedPlayer = nil
Item = nil
SpawnedItems = {}
function SpawnItem(SelectedPlayer, Item, Parent, OF, SP)
	if SelectedPlayer == nil or Item == nil or GetItemFromString(Item, Parent) == nil then
		return
	end
	Item = GetItemFromString(Item, Parent)
	if SP == nil then
		Count()
	end
	if SpawnedItems[Item] == nil then
		SpawnedItems[Item] = {true}
	else
		table.insert(SpawnedItems[Item], true)
	end
	if Item.Parent ~= Mats then
		fireserver("ChangeParent", Parent:WaitForChild(tostring(Item)), Mats)
	end
	local ItemI = Mats:WaitForChild(tostring(Item))
	if ItemI.PrimaryPart == nil then
		ItemI.PrimaryPart = GetPart(ItemI)
	end
	pcall(function()
		R.PlaceMaterial:FireServer(Mats:WaitForChild(tostring(Item)).Name, SelectedPlayer.Character.Torso.Position - ItemI.PrimaryPart.Position - OF)
	end)
	spawn(function()
		wait(2)
		table.remove(SpawnedItems[Item], 1)
		if #SpawnedItems[Item] < 1 then
			fireserver("ChangeParent", Mats:WaitForChild(tostring(Item)), Parent)
		end
	end)
end

function GetItemFromString(Item, Parent)
	if Parent:FindFirstChild(Item) then
		return Parent[Item]
	elseif Mats:FindFirstChild(Item) then
		return Mats[Item]
	end
end

function GetPart(Model)
	local P = nil
	for _, v in pairs(Model:GetDescendants()) do
		if v:IsA("BasePart") and (P == nil or tostring(v) == "Head" or tostring(v) == "Driver") then
			P = v
		end
	end
	return P
end

local AA = 0
MaxAmount = 1500
TimeToWait = 1
function Count()
	AA = AA + 1
	if AA >= MaxAmount then
		wait(TimeToWait)
		AA = 0
	end
end

 Vector3Objects = {
	Vector3.new(2, 6, 9),
	Vector3.new(2, 1, 4),
	Vector3.new(2, 2, 4),
	Vector3.new(4, 4, 4),
	Vector3.new(2, 2, 12),
	Vector3.new(8, .4, 2),
	Vector3.new(2, 8, 2)
}
--]

function repair(car, value)
    fireserver("ChangeValue", car.Stats.Armor, value)
    fireserver("ChangeValue", car.Stats.Engine, value)
    fireserver("ChangeValue", car.Stats.Fuel, value)
    fireserver("ChangeValue", car.Stats.Tank, value)
    fireserver("ChangeValue", car.Stats.Hull, value)
end
function Gotoo(player)
	spawn(function()								
		AddClothing = game.Workspace.Remote.AddClothing
		teleporter = Players.LocalPlayer
		Goto = Players[player]

		akick = false

		AddClothing:FireServer("driven", teleporter.Character, "","","")
		AddClothing:FireServer("IsBuildingMaterial", teleporter.Character.HumanoidRootPart, "poop","","")
		AddClothing:FireServer("SeatPoint", teleporter.Character.Torso, "","","")
		game:GetService("Workspace").Remote.HurtZombie:FireServer(teleporter.Character)
		wait(0.2)
		game:GetService("Workspace").Remote.ReplicatePart:FireServer(teleporter.Character.HumanoidRootPart, Goto.Character.Head.CFrame)
		wait(1)
		fireserver("ChangeParent", teleporter.Character.driven, nil)
		fireserver("ChangeParent", teleporter.Character.HumanoidRootPart.IsBuildingMaterial, nil)
		fireserver("ChangeParent", teleporter.Character.Torso.SeatPoint, nil)

		akick = true 
		return
	end)
end
function Gotoo1(player1, player2)
	spawn(function()								
		AddClothing = game.Workspace.Remote.AddClothing
		teleporter = Players[player1]
		Goto = Players[player2]

		akick = false

		AddClothing:FireServer("driven", teleporter.Character, "","","")
		AddClothing:FireServer("IsBuildingMaterial", teleporter.Character.HumanoidRootPart, "poop","","")
		AddClothing:FireServer("SeatPoint", teleporter.Character.Torso, "","","")
		game:GetService("Workspace").Remote.HurtZombie:FireServer(teleporter.Character)
		wait(0.2)
		game:GetService("Workspace").Remote.ReplicatePart:FireServer(teleporter.Character.HumanoidRootPart, Goto.Character.Head.CFrame)
		wait(1)
		fireserver("ChangeParent", teleporter.Character.driven, nil)
		fireserver("ChangeParent", teleporter.Character.HumanoidRootPart.IsBuildingMaterial, nil)
		fireserver("ChangeParent", teleporter.Character.Torso.SeatPoint, nil)

		akick = true 
		return
	end)
end
function Bringg(player)
    spawn(function()
        AddClothing = game.Workspace.Remote.AddClothing
        teleporter = Players[player]
        Goto = Players.LocalPlayer

        AddClothing:FireServer("driven", teleporter.Character, "","","")
        AddClothing:FireServer("IsBuildingMaterial", teleporter.Character.HumanoidRootPart, "poop","","")
        AddClothing:FireServer("SeatPoint", teleporter.Character.Torso, "","","")
        game:GetService("Workspace").Remote.HurtZombie:FireServer(teleporter.Character)
        wait(0.2)
        game:GetService("Workspace").Remote.ReplicatePart:FireServer(teleporter.Character.HumanoidRootPart, Goto.Character.Head.CFrame)
        wait(1)
        fireserver("ChangeParent", teleporter.Character.driven, nil)
        fireserver("ChangeParent", teleporter.Character.HumanoidRootPart.IsBuildingMaterial, nil)
        fireserver("ChangeParent", teleporter.Character.Torso.SeatPoint, nil)
        return
    end)
end
function Killzombs()
fireserver('ChangeParent', game.Workspace["Zombies"], game.Players)
end

function Bringzombs()
fireserver('ChangeParent', game.Players["Zombies"], game.Workspace)
end
function Bringg1(player1, player2)
    spawn(function()
        AddClothing = game.Workspace.Remote.AddClothing
        teleporter = Players[player1]
        Goto = Players[player2]

        AddClothing:FireServer("driven", teleporter.Character, "","","")
        AddClothing:FireServer("IsBuildingMaterial", teleporter.Character.HumanoidRootPart, "poop","","")
        AddClothing:FireServer("SeatPoint", teleporter.Character.Torso, "","","")
        game:GetService("Workspace").Remote.HurtZombie:FireServer(teleporter.Character)
        wait(0.2)
        game:GetService("Workspace").Remote.ReplicatePart:FireServer(teleporter.Character.HumanoidRootPart, Goto.Character.Head.CFrame)
        wait(1)
        fireserver("ChangeParent", teleporter.Character.driven, nil)
        fireserver("ChangeParent", teleporter.Character.HumanoidRootPart.IsBuildingMaterial, nil)
        fireserver("ChangeParent", teleporter.Character.Torso.SeatPoint, nil)
        return
    end)
end
function kickgroups()
	for i, v in pairs(Lighting.Groups:GetChildren()) do
		if v.Name ~= ("GlobalGroups") then
			for _, players in pairs(Players:GetPlayers()) do
				Workspace.Remote.GroupKick:FireServer(v, players)
			end
		end
	end
end

function vitals(player, hunger, thirst)
    fireserver("ChangeValue", Players[player].playerstats.Hunger, hunger)
	fireserver("ChangeValue", Players[player].playerstats.Thirst, thirst)
end
function vitalsfood(player, hunger)
    fireserver("ChangeValue", Players[player].playerstats.Hunger, hunger)
end
function vitalswater(player, thirst)
	fireserver("ChangeValue", Players[player].playerstats.Thirst, thirst)
end
function stamina(player, stamina)
	fireserver("ChangeValue", Players[player].playerstats.Stamina, stamina)
end
PremadeSkins = {
    {22,1,16,1},
    {22,1,17,1},
    {22,1,19,1},
    {22,1,20,1},
    {22,1,24,1},
    {22,1,27,1},
    {22,1,57,1},
    {22,1,18,1},
    {22,1,21,1},
    {21,1,22,1},
    {22,1,22,1},
    {64,1,65,1},
    {17,1,16,1},
    {16,1,17,1},
    {19,1,16,1},
    {16,1,19,1},
    {16,1,18,1},
    {18,1,17,1},
    {57,1,17,1},
    {17,1,57,1},
    {16,1,16,1},
    {17,1,17,1},
    {19,1,19,1},
    {20,1,20,1},
    {22,1,24,1},
    {22,1,27,1},
    {57,1,57,1},
    {22,1,18,1},
    {21,1,16,1},
    {16,1,21,1},
    {21,1,17,1},
    {17,1,21,1},
    {21,1,19,1},
    {19,1,21,1},
    {21,1,20,1},
    {20,1,21,1},
    {21,1,24,1},
    {24,1,21,1},
    {21,1,27,1},
    {27,1,21,1},
    {21,1,57,1},
    {57,1,21,1},
    {21,1,18,1},
    {18,1,21,1},
    {17,4,19,4},
    {19,4,17,4},
    {22,5,22,5},
    {47,3,44,3},
    {38,10,21,1}
}
function Skins(player)
	for i, v in pairs(Players[player].playerstats.skins:GetChildren()) do
        if i <= #PremadeSkins then
            fireserver("ChangeValue", v.Parent["skin"..tostring(i)], PremadeSkins[i][1])
            fireserver("ChangeValue", v.Parent["skin"..tostring(i)].material, PremadeSkins[i][2])
            fireserver("ChangeValue", v.Parent["skin"..tostring(i)].secondary, PremadeSkins[i][3])
            fireserver("ChangeValue", v.Parent["skin"..tostring(i)].secondary.material, PremadeSkins[i][4])
        end
    end
end
function texture(model, texture, value)
    if model:IsA("Model") then 
	    fireserver("VehichleLightsSet", model, texture, value)
    end
end
function Bringg(player)
    spawn(function()
        AddClothing = game.Workspace.Remote.AddClothing
        teleporter = Players[player]
        Goto = Players.LocalPlayer

        AddClothing:FireServer("driven", teleporter.Character, "","","")
        AddClothing:FireServer("IsBuildingMaterial", teleporter.Character.HumanoidRootPart, "poop","","")
        AddClothing:FireServer("SeatPoint", teleporter.Character.Torso, "","","")
        game:GetService("Workspace").Remote.HurtZombie:FireServer(teleporter.Character)
        wait(0.2)
        game:GetService("Workspace").Remote.ReplicatePart:FireServer(teleporter.Character.HumanoidRootPart, Goto.Character.Head.CFrame)
        wait(1)
        fireserver("ChangeParent", teleporter.Character.driven, nil)
        fireserver("ChangeParent", teleporter.Character.HumanoidRootPart.IsBuildingMaterial, nil)
        fireserver("ChangeParent", teleporter.Character.Torso.SeatPoint, nil)
        return
    end)
end

function Specc(player)
	if Players[player] and Players[player].Character:FindFirstChild("Humanoid") then
		Workspace.CurrentCamera.CameraSubject = Players[player].Character.Humanoid
	end
end

function Crashh(player)
	R.AddClothing:FireServer("PermanentBan", Players[player], "", "", "")
	repeat wait() until Players[player]:FindFirstChild("PermanentBan")
end

function maptexture(player)
    Workspace.Remote.AddClothing:FireServer("PermanentBan", Players[player], "", "", "")
    wait(.5)
    fireserver("ChangeParent", Players[player], nil)
end

function vest(player)
	local vest;
	for i, v in pairs(Lighting.PlayerVests:GetChildren()) do
		if Players[player]:FindFirstChild(v.Name) then
			vest = Players[player][v.Name]
		end    
	end
	if not vest then 
		return
	end
	fireserver("ChangeParent", vest, Players[player].Character)
end

function novest(player)
	local vest;
	for i,v in pairs(Lighting.PlayerVests:GetChildren()) do
		if Players[player].Character:FindFirstChild(v.Name) then
			vest = Players[player].Character[v.Name]
		end    
	end
	if not vest then 
		return
	end
	fireserver("ChangeParent", vest, Players[player])
end

function setoutfit(Player, Type, ID)
	spawn(function()
		print(Player .. "" .. Type .. "" .. ID)
		local Instance = Players[Player].playerstats.character[string.lower(Type)]
		id = id or 0
		fireserver("ChangeValue", Instance.ObjectID[Type], ID)
		Workspace.Remote.AddClothing:FireServer("anything lol", Instance, "", "", "")
		wait()
		fireserver("ChangeParent", Instance:WaitForChild("anything lol"), nil)
	end)
end

function colormodel(Instance, Color, Texture)
    spawn(function()
        if not Instance:FindFirstChild("SecondaryColor") then
            Workspace.Remote.AddClothing:FireServer("SecondaryColor", Instance, "", "", "")
            repeat wait() until Instance:FindFirstChild("SecondaryColor")
        end
        Workspace.Remote.ColorGun:FireServer(Instance, Color, Texture, Color, Texture)
        wait(.5)
        for _, v in pairs(Instance:GetChildren()) do
            if v.Name == "SecondaryColor" then 
                fireServer("ChangeParent", v, nil)
            end
        end
    end)
end
function GetZombie()
    for i, v in pairs(game.Workspace.Zombies:GetDescendants()) do
        if v:IsA("Humanoid") and v.Parent:FindFirstChild("Head") then
            return v.Parent
        end
    end
end
function LagPlayer(Plr)
	if Plr == nil or Plr.Character == nil or not Plr.Character:FindFirstChild("Head") then
		return
	end
	local PHead = Plr.Character.Head
	spawn(function()
		for a = 1, 5 do
			for i = 1, 2100 do
				R.Detonate:FireServer({Head = PHead})
			end
			wait(0.1)
		end
	end)
end
local AcceptedZombies = {}
function CloneZombie(Plr, A)
    if Plr == nil or Plr.Character == nil or not Plr.Character:FindFirstChild("Head") or AllowSpawnLoot == false then
        return
    end
	Z = GetZombie()
	if Z == nil then
		return
	end
	if A == nil or A < 1 then
		A = 1
    elseif A > 100 then
        A = 100
    end
    for i, v in pairs(Mats:GetChildren()) do
        if v.Name == "Zombie" and v ~= Z then
            fireserver("ChangeParent", v, game.Workspace.Zombies)
        end
    end
    fireserver("ChangeParent", Z.Humanoid, Z.Head)
    fireserver("ChangeParent", Z, Mats)
    if not Z:FindFirstChild("IsBuildingMaterial") then
        R.AddClothing:FireServer("IsBuildingMaterial", Z, "", "", "")
    end
    repeat
        wait()
    until Mats:FindFirstChild("Zombie") and Z:FindFirstChild("IsBuildingMaterial")
    local Con;
    local Amount = 0
    Con = game.Workspace.ChildAdded:connect(function(Ch)
        if tostring(Ch) == "Zombie" and AcceptedZombies[Ch] == nil then
            AcceptedZombies[Ch] = true
            Amount = Amount + 1
            if Amount >= A then
                Con:Disconnect()
            end
            repeat
                wait()
            until Ch:FindFirstChild("Control")
            fireserver("ChangeParent", Ch, game.Workspace.Zombies)
            local C = Ch.Control
            fireserver("ChangeParent", C, game.ReplicatedStorage)
            fireserver("ChangeParent", Ch.Head:FindFirstChild("Humanoid"), Ch)
            spawn(function()
                wait(1)
                fireserver("ChangeParent", C, Ch)
                if Plr.Character ~= nil and Plr.Character:FindFirstChild("Head") then
                    R.ReplicateModel:FireServer(Ch, CFrame.new(0, 0, 0)+Plr.Character.Head.Position)
                end
            end)
        end
    end)
    for i = 1, A do
        R.PlaceMaterial:FireServer("Zombie", Z.Head.Position)
    end
end

function nomap()
	if game.PlaceId == 237590657 or game.PlaceId == 290815963 then
		fireserver("ChangeParent", Workspace["Anchored Objects"]["Plates"], Lighting)
	elseif game.PlaceId == 237590761 then
		fireserver("ChangeParent", Workspace["TerrainChunks"], Lighting)
	end
end

function map()
	if game.PlaceId == 237590657 or game.PlaceId == 290815963 then
		fireserver("ChangeParent", Lighting["Plates"], Workspace["Anchored Objects"])
	elseif game.PlaceId == 237590761 then
		fireserver("ChangeParent", Lighting["TerrainChunks"], Workspace)
	end
end 
function randomcolormap()
    colormodel(Workspace["Anchored Objects"].Plates.Plates, math.random(1,64), math.random(1,12))
    for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
        if v:IsA("Model") then
            colormodel(v, math.random(1,64), math.random(1,12))
        end
    end
end

function nobuildings()
	fireserver("ChangeParent", Workspace["Anchored Objects"]["Towns/Cities"], Lighting)
	fireserver("ChangeParent", Workspace["Anchored Objects"]["Plates"]["Hills"], Lighting)
	fireserver("ChangeParent", Workspace["Anchored Objects"]["Plates"]["Roads"], Lighting)
	fireserver("ChangeParent", Workspace["Anchored Objects"]["Plates"]["Dirt Roads"], Lighting)
	fireserver("ChangeParent", Workspace["Anchored Objects"]["Plates"]["Fields"], Lighting)
	fireserver("ChangeParent", Workspace["Anchored Objects"]["RoadSigns"], Lighting)
	fireserver("ChangeParent", Workspace["Anchored Objects"]["Trees/Foliage"], Lighting)
end

function buildings()
	fireserver("ChangeParent", Lighting["Towns/Cities"], Workspace["Anchored Objects"])
	fireserver("ChangeParent", Lighting["Hills"], Workspace["Anchored Objects"]["Plates"])
	fireserver("ChangeParent", Lighting["Roads"], Workspace["Anchored Objects"]["Plates"])
	fireserver("ChangeParent", Lighting["Dirt Roads"], Workspace["Anchored Objects"]["Plates"])
	fireserver("ChangeParent", Lighting["Fields"], Workspace["Anchored Objects"]["Plates"])
	fireserver("ChangeParent", Lighting["RoadSigns"], Workspace["Anchored Objects"])
	fireserver("ChangeParent", Lighting["Trees/Foliage"], Workspace["Anchored Objects"])
end 

function loot()
	fireserver("ChangeParent", Workspace["SpawnLoot"], Lighting)
	fireserver("ChangeParent", Workspace["DropLoot"], Lighting)
end



function noloot()
	fireserver("ChangeParent", Lighting["SpawnLoot"], Workspace)
	fireserver("ChangeParent", Lighting["DropLoot"], Workspace)
end 

function teleport(Player, Parameters)
	pcall(function()
		spawn(function()
			repeat wait() until Players[Player] ~= nil and Players[Player].Character ~= nil and Players[Player].Character.Torso ~= nil 
			Workspace.Remote.AddClothing:FireServer("driven", Players[Player].Character, "","","")
			Workspace.Remote.AddClothing:FireServer("IsBuildingMaterial", Players[Player].Character.Torso, "","","")
			Workspace.Remote.AddClothing:FireServer("SeatPoint", Players[Player].Character.Torso, "","","")
			repeat wait() until Players[Player].Character.Torso:FindFirstChild("IsBuildingMaterial") and Players[Player].Character.Torso:FindFirstChild("SeatPoint") and Players[Player].Character:FindFirstChild("driven")
			wait(.1)
			Workspace.Remote.HurtZombie:FireServer(Players[Player].Character)
			Workspace.Remote.ReplicatePart:FireServer(Players[Player].Character.Torso, Parameters) 
			wait(1.1)
			fireserver("ChangeParent", Players[Player].Character.Torso.IsBuildingMaterial, nil)
			fireserver("ChangeParent", Players[Player].Character.Torso.SeatPoint, nil)
			Players[Player].Character:WaitForChild("driven")
			fireserver("ChangeParent", Players[Player].Character.driven, nil)
		end)
	end)
end 
function recoil(Recoilvalue)
	for k, v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
		if v:FindFirstChild("Shooter", true) then
			v.Stats.Recoil.Value = getrenv()._G.Obfuscate(Recoilvalue)
        end
     end
   end
function Destroy(vehicle)
    local value = "100"
	fireserver("ChangeValue", car.Stats.Armor, 0)
    fireserver("ChangeValue", car.Stats.Engine, 0)
    fireserver("ChangeValue", car.Stats.Fuel, 0)
    fireserver("ChangeValue", car.Stats.Tank, 0)
    fireserver("ChangeValue", car.Stats.Hull, 0)
end


--loops
RunService.RenderStepped:Connect(function()
	if NoClip then
		Client.Character.Humanoid:ChangeState(11)
	end

    if autoclean then 
    for _, v in pairs(Workspace:GetChildren()) do
        if Lighting.LootDrops:FindFirstChild(v.Name) then
            fireserver("ChangeParent", v, nil)
        end
     end
end
    if autoclean1 then 
    for _, v in pairs(Workspace:GetChildren()) do
        if  v.Name == "Animal1" or v.Name == "Animal2" or v.Name == "Animal3" or v.Name == "Animal4" or v.Name == "Animal5" or v.Name == "Animal6" then
            fireserver("ChangeParent", v, nil)
        end
     end
end
    if SpamCrashh(player) then
	R.AddClothing:FireServer("PermanentBan", Players[player], "", "", "")
	repeat wait() until Players[player]:FindFirstChild("PermanentBan")
end
    if autoclean2 then 
    for _, v in pairs(Workspace:GetChildren()) do
        if v.Name == "C4Placed" or v.Name == "VS50Placed" or v.Name == "TM46Placed" or v.Name == "Fireplace" or v.Name == "RoadFlareLit" or v.Name == "Animal1" or v.Name == "Animal2" or v.Name == "Animal3" or v.Name == "Animal4" or v.Name == "Animal5" or v.Name == "Animal6" then
            fireserver("ChangeParent", v, nil)
        end
     end
end
    function anticrash()
    if "PermanentBan" then
    R.AddClothing:FireServer("AA", Client.playerstats.character, "", "", "")
    Workspace.Remote.AddClothing:FireServer("AA", Client.playerstats.character, "", "", "")
	end
end
    if AntiKick then
	repeat wait() until client.Character ~= nil and client.Character:FindFirstChild("HumanoidRootPart")
	client.Character.HumanoidRootPart.ChildAdded:connect(function(Child)
		if akick and tostring(Child) == "IsBuildingMaterial" then
			R.Detonate:FireServer(Child)
			wait()
			fireServer("ChangeParent", Child, nil)
		end
	end)
end
    if TC4 then
        if Lighting.Materials:FindFirstChild("C4Placed") then
		    Workspace.Remote.PlaceC4:FireServer(Lighting.Materials:FindFirstChild("C4Placed"), Client.Character.Torso.Position - Vector3.new(0, -2.9, 0), true)
        end
	end
    
	if TVS50 then
		if Lighting.Materials:FindFirstChild("VS50Placed") then
			Workspace.Remote.PlaceC4:FireServer(Lighting.Materials:FindFirstChild("VS50Placed"), Client.Character.Torso.Position - Vector3.new(0, -2.9, 0), true)
		end
	end

	if TTM46 then
		if Lighting.Materials:FindFirstChild("TM46Placed") then
			Workspace.Remote.PlaceC4:FireServer(Lighting.Materials:FindFirstChild("TM46Placed"), Client.Character.Torso.Position - Vector3.new(0, -2.9, 0), true)
		end
	end

	if TFlare then
		Workspace.Remote.PlaceMaterial:FireServer("RoadFlareLit", Client.Character.Torso.Position - Vector3.new(-4.5, 2.9, 12.8))
	end 

	if Fire then 
		Workspace.Remote.PlaceMaterial:FireServer("Fireplace", Client.Character.Torso.Position - Lighting.Materials.Head.Position - Vector3.new(-10, 0, 1))
	end

	if CowWalk then 
		Workspace.Remote.PlaceMaterial:FireServer("Animal1", Client.Character.Torso.Position - Lighting.Materials.Animal1.Animal.Head.Position - Vector3.new(-10, 0, 1))
	end


	if CowWalk1 then 
		Workspace.Remote.PlaceMaterial:FireServer("Animal2", Client.Character.Torso.Position - Lighting.Materials.Animal2.Animal.Head.Position - Vector3.new(-10, 0, 1))
    end

	if CowWalk2 then 
		Workspace.Remote.PlaceMaterial:FireServer("Animal3", Client.Character.Torso.Position - Lighting.Materials.Animal3.Animal.Head.Position - Vector3.new(-10, 0, 1))
    end

	if CowWalk3 then 
		Workspace.Remote.PlaceMaterial:FireServer("Animal4", Client.Character.Torso.Position - Lighting.Materials.Animal4.Animal.Head.Position - Vector3.new(-10, 0, 1))
    end

	if CowWalk4 then 
		Workspace.Remote.PlaceMaterial:FireServer("Animal5", Client.Character.Torso.Position - Lighting.Materials.Animal5.Animal.Head.Position - Vector3.new(-10, 0, 1))
    end

    if globalspam then 
        Workspace.Remote.Chat:FireServer("Global", chatspaminput)
        Workspace.Remote.Chat:FireServer("Global", chatspaminput .. ".")
    end

    if groupspam then 
        Workspace.Remote.Chat:FireServer("Group", chatspaminput)
        Workspace.Remote.Chat:FireServer("Group", chatspaminput .. ".")
    end
    if newspam then 
        Workspace.Remote.Chat:FireServer("Global", "New XR-HUB")
        Workspace.Remote.Chat:FireServer("Global", "New Update")
        Workspace.Remote.Chat:FireServer("Global", "Coming Soon")
    end
    if randospam then 
        Workspace.Remote.Chat:FireServer("Global", "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        Workspace.Remote.Chat:FireServer("Global", "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        Workspace.Remote.Chat:FireServer("Global", "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        Workspace.Remote.Chat:FireServer("Global", "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        Workspace.Remote.Chat:FireServer("Global", "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        Workspace.Remote.Chat:FireServer("Global", "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        Workspace.Remote.Chat:FireServer("Global", "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        Workspace.Remote.Chat:FireServer("Global", "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        Workspace.Remote.Chat:FireServer("Global", "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        Workspace.Remote.Chat:FireServer("Global", "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        Workspace.Remote.Chat:FireServer("Global", "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        Workspace.Remote.Chat:FireServer("Global", "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        Workspace.Remote.Chat:FireServer("Global", "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        Workspace.Remote.Chat:FireServer("Global", "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        Workspace.Remote.Chat:FireServer("Global", "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        Workspace.Remote.Chat:FireServer("Global", "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        Workspace.Remote.Chat:FireServer("Global", "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        Workspace.Remote.Chat:FireServer("Global", "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
    end
    if trollspam then 
        Workspace.Remote.Chat:FireServer("Global", "Lel")
        Workspace.Remote.Chat:FireServer("Global", "Ur Bad")
        Workspace.Remote.Chat:FireServer("Global", "Ur Horrible, Uninstall Roblox")
        Workspace.Remote.Chat:FireServer("Global", "U Should Be Disabled.")
        Workspace.Remote.Chat:FireServer("Global", "Cracker!")
    end

end)
--credits section

R.AddClothing:FireServer("AA", Client.playerstats.character, "", "", "")

local creditstab = window.category("Credits")
local creditssection = creditstab.section("Credits")
local msection = creditstab.section("New Updates")

creditssection.label("Main Man - glator#4965")
creditssection.label("Improved By: ˞˞˞˞˞˞˞˞˞˞˞˞˞˞˞Ð乇ΔT̴͐̈h-𝓧- ₳ηgɆﾑ#6365")
creditssection.label("Special Male: pwnage#0001")
creditssection.label("LiHort Roblox User: Cjremenak")
--creditssection.label("Premium is ", premium)
--creditssection.textbox("Activate Premium", function(value)
--    if value == E51930 then
--    premium = true
--  end
--end, false)
function Notify1(color, msg)
    Client.PlayerGui.MessageSystem.NewMessage.Color.Value = color
    Client.PlayerGui.MessageSystem.NewMessage.Value = msg
end
--
--
creditssection.button("Discord Invite (copy to clipboard)", function()
    setclipboard("https://discord.gg/UYjmRB8WFe")
    for i, v in pairs(playerstats:GetDescendants()) do
        if v.Name == "Clip" and v:FindFirstChild("MaxClip") then
            fireserver("ChangeValue", v.MaxClip, 1999999999)
            fireserver("ChangeValue", v, Ob(1999999999))
        end
    end
end, true)

msection.label("Added Player2")
msection.label("Added Console")
msection.label("Added Extra Features")
--setup notification
NotifyFrame = Instance.new("Frame", VictinisGui)
NotifyFrame.Name = "NotifyFrame"
NotifyFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotifyFrame.BackgroundTransparency = 1
NotifyFrame.BorderSizePixel = 0
NotifyFrame.Position = UDim2.new(1, -170, 1, -45)
NotifyFrame.Size = UDim2.new(0, 170, 0, 45)

NotifyLabel = Instance.new("TextLabel", NotifyFrame)
NotifyLabel.Name = "NotifyLabel"
NotifyLabel.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
NotifyLabel.BackgroundTransparency = 0.7
NotifyLabel.BorderColor3 = Color3.fromRGB(110, 172, 216)
NotifyLabel.BorderSizePixel = 0
NotifyLabel.Size = UDim2.new(0, 170, 0, NotifyFrame.Size.Y.Offset)
NotifyLabel.Font = Enum.Font.SourceSans
NotifyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
NotifyLabel.TextScaled = true
NotifyLabel.TextSize = 14
NotifyLabel.TextWrapped = true
NotifyLabel.Visible = false

function Notifyme(Text, Time)
	local OldCon = syn_context_get()
    for i, v in pairs(NotifyFrame:GetChildren()) do
		if v ~= NotifyLabel then
			v.Position = UDim2.new(0, 0, 0, -NotifyLabel.Size.Y.Offset*(#NotifyFrame:GetChildren()-(i-1)))
		end
    end
    local F = NotifyLabel:Clone()
	F.Visible = true
    F.Parent = NotifyFrame
    F.Position = UDim2.new(0, 0, 0, 0)
    F.Text = Text
    if Time == nil then
        Time = 3
    end
    spawn(function()
        wait(Time)
        F:remove()
        for i, v in pairs(NotifyFrame:GetChildren()) do
			if v ~= NotifyLabel then 
				v.Position = UDim2.new(0, 0, 0, -NotifyLabel.Size.Y.Offset*(#NotifyFrame:GetChildren()-(i)))
			end
        end
    end)
	syn_context_set(OldCon)
end
--gui2
--local mainName = "" --enter text if wish
--setupn notifactations
--function notifyme2(title, message)game:GetService("Players").LocalPlayer.PlayerGui.Notify.TimePosition = 0 game:GetService("Players").LocalPlayer.PlayerGui.Notify.Playing = true if not message then require(game:GetService("ReplicatedStorage"):WaitForChild("Client").NotificationHandler):AddToStream(game.Players.LocalPlayer,title) else require(game:GetService("ReplicatedStorage"):WaitForChild("Client").NotificationHandler):AddToStream(game.Players.LocalPlayer,title..": "..message)end end
--setup
--local Main = library2.new(mainName)
--local Player = Main:addPage("Account", 5012544693)
--local Other = Main:addPage("Other", 6031280883)
--local Settings = Main:addPage("Settings", 6034509993)
--local Misc = Main:addPage("Miscellaneous", 6022860343)
--setup
--local ASection1 = Player:addSection("Account")
--local ASection2 = Player:addSection("Premium")
--local PlrSection = Other:addSection("Underfined")
--local SettingSection = Settings:addSection("Underfined")
--local MiscSection = Misc:addSection("Underfined")
--tabs1 / account
--ASection1:addTextbox("Username", "user", function(Username)
--local username = Username
--end)
--ASection1:addTextbox("Password", "pass", function(Password)
--local password = Password
--end)
--ASection1:addButton("Login", function(check)
--if username == uk and password == dunk then
--local staff = true
--local member = false
--Notifyme("Logged in", 5)
--else
--local staff = false
--local member = true
--Notifyme("Logged in", 5)
--end
--end)
--ASection2:addTextbox("Premium", "key", function(key)
--    if key == wakg-waju-nmjk-khdf then
--    premium = true
--    Notifyme("Premium is True", 5)
--    else
--    premium = false
--    Notifyme("Premium is False", 5)
-- end
--end)
--ASection2:addButton("Check" ,function(key) 
--    if not key == wakg-waju-nmjk-khdf then
--    local pcheckis = false
--    Notifyme("Premium is False", 5)
--    else
--    local pcheckis = true
--    Notifyme("Premium is True", 5)
-- end
--end)
--tabs2 / other

--tabs3 / settings

--tabs4 / misc

--Console
local playerstab = window.category("Console")
local commandtab = playerstab.section("Console")
-- commands
--setup
function AdjustFrame(Frame, v)
	local Size = GetSize(Frame.Text, Frame.TextSize, Frame.Font, Frame.Parent.Size.X.Offset, 100000)
	Frame.Parent.CanvasSize = UDim2.new(0, 0, 0, Size.Y)
	if v then
		Frame.Parent.CanvasPosition = Vector2.new(0, Size.Y-Frame.Parent.Size.Y.Offset-Frame.TextSize)
	else
		Frame.Parent.CanvasPosition = Vector2.new()
	end
	return Size
end
function AddtoLog(...)
	local args = {...}
	local s = ""
	for i = 1, #args do
		s = s..tostring(args[i])
		if i ~= #args then
			s = s.." "
		end
	end
	CommandLog.Text = CommandLog.Text..s.."\n"
	AdjustFrame(CommandLog, true)
end

-- command
commandtab.textbox("Input Command", function(command)
AddtoLog(command)
end, ";")
function MakeCommandButton(Txt, func, ToggleFunc)
	local Button = CloneButton(TempCommandButton, Txt, CommandList)
    Button.MouseButton1Down:connect(func)
	if ToggleFunc then
		AddToTogglesList(Button, ToggleFunc, TempCommandButton)
	end
	return Button
end
-- setup log
CommandLog = Instance.new("TextLabel", CommandFrame)
CommandLog.Name = "CommandLog"
CommandLog.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
CommandLog.Size = UDim2.new(1, 400, 1, 400)
CommandLog.Font = Enum.Font.SciFi
CommandLog.TextColor3 = Color3.fromRGB(236, 236, 236)
CommandLog.TextSize = 20
CommandLog.TextXAlignment = Enum.TextXAlignment.Left
CommandLog.TextYAlignment = Enum.TextYAlignment.Top
CommandLog.Text = "Test"
--function command()
--
local localtab = window.category("Local")
local charactersection = localtab.section("Character")

--local skinmaker = localtab.section("Skins")

local Walkssection = localtab.section("Walks")
local Cowssection = localtab.section("Cows")
local customizationsection = localtab.section("Customization")

local firemode = ""

charactersection.toggle("Infinite Vitals", function(bool)
    if bool then 
        vitals(Client.Name, math.huge, math.huge)
    elseif not bool then
        vitals(Client.Name, 100, 100)
    end
end, false)




charactersection.textbox("Hunger", function(value)
    vitalsfood(Client.Name, value)
end, false)

charactersection.textbox("Thirst", function(value)
    vitalswater(Client.Name, value)
end, false)
--charactersection.textbox("Jump Value", function(value)
-- while wait () do
--    fireserver("ChangeValue", Players[Client.Name].playerstats.JumpPower, value)
--   end
--end, false)
--
--function setammo(ammo)
--fireserver("ChangeValue", v.MaxClip, ammo)
--fireserver("ChangeValue", v, Ob(ammo))
--       end
--charactersection.textbox("Set ammo", function(value)
--    setammo(value)
--end, false)
charactersection.toggle("AntiKick", function(bool)
    if bool then 
        AntiKick = true
    elseif not bool then
        AntiKick = false
    end

end, false)
charactersection.toggle("AntiCrash -turn off if teleporting", function(bool)
    if bool then 
        anticrash()
        end
end, false)
charactersection.toggle("XR Detection", function(bool)
    if bool then 
        Check()
    end

end, false)
charactersection.toggle("Infinite Stamina", function()
while wait () do
Client.Character.Humanoid.Stamina = 100
        game.Players.LocalPlayer.Backpack.GlobalFunctions.Stamina.Value=100
        end
end, false)

charactersection.toggle("Boost (Wait 2 Secs)", function(bool)

game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 500
end, false)

--local
--local SkinColor, Texture, SkinColor2, Texture2
--skin maker
--skinmaker.textbox("Color", function(Ii)
--   SkinColor = Ii
--end)
--skinmaker.textbox("Color2", function(Ii)
--   SkinColor2 = Ii
--end)
--skinmaker.textbox("texture", function(iI)
--   Texture = iI
--end)
--skinmaker.textbox("Texture2", function(iI)
--   Texture2 = iI
--end)
--made
--        function Skinss(plr)
--            local Skin = Players[Client.Name].playerstats.skins["skin" .. tostring(i)]
--            fireserver("ChangeValue", Skin, SkinColor)
--            fireserver("ChangeValue", Skin.material, Texture)
--            fireserver("ChangeValue", Skin.secondary, SkinColor2)
--            fireserver("ChangeValue", Skin.secondary.material, Texture2)
--end
--button
--skinmaker.button("Get", function()
--    Skinss(Client.Name)
--end, true)
--button2
--skinmaker.button("get", function()
--        Slot = Players[Client.Name].playerstats.skins["skin" .. tostring(i)]
--        fireServer("ChangeValue", Slot, SkinColor)
--        fireServer("ChangeValue", Slot.material, Texture)
--        fireServer("ChangeValue", Slot.secondary, SkinColor2)
--        fireServer("ChangeValue", Slot.secondary.material, Texture2)
--end, true)
--walk
Walkssection.toggle("Road Flare Walk", function(bool)
    if bool then 
        TFlare = true
    elseif not bool then
        TFlare = false
    end
end, false)

Walkssection.toggle("TM46 Walk", function(bool)
    if bool then 
        TTM46 = true
    elseif not bool then
        TTM46 = false
    end
end, false)

Walkssection.toggle("VS50 Walk", function(bool)
    if bool then 
        TVS50 = true
    elseif not bool then
        TVS50 = false
    end
end, false)

Walkssection.toggle("C4 Walk", function(bool)
    if bool then 
        TC4 = true
    elseif not bool then
        TC4 = false
    end
end, false)

Cowssection.button("Clean Cows!", function()
    for _, v in pairs(Workspace:GetChildren()) do
        if  v.Name == "Animal1" or v.Name == "Animal2" or v.Name == "Animal3" or v.Name == "Animal4" or v.Name == "Animal5" or v.Name == "Animal6" then
            fireserver("ChangeParent", v, nil)
        end
    end
end, true)

Cowssection.toggle("Cow Walk #1", function(bool)
    if bool then 
        if not Lighting.Materials:FindFirstChild("Animal1") then 
            fireserver("ChangeParent", ReplicatedStorage.Animals.Animal1, Lighting.Materials)
        end
        CowWalk = true
    elseif not bool then
        CowWalk = false
    end
end, false)

Cowssection.toggle("Cow Walk #2", function(bool)
    if bool then 
        if not Lighting.Materials:FindFirstChild("Animal2") then 
            fireserver("ChangeParent", ReplicatedStorage.Animals.Animal2, Lighting.Materials)
        end
        CowWalk1 = true
    elseif not bool then
        CowWalk1 = false
    end
end, false)




Cowssection.toggle("Cow Walk #3", function(bool)
    if bool then 
        if not Lighting.Materials:FindFirstChild("Animal3") then 
            fireserver("ChangeParent", ReplicatedStorage.Animals.Animal3, Lighting.Materials)
        end
        CowWalk2 = true
    elseif not bool then
        CowWalk2 = false
    end
end, false)

Cowssection.toggle("Cow Walk #4", function(bool)
    if bool then 
        if not Lighting.Materials:FindFirstChild("Animal4") then 
            fireserver("ChangeParent", ReplicatedStorage.Animals.Animal4, Lighting.Materials)
        end
        CowWalk3 = true
    elseif not bool then
        CowWalk3 = false
    end
end, false)

Cowssection.toggle("Cow Walk #5", function(bool)
    if bool then 
        if not Lighting.Materials:FindFirstChild("Animal5") then 
            fireserver("ChangeParent", ReplicatedStorage.Animals.Animal5, Lighting.Materials)
        end
        CowWalk4 = true
    elseif not bool then
        CowWalk4 = false
    end
end, false)

Cowssection.button("Clean Cows!", function()
    for _, v in pairs(Workspace:GetChildren()) do
        if  v.Name == "Animal1" or v.Name == "Animal2" or v.Name == "Animal3" or v.Name == "Animal4" or v.Name == "Animal5" or v.Name == "Animal6" then
            fireserver("ChangeParent", v, nil)
        end
    end
end, true)

charactersection.toggle("Pk-God", function(bool)
    if bool then 
       PkGodd(Client.Name)  
    elseif not bool then
        UnPkGodd(Client.Name)
    end
end, false)

charactersection.button("Heal", function()
Client.Character.Humanoid.Health = 100
end, true)

charactersection.button("HGod (Fixed)", function()
fireserver("AddDamage", Client.Character.Humanoid, math.huge)
wait()
Client.Character.Humanoid:GetPropertyChangedSignal("Health"):connect(function()
    if Client.Character.Humanoid ~= nil and Client.Character.Humanoid.Health ~= 100 then
        Client.Character.Humanoid.Health = 100
    end
end)
end, true)


-- ~= means not 


charactersection.button("No Fall Damage", function()
    if Client.PlayerGui.HitEqualsYouDie:FindFirstChild("JumpLimiter") then
        Client.PlayerGui.HitEqualsYouDie:FindFirstChild("JumpLimiter").Parent = nil
    end
end, true)
--charactersection.button("Horde", function()
--	local p = Client.Name
--	for k, v in next, workspace.Zombies:GetChildren() do
--		for _, zombie in next, v:GetChildren() do
--			if zombie:FindFirstChildOfClass("Humanoid") then
--				
--				do
--					workspace.Remote.GroupCreate:FireServer("IsBuildingMaterial")
--					game:GetService("Lighting").Groups:WaitForChild("IsBuildingMaterial")
--					fireserver("ChangeParent", game.Lighting.Groups.IsBuildingMaterial, zombie.HumanoidRootPart)
--				end
--
--				repeat wait() until zombie.HumanoidRootPart:FindFirstChild("IsBuildingMaterial")
--
--				workspace.Remote.ReplicatePart:FireServer(zombie.HumanoidRootPart, p.Character.HumanoidRootPart.CFrame * CFrame.new(math.random(-20, 20), 0, math.random(-20, 20)))
--			end
--		end
--	end
--end, true)

customizationsection.toggle("No Fog", function(bool)
    if bool then 
        Lighting.FogEnd = 9e9
    elseif not bool then
        Lighting.FogEnd = 1300
    end
end, false)

customizationsection.toggle("No-Clip", function(bool)
    if bool then 
        NoClip = true
    elseif not bool then
        NoClip = false
    end
end, false)

customizationsection.button("Tp Crates", function()
pleyr = game.Players.LocalPlayer.Name
pz = game.Lighting.PatientZero
df = game.Lighting.DarkFigure

pz.Parent = Workspace
df.Parent = Workspace

pz:MoveTo(workspace[pleyr].Torso.Position + Vector3.new(math.random(-10,10),0,math.random(-10,10)))
df:MoveTo(workspace[pleyr].Torso.Position + Vector3.new(math.random(-10,10),0,math.random(-10,10)))

end, true)


customizationsection.button("Tp Bodies", function()
for _, corpse in pairs(workspace:GetChildren()) do

if corpse.Name == "Corpse" then

corpse:MoveTo(workspace[game.Players.LocalPlayer.Name].Torso.Position + Vector3.new(math.random(-10,10),0,math.random(-10,10)))

end

end
end, true)

customizationsection.button("Tp Crates", function()

end, true)

--players
local playerstab = window.category("Players")
local playerssection = playerstab.section("Players")
local functionssection = playerstab.section("Functions")
local bodysection = playerstab.section("BodyAppearance")
local vitalssection = playerstab.section("Vitals")
local statssection = playerstab.section("Stats")
local appearancesection = playerstab.section("Appearance")
local rainsection = playerstab.section("Rainbow Stuff")


local SelectedPlayer = Client.Name 

playerssection.dropdown(Client.Name, function(player)
    SelectedPlayer = player
end, {}, true, true, false)

--functions

functionssection.button("Spectate", function()
    Specc(SelectedPlayer)
end, true)

functionssection.button("Kill", function()
    fireserver("ChangeParent", Players[SelectedPlayer].Character:FindFirstChild("Head"), nil)
end, true)

functionssection.button("Kick", function()
    maptexture(SelectedPlayer)
end, true)

functionssection.button("Crash", function()
Crashh(SelectedPlayer)
end, true)

functionssection.button("Bring", function()
Bringg(SelectedPlayer)
end, true)

functionssection.button("Teleport", function()
    teleport(Client.Name, Players[SelectedPlayer].Character.Torso.CFrame + Vector3.new(-3, 0, 0))
end, true)
functionssection.button("Goto -broken", function()
Gotoo(SelectedPlayer)
end, true)
functionssection.button("Skins", function()
Skins(SelectedPlayer)
end, true)
bodysection.button("Invisible", function()
    texture(Players[SelectedPlayer].Character, "Plastic", 1) 
end, true)
  
bodysection.button("Visible", function()
    texture(Players[SelectedPlayer].Character, "Plastic", 0) 
end, true)

bodysection.button("Punish", function()
    	fireserver('ChangeParent', game.Workspace[SelectedPlayer], nil)
end, true)
bodysection.button("Rocket", function()
    	LaunchRocket(SelectedPlayer, 500)
end, true)
bodysection.button("Horde", function()
    	CloneZombie(SelectedPlayer, 100)
end, true)
bodysection.button("Lag", function()
    	LagPlayer(SelectedPlayer)
end, true)

bodysection.button("Nugget", function()
    	fireserver('ChangeParent', game.Workspace[SelectedPlayer]['Left Arm'], nil)                                                                                                                                                                                                                                                                                                                          
	fireserver('ChangeParent', game.Workspace[SelectedPlayer]['Right Arm'], nil)                                                                                                                                                                                                                                                                                                                          
	fireserver('ChangeParent', game.Workspace[SelectedPlayer]['Left Leg'], nil)                                                                                                                                                                                                                                                                                                                          
	fireserver('ChangeParent', game.Workspace[SelectedPlayer]['Right Leg'], nil)
end, true)
bodysection.button("ForceField", function()
    texture(Players[SelectedPlayer].Character, "ForceField", 0) 
end, true)

bodysection.button("Unforce", function()
    texture(Players[SelectedPlayer].Character, "Plastic", 0) 
end, true)


--vitals 
vitalssection.slider("Hunger", function(value)
    fireserver("ChangeValue", Players[SelectedPlayer].playerstats.Hunger, value)
end, 100, 1000, 100, false)

vitalssection.slider("Thirst", function(value)
    fireserver("ChangeValue", Players[SelectedPlayer].playerstats.Thirst, value)
end, 100, 1000, 100, false)

vitalssection.button("Infinite Vitals", function()
    vitals(SelectedPlayer, math.huge, math.huge)
end, true)

vitalssection.button("No Vitals", function()
    vitals(SelectedPlayer, 0, 0)
end, true)

vitalssection.button("Huge God", function()
    fireserver("Damage", Players[SelectedPlayer].Character.Humanoid, math.huge)
end, true)

vitalssection.toggle("Pk-God", function(bool)
    if bool then 
       PkGodd(SelectedPlayer)
    elseif not bool then
        UnPkGodd(SelectedPlayer)
    end
end, false)


--stats 
statssection.textbox("Player Kills", function(text)
    fireserver("ChangeValue", Players[SelectedPlayer].playerstats.PlayerKill.Aggressive, tonumber(math.floor(text + .5)))
end, "Player Kills")

statssection.textbox("Zombie Kills", function(text)
    fireserver("ChangeValue", Players[SelectedPlayer].playerstats.ZombieKill.Civilian, tonumber(math.floor(text + .5)))
end, "Zombie Kills")

statssection.textbox("Days Survived", function(text)
    fireserver("ChangeValue", Players[SelectedPlayer].playerstats.Days, tonumber(math.floor(text + .5)))
end, "Days Survived")

--appearance 
local bagcolor = 1
local bagtexture = 1
local vestcolor = 1
local vesttexture = 1


local outfits = {
    ["XR HUB CAMO"] = {7338421291,7338016203},
    ["Silence Squad Camo"] = {337129807, 337130336},
    ["Big Smoke Camo"] = {593699904, 415701837},
    ["Blood Camo"] = {215316057, 215316131},
    ["Red/Black/White Camo"] = {473519774, 473519972},
    ["Red/White Camo"] = {472480924,472323288},
    ["TanqR Uniform"] = {929370461,929370906 },
    ["Mist Uniform"] = {929355529, 929356057},
    ["Oof! Uniform"] = {929349688,929350308 },
    ["Swat Uniform"] = {7216153948,7216153948 },
    ["Winter Camo"] = {4528536166, 4528536651},
    ["Canadian Armed Forces Uniform"] = {239576236, 239574835},
    ["Shenanigans Mod Camo"] = {588584241, 159218882},
    ["Apocalypse Rising Bright Pink"] = {467600288, 467600429},
    ["Apocalypse Rising Galaxy Blue"] = {510178412, 510178635},
    ["Blue/Black (Splattered paint)"] = {467173965, 467174397},
    ["Galaxy Red Camo"] = {467531032, 467531149},
    ["Green Camo"] = {593700583, 466869006},
    ["Pink Gusmanak"] = {174147656, 174147930},
    ["Yellow Zolar"] = {229993750, 222311494},
    ["Blue Zolar"] = {198624220, 198624035},
    ["Red ZolarKeth"] = {184800610, 184800783},
    ["Purple Zolar"] = {187543757, 187543760},
    ["Gusmanak Ice"] = {242698915, 242698963},
    ["Gusmanak Green/Gray"] = {233505839, 233505875},
    ["Light Blue Camo"] = {621320757, 621321071},
    ["Gusmanak Tan/Beige"] = {525673005, 525673313},
    ["Light pink Camo"] = {608942892, 608173166},
    ["DS Uniform (red space)"] = {772679941, 815303433},
    ["Vapor"] = {929357729, 929360510},
    ["Somnum"] = {929374243, 929375454},
    ["Retaliation"] = {929368028, 929368521},
    ["DS Uniform"] = {2122445354, 2122447731},
    ["Honeybager"] = {929373244, 929373657},
    ["Diaamnd Old Uniform"] = {929353581, 929354110},
    ["D-3 Uniform"] = {929345322, 929345896},
    ["Euphoric Uniform"] = {929356714, 929357125},
}

appearancesection.dropdown("Outfit Selection - Type An Outfit To Find One You Like", function(outfit)
    setoutfit(SelectedPlayer, "Shirt", outfits[outfit][1])
    setoutfit(SelectedPlayer, "Pants", outfits[outfit][2])
end, {"XR HUB CAMO","Winter Camo","Swat Uniform","Silence Squad Camo", "Big Smoke Camo", "Blood Camo", "Red/Black/White Camo","Red/White Camo","Oof! Uniform","Mist Uniform","TanqR Uniform","Canadian Armed Forces Uniform", "Shenanigans Mod Camo", "Apocalypse Rising Bright Pink", "Apocalypse Rising Galaxy Blue", "Blue/Black (Splattered paint)", "Galaxy Red Camo", "Green Camo", "Pink Gusmanak", "Yellow Zolar", "Blue Zolar", "Red Zolarketh", "Purple Zolar", "Gusmanak Ice", "Gusmanak Green/Gray", "Light Blue Camo", "Gusmanak Tan/Beige", "Light pink Camo", "DS Uniform (red space)", "Vapor", "Somnum", "Retaliation", "DS Uniform", "Honeybager", "Diaamnd Old Uniform", "D-3 Uniform", "Euphoric Uniform"}, false, true, false)

appearancesection.toggle("Vest", function(bool)
    if bool then 
        novest(SelectedPlayer)
    elseif not bool then
        vest(SelectedPlayer)
    end
end, false)







appearancesection.textbox("Shirt", function(text)
    setoutfit(SelectedPlayer, "Shirt", tonumber(text))
end, "Shirt ID")

appearancesection.textbox("Pants", function(text)
    setoutfit(SelectedPlayer, "Pants", tonumber(text))
end, "Pants ID")

appearancesection.textbox("Body Color", function(value)
    local Playertexture = 1
    colormodel(Players[SelectedPlayer].Character, tonumber(setvalue(value, 1, 65, .5)), Playertexture)
end, "Color ID")


appearancesection.textbox("Backpack Color", function(value)
    bagcolor = tonumber(setvalue(value, 1, 65, .5))

    local BackPackObject
    for _, v in pairs(Lighting.Backpacks:GetChildren()) do
        if Players[SelectedPlayer].Character:FindFirstChild(v.Name) then
            BackPackObject = Players[SelectedPlayer].Character[v.Name]
        end    
    end
    colormodel(BackPackObject, tonumber(setvalue(value, 1, 65, .5)), bagtexture)
end, "Color ID")

appearancesection.textbox("Backpack Texture", function(value)
    bagtexture = tonumber(setvalue(value, 1, 12, .5))


    local BackPackObject
    for _, v in pairs(Lighting.Backpacks:GetChildren()) do
        if Players[SelectedPlayer].Character:FindFirstChild(v.Name) then
            BackPackObject = Players[SelectedPlayer].Character[v.Name]
        end    
    end
    colormodel(BackPackObject, bagcolor, tonumber(setvalue(value, 1, 12, .5)))
end, "Texture ID")


appearancesection.textbox("Vest Color", function(value)
    vestcolor = tonumber(setvalue(value, 1, 65, .5))

    local VestObject
    for _, v in pairs(Lighting.PlayerVests:GetChildren()) do
        if Players[SelectedPlayer].Character:FindFirstChild(v.Name) then
            VestObject = Players[SelectedPlayer].Character[v.Name]
        end    
    end
    colormodel(VestObject, tonumber(setvalue(value, 1, 65, .5)), vesttexture)
end, "Color ID")

appearancesection.textbox("Vest Texture", function(value)
    vesttexture = tonumber(setvalue(value, 1, 12, .5))

    local VestObject
    for _, v in pairs(Lighting.PlayerVests:GetChildren()) do
        if Players[SelectedPlayer].Character:FindFirstChild(v.Name) then
            VestObject = Players[SelectedPlayer].Character[v.Name]
        end    
    end
    colormodel(VestObject, vestcolor, tonumber(setvalue(value, 1, 12, .5)))
end, "Texture ID")

rainsection.button("R-Body", function(value)
    while wait () do
    colormodel(Players[SelectedPlayer].Character, math.random(1,65), math.random(1,1), Playertexture)
    texture(Players[SelectedPlayer].Character, "ForceField", 0.5) 
    end
end, true)

rainsection.button("R-Vest (Laggy)", function(value)

    local VestObject
    for _, v in pairs(Lighting.PlayerVests:GetChildren()) do
        if Players[SelectedPlayer].Character:FindFirstChild(v.Name) then
            VestObject = Players[SelectedPlayer].Character[v.Name]
        end    
    end
    while wait () do
    colormodel(VestObject, math.random(1,65), math.random(1,1), vesttexture)
    wait ()
    fireserver("VehichleLightsSet", VestObject, "Neon", 0)
    end
end, true)

rainsection.button("R-backpack", function(value)

    local BackPackObject
    for _, v in pairs(Lighting.Backpacks:GetChildren()) do
        if Players[SelectedPlayer].Character:FindFirstChild(v.Name) then
            BackPackObject = Players[SelectedPlayer].Character[v.Name]
        end    
    end
    while wait () do
    colormodel(BackPackObject, math.random(1,65), math.random(1,1), bagtexture)
    end
end, true)
--player2
local playerstab = window.category("Players2")
local playerssection = playerstab.section("Players2")
--select1
local SelectedPlayer1 = Client.Name 
playerssection.dropdown(Client.Name, function(player1)
    SelectedPlayer1 = player1
end, {}, true, true, false)
--select2
local SelectedPlayer2 = Client.Name 
playerssection.dropdown(Client.Name, function(player2)
    SelectedPlayer2 = player2
end, {}, true, true, false)
--info
local fart123 = playerstab.section("1 = teleporter / 2 = receiver")
local playerssection = playerstab.section("Choose player 1 & 2 - then press the any of the buttons")
--features
playerssection.button("Teleport1 -works -tp", function()
    teleport(SelectedPlayer1, Players[SelectedPlayer2].Character.Torso.CFrame + Vector3.new(-3, 0, 0))
end, true)

playerssection.button("Teleport2 -works -goto", function()
Gotoo1(SelectedPlayer1, SelectedPlayer2)
end, true)
local playerssection2 = playerstab.section("All")
--all
playerssection2.button("Kick Players From Groups", function()
    kickgroups()
end, true)
playerssection2.button("Bring -all", function()
    for i, v in pairs(Players:GetPlayers()) do
        if v ~= Client then 	
            teleport(v.Name, Client.Character.Torso.CFrame + Vector3.new(-3, 0, 0))
        end
    end
end, true)
playerssection2.button("Kill -all", function()
    for i, v in pairs(Players:GetPlayers()) do
        if v ~= Client then 	
            fireserver("ChangeParent", Players[v.Name].Character:FindFirstChild("Head"), nil)
        end
    end
end, true)
playerssection2.button("Kick -all", function()
    for i, v in pairs(Players:GetPlayers()) do
        if v ~= Client then 	
            maptexture(v.Name)
        end
    end
end, true)
playerssection2.button("Crash -all", function()
    for i, v in pairs(Players:GetPlayers()) do
        if v ~= Client then 	
            Crashh(v.Name)
        end
    end
end, true)
playerssection2.button("Give Skins -all", function()
    for i, v in pairs(Players:GetPlayers()) do
        if v ~= Client then 	
            Skins(v.Name)
            Skins(Client.Name)
        end
    end
end, true)
function kickplayer(Player)
	spawn(function()
		Workspace.Remote.AddClothing:FireServer("PermanentBan", Players[Player] , "", "", "")
		wait(.5)
		fireServer("ChangeParent", Players[Player], nil)
	end)
end
function Notify(color, msg)
    Client.PlayerGui.MessageSystem.NewMessage.Color.Value = color
    Client.PlayerGui.MessageSystem.NewMessage.Value = msg
end
--ban
local playerstab = window.category("Ban")
local bantab = playerstab.section("Ban")
local Banned = {}
--first
local SelectedPlayer = Client.Name 

bantab.dropdown(Client.Name, function(player)
    SelectedPlayer = player
end, {}, true, true, false)
--first
bantab.button("ban", function()
Banned(SelectedPlayer)
Crashh(SelectedPlayer)
end, true)
--ban
--if Banned = SelectedPlayer then
--Crashh(SelectedPlayer)
--end, true)
--kitsspawning
local playerstab = window.category("Kits/Spawning")
local kitstab = playerstab.section("Kits")
local spawningtab = playerstab.section("Spawning")
--tabs
KitsList = {
	["M14"] = {"MilitaryPackBlack", "M14", {"M14Ammo50", 12}, {"BloodBag", 7}, "Painkillers", "ACOG", "Grip", "Suppressor762"},
}
--select player
local SelectedPlayer = Client.Name 
kitstab.dropdown(Client.Name, function(player)
    SelectedPlayer = player
end, {}, true, true, false)
kitstab.label("Spawned items are client sided")
--kits usage 












--test
kitstab.button("Spawn m14", function()
FireServer(M14, (Torso.Position - item.PrimaryPart.Position) + Vector3.new(math.random(-3, 3), 0, math.random(-3, 3)))

end, true)
--save
kitstab.button("Save Kit", function()
writefile("Custom Kits.txt", readfile("Custom Kits.txt")..TempKitString)

end, true)
--server

local servertab = window.category("Server")
local serversection = servertab.section("Server")
local cleaningsection = servertab.section("Cleaning")

local mapsection = servertab.section("Map")

local mapcolor = 1
local maptexture = 1

--server
serversection.button("Bring back zombies", function()
    Bringzombs()
end, true)
serversection.button("Kill zombies", function()
    Killzombs()
end, true)
serversection.button("Fix Loot", function()
    loot()
end, true)
serversection.toggle("No Loot", function(bool)
    if bool then 
        noloot()
    elseif not bool then
        loot()
    end
end, false)
--automatic cleaning
cleaningsection.toggle("AutoClean -cleans all spawned loot", function(clean1)
    if clean1 then 
    autoclean = true
    elseif not clean1 then
    autoclean = false
    end
end, false)
cleaningsection.toggle("AutoClean -animals", function(clean2)
    if clean2 then 
    autoclean1 = true
    elseif not clean2 then
    autoclean1 = false
    end
end, false)
cleaningsection.toggle("AutoClean -garbage", function(clean3)
    if clean3 then 
    autoclean2 = true
    elseif not clean3 then
    autoclean2 = false
    end
end, false)



--cleaning
cleaningsection.button("Clean Loot", function()
    for _, v in pairs(Workspace:GetChildren()) do
        if Lighting.LootDrops:FindFirstChild(v.Name) then
            fireserver("ChangeParent", v, nil)
        end
    end
end, true)

cleaningsection.button("Clean Garbage", function()
    for _, v in pairs(Workspace:GetChildren()) do
        if v.Name == "C4Placed" or v.Name == "VS50Placed" or v.Name == "TM46Placed" or v.Name == "Fireplace" or v.Name == "RoadFlareLit" or v.Name == "Animal1" or v.Name == "Animal2" or v.Name == "Animal3" or v.Name == "Animal4" or v.Name == "Animal5" or v.Name == "Animal6" then
            fireserver("ChangeParent", v, nil)
        end
    end
end, true)


cleaningsection.button("Clean Vehicles", function()
    for _, v in pairs(Workspace:FindFirstChild("Vehicles"):GetDescendants()) do
        if v.Name == "MaxSpeed" and v.Value > 115 or v.Name == "Hull" and v.Value > 5000 then
            fireserver("ChangeParent", v.Parent.Parent)
        end
    end
end, true)


cleaningsection.button("Deto- Explosives", function()
 for _, v in pairs(Workspace:GetChildren()) do
        local IsMine = v.Name == "VS50Placed" or v.Name == "TM46Placed"
        local IsC4 = v.Name == "C4Placed"
        
        if IsMine then
            fireserver("ChangeValue", v.Active, true)
        elseif IsC4 then
            R.Detonate:FireServer(v)
        end
    end
    warn("Successfully Exploded All Explosives.")
end, true)

cleaningsection.button("Clean Parts", function()
spawn(function()
		local C = 0
		for _, v in pairs(Workspace:GetDescendants()) do 
			if v.Name == "Floodlight" or v.Name == "LargeCrateOpen" or v.Name == "SmallCrateOpen" or v.Name == "Fireplace" then
				Count()
				C = C + 1
				fireserver("ChangeParent", v, nil)
			elseif (v.Name == "Part" or v.Name == "Head" or v.Name == "Truss") then
				if table.find(Vector3Objects,v.Size) then
					Count()
					C = C + 1
					fireserver("ChangeParent", v, nil)
				end
			end
		end
		warn(string.format("Cleaned %s Parts.", D))
	end)
end, true)


cleaningsection.button("UnMesh Parts", function()
    for _, v in pairs(game:GetDescendants()) do
        if v.Name == "Mesh" then
            fireserver("ChangeParent", v, nil)
        end
    end
end, true)

cleaningsection.button("UnWeld Parts", function()
    for _, v in pairs(game:GetDescendants()) do
        if v.Name == "Weld" then
            fireserver("ChangeParent", v, nil)
        end
    end
end, true)

cleaningsection.button("Delete Everything(No Fix)", function()
    for _, v in pairs(game:GetDescendants()) do
        if v.Name == "Anchored Objects" then
            fireserver("ChangeParent", v, nil)
        end
    end
end, true)


local m = window.category("Map Options")
local mmsection = m.section("Coloring")

mmsection.toggle("Spam Color Roads - reimagined/amend", function(bool)
    if bool then
     while wait () do
        colormodel(Workspace["Anchored Objects"]["Plates"]["Roads"], math.random(1,64), math.random(1,12))
        for _, v in pairs(Workspace["Anchored Objects"]["Plates"]["Roads"]:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, math.random(1,64), math.random(1,12))
                elseif not bool then
          end
       end
    end
  end
end, false)
mmsection.button("Random Color Roads", function()
    
    if game.PlaceId == 237590657 or game.PlaceId == 1228674372 then 
        colormodel(Workspace["Anchored Objects"]["Plates"]["Roads"], math.random(1,64), math.random(1,12))
        for _, v in pairs(Workspace["Anchored Objects"]["Plates"]["Roads"]:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, math.random(1,64), math.random(1,12))
            end
        end
    elseif game.PlaceId == 290815963 or game.PlaceId == 1228677761 then 
        colormodel(Workspace["Anchored Objects"]["Plates"]["Roads"], math.random(1,64), math.random(1,12))
        for _, v in pairs(Workspace["Anchored Objects"]["Plates"]["Roads"]:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, math.random(1,64), math.random(1,12))
            end
        end
    end
end, true)

mmsection.textbox("Road Color", function(value)
    mapcolor = setvalue(tonumber(value), 1, 65, .5)

	if game.PlaceId == 237590657 or game.PlaceId == 1228674372 then 
		colormodel(game.Workspace["Anchored Objects"]["Plates"]["Roads"], setvalue(tonumber(value), 1, 65, .5), maptexture)
		for _, v in pairs(game.Workspace["Anchored Objects"]["Plates"]["Roads"]:GetDescendants()) do
			if v:IsA("Model") then
				colormodel(v, setvalue(tonumber(value), 1, 65, .5), maptexture)
			end
		end
	elseif game.PlaceId == 290815963 or game.PlaceId == 1228677761 then 
		colormodel(game.Workspace["Anchored Objects"]["Plates"]["Roads"], setvalue(tonumber(value), 1, 65, .5), maptexture)
		for _, v in pairs(game.Workspace["Anchored Objects"]["Plates"]["Roads"]:GetDescendants()) do
			if v:IsA("Model") then
				colormodel(v, setvalue(tonumber(value), 1, 65, .5), maptexture)
			end
		end
	end
end, "Color ID")

mmsection.button("Random Color Buildings", function()
    
    if game.PlaceId == 237590657 or game.PlaceId == 1228674372 then 
        colormodel(Workspace["Anchored Objects"]["Towns/Cities"], math.random(1,64), math.random(1,12))
        for _, v in pairs(Workspace["Anchored Objects"]["Towns/Cities"]:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, math.random(1,64), math.random(1,12))
            end
        end
    elseif game.PlaceId == 290815963 or game.PlaceId == 1228677761 then 
        colormodel(Workspace["Anchored Objects"]["Towns/Cities"], math.random(1,64), math.random(1,12))
        for _, v in pairs(Workspace["Anchored Objects"]["Towns/Cities"]:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, math.random(1,64), math.random(1,12))
            end
        end
    end
end, true)

mmsection.textbox("Building Color", function(value)
    mapcolor = setvalue(tonumber(value), 1, 65, .5)

	if game.PlaceId == 237590657 or game.PlaceId == 1228674372 then 
		colormodel(game.Workspace["Anchored Objects"]["Plates"]["Roads"], setvalue(tonumber(value), 1, 65, .5), maptexture)
		for _, v in pairs(game.Workspace["Anchored Objects"]["Plates"]["Roads"]:GetDescendants()) do
			if v:IsA("Model") then
				colormodel(v, setvalue(tonumber(value), 1, 65, .5), maptexture)
			end
		end
	elseif game.PlaceId == 290815963 or game.PlaceId == 1228677761 then 
		colormodel(game.Workspace["Anchored Objects"]["Plates"]["Roads"], setvalue(tonumber(value), 1, 65, .5), maptexture)
		for _, v in pairs(game.Workspace["Anchored Objects"]["Plates"]["Roads"]:GetDescendants()) do
			if v:IsA("Model") then
				colormodel(v, setvalue(tonumber(value), 1, 65, .5), maptexture)
			end
		end
	end
end, "Color ID")

mmsection.button("Random Color Buildings", function()
    
    if game.PlaceId == 237590657 or game.PlaceId == 1228674372 then 
        colormodel(Workspace["Anchored Objects"]["Towns/Cities"]["Trees/Foliage"], math.random(1,64), math.random(1,12))
        for _, v in pairs(Workspace["Anchored Objects"]["Towns/Cities"]["Trees/Foliage"]:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, math.random(1,64), math.random(1,12))
            end
        end
    elseif game.PlaceId == 290815963 or game.PlaceId == 1228677761 then 
        colormodel(Workspace["Anchored Objects"]["Towns/Cities"]["Trees/Foliage"], math.random(1,64), math.random(1,12))
        for _, v in pairs(Workspace["Anchored Objects"]["Towns/Cities"]["Trees/Foliage"]:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, math.random(1,64), math.random(1,12))
            end
        end
    end
end, true)




























































local BulletModstab = window.category("BulletMods")
local BulletModssection = BulletModstab.section("BulletMods")
local GunModssection = BulletModstab.section("FireModes")


BulletModssection.toggle("Fire Bullets", function(bool)
    if bool then 
        if not ReplicatedStorage.Effects.Bullet:FindFirstChild("FireEffect") then
            fireserver("ChangeParent", Lighting:FindFirstChild("FireEffect"), ReplicatedStorage.Effects.Bullet)
        end
        Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("FireEffect"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("FireEffect"))
    end
end, false)

BulletModssection.toggle("Sparkle Bullets", function(bool)
   if bool then
    if not ReplicatedStorage.Effects.Bullet:FindFirstChild("Sparkles") then
        fireserver("ChangeParent", Lighting.Materials.RoadFlareLit.Tip:FindFirstChild("Sparkles"), ReplicatedStorage.Effects.Bullet)
    end
    Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("Sparkles"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("Sparkles"))
    end
end, false)

BulletModssection.toggle("Redlight Bullets v.2", function(bool)
   if bool then
    if not ReplicatedStorage.Effects.Bullet:FindFirstChild("PointLight") then
        fireserver("ChangeParent", Lighting.Materials.RoadFlareLit.Tip:FindFirstChild("PointLight"), ReplicatedStorage.Effects.Bullet)
    end
    Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("PointLight"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("PointLight"))
    end
end, false)


BulletModssection.toggle("Snow Bullets", function(bool)
    if bool then 
        if not ReplicatedStorage.Effects.Bullet:FindFirstChild("Droplets4") then
            fireserver("ChangeParent", ReplicatedStorage.Snow:FindFirstChild("Droplets4"), ReplicatedStorage.Effects.Bullet)
        end
    Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("Droplets4"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("Droplets4"))
    end
end, false)

BulletModssection.toggle("Tornado Bullets", function(bool)
    if bool then 
        if not ReplicatedStorage.Effects.Bullet:FindFirstChild("Sheets") then
            fireserver("ChangeParent", ReplicatedStorage.Rain:FindFirstChild("Sheets"), ReplicatedStorage.Effects.Bullet)
        end
    Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("Sheets"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("Sheets"))
    end
end, false)



BulletModssection.toggle("Rain Bullets", function(bool)
    if bool then 
        if not ReplicatedStorage.Effects.Bullet:FindFirstChild("Droplets") then
            fireserver("ChangeParent", ReplicatedStorage.Rain:FindFirstChild("Droplets"), ReplicatedStorage.Effects.Bullet)
        end
    Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("Droplets"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("Droplets"))
    end
end, false)

BulletModssection.toggle("Blood Bullets", function(bool)
    if bool then 
        if not ReplicatedStorage.Effects.Bullet:FindFirstChild("Blood") then
            fireserver("ChangeParent", ReplicatedStorage.Effects:FindFirstChild("Blood"), ReplicatedStorage.Effects.Bullet)
        end
    Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("Blood"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("Blood"))
    end
end, false)



BulletModssection.toggle("Smokey Bullets", function(bool)
    if bool then 
        if not ReplicatedStorage.Effects.Bullet:FindFirstChild("Smoke") then
            fireserver("ChangeParent", ReplicatedStorage.SpawnPlate.Models.Fireplace.Thing:FindFirstChild("Smoke"), ReplicatedStorage.Effects.Bullet)
        end
    Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("Smoke"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("Smoke"))
    end
end, false)

BulletModssection.toggle("Smokey.v2 Bullets", function(bool)
    if bool then 
        if not ReplicatedStorage.Effects.Bullet:FindFirstChild("Smoke") then
            fireserver("ChangeParent", ReplicatedStorage..SpawnPlate.Models.Ural.NotAVehicle.Wheels.RFWheel.Wheel:FindFirstChild("Smoke"), ReplicatedStorage.Effects.Bullet)
        end
    Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("Smoke"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("Smoke"))
    end
end, false)



BulletModssection.toggle("RedLight Bullets", function(bool)
    if bool then 
        if not ReplicatedStorage.Effects.Bullet:FindFirstChild("RedLight") then
            Workspace.Remote.CreateChemlight:FireServer(3020)
            wait(.16)
            fireserver("ChangeParent", Client.Character.Head:FindFirstChild("RedLight"), ReplicatedStorage.Effects.Bullet)
        end
        Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("RedLight"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("RedLight"))
    end
end, false)

BulletModssection.toggle("BlueLight Bullets", function(bool)
    if bool then 
        if not ReplicatedStorage.Effects.Bullet:FindFirstChild("BlueLight") then
            Workspace.Remote.CreateChemlight:FireServer(3022)
            wait(.16)
            fireserver("ChangeParent", Client.Character.Head:FindFirstChild("BlueLight"), ReplicatedStorage.Effects.Bullet)
        end
        Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("BlueLight"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("BlueLight"))
    end
end, false)

BulletModssection.toggle("GreenLight Bullets", function(bool)
    if bool then 
        if not ReplicatedStorage.Effects.Bullet:FindFirstChild("GreenLight") then
            Workspace.Remote.CreateChemlight:FireServer(3021)
            wait(.16)
            fireserver("ChangeParent", Client.Character.Head:FindFirstChild("GreenLight"), ReplicatedStorage.Effects.Bullet)
        end
        Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("GreenLight"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("GreenLight"))
    end
end, false)

GunModssection.dropdown("Fire Modes", function(current)
	firemode = current
end, {"Shotgun", "Pump", "Bolt", "Burst"}, false, true, false, false)

GunModssection.button("Set Firemode", function()
	if firemode == "Shotgun" then 
		for i, v in pairs(Client.Backpack:GetChildren()) do
			if ReplicatedStorage.Weapons:FindFirstChild(v.Name) then
				fireServer("ChangeValue", v.Stats.Action, 5)
				fireServer("ChangeValue", v.Stats.Action.Original, 5)
			end
		end
	elseif firemode == "Pump" then 
		for i, v in pairs(Client.Backpack:GetChildren()) do 
			if ReplicatedStorage.Weapons:FindFirstChild(v.Name) then
				fireserver("ChangeValue", v.Stats.Action, 4)
				fireserver("ChangeValue", v.Stats.Action.Original, 4)
			end
		end
	elseif firemode == "Burst" then 
		for i, v in pairs(Client.Backpack:GetChildren()) do 
			if ReplicatedStorage.Weapons:FindFirstChild(v.Name) then
				fireserver("ChangeValue", v.Stats.Action, 3)
				fireserver("ChangeValue", v.Stats.Action.Original, 3)
			end
		end
	elseif firemode == "Bolt" then 
		for i, v in pairs(Client.Backpack:GetChildren()) do 
			if ReplicatedStorage.Weapons:FindFirstChild(v.Name) then
				fireserver("ChangeValue", v.Stats.Action, 2)
				fireserver("ChangeValue", v.Stats.Action.Original, 2)
			end
		end
	end
end, true)

GunModssection.button("Rainbow Crosshair", function(bool)
while wait() do
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3 = Color3.new(1, 0, 0)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3 = Color3.new(1, 0, 0)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3 = Color3.new(1, 0, 0)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3 = Color3.new(1, 0, 0)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3 = Color3.new(1, 0, 0)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3 = Color3.new(1, 0, 0)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3 = Color3.new(1, 0, 0)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3 = Color3.new(1, 0, 0)
for i=1,15 do
game:GetService("RunService").RenderStepped:wait()
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3.g+(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3.g+(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3.g+(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3.g+(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3.g+(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3.g+(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3.g+(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3.g+(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3.b)
end
for i=1,15 do
game:GetService("RunService").RenderStepped:wait()
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3.r-(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3.r-(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3.r-(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3.r-(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3.r-(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3.r-(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3.r-(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3.r-(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3.b)
end
for i=1,15 do
game:GetService("RunService").RenderStepped:wait()
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3.b+(17/255))
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3.b+(17/255))
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3.b+(17/255))
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3.b+(17/255))
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3.b+(17/255))
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3.b+(17/255))
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3.b+(17/255))
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3.b+(17/255))
end
for i=1,15 do
game:GetService("RunService").RenderStepped:wait()
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3.g-(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3.g-(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3.g-(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3.g-(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3.g-(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3.g-(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3.g-(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3.g-(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3.b)
end
for i=1,15 do
game:GetService("RunService").RenderStepped:wait()
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3.r+(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3.r+(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3.r+(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3.r+(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3.r+(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3.r+(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3.r+(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3.b)
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3.r+(17/255),game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3.b)
end
for i=1,15 do
game:GetService("RunService").RenderStepped:wait()
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BackgroundColor3.b-(17/255))
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Top.BorderColor3.b-(17/255))
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BackgroundColor3.b-(17/255))
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Left.BorderColor3.b-(17/255))
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BackgroundColor3.b-(17/255))
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Right.BorderColor3.b-(17/255))
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BackgroundColor3.b-(17/255))
game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3 = Color3.new(game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3.r,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3.g,game.Players.LocalPlayer.PlayerGui.AmmoCursor.Bin.Cursor.Bottom.BorderColor3.b-(17/255))
end
end
end, false)


--map
mapsection.textbox("Map Color", function(value)
    mapcolor = setvalue(tonumber(value), 1, 65, .5)

	if game.PlaceId == 237590657 or game.PlaceId == 1228674372 then 
		colormodel(game.Workspace["Anchored Objects"].Plates, setvalue(tonumber(value), 1, 65, .5), maptexture)
		for _, v in pairs(game.Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
			if v:IsA("Model") then
				colormodel(v, setvalue(tonumber(value), 1, 65, .5), maptexture)
			end
		end
	elseif game.PlaceId == 290815963 or game.PlaceId == 1228677761 then 
		colormodel(game.Workspace["Anchored Objects"].Plates.Plates, setvalue(tonumber(value), 1, 65, .5), maptexture)
		for _, v in pairs(game.Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
			if v:IsA("Model") then
				colormodel(v, setvalue(tonumber(value), 1, 65, .5), maptexture)
			end
		end
	end
end, "Color ID")

mapsection.textbox("Map Texture", function(value)
    maptexture = setvalue(tonumber(value), 1, 12, .5)

    if game.PlaceId == 237590657 or game.PlaceId == 1228674372 then 
        colormodel(Workspace["Anchored Objects"].Plates, mapcolor, setvalue(tonumber(value), 1, 12, .5))
        for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, mapcolor, setvalue(tonumber(value), 1, 12, .5))
            end
        end
    elseif game.PlaceId == 290815963 or game.PlaceId == 1228677761 then 
        colormodel(Workspace["Anchored Objects"].Plates.Plates, mapcolor, setvalue(tonumber(value), 1, 12, .5))
        for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, mapcolor, setvalue(tonumber(value), 1, 12, .5))
            end
        end
    end
end, "Texture ID")

mapsection.button("Snow Map", function()
    if game.PlaceId == 237590657 or game.PlaceId == 1228674372 then 
        colormodel(Workspace["Anchored Objects"].Plates, 21, 7)
        for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, 21, 7)
            end
        end
    elseif game.PlaceId == 290815963 or game.PlaceId == 1228677761 then 
        colormodel(Workspace["Anchored Objects"].Plates.Plates, 21, 7)
        for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, 21, 7)
            end
        end
    end
end, true)

mapsection.button("Desert Map", function()
    if game.PlaceId == 237590657 or game.PlaceId == 1228674372 then 
        colormodel(Workspace["Anchored Objects"].Plates, 32, 6)
        for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, 32, 6)
            end
        end
    elseif game.PlaceId == 290815963 or game.PlaceId == 1228677761 then 
        colormodel(Workspace["Anchored Objects"].Plates.Plates, 32, 6)
        for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, 32, 6)
            end
        end
    end
end, true)

mapsection.button("Random Map", function()
    if game.PlaceId == 237590657 or game.PlaceId == 1228674372 then 
        colormodel(Workspace["Anchored Objects"].Plates, math.random(1,64), math.random(1,12))
        for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, math.random(1,64), math.random(1,12))
            end
        end
    elseif game.PlaceId == 290815963 or game.PlaceId == 1228677761 then 
        colormodel(Workspace["Anchored Objects"].Plates.Plates, math.random(1,64), math.random(1,12))
        for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, math.random(1,64), math.random(1,12))
            end
        end
    end
end, true)

mapsection.button("Rainbow Map", function()
    while wait (1) do
    if game.PlaceId == 237590657 or game.PlaceId == 1228674372 then 
        colormodel(Workspace["Anchored Objects"].Plates, math.random(1,64), math.random(1,12))
        for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, math.random(1,64), math.random(1,12))
            end
        end
    elseif game.PlaceId == 290815963 or game.PlaceId == 1228677761 then 
        colormodel(Workspace["Anchored Objects"].Plates.Plates, math.random(1,64), math.random(1,12))
        for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, math.random(1,64), math.random(1,12))
            end
        end
    end
    end
end, true)


mapsection.button("Color Everything (No Fix)", function()
    if game.PlaceId == 290815963 or game.PlaceId == 1228677761 then 
        colormodel(Workspace["Anchored Objects"], math.random(1,64), math.random(1,12))
        for _, v in pairs(Workspace["Anchored Objects"]:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, math.random(1,64), math.random(1,12))
            end
        end    
    elseif game.PlaceId == 237590657 or game.PlaceId == 1228674372 then 
        colormodel(Workspace["Anchored Objects"], math.random(1,64), math.random(1,12))
        for _, v in pairs(Workspace["Anchored Objects"]:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, math.random(1,64), math.random(1,12))
            end
        end
    end
end, true)

mapsection.button("Reset Map", function()
    if game.PlaceId == 237590657 or game.PlaceId == 1228674372 then 
        colormodel(Workspace["Anchored Objects"].Plates, 8, 10)
        for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, 8, 10)
            end
        end
    elseif game.PlaceId == 290815963 or game.PlaceId == 1228677761 then 
        colormodel(Workspace["Anchored Objects"].Plates.Plates, 8, 10)
        for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, 8, 10)
            end
        end
    end
end, true)

mapsection.toggle("No Map", function(bool)
    if bool then 
        nomap()
    elseif not bool then
        map()
    end
end, false)

mapsection.toggle("No Buildings", function(bool)
    if bool then 
        nobuildings()
    elseif not bool then
        buildings()
    end
end, false)










--vehicles


local vehiclestab = window.category("Vehicles")
local getcar = vehiclestab.section("Get vehicle")
local modificationsection = vehiclestab.section("Modifications")

modificationsection.label("Will apply function to current car in use")

local VehicleList = {}
local Selection2 = "nil"
for _, v in pairs(Workspace.Vehicles:GetChildren()) do 
	table.insert(VehicleList, v.Name)
end
Workspace.Vehicles.ChildAdded:connect(function(vehicle)
	if table.find(VehicleList, vehicle.Name) then
		return
	else
		table.insert(VehicleList, vehicle.Name)
	end
end)

Workspace.Vehicles.ChildRemoved:Connect(function(vehicle)
	if table.find(VehicleList, vehicle.Name) then
		table.remove(VehicleList, vehicle.Name)
	end
end)
function VBringg(player, vehicle)
	spawn(function()
		Workspace.Remote.AddClothing:FireServer("IsBuildingMaterial", Workspace.Vehicles[vehicle].Essentials.Base, "","","")
		Workspace.Vehicles[vehicle].Essentials.Base:WaitForChild("IsBuildingMaterial")
		Workspace.Remote.ReplicatePart:FireServer(Workspace.Vehicles[vehicle].Essentials.Base, Players[player].Character.HumanoidRootPart.CFrame + Vector3.new(math.random(10, 20), 4, math.random(10, 20)))
		wait(1)
		fireserver("ChangeParent", Workspace.Vehicles[vehicle].Essentials.Base:FindFirstChild("IsBuildingMaterial"), nil)
	end)
end
getcar.textbox("Vehicle Name", function(car)
    Selection2 = car
end, false)
--local current = getcar()
getcar.label("But capital letter infront of vehicle name")
getcar.button("Destroy Vehicle", function()
Destroy(Selection2)
end, true)
getcar.button("Bring Vehicle", function()
		VBringg(Client.Name, Selection2)
end, true)

modificationsection.textbox("Set Vehicle Speed -onroad", function(value)
    current = getcar()
    fireserver("ChangeValue", current.Stats.MaxSpeed, tonumber(value))
	fireserver("ChangeValue", current.Stats.MaxSpeed.Onroad, tonumber(value))
end, "Vehicle Speed")
modificationsection.textbox("Set Vehicle Speed -offroad", function(value)
    current = getcar()
    fireserver("ChangeValue", current.Stats.MaxSpeed, tonumber(value))
	fireserver("ChangeValue", current.Stats.MaxSpeed.Offroad, tonumber(value))
end, "Vehicle Speed")

modificationsection.textbox("Set Vehicle Armor", function(value)
    current = getcar()
	fireserver("ChangeValue", current.Stats.Armor, tonumber(value))
end, "value")
modificationsection.textbox("Set Vehicle Engine", function(value)
    current = getcar()
	fireserver("ChangeValue", current.Stats.Engine, tonumber(value))
end, "value")
modificationsection.textbox("Set Vehicle Fuel", function(value)
    current = getcar()
	fireserver("ChangeValue", current.Stats.Fuel, tonumber(value))
end, "value")
modificationsection.textbox("Set Vehicle Tank", function(value)
    current = getcar()
	fireserver("ChangeValue", current.Stats.Tank, tonumber(value))
end, "value")
modificationsection.textbox("Set Vehicle Hull", function(value)
    current = getcar()
	fireserver("ChangeValue", current.Stats.Hull, tonumber(value))
end, "value")

modificationsection.button("Fix Vehicle", function()
    current = getcar()
    repair(current, 1)
end, true)
modificationsection.button("Destroy Vehicle", function()
current = getcar()
Destroy(current)
end, true)
modificationsection.toggle("God Vehicle", function(bool)
    current = getcar()
    if bool then 
        repair(current, 10000000000)
    elseif not bool then
        repair(current, 1000)
    end
end, false)

modificationsection.textbox("Vehicle Color", function(value)
    current = getcar()

    for _, v in pairs(current:GetDescendants()) do
        if current.Stats.Armor.Value > 0 then 
            if v.Name == "Special" or v.Name == "Color" or v.Name == "White" then 
                colormodel(v, setvalue(value, 1, 65, .5), 2)
            end
        elseif v.Name == "Special" or v.Name == "Color" or v.Name == "White" then
            colormodel(v, setvalue(value, 1, 65, .5), 1)
        end    
        if v.Name ~= "PoliceCar" and v.Name == "ArmorSkirt" then
            colormodel(v, setvalue(value, 1, 65, .5), 2)
        end
    end
end, "Color ID")

modificationsection.button("Rainbow Car (Only Works On Some Cars.)", function(value)
    current = getcar()
    for _, v in pairs(current:GetDescendants()) do
        if current.Stats.Armor.Value > 0 then 
            if v.Name == "Special" or v.Name == "Color" or v.Name == "White" then 
            while wait() do
              colormodel(v, math.random(1,65), math.random(1,1))
              fireserver("VehichleLightsSet", v, "Neon", 0)
wait (0)
            end
                end

        elseif v.Name == "Special" or v.Name == "Color" or v.Name == "White" then
                        while wait() do
              colormodel(v, math.random(1,65), math.random(1,1))
              fireserver("VehichleLightsSet", v, "Neon", 0)
              wait(0)
              end
            end
        end    
        if v.Name ~= "PoliceCar" and v.Name == "ArmorSkirt" then
                        while wait() do
              colormodel(v, math.random(1,65), math.random(1,1))
              fireserver("VehichleLightsSet", v, "Neon", 0)
              wait(0)
            end
        end
end)


modificationsection.button("ForceField Vehicle", function(bool)
    current = getcar()
    if current.Essentials.Color:FindFirstChild("ArmorSkirt") then
        fireserver("ChangeParent", current.Essentials.Color:FindFirstChild("ArmorSkirt"), current)
        fireserver("VehichleLightsSet", current.Essentials.Color:FindFirstChild("ArmorSkirt"), Material, 1, 0)
    end   
    for _, v in pairs(current:GetDescendants()) do
        if v.Name == "Special" or v.Name == "Color" or v.Name == "Black" or v.Name == "White" or v.Name == "LMWheel" or v.Name == "LBWheel" or v.Name == "Black" then
            fireserver("VehichleLightsSet", v, "ForceField", 0)
        end
        if v.Name == "LMWheel" or v.Name == "LBWheel" or v.Name == "Black" or v.Name == "LFWheel" or v.Name == "RFWheel" or v.Name == "RMWheel" or v.Name == "RBWheel" then 
            fireserver("VehichleLightsSet", v, "ForceField", 0)
        end
    end
    current:WaitForChild("ArmorSkirt")
    fireserver("ChangeParent", current:FindFirstChild("ArmorSkirt"), current.Essentials.Color)
end, true)


modificationsection.button("Glass Vehicle", function(bool)
    current = getcar()
    if current.Essentials.Color:FindFirstChild("ArmorSkirt") then
        fireserver("ChangeParent", current.Essentials.Color:FindFirstChild("ArmorSkirt"), current)
        fireserver("VehichleLightsSet", current.Essentials.Color:FindFirstChild("ArmorSkirt"), Material, 1, 0)
    end   
    for _, v in pairs(current:GetDescendants()) do
        if v.Name == "Special" or v.Name == "Color" or v.Name == "Black" or v.Name == "White" or v.Name == "LMWheel" or v.Name == "LBWheel" or v.Name == "Black" then
            fireserver("VehichleLightsSet", v, "Glass", 0.5)
        end
        if v.Name == "LMWheel" or v.Name == "LBWheel" or v.Name == "Black" or v.Name == "LFWheel" or v.Name == "RFWheel" or v.Name == "RMWheel" or v.Name == "RBWheel" then 
            fireserver("VehichleLightsSet", v, "Glass", 0)
        end
    end
    current:WaitForChild("ArmorSkirt")
    fireserver("ChangeParent", current:FindFirstChild("ArmorSkirt"), current.Essentials.Color)
end, true)


modificationsection.button("Neon Vehicle", function(bool)
    current = getcar()
    if current.Essentials.Color:FindFirstChild("ArmorSkirt") then
        fireserver("ChangeParent", current.Essentials.Color:FindFirstChild("ArmorSkirt"), current)
        fireserver("VehichleLightsSet", current.Essentials.Color:FindFirstChild("ArmorSkirt"), Material, 1, 0)
    end   
    for _, v in pairs(current:GetDescendants()) do
        if v.Name == "Special" or v.Name == "Color" or v.Name == "Black" or v.Name == "White" or v.Name == "LMWheel" or v.Name == "LBWheel" or v.Name == "Black" then
            fireserver("VehichleLightsSet", v, "Neon", 0)
        end
        if v.Name == "LMWheel" or v.Name == "LBWheel" or v.Name == "Black" or v.Name == "LFWheel" or v.Name == "RFWheel" or v.Name == "RMWheel" or v.Name == "RBWheel" then 
            fireserver("VehichleLightsSet", v, "Neon", 0)
        end
    end
    current:WaitForChild("ArmorSkirt")
    fireserver("ChangeParent", current:FindFirstChild("ArmorSkirt"), current.Essentials.Color)
end, true)

modificationsection.label("Will apply function to current car in use")

--chat spam 
local chatspamtab = window.category("Chat Spam")
local chatspamsection = chatspamtab.section("Chat Spam")

chatspamsection.textbox("Chat Spam", function(text)
    if text ~= "" then 
        chatspaminput = text
    end
end, "Chat Spam Input")

chatspamsection.toggle("Global Chat", function(bool)
    if bool and chatspaminput ~= "" then 
        globalspam = true 
    elseif not bool then
        globalspam = false
    end
end, false)

chatspamsection.toggle("Group Chat", function(bool)
    if bool and chatspaminput ~= "" then 
        groupspam = true 
    elseif not bool then
        groupspam = false
    end
end, false)

chatspamsection.toggle("Troll Chat", function(bool)
    if bool then 
        trollspam = true 
    elseif not bool then
        trollspam = false
    end
end, false)
	chatspamsection.toggle("New Chat", function(bool)
    if bool then 
        newspam = true 
    elseif not bool then
        newspam = false
    end
end, false)
	chatspamsection.toggle("Randospam", function(bool)
    if bool then 
        randospam = true 
    elseif not bool then
        randospam = false
    end
end, false)

--scripts
local scriptstab = window.category("Scripts")
local scriptssection = scriptstab.section("Scripts")

scriptssection.button("Inf. Yeild", function(bool)
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end, true)

scriptssection.button("Random ESP (Requested)", function(bool)
    loadstring(game:HttpGet(('https://pastebin.com/raw/uc6LV1cm'),true))()
end, true)

scriptssection.button("Ventrix -synapse req", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/undesiredwrld/Ventrix-Development/main/custom_loader.lua"))()
end, true)
scriptssection.button("Zanikes", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Zanikes/zanikes-hub/main/Main.lua", true))();
end, true)
scriptssection.button("SethMilkman AR GUI", function()
    loadstring(game:GetObjects('rbxassetid://291556436')[1].Source)()
end, true)
scriptssection.button("Ponnte v2", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/vvR37eTn", true))();
end, true)

    scriptssection.button("Neptunium v.n3", function()
loadstring(game:HttpGet("https://pastebin.com/raw/yrGGY6sf", true))()
end, true)

    scriptssection.button("Old XR Hub", function()
loadstring(game:HttpGet("https://pastebin.com/raw/WBcXn2je", true))()
end, true)

scriptssection.button("Lightning GUI", function(bool)
    loadstring(game:HttpGet(('https://pastebin.com/raw/stPBzPJ0'),true))()
end, true)

scriptssection.button("Random TP Script", function(bool)
    loadstring(game:HttpGet(('https://pastebin.com/raw/PH2eLhxi'),true))()
end, true)

scriptssection.button("Command X  (CMD-x) " , function(bool)
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source'),true))()
end, true)

scriptssection.button("Custom Skins - Broken But Can Use - ", function(bool)
    loadstring(game:HttpGet(('https://pastebin.com/raw/4fZvusC8'),true))()
end, true)

scriptssection.button("Apoc X (Better Aimbot)", function(bool)
    loadstring(game:HttpGet("https://pastebin.com/raw/eCCmuezM", true))()
end, true)

scriptssection.button("Victini Gui", function(bool)
    loadstring(game:HttpGet("https://pastebin.com/raw/TzqAK8sP", true))()
end, true)

scriptssection.button("Impulse Hub", function(bool)
    loadstring(game:HttpGet('http://impulse-hub.xyz/ImpulseHub',true))()
end, true)

scriptssection.button("Apoc Hub", function(bool)
    loadstring(game:HttpGet("https://pastebin.com/raw/Ks6hHaDm", true))()
end, true)

scriptssection.button("Apoc Chatlogs", function(bool)
    loadstring(game:HttpGet("https://pastebin.com/raw/UmDQDNDn", true))();
end, true)

--themes 
local ThemeCategory = window.category("Themes")
local ThemeSection = ThemeCategory.section("Themes")

ThemeSection.colorpicker("Background Color", function(col)
library:SetThemeColor("BackgroundColor", col, 0)
end, Color3.fromRGB(40, 40, 40), false)

ThemeSection.colorpicker("Text Color", function(col)
library:SetThemeColor("TextColor", col, 0)
end, Color3.fromRGB(255, 255, 255), false)

ThemeSection.colorpicker("Accent Color", function(col)
library:SetThemeColor("AccentColor", col, 0)
end, Color3.fromRGB(30, 30, 30), false)

ThemeSection.colorpicker("Gray Contrast Color", function(col)
library:SetThemeColor("GrayContrastColor", col, 0)
end, Color3.fromRGB(35, 35, 35), false)

ThemeSection.colorpicker("Dark ContrastColor", function(col)
library:SetThemeColor("DarkContrastColor", col, 0)
end, Color3.fromRGB(25, 25, 25), false)

-- Red = Disconnected.
-- Green = Connected.
-- Magenta = XR Users./Victini Users.
-- Brown = HGod.
-- Brown = JJGod
-- LIGHT BLUE = PkGod.
--Yellow = Infinite Vitals.
--Blue = Account Ages


rconsoleclear()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/log.lua", true))()
CreateFloatingTextBox("Script Loaded Correctly!", 3, 25, 255, 25)

local Players = game:GetService("Players")
local Client = Players.LocalPlayer

rconsolename('XR Detections! - Waittime is 100 secs / If it dosent close please report this as a issue')
for _, v in pairs(Players:GetPlayers()) do
    if v ~= client then
        rconsoleerr(tostring(v) .. " Acc Age Is " .. v.AccountAge .. "\n")
    end
end

Players.PlayerAdded:Connect(function(player)
    rconsoleprint("@@GREEN@@")
    rconsoleprint(string.format("[Joined]: %s Connected To The Server.\n", player))
        
    rconsoleerr(tostring(player) .. " Acc Age Is " .. player.AccountAge .. "\n")
            
    if player.AccountAge < 1 then
        rconsoleprint("@@BLUE@@")
        rconsoleprint("[NB]: " .. tostring(player) .. " Is A NewBorn.\n")
    end
        
    if player.AccountAge > 364 then
        rconsoleprint("@@BLUE@@")
        rconsoleprint("[GP]: " .. tostring(player) .. " Is A Grandpa.\n")
    end
end)
    
Players.PlayerRemoving:Connect(function(player)
    rconsoleprint("@@RED@@")
    rconsoleprint(string.format("[Left]: %s Disconnected.\n", player))
end)


function Check()
    for _, v in pairs(Players:GetPlayers()) do
        --if v ~= Client then
            pcall(function()
              while wait(10) do
                
                if v.Character:FindFirstChild("IsSpawned").Value == true then
                    if not v.Character:FindFirstChild("Humanoid") and not v:FindFirstChild("Humanoid") then
                        rconsoleprint("@@BROWN@@")
                        rconsoleprint("[JJG]: " .. tostring(v) .. " Has JJGod.\n")
                    end
                end
                
                if v:FindFirstChild("playerstats") then
                    local Stats = v.playerstats
                
                    if Stats.character:FindFirstChild("AA") then
                        rconsoleprint("@@MAGENTA@@")
                        rconsoleprint("[XR]: " .. tostring(v) .. " Is Using XR Hub.\n")
                    end
                    
                    
                    
                    if CheckNumber(Stats.Hunger.Value) == nil or CheckNumber(Stats.Thirst.Value) == nil then
                        rconsoleprint("@@YELLOW@@")
                        rconsoleprint("[Inf]: " .. tostring(v) .. " Has Inf Vitals.\n")
                    end
                end
                
                if v.Character and v.Character:FindFirstChild("Humanoid") then
                    local Hum = v.Character.Humanoid
                    
                    if Hum.Health < 0 or CheckNumber(Hum.Health) == nil then
                        rconsoleprint("@@BROWN@@")
                        rconsolprint("[HG]: " .. tostring(v) .. " Has HGod.\n")
                    end
                    
                    if Hum:FindFirstChild("DefenseMultiplier") and Hum["DefenseMultiplier"]:IsA("StringValue") and tonumber(Hum["DefenseMultiplier"].Value) == 0 then
                        rconsoleprint("@@LIGHT_BLUE@@")
                        rconsoleprint("[!]: " .. tostring(v) .. " Has PkGod.\n")
                    end
                end
            end
        end)
    end
end

function CheckNumber(Numb)
    return tonumber(string.sub(tostring(Numb), 1, 1))
end

Players.PlayerAdded:Connect(Check)
Players.PlayerRemoving:Connect(Check)
Client.CharacterAdded:Connect(Check)
spawn(function()
while wait(10) do
    Check()
  end
end)

while wait(10) do
    
    --[[
    rconsoleprint("@@CYAN@@")
    rconsoleprint("--------------------------------------------------\n")

    rconsoleprint("@@LIGHT_GRAY@@")
    rconsoleprint(" New Line!")

    rconsoleprint("@@CYAN@@")
    rconsoleprint("\n--------------------------------------------------")
    ]]

    Check()
end

---Detections (Apoc)
