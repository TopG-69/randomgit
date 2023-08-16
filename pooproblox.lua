
do
    if game.CoreGui:FindFirstChild("Neptunium") then
        game.CoreGui:FindFirstChild("Neptunium"):Destroy()
    end
end
local Time = tick()
Neptunium = game:GetObjects("rbxassetid://9766845497")[1]
Neptunium.Parent = game.CoreGui
MessageBox = Neptunium.MessageBox
Console = Neptunium.Console
Text = Neptunium.Console.Text
Type = Neptunium.Console.Type
Drag = Neptunium.Console.Drag
Commands = Neptunium.Console.Text.Commands
UIListLayout = Neptunium.Console.Text.Commands.UIListLayout
Error = Neptunium.Console.Text.Error
Success = Neptunium.Console.Text.Success
Player = Neptunium.Console.Text.Player
Info = Neptunium.Console.Text.Info
Console.Visible = false
MessageBox.Visible = true
Buttons = MessageBox.Buttons

local function AdaptUI(Scroll, Layout)
	Scroll.CanvasSize = UDim2.new(0,0,0,Layout.AbsoluteContentSize.Y+10)
end

function success(Message)
	local SuccessMessage = Success:Clone()
	SuccessMessage.SuccessReply.Text = Message
	SuccessMessage.Parent = Commands
	SuccessMessage.Visible = true   
end

function player(Message)
	local PlayerMessage = Player:Clone()
	PlayerMessage.PlayerReply.Text = Message
	PlayerMessage.Parent = Commands
	PlayerMessage.Visible = true   
end

function error(Message)
	local ErrorMessage = Error:Clone()
	ErrorMessage.ErrorReply.Text = Message
	ErrorMessage.Parent = Commands
	ErrorMessage.Visible = true   
end

function info(Message)
	local InfoMessage = Info:Clone()
	InfoMessage.InfoReply.Text = Message
	InfoMessage.Parent = Commands
	InfoMessage.Visible = true   
end

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local TestService = game:GetService("TestService")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MessagingService = game:GetService("MessagingService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local Client = Players.LocalPlayer
local Mouse = Client:GetMouse()


if not isfolder("Neptunium") then 
    makefolder("Neptunium") 
end

if not isfile("Neptunium/Neptunium_Bans.txt") then
    writefile("Neptunium/Neptunium_Bans.txt", HttpService:JSONEncode({}))
end

if not isfile("Neptunium/Neptunium_Prefix.txt") then
    writefile("Neptunium/Neptunium_Prefix.txt", HttpService:JSONEncode("~"))
end

local banData = HttpService:JSONDecode(readfile("Neptunium/Neptunium_Bans.txt"))
Prefix = HttpService:JSONDecode(readfile("Neptunium/Neptunium_Prefix.txt"))

    Mapname = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    local Namelength = 20
    if string.sub(Mapname, 1, 6) == "Xbox" then
        Namelength = Namelength + 5
    end
    Mapname = string.sub(Mapname, Namelength) 

    ServerID = require(ReplicatedStorage.Node).Remote.GetServer:InvokeServer()

    MessageBox.Title.Text = "Neptunium"
    MessageBox.Message.Text = "Welcome, " .. Client.Name .. "!\n Map Name : " .. Mapname .. "\nChathook Prefix : " .. "(\"" .. Prefix .. "\")".."\n Execution Time : " .. string.format("%.3f ms",(tick() - Time))
    Buttons.OkButton.Visible = true 

    Buttons.OkButton.Ok.MouseButton1Down:Connect(function()
        MessageBox.Visible = false
        Buttons.OkButton.Visible = false
        Console.Visible = true
    end)
    
    Buttons.YesNo.Yes.MouseButton1Down:Connect(function()
        Client.PlayerGui.HitEqualsYouDie:FindFirstChild("JumpLimiter").Parent = nil
        MessageBox.Visible = false
        Buttons.YesNo.Visible = false
    end)
    Buttons.YesNo.No.MouseButton1Down:Connect(function()
        MessageBox.Visible = false
        Buttons.YesNo.Visible = false
    end)

    Serial = debug.getupvalues(debug.getupvalues(getrawmetatable(getrenv().shared).__index)[3])[6];
    GetKey = debug.getupvalues(debug.getupvalues(getrawmetatable(getrenv().shared).__index)[3])[7];

    local Utils = {["Remotes"] = {}};
    
    for A, B in pairs(game:GetDescendants()) do
        if B:IsA("RemoteEvent") then
            Utils.Remotes[tostring(B)] = B;
        end;
    end;

    function fireServer(A, ...)
        Utils.Remotes[tostring(A)]:FireServer(Serial({...}, GetKey()));
    end;


    Moderators = {}
    local Nonmods = {["ws"] = true, ["jp"] = true, ["nofall"] = true, ["nofog"] = true, ["spec"] = true, ["oneshot"] = true, ["mod"] = true, ["unmod"] = true, ["getbans"] = true, ['setprefix'] = true}

    KitsList = {
        ["M14"] = {"MilitaryPackBlack","M14","G18",{"M14Ammo50",10},"M9Ammo32",{"BloodBag",8},"ACOG","Grip","Suppressor762","Suppressor9","Laser","Painkillers","Katana","Entrencher","Detonator"},
        ["FAL"] = {"MilitaryPackBlack","FAL","G18",{"M14Ammo50",10},"M9Ammo32",{"BloodBag",8},"ACOG","Grip","Suppressor762","Suppressor9","Laser","Painkillers","Katana","Entrencher","Detonator"},
        ["MK17"] = {"MilitaryPackBlack","Mk 17","G18",{"M14Ammo50",10},"M9Ammo32",{"BloodBag",8},"ACOG","Grip","Suppressor762","Suppressor9","Laser","Painkillers","Katana","Entrencher","Detonator"},
        ["HK21"] = {"MilitaryPackBlack","HK21","G18",{"M14Ammo50",10},"M9Ammo32",{"BloodBag",8},"ACOG","Grip","Suppressor762","Suppressor9","Laser","Painkillers","Katana","Entrencher","Detonator"},
        ["G36K"] = {"MilitaryPackBlack","G36K","G18",{"STANAGAmmo100",10},"M9Ammo32",{"BloodBag",8},"ACOG","Grip","Suppressor556","Suppressor9","Laser","Painkillers","Katana","Entrencher","Detonator"},
        ["Patriot"] = {"MilitaryPackBlack","Patriot","G18",{"STANAGAmmo100",10},"M9Ammo32",{"BloodBag",8},"ACOG","Grip","Suppressor556","Suppressor9","Laser","Painkillers","Katana","Entrencher","Detonator"},
        ["M4A1"] = {"MilitaryPackBlack","M4A1","G18",{"STANAGAmmo100",10},"M9Ammo32",{"BloodBag",8},"ACOG","Grip","Suppressor556","Suppressor9","Laser","Painkillers","Katana","Entrencher","Detonator"},
        ["SCAR-L"] = {"MilitaryPackBlack","SCAR-L","G18",{"STANAGAmmo100",10},"M9Ammo32",{"BloodBag",8},"ACOG","Grip","Suppressor556","Suppressor9","Laser","Painkillers","Katana","Entrencher","Detonator"},
        ["Navigation"] = {"OmniLight","Map","GPS","Katana","Entrencher","Detonator","Binoculars","Compass","GreenChemlight","BlueChemlight","RedChemlight"}
    }

    

    checkpermission = function(Player)
        for _, v in pairs(Moderators) do
            if v:lower() == Player:lower() then
                return true
            end
        end
    end

    Players.PlayerRemoving:Connect(function(Player)
        --[[if table.find(Moderators, Player.Name) then
            table.remove(Moderators, table.find(Moderators, Player.Name)) 
        end--]]
    end)

    function FindLastChild(Instance, Item)
        local Last
        for i,v in pairs(Instance:GetChildren()) do
            if tostring(v) == Item then
                Last = v
            end
        end
        return Last
    end

    local meta = getrawmetatable(game)
    local nc = meta.__namecall 
    setreadonly(meta, false)
    meta.__namecall = newcclosure(function(rc, ...)
        if getnamecallmethod() == "FindLastChild" then
            return FindLastChild(rc, ...)
        end
        return nc(rc, ...)
    end)

    
    --toggles
    _G.silentaim = false
    OListT = false
    --

    info("Removed Localized Checks")

    function checkargs(Content, Args)
        if not Args then
            error(Content .. " is either nil or invalid")
            return true
        end   
    end

    function noclient(Player)
        if Player == Client.Name then 
            error("This command does not apply on client")
            return true
        end
    end

    function notloaded(Player)
        if not workspace:FindFirstChild(Player) then
            error(Player .. " is either not loaded in or punished")
            return true
        end 
    end

    function notspawned(Player)
        if not Players[Player].Character.IsSpawned.Value == true then
            error(Player .. " is not spawned in")
            return true
        end 
    end

    SpawnedItems = {}
    function Spawn(Player, Item, Parent, Offset, Spawn)
        if Player == nil or Item == nil or GetItemFromString(Item, Parent) == nil then
            return
        end
        Item = GetItemFromString(Item, Parent)
        if Spawn == nil then
            Limiter()
        end
        if SpawnedItems[Item] == nil then
            SpawnedItems[Item] = {true}
        else
            table.insert(SpawnedItems[Item], true)
        end
        if Item.Parent ~=  Lighting.Materials then
            fireServer("ChangeParent", Parent:WaitForChild(tostring(Item)), Lighting.Materials)
        end
        local ItemWait = Lighting.Materials:WaitForChild(tostring(Item))
        if ItemWait.PrimaryPart == nil then
            ItemWait.PrimaryPart = GetPart(ItemWait)
        end
        pcall(function() Utils.Remotes["PlaceMaterial"]:FireServer(Lighting.Materials:WaitForChild(tostring(Item)).Name, Player.Character.Torso.Position - ItemWait.PrimaryPart.Position - Offset) end)
        spawn(function()
            wait(2)
            table.remove(SpawnedItems[Item], 1)
            if #SpawnedItems[Item] < 1 then
                fireServer("ChangeParent", Lighting.Materials:WaitForChild(tostring(Item)), Parent)
            end
        end)
    end

    local function setParent(instance, parent)
        fireServer("ChangeParent", instance, parent)
        repeat wait() until instance.Parent == parent
    end
    
    local function destroy(instance)
        fireServer("ChangeParent", instance)
    end

    function setoutfit(Player, Type, ID)
        spawn(function()
            local Instance = Players[Player].playerstats.character[string.lower(Type)]
            id = id or 0
            fireServer("ChangeValue", Instance.ObjectID[Type], ID)
            Utils.Remotes["AddClothing"]:FireServer("abea21bcf13eee69d2b0a833f38b1340", Instance, "", "", "")
            wait()
            fireServer("ChangeParent", Instance:WaitForChild("abea21bcf13eee69d2b0a833f38b1340"), nil)
        end)
    end

    function checkweapon(Weapon, Player)
        if not Players[Player].Character:FindFirstChild("IsSpawned") or not Players:FindFirstChild(Player) or not Players[Player]:FindFirstChild("Backpack") then
            error("Error with " .. Player .. " possible instance missing: " .. Player .. " is nil / " .. Player ..  ".Backpack is nil / " .. Player .. ".Character.IsSpawned is nil")
            return true
        end
        if notspawned(Player) then return true end
        local Weaponfound = false
        for _, v in pairs(Players[Player].Backpack:GetChildren()) do
            if v.Name == Weapon then
                Weaponfound = true
            end
        end
        if not Weaponfound then
            error(Player .. " is missing " .. Weapon)
            return true 
        end
    end

    function checkgroup(Player)
        local GroupFound = false
        repeat wait() until game.Lighting.Groups ~= nil 
        for _, v in pairs(game.Lighting.Groups:GetDescendants()) do 
            if v:IsA("StringValue") and v.Value == Player then
                GroupFound = true
            end
        end
        if GroupFound == false then 
            error(Player .. " is not in a group")
            return true
        end
    end

    function nohumanoid(Player)
        if not Players[Player].Character:FindFirstChild("Humanoid") then
            error(Player.Name .. "'s Humanoid Is Missing Or Is Removed")
            return true
        end 
    end


    function getgroup(Player)
        repeat wait() until game.Lighting.Groups ~= nil 
        for _, v in pairs(game.Lighting.Groups:GetDescendants()) do 
            if v:IsA("StringValue") and v.Value == Player then 
                return tostring(v.Parent)
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

    local function GetBM(str)
        if str == nil or str == "" then return end
        for _, Material in pairs(game.Lighting.Materials:GetChildren()) do 
            if Material.Name:lower() == str:lower() then
                return Material.Name
            end
        end
        for _, Material in pairs(game.Lighting.Materials:GetChildren()) do 
            if Material.Name:lower():sub(1, #str) == str:lower() then
                return Material.Name
            end
        end
        return 
    end
    
    local function GetPlayer(str)
        if str == nil or str == "" then return end
        for _, Player in pairs(Players:GetPlayers()) do 
            if Player.Name:lower() == str:lower() then
                return Player.Name
            end
        end
        for _, Player in pairs(Players:GetPlayers()) do
            if Player.Name:lower():sub(1, #str) == str:lower() then
                return Player.Name
            end
        end
        return 
    end

    function silentaim()
        local CurrentPlayer = nil 
        local Cam = workspace.CurrentCamera
        
        local Meta = getrawmetatable(game)
        local Name = Meta.__namecall 
        setreadonly(Meta,false)
        
        local function CloestPlayer()
            local Plr;
            local Shearch = math.huge 
            
            for _,V in pairs(Players:GetChildren()) do 
                if V ~= Client and V.Character and V.Character:FindFirstChild("Head") then 
                    local Vec,On = Cam:WorldToViewportPoint(V.Character.Head.Position)
                    local Mag = (Vector2.new(Mouse.X,Mouse.Y) - Vector2.new(Vec.X,Vec.Y)).Magnitude
                    local DistanceCheck = (Cam.CFrame.Position - V.Character.Head.Position).Magnitude
        
                    if On and Mag < Shearch and DistanceCheck <= 5000000000 then 
                        Shearch = Mag 
                        Plr = V
                    end 
                end 
            end 
            return Plr 
        end 
        
        Meta.__namecall = newcclosure(function(...)
            local Args = {...}
            local Method = getnamecallmethod()
            local Calling = getcallingscript()
        
            if _G.silentaim == true then
            if Method == "FindPartOnRayWithIgnoreList" and tostring(Calling) == "Shooter" then 
                if CurrentPlayer then 
                    Args[2] = Ray.new(Cam.CFrame.Position,(CurrentPlayer.Character.Head.Position - Cam.CFrame.Position).Unit * 10000)
                    return Name(unpack(Args))
                end 
            end 
        end
            return Name(unpack(Args))
        end)
        
        game:GetService("RunService").RenderStepped:Connect(function()
            local Closest = CloestPlayer()
            
            if Closest then 
                CurrentPlayer = Closest
            else 
                CurrentPlayer = nil
                wait()
            end 
        end)
    end

    local function GetVehicles(str)
        if str == nil or str == "" then return end
        for _, Vehicles in pairs(workspace.Vehicles:GetChildren()) do 
            if Vehicles.Name:lower() == str:lower() then
                return Vehicles.Name
            end
        end
        for _, Vehicles in pairs(workspace.Vehicles:GetChildren()) do
            if Vehicles.Name:lower():sub(1, #str) == str:lower() then
                return Vehicles.Name
            end
        end
        return 
    end

    local SpacedItems = {
        ["M1 Garand"] = "M1Garand",
        ["Model 29"]  = "Model29",
        ["Mk 48"] = "Mk48",
        ["Mk 17"] = "Mk17",
        ["Mk 23"] = "Mk23",
        ["Model 459"] = "Model459"
    }


    function GetItemFromString(Item, Parent)
        if Parent:FindFirstChild(Item) then
            return Parent[Item]
        elseif Lighting.Materials:FindFirstChild(Item) then
            return Lighting.Materials[Item]
        end
    end


    local function GetItemName(str)
        if str == nil or str == "" then return end
        for _, Item in pairs(Lighting.LootDrops:GetChildren()) do
            local Original = Item.Name
            if SpacedItems[Item.Name] then
                Item = SpacedItems[Item.Name]
            else
                Item = Item.Name
            end
            if Item:lower() == str:lower() then
                return Original
            end
        end
        for _, Item in pairs(Lighting.LootDrops:GetChildren()) do
            local Original = Item.Name
            if SpacedItems[Item.Name] then
                Item = SpacedItems[Item.Name]
            else
                Item = Item.Name
            end
            if Item:lower():sub(1, #str) == str:lower() then
                return Original
            end
        end
        return 
    end

    local SpacedWeapons = {
        ["M1 Garand"] = "M1Garand",
        ["Instance 29"]  = "Instance29",
        ["Mk 48"] = "Mk48",
        ["Mk 17"] = "Mk17",
        ["Mk 23"] = "Mk23",
        ["Instance 459"] = "Instance459"
    }


    local function GetWeapon(str)
        if str == nil or str == "" then return end
        for _, Weapon in pairs(ReplicatedStorage.Weapons:GetChildren()) do
            local Original = Weapon.Name
            if SpacedWeapons[Weapon.Name] then
                Weapon = SpacedWeapons[Weapon.Name]
            else
                Weapon = Weapon.Name
            end
            if Weapon:lower() == str:lower() then
                return Original
            end
        end
        for _, Weapon in pairs(ReplicatedStorage.Weapons:GetChildren()) do
            local Original = Weapon.Name
            if SpacedWeapons[Weapon.Name] then
                Weapon = SpacedWeapons[Weapon.Name]
            else
                Weapon = Weapon.Name
            end
            if Weapon:lower():sub(1, #str) == str:lower() then
                return Original
            end
        end
        return 
    end

    local SpacedLocations = {
        ["Military Airfield"] = "MilitaryAirfield",
        ["Power Plant"]  = "PowerPlant",
        ["Radio Tower"] = "RadioTower",
        ["Fort Ruins"] = "FortRuins",
        ["Trinity HQ"] = "TrinityHQ",
        ["Car Dealership"] = "CarDealership",
        ["Pitts Park"] = "PittsPark",
        ["Windy Peak Campground"]  = "WindyPeakCampground",
        ["Military Outpost"] = "MilitaryOutpost",
        ["Bump Flatts"] = "BumpFlatts",
        ["SW Airfield"] = "SWAirfield",
        ["NE Airfield"] = "NEAirfield"
    }
    local function GetLocation(str)
        if str == nil or str == "" then return end
        for _, Location in pairs(workspace.Locations:GetChildren()) do
            local Original = Location.Name
            if SpacedLocations[Location.Name] then
                Location = SpacedLocations[Location.Name]
            else
                Location = Location.Name
            end
            if Location:lower() == str:lower() then
                return Original
            end
        end
        for _, Location in pairs(workspace.Locations:GetChildren()) do
            local Original = Location.Name
            if SpacedLocations[Location.Name] then
                Location = SpacedLocations[Location.Name]
            else
                Location = Location.Name
            end
            if Location:lower():sub(1, #str) == str:lower() then
                return Original
            end
        end
        return 
    end

    local function GetMaterials(str)
        if str == nil or str == "" then return end
        for _, Materials in pairs(Enum.Material:GetEnumItems()) do 
            if Materials.Name:lower() == str:lower() then
                return Materials.Name
            end
        end
        for _, Materials in pairs(Enum.Material:GetEnumItems()) do
            if Materials.Name:lower():sub(1, #str) == str:lower() then
                return Materials.Name
            end
        end
        return 
    end

    local AttachmentList = {
        ["CCO"] = {"sight", 9001},
        ["Holo"] = {"sight", 9002},
        ["Reflex"] = {"sight", 9003},
        ["Kobra"] = {"sight", 9004},
        ["Grip"] = {"under", 9005},
        ["Laser"] = {"under", 9006},
        ["Suppressor9"] = {"silencer", 9007},
        ["Suppressor45"] = {"silencer", 9008},
        ["Suppressor556"] = {"silencer", 9009},
        ["Suppressor762"] = {"silencer", 9010},
        ["Suppressor545"] = {"silencer", 9011},
        ["Flashlight"] = {"under", 9012},
        ["Acog"] = {"sight", 9013},
        ["SUSAT"] = {"sight", 9014}
    }

    local function GetAttachments(str)
        if str == nil or str == "" then return end
        for Attachment in pairs(AttachmentList) do 
            if Attachment:lower() == str:lower() then
                return Attachment
            end
        end
        for Attachment in pairs(AttachmentList) do
            if Attachment:lower():sub(1, #str) == str:lower() then
                return Attachment
            end
        end
        return 
    end

    function GetPart(Model)
        local Part = nil
        for _, v in pairs(Model:GetDescendants()) do
            if v:IsA("BasePart") and (Part == nil or tostring(v) == "Head" or tostring(v) == "Driver") then
                Part = v
            end
        end
        return Part
    end

    local Amount = 0
    MaxAmount = 1500
    TimeToWait = 1
    function Limiter()
        Amount = Amount + 1
        if Amount >= MaxAmount then
            task.wait(TimeToWait)
            Amount = 0
        end
    end
    -- Anti Exploit 
    function AntiTpKick()
        for i, v in pairs(Client.Character:GetChildren()) do
        repeat wait() until Client.Character ~= nil and Client.Character:FindFirstChild("HumanoidRootPart")
            local TryTpKick = false
            v.ChildAdded:Connect(function(Ch)
                if tostring(Ch) == "IsBuildingMaterial" and Ch.Value ~= "Bypassed" then
                    Utils.Remotes["Detonate"]:FireServer(Ch)
                    TryTpKick = true
                    pcall(function()
                        repeat fireServer("ChangeParent", Ch) wait() until Ch.Parent == nil
                    end)
                    TryTpKick = false
                end
            end)
        end
    end
        
    Client.CharacterAdded:Connect(AntiTpKick)
    AntiTpKick()

    local OldIndex;
    OldIndex = hookmetamethod(game, "__index", newcclosure(function(Item, Property)
        if tostring(Item) == "PermanentBan" and Property == "Name" then
            info("Attempt To Crash Your Client!");
            return;
        end
        return OldIndex(Item, Property);
    end))

    local OldOldIndex;
    OldOldIndex = hookmetamethod(game, "__newindex", newcclosure(function(Item, Property, Val)
        if typeof(Item) == "Instance" and Item:IsA("Player") then
            if not checkcaller() and Property == "Parent" and Val ~= Players then
                print(tostring(Item) .. " Attempt To Go Offlist!");
                return;
            end;
        end;

        return OldOldIndex(Item, Property, Val);
    end))

    local OldName;
    OldName = hookmetamethod(game, "__namecall", newcclosure(function(Item, ...)
        local Args = {...};
        local Method = getnamecallmethod();

        if Method == "FindFirstChild" and Args[1] == "PermanentBan" and Item == Client then
            info("Attempt To Crash & Kill Your Client!");
            return;
        end;

        return OldName(Item, ...);
    end))

    pcall(function() fireServer("ChangeParentLocal", Workspace.Remote:FindFirstChild("SpawnCrate")) end)
    --Anti Exploit done

    function kickplayer(Player)	
        spawn(function()	
            Utils.Remotes["AddClothing"]:FireServer("PermanentBan", Players[Player] , "", "", "")
            task.wait(1)
            fireServer("ChangeParent", Player)
        end)
    end

    spawn(function()
        for i,v in pairs(banData) do
            local playerName = tostring(i)
            if playerName and game.Players:FindFirstChild(playerName) then
                kickplayer(playerName)
                info(string.format("%s Attempt To Join Was Denied.", playerName))
            end
        end
    end)
    
    Players.PlayerAdded:Connect(function(Player)
        if banData[tostring(Player)] then
            kickplayer(tostring(Player))
        end
    end)

    function teleport(Player, Parameters)
        pcall(function()
            spawn(function()
                repeat wait() until Players[Player] ~= nil and Players[Player].Character ~= nil and Players[Player].Character.Torso ~= nil 
                Utils.Remotes["AddClothing"]:FireServer("driven", Players[Player].Character, "","","")
                Utils.Remotes["AddClothing"]:FireServer("IsBuildingMaterial", Players[Player].Character.Torso, "Bypassed","","")
                Utils.Remotes["AddClothing"]:FireServer("SeatPoint", Players[Player].Character.Torso, "","","")
                repeat wait() until Players[Player].Character.Torso:FindFirstChild("IsBuildingMaterial") and Players[Player].Character.Torso:FindFirstChild("SeatPoint") and Players[Player].Character:FindFirstChild("driven")
                wait(.1)
                Utils.Remotes["HurtZombie"]:FireServer(Players[Player].Character)
                Utils.Remotes["ReplicatePart"]:FireServer(Players[Player].Character.Torso, Parameters) 
                wait(1.1)
                fireServer("ChangeParent", Players[Player].Character.Torso.IsBuildingMaterial, nil)
                fireServer("ChangeParent", Players[Player].Character.Torso.SeatPoint, nil)
                Players[Player].Character:WaitForChild("driven")
                fireServer("ChangeParent", Players[Player].Character.driven, nil)
            end)
        end)
    end 

    function colormodel(Instance, Color, Texture)
        spawn(function()
            if not Instance:FindFirstChild("SecondaryColor") then
                Utils.Remotes["AddClothing"]:FireServer("SecondaryColor", Instance, "", "", "")
                repeat wait() until Instance:FindFirstChild("SecondaryColor")
            end
            Utils.Remotes["ColorGun"]:FireServer(Instance, Color, Texture, Color, Texture)
            wait(.5)
            for _, v in pairs(Instance:GetChildren()) do
                if v.Name == "SecondaryColor" then 
                    fireServer("ChangeParent", v, nil)
                end
            end
        end)
    end

    function repair(Vehicle, Boolean, Value, Fuel)
        if Boolean then 
            fireServer("WindowArmorSet", Vehicle.Essentials.Details:FindFirstChild("Windows") , "Ballistic")
            for _, v in pairs(Vehicle.Wheels:GetChildren()) do 
                fireServer("WheelVisibleSet", v, "Armored")
            end
            if Vehicle == "Firetruck" or Vehicle == "Ambulance" then
                fireServer("HullArmorSet", Vehicle:FindFirstChild("ArmorSkirt", true))
            else        
                fireServer("HullArmorSet", Vehicle:FindFirstChild("ArmorSkirt", true), Vehicle:FindFirstChild("Color", true), Vehicle:FindFirstChild("Special", true))
            end
        end
        fireServer("ChangeValue", Vehicle.Stats.Hull, Value)
        fireServer("ChangeValue", Vehicle.Stats.Hull.Max, Value)
        fireServer("ChangeValue", Vehicle.Stats.Engine, Value)
        fireServer("ChangeValue", Vehicle.Stats.Engine.Max, Value)
        fireServer("ChangeValue", Vehicle.Stats.Tank, Value)
        fireServer("ChangeValue", Vehicle.Stats.Tank.Max, Value)
        fireServer("ChangeValue", Vehicle.Stats.Armor, Value)
        fireServer("ChangeValue", Vehicle.Stats.Armor.Max, Value)
        fireServer("ChangeValue", Vehicle.Stats.Fuel, Fuel)
        fireServer("ChangeValue", Vehicle.Stats.Fuel.Max, Fuel)
    end



    AdaptUI(Text, UIListLayout)
    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        AdaptUI(Text, UIListLayout)
    end)

    local function returnplayers(Mod, Phrase)
        local players = {}
        if Phrase == nil then 
            Phrase = GetPlayer(Phrase)
            if checkargs("Player", Phrase) then return players end
        end
        if Phrase:lower() == "me" then
            table.insert(players, Players[Mod])
        elseif Phrase:lower() == "random" then
            table.insert(players, Players:GetPlayers()[math.random(1, #Players:GetPlayers())])
        elseif Phrase:lower() == "others" then
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= Players[Mod] then 
                    table.insert(players, v)
                end
            end
        elseif Phrase:lower() == "all" then 
            for _, v in pairs(Players:GetPlayers()) do
                table.insert(players, v)
            end
        elseif Phrase:lower() == "team" then 
            local Groupfound = false
            repeat wait() until Lighting.Groups ~= nil 
            for _, v in pairs(Lighting.Groups:GetDescendants()) do 
                if v:IsA("StringValue") and v.Value == Players[Mod].Name then 
                    Groupfound = true
                    for _, Group in pairs(v.Parent:GetChildren()) do
                        if Players:FindFirstChild(Group.Value) then 
                            table.insert(players, Players[Group.Value])
                        end
                    end
                end
            end
            if Groupfound == false then
                error(Mod .. " is not in a group")
            end
        else
            Phrase = GetPlayer(Phrase)
            if checkargs("Player", Phrase) then return players end
            table.insert(players, Players[Phrase])
        end
        return players
    end


    local function returnvehicles(Mod, Phrase)
        local vehicles = {}
        if not workspace:FindFirstChild("Vehicles") then 
            error("Vehicles is not a valid member of workspace")
            return vehicles
        end
        if Phrase == nil then 
            Phrase = GetVehicles(Phrase)
            if checkargs("Vehicle", Phrase) then return vehicles end
        end
        if Phrase:lower() == "all" then 
            for _, v in pairs(workspace.Vehicles:GetChildren()) do
                if v.Name ~= "VehicleWreck" then
                    table.insert(vehicles, v)
                end
            end
        elseif Phrase:lower() == "current" or Phrase:lower() == "mine" then 
            local Seatfound = false
            for _, v in pairs(workspace.Vehicles:GetDescendants()) do
                if v.Name ~= "VehicleWreck" and v:IsA("Weld") and v.Name == "SeatWeld" and v.Part1 ~= nil and v.Part1.Parent.Name == Players[Mod].Name then
                    Seatfound = true
                    if v.Parent.Parent.Parent.Name == "Seats" then
                        table.insert(vehicles, v.Parent.Parent.Parent.Parent)
                    else
                        table.insert(vehicles, v.Parent.Parent.Parent)
                    end
                end
            end
            if Seatfound == false then
                error(Mod .. " is not in a driver or passenger seat")
            end
        else
            Phrase = GetVehicles(Phrase)
            if checkargs("Vehicle", Phrase) then return vehicles end
            table.insert(vehicles, workspace.Vehicles[Phrase])
        end
        return vehicles
    end

    local function GetArgs(Str)
        local Args = {}
        for Arg in string.gmatch(Str, "%S+") do
            table.insert(Args, Arg)
        end    
        return Args
    end    

    local CommandDictionary = {
        ["cmds"] = {
            Callback = function()
                local Message = [[
Local:
ws (#) ~ Sets Your Walkspeed
jp (#) ~ Sets Your Jumppower
nofall ~ Disables Fall Damage
nofog ~ Removes Fog
spec (Plr) ~ Spectates The Player
offlist ~ Makes You Invisible On The Playerlist
unofflist ~ Makes You Visible On The Playerlist
Server:
cleanloot ~ Cleans Spawned Loot
cleangarbage ~ Cleans Garbage
cleanallparts ~ Cleans All Building Parts
cleanclones ~ Cleans Cloned Locations
lootmod (#) ~ Sets Loot Modifier 
map (Color) (Texture) ~ Colors And Textures The Map
resetmap ~ Resets Map Color And Texture
Spawning:
spawn (Plr) (Item) (#) ~ Will Spawn Selected Item To Player
m14kit (Plr) ~ Gives A M14 Kit To Player
falkit (Plr) ~ Gives A FAL Kit To Player
mk17kit (Plr) ~ Gives A Mk 17 Kit To Player
hk21kit (Plr) ~ Gives A HK21 Kit To Player
g36kkit (Plr) ~ Gives A G36K Kit To Player
patkit (Plr) ~ Gives A Patriot Kit To Player
m4kit (Plr) ~ Gives A M4A1 Kit To Player
scarkit (Plr) ~ Gives A SCAR-L Kit To Player 
navkit (Plr) ~ Gives A Navigation Kit To Player
clone (Loc) (Plr) ~ Clones Location To Player
Weapons:
add (Plr) (Gun) (Attachment) ~ Adds Attachment On Player's Weapon
recoil (Plr) (Gun) (#) ~ Sets Player's Weapon Recoil
norecoil (Gun) ~ Makes Player's Weapon Have No Recoil
firerate (Plr) (Gun) (#) ~ Sets Player's Weapons Firerate
nospread (Plr) (Gun) ~ Makes Player's Weapon Have No Spread
ammo (Plr) (#) ~ Sets Players Ammo 
infammo (Plr) ~ Sets Players Ammo To 99999999999999
qreload (Plr) (Gun) ~ Sets Players Weapon Reload Speed Fast
pump (Plr) (Gun) ~ Sets Players Weapon To Pump Shotgun
shotgun (Plr) (Gun) ~ Sets Players Weapon To A Shotgun
bolt (Plr) (Gun) ~ Sets Players Weapon To Bolt Action Mode
oneshot (Gun) ~ Makes Selected Weapon A One Shot
skin (Plr) (Color) (Texture) (Color) (Texture) ~ Gives Custom Skin
fillskins (Plr) ~ Fills In Player's Empty Skin Slots
noskins (Plr) ~ Removes Player's Skins
Building Parts:
pcolor (Part) (Color) (Texture) ~ Color/Textures Selected Building Part
pmat (Part) (Mat) (#) ~ Sets Material and Transparency Of Part
preset (Part) ~ Reset Selected Building Part Back To Normal Color
Players:
punish (Plr) ~ Punishes Selected Player
unpunish (Plr) ~ Unpunishes Selected Player
nohum (Plr) ~ Removes Player's Humanoid
addhum (Plr) ~ Gives Player's Humanoid Back
clog (Plr) ~ Combat Logs Player
kill (Plr) ~ Will Kill Selected Player
explode (Plr) ~ Will Explode Selected Player
kick (Plr) ~ Kick Selected Player From The Game
ban (Plr) ~ Adds Player To Auto Kick
unban (Plr) ~ Removes Player From Auto Kick
god (Plr) ~ Makes Player Godded
ungod (Plr) ~ Ungods Player
pkills (Plr) (#) ~ Sets Player's Players Killed To Amount
days (Plr) (#) ~ Sets Player's Days Survived To Amount
zkills (Plr) (#) ~ Sets Player's Zombies Killed To Amount
hunger (Plr) (#) ~ Sets Selected Player To Selected Hunger
thirst (Plr) (#) ~ Sets Selected Player To Selected Thirst
stamina (Plr) (#) ~ Sets Selected Player To Selected Stamina
infvitals (Plr) ~ Gives Selected Player Infinite Vitals
heal (Plr) ~ Sets Selected Player's Health To Full
joingroup (Plr) ~ Joins Selected Player's Group
invgroup (Plr) ~ Invites Selected Player To Group
kickgroup (Plr) ~ Kicks Selected Player From Group
trip (Plr) ~ Will Make Selected Player Sit Down
tp (Plr) (Plr) ~ Teleports Player To Player
loc (Plr) (Loc) ~ Teleports Player To Location
Bullet Mods:
fire ~ Enables Fire Bullets
unfire ~ Disables Fire Bullets
snow ~ Enables Snow Bullets
unsnow ~ Disables Snow Bullets
Appearance:
color (Plr) (Color) ~ Colors Player 
vest (Plr) (Color) (Texture) ~ Colors And Textures Player's Vest
bag (Plr) (Color) (Texture) ~ Colors And Textures Player's Bag
invis (Plr) ~ Makes Player Invisible
vis (Plr) ~ Makes Player Visible
force (Plr) ~ Sets Player's Material To ForceField
unforce (Plr) ~ Sets Player's Material To Plastic
hatforce (Plr) ~ Sets Player's Hat Material To ForceField
unhatforce (Plr) ~ Sets Player's Hat Material To Plastic
novest (Plr) ~ Removes Player's Vest
addvest (Plr) ~ Gives Player's Vest Back
shirt (Plr) (ID) ~ Gives Player Selected Shirt
pants (Plr) (ID) ~ Gives Player Selected Pants
Vehicles:
vcolor (Car) (#) ~ Colors Vehicle
vmat (Car) (Mat) (#) ~ Sets Material On Vehicle
vspeed (Car) ~ Sets The Speed Of Vehicle
vreset (Car) ~ Resets Speed Of Vehicle
vfix (Car) ~ Repairs Vehicle
vclone (Car) (Plr) ~ Clones Veh\]6icle To Player
vgod (Car) ~ God Vehicle
vunweld (Car) ~ Unwelds Vehicle
vdelete (Car) ~ Deletes Vehicle
vtp (Plr) (Car) ~ Teleports Player To Vehicle
vbring (Car) (Plr) ~ Brings Vehicle To Player
Other:
setprefix (Prefix) ~ Changes Prefix
mod (Plr) ~ Gives Player Ability To Use Commands In Chat
unmod (Plr) ~ Removes Player Ability To Use Commands In Chat
cmds ~ Shows A List Of Commands 
getmats ~ Gets An Output Of All The Materails
getitems ~ Gets An Output Of All The Items
getcars ~  Gets An Output Of All The Vehicles In Server  
getlocs ~ Gets An Output Of All The Locations In Server
getbans ~ Gives An Output Of Every Player You Banned
clear ~ Cleans All Previous Messages In Console]]
                for i in string.gmatch(Message, "[^\n]+") do
                    success(i)
                end
            end
        },

        ["spec"] = {
            Callback = function(Mod, Player) 
                local Player = returnplayers(Mod, Player)[1]
                if Player == nil then return end
                workspace.CurrentCamera.CameraSubject = Player.Character.Humanoid
                success(string.format("Spectated %s", Player.Name))
            end
        },


        ["clear"] = {
            Callback = function()
                for _, Message in pairs(Commands:GetChildren()) do
                    if Message.Name == "Success" or Message.Name == "Error" or Message.Name == "Player" or Message.Name == "Info" then
                        Message:Destroy()
                    end    
                end  
            end
        },

        ["nofog"] = {
            Callback = function()
                Lighting.FogEnd = 9e9
                success("Removed fog")
            end 
        },

        ["ws"] = {
            Callback = function(Mod, Value) 
                if Client.PlayerGui:FindFirstChild("SkyboxRenderMode") then
                    Client.PlayerGui.SkyboxRenderMode.Parent = nil
                end
                if checkargs("Value", tonumber(Value)) then return end	
                getrenv()._G.walkbase = tonumber(setvalue(Value, 0, 9e9, .5))
                success(string.format("Set your walkspeed to %s", Value))
                if Client.PlayerGui.HitEqualsYouDie:FindFirstChild("JumpLimiter") then
                    MessageBox.Title.Text = "Disable Fall Damage?"
                    MessageBox.Message.Text = "Neptunium's suggestion is for you to disable fall damage, so when running off hill or mountains you don't hit ground too hard"
                    MessageBox.Visible = true
                    Buttons.YesNo.Visible = true
                end
            end
        },

        ["jp"] = {
            Callback = function(Mod,Value) 
                if notloaded(Client.Name) then return end
                if checkargs('Value', Value) then return end
                Client.Character.Humanoid.JumpPower = tonumber(Value)
                if Client.PlayerGui.HitEqualsYouDie:FindFirstChild("JumpLimiter") then
                    MessageBox.Title.Text = "Disable Fall Damage?"
                    MessageBox.Message.Text = "Neptunium's suggestion is for you to disable fall damage, so when jumping to hight you don't hit the ground too hard"
                    MessageBox.Visible = true
                    Buttons.YesNo.Visible = true
                end
                success(string.format("Set your jumppower to %s",tostring(Value)))
            end
        },

        ["nofall"] = {
            Callback = function() 
                if Client.PlayerGui.HitEqualsYouDie:FindFirstChild("JumpLimiter") then
                    fireServer("ChangeParent", Client.PlayerGui.HitEqualsYouDie:FindFirstChild("JumpLimiter"), nil)
                    success("Disabled fall damage")
                else
                    error("Fall damage has already been removed")
                end
            end
        },

        ["saim"] = {
            Callback = function()
                if _G.silentaim == true then
                    error("Silent Aim is already enabled")
                return end
                _G.silentaim = true
                if _G.silentaim == true then
                    silentaim()
                end
                success("Silent Aim Enabled")
            end 
        },

        ["unsaim"] = {
            Callback = function()
                if _G.silentaim == false then
                    error("Silent Aim is already disabled")
                return end
                _G.silentaim = false
                success("Silent Aim Disabled")
            end 
        },

        --player
        ["tp"] = {
            Callback = function(Mod, Player, Player2)
                local Player2 = returnplayers(Mod, Player2)[1]
                if Player2 == nil then return end
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if Player == Player2 then 
                        error(string.format("%s is there own player", Player.Name))
                        return
                    end
                    repeat wait() until Player2 ~= nil and Player2.Character ~= nil and Player2.Character.Torso ~= nil 
                    teleport(Player.Name, Player2.Character.Torso.CFrame + Vector3.new(-3, 0, 0))
                    success(string.format("Teleported %s to %s", Player.Name, Player2.Name))
                end
            end
        },


        ["loc"] = {
            Callback = function(Mod, Player, Location)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    Location = GetLocation(Location)
                    if checkargs("Location", Location) then return end
                    repeat wait() until Player ~= nil and Player.Character ~= nil and Player.Character.Torso ~= nil 
                    teleport(Player.Name, workspace.Locations[Location].CFrame + Vector3.new(0, 10, 0))
                    success(string.format("Located %s to %s", Player.Name, Location))
                end
            end
        },

        ["trip"] = {
            Callback = function(Mod, Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if notloaded(Player.Name) then return end
                    Utils.Remotes["HurtZombie"]:FireServer(Player.Character)
                    success(string.format("Tripped %s", Player.Name))
                end 
            end
        },

        ["kill"] = {
            Callback = function(Mod, Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if notloaded(Player.Name) or noclient(Player.Name) then return end
                    fireServer("ChangeParent", Player.Character:FindFirstChild("Head"), nil)   
                    success(string.format("Killed %s", Player.Name))
                end   
            end
        },

        ["explode"] = {
            Callback = function(Mod, Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if notloaded(Player.Name) or noclient(Player.Name) then return end
                    Utils.Remotes["Detonate"]:FireServer({["Head"] = Player.Character.Head})
                    success(string.format("Exploded %s", Player.Name))
                end   
            end
        },

        ["getcars"] = {
            Callback = function()
                local Vehicles = workspace:FindFirstChild("Vehicles")
                for i,v in pairs(Vehicles:GetChildren()) do
                    success(v.Name)
                end
            end
        },

        ["getlocs"] = {
            Callback = function()
                local Locs = workspace:FindFirstChild("Locations")
                for i,v in pairs(Locs:GetChildren()) do
                    if v:IsA("Part") then
                        success(v.Name)
                    end
                end
            end
        },

        ["punish"] = {
            Callback = function(Mod, Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if notloaded(Player.Name) then return end
                    fireServer("ChangeParent", Player.Character, game.Players)
                    success(string.format("Punished %s", Player.Name))
                end  
            end
        },

        ["unpunish"] = {
            Callback = function(Mod, Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do     
                    if workspace:FindFirstChild(Player.Name) then
                        error(string.format("%s is not punished", Player.Name))
                        return
                    end
                    for i,v in pairs(game.Players:GetChildren()) do
                        if v:IsA("Model") then
                            fireServer("ChangeParent", v, workspace)
                        end
                    end
                    success(string.format("Unpunished %s", Player.Name))
                end
            end
        },


        ["force"] = {
            Callback = function(Mod, Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do
                    local Value = 0
                    local Material = GetMaterials("ForceField")	
                    if Player.Character.Head.Material == Material then
                        error(string.format("%s is already forced", Player.Name)) return
                    end
                    fireServer("VehichleLightsSet", Player.Character, Material, setvalue(Value, 0, 1))
                    success(string.format("%s's material has been changed to force", Player.Name))
                end
            end
        },

        ["hatforce"] = {
            Callback = function(Mod,Player) 
                for _, Player in pairs(returnplayers(Mod, Player)) do
                    if notLoaded(Player.Name) then return end
                    if notspawned(Player.Name) then return end
                    spawn(function()
                        for _, v in pairs(Player.Character:GetChildren()) do
                            if Lighting.Hats:FindFirstChild(v.Name) then
                                local HatType = "thisishat"
                                if v:FindFirstChild("thisisaccessory") then
                                    HatType = "thisisaccessory"
                                end
                                fireServer("ChangeParent",Player:FindFirstChild(HatType),nil)
                                fireServer("ChangeParent",v:FindFirstChild(HatType),Player)
                                Player:WaitForChild(HatType)
                                fireServer("VehichleLightsSet",v, "ForceField",0)
                                fireServer("ChangeParent",Player:FindFirstChild(HatType),v)
                            end
                        end
                    end)
                    success(string.format("Successfully Set %s's Hat Material To ForceField",Player.Name))
                end
            end
        },
    
        ["unhatforce"] = {
            Callback = function(Mod,Player) 
                for _, Player in pairs(returnplayers(Mod, Player)) do
                    if notloaded(Player.Name) then return end
                    if notspawned(Player.Name) then return end
                    spawn(function()
                        for _, v in pairs(Player.Character:GetChildren()) do
                            if Lighting.Hats:FindFirstChild(v.Name) then
                                local HatType = "thisishat"
                                if v:FindFirstChild("thisisaccessory") then
                                    HatType = "thisisaccessory"
                                end
                                fireServer("ChangeParent",Player:FindFirstChild(HatType),nil)
                                fireServer("ChangeParent",v:FindFirstChild(HatType),Player)
                                Player:WaitForChild(HatType)
                                fireServer("VehichleLightsSet",v, "Plastic",0)
                                fireServer("ChangeParent",Player:FindFirstChild(HatType),v)
                            end
                        end
                    end)
                    success(string.format("Successfully Set %s's Hat Material To Plastic",Player.Name))
                end
            end
        },

        ["lootmod"] = {
            Callback = function(Value)
                Value = tonumber(Value)
                if checkargs("Value", tonumber(Value)) then return end
                Utils.Remotes["ChangeLootModifier"]:FireServer(tonumber(Value))
                success(string.format("Successfully Set Loot Rate To %s.",Value))
            end  
        },


        ["pcolor"] = {
            Callback = function(Mod, BuildingMat, Color, Texture)
                local BuildingMat = GetBM(BuildingMat)
                if checkargs("BuildingMat", BuildingMat) or checkargs("Color code", tonumber(Color)) or checkargs("Texture code", tonumber(Texture)) then return end
                colormodel(game.Lighting.Materials[BuildingMat], setvalue(Color, 1, 65, .5), setvalue(Texture, 1, 12, .5))
                success(string.format("Colored %s", BuildingMat))
            end
        },

        ["preset"] = {
            Callback = function(Mod, BuildingMat)
                local BuildingMat = GetBM(BuildingMat)
                if checkargs("BuildingMat", BuildingMat) then return end
                if BuildingMat == "Walls" then
                    colormodel(game.Lighting.Materials[BuildingMat], 46, 1)
                elseif BuildingMat == "Timber" then
                    colormodel(game.Lighting.Materials:FindFirstChild("Timber"), 33, 1)
                elseif BuildingMat == "MetalTruss" then
                    colormodel(game.Lighting.Materials:FindFirstChild("MetalTruss"), 46, 1)
                elseif BuildingMat == "Stone" then
                    colormodel(game.Lighting.Materials:FindFirstChild("Stone"), 46, 1)
                elseif BuildingMat == "SmallCrateOpen" then
                    colormodel(game.Lighting.Materials:FindFirstChild("SmallCrateOpen"), 13, 1)
                elseif BuildingMat == "Slabs" then
                    colormodel(game.Lighting.Materials:FindFirstChild("Slabs"), 33, 1)
                elseif BuildingMat == "Planks" then
                    colormodel(game.Lighting.Materials:FindFirstChild("Planks"), 33, 1)
                elseif BuildingMat == "LargeCrateOpen" then
                    colormodel(game.Lighting.Materials:FindFirstChild("LargeCrateOpen"), 64, 1)
                elseif BuildingMat == "Bricks" then
                    colormodel(game.Lighting.Materials:FindFirstChild("Bricks"), 65, 1)
                    return end
                fireServer("VehichleLightsSet", Lighting.Materials[BuildingMat], "Plastic", 0)
                success(string.format("Reset %s", BuildingMat))
            end
        },

        ["pmat"] = {
            Callback = function(Mod, BuildingMat, Material)
                local BuildingMat = GetBM(BuildingMat)
                local Material = GetMaterials(Material)
                if checkargs("BuildingMat", BuildingMat) or checkargs("Material", Material) then return end
                fireServer("VehichleLightsSet", Lighting.Materials[BuildingMat], Material, 0)
                success(string.format("Changed %s Material", BuildingMat))
            end
        },

        ["ptrans"] = {
            Callback = function(Mod, BuildingMat, Value)
                local BuildingMat = GetBM(BuildingMat)
                local Matplace = Lighting.Materials[BuildingMat].Head.Material
                if checkargs("BuildingMat", BuildingMat) or checkargs("Transparency", tonumber(Value)) then return end
                fireServer("VehichleLightsSet", Lighting.Materials[BuildingMat], Matplace,setvalue(Value, 0, 1))
                success(string.format("Modified %s", BuildingMat))
                end
        },

        ["rembuilds"] = {
            Callback = function(Mod)
                local map 
                if workspace:FindFirstChild("Anchored Objects") then
                    map = workspace
                end
                if not map then
                    error(string.format("Map is currently set to nil"))
                else
                    local Towns
                    if workspace["Anchored Objects"]:FindFirstChild("Towns/Cities") then
                        Towns = workspace["Anchored Objects"]
                        if not Towns then
                            error(string.format("Towns/Cites are currently set to nil"))
                            return
                        end
                        fireServer("ChangeParent", workspace["Anchored Objects"]["Towns/Cities"], game.Lighting)
                        success(string.format("Buildings have been moved"))
                    end
                end
            end
        },


        ["spawn"] = {
            Callback = function(Mod, Player, Item, Value)
                for _, Player in pairs(returnplayers(Mod, Player)) do	
                    local Item = GetItemName(Item)
                    if not Item then
                        error(string.format("Invalid item!")) return end
                    if checkargs("Item", Item) or checkargs("Value", tonumber(Value)) then return end
                        spawn(function()
                            for i = 1, Value do
                                Spawn(Player, Item, Lighting.LootDrops, Vector3.new(math.random(-5, 5), 2.5, math.random(-5, 5)))
                            end
                        end)
                        success(string.format("Spawned %s to %s", Item, Player.Name))
                    end
                end
        },	

        ["m14kit"] = {
            Callback = function(Mod,Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do
                    if notspawned(Player.Name) then return end
                    for i = 1, #KitsList["M14"] do
                        local Amount = 1
                        local Item = KitsList["M14"][i]
                        if typeof(Item) == "table" then
                            Amount = Item[2]
                            Item = Item[1]
                        end
                        for a = 1, Amount do
                            spawn(function()
                                Spawn(Player,Item,Lighting.LootDrops,Vector3.new(math.random(-5, 5),2.5,math.random(-5, 5)),true)
                            end)
                        end
                    end
                    success(string.format("Successfully Gave A M14 Kit To %s.",Player.Name))
                end
            end
        },
    
        ["falkit"] = {
            Callback = function(Mod,Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do
                    if notspawned(Player.Name) then return end
                    for i = 1, #KitsList["FAL"] do
                        local Amount = 1
                        local Item = KitsList["FAL"][i]
                        if typeof(Item) == "table" then
                            Amount = Item[2]
                            Item = Item[1]
                        end
                        for a = 1, Amount do
                            spawn(function()
                                Spawn(Player,Item,Lighting.LootDrops,Vector3.new(math.random(-5, 5),2.5,math.random(-5, 5)),true)
                            end)
                        end
                    end
                    success(string.format("Successfully Gave A FAL Kit To %s.",Player.Name))
                end
            end
        },
    
        ["mk17kit"] = {
            Callback = function(Mod,Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do
                    if notspawned(Player.Name) then return end
                    for i = 1, #KitsList["MK17"] do
                        local Amount = 1
                        local Item = KitsList["MK17"][i]
                        if typeof(Item) == "table" then
                            Amount = Item[2]
                            Item = Item[1]
                        end
                        for a = 1, Amount do
                            spawn(function()
                                Spawn(Player,Item,Lighting.LootDrops,Vector3.new(math.random(-5, 5),2.5,math.random(-5, 5)),true)
                            end)
                        end
                    end
                    success(string.format("Successfully Gave A Mk 17 Kit To %s.",Player.Name))
                end
            end
        },
    
        ["hk21kit"] = {
            Callback = function(Mod,Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do
                    if notspawned(Player.Name) then return end
                    for i = 1, #KitsList["HK21"] do
                        local Amount = 1
                        local Item = KitsList["HK21"][i]
                        if typeof(Item) == "table" then
                            Amount = Item[2]
                            Item = Item[1]
                        end
                        for a = 1, Amount do
                            spawn(function()
                                Spawn(Player,Item,Lighting.LootDrops,Vector3.new(math.random(-5, 5),2.5,math.random(-5, 5)),true)
                            end)
                        end
                    end
                    success(string.format("Successfully Gave A HK21 Kit To %s.",Player.Name))
                end
            end
        },
    
        ["g36kkit"] = {
            Callback = function(Mod,Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do
                    if notspawned(Player.Name) then return end
                    for i = 1, #KitsList["G36K"] do
                        local Amount = 1
                        local Item = KitsList["G36K"][i]
                        if typeof(Item) == "table" then
                            Amount = Item[2]
                            Item = Item[1]
                        end
                        for a = 1, Amount do
                            spawn(function()
                                Spawn(Player,Item,Lighting.LootDrops,Vector3.new(math.random(-5, 5),2.5,math.random(-5, 5)),true)
                            end)
                        end
                    end
                    success(string.format("Successfully Gave A G36K Kit To %s.",Player.Name))
                end
            end
        },
    
        ["patkit"] = {
            Callback = function(Mod,Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do
                    if notspawned(Player.Name) then return end
                    for i = 1, #KitsList["Patriot"] do
                        local Amount = 1
                        local Item = KitsList["Patriot"][i]
                        if typeof(Item) == "table" then
                            Amount = Item[2]
                            Item = Item[1]
                        end
                        for a = 1, Amount do
                            spawn(function()
                                Spawn(Player,Item,Lighting.LootDrops, Vector3.new(math.random(-5, 5),2.5,math.random(-5, 5)),true)
                            end)
                        end
                    end
                    success(string.format("Successfully Gave A Patriot Kit To %s.",Player.Name))
                end
            end
        },
    
        ["m4kit"] = {
            Callback = function(Mod,Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do
                    if notspawned(Player.Name) then return end
                    for i = 1, #KitsList["M4A1"] do
                        local Amount = 1
                        local Item = KitsList["M4A1"][i]
                        if typeof(Item) == "table" then
                            Amount = Item[2]
                            Item = Item[1]
                        end
                        for a = 1, Amount do
                            spawn(function()
                                Spawn(Player,Item,Lighting.LootDrops,Vector3.new(math.random(-5, 5), 2.5, math.random(-5, 5)),true)
                            end)
                        end
                    end
                    success(string.format("Successfully Gave A M4A1 Kit To %s.",Player.Name))
                end
            end
        },
    
        ["scarkit"] = {
            Callback = function(Mod,Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do
                    if notspawned(Player.Name) then return end
                    for i = 1, #KitsList["SCAR-L"] do
                        local Amount = 1
                        local Item = KitsList["SCAR-L"][i]
                        if typeof(Item) == "table" then
                            Amount = Item[2]
                            Item = Item[1]
                        end
                        for a = 1, Amount do
                            spawn(function()
                                Spawn(Player, Item, Lighting.LootDrops, Vector3.new(math.random(-5, 5), 2.5, math.random(-5, 5)),true)
                            end)
                        end
                    end
                    success(string.format("Successfully Gave A SCAR-L Kit To %s.",Player.Name))
                end
            end
        },
    
        ["navkit"] = {
            Callback = function(Mod,Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do
                    if notspawned(Player.Name) then return end
                    for i = 1, #KitsList["Navigation"] do
                        local Amount = 1
                        local Item = KitsList["Navigation"][i]
                        if typeof(Item) == "table" then
                            Amount = Item[2]
                            Item = Item[1]
                        end
                        for a = 1, Amount do
                            spawn(function()
                                Spawn(Player, Item, Lighting.LootDrops, Vector3.new(math.random(-5, 5), 2.5, math.random(-5, 5)),true)
                            end)
                        end
                    end
                    success(string.format("Successfully Gave A Navigation Kit To %s.",Player.Name))
                end
            end
        },

        ["clone"] = {
            Callback = function(Mod,Location,Player)
                    local Location = GetLocation(Location)
                    if checkargs("Location", Location) then return end
                    for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if game.PlaceId == 237590761 or game.PlaceId == 302647266 or game.PlaceId == 1228676522 or game.PlaceId == 1228677045 then 
                        error(string.format("coloring and texturing is disabled On", Mapname))
                        return
                    elseif not workspace["Anchored Objects"] then 
                        error("Anchored Objects is nil")
                        return
                    end
                    Spawn(Player, Location, workspace["Anchored Objects"]["Towns/Cities"], Vector3.new(math.random(-4, 4), -2 , math.random(-4, 4)))
                    success(string.format("Cloned %s to %s", Location, Player.Name))
                end
            end
        },

["cloned"] = {
            Callback = function(Mod,Location,Player)
                    local Location = GetLocation(Location)
                    if checkargs("Location", Location) then return end
                    for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if game.PlaceId == 237590761 or game.PlaceId == 302647266 or game.PlaceId == 1228676522 or game.PlaceId == 1228677045 then 
                        error(string.format("coloring and texturing is disabled On", Mapname))
                        return
                    elseif not workspace["Anchored Objects"] then 
                        error("Anchored Objects is nil")
                        return
                    end
                    Spawn(Player, Location, workspace["Anchored Objects"]["Towns/Cities"], Vector3.new(math.random(-4, 4), -2 , math.random(-4, 4)))
                    success(string.format("Cloned %s to %s", Location, Player.Name))
                end
            end
        },

        ["fire"] = {
            Callback = function(Mod)
                Utils.Remotes["SwitchEnabled"]:FireServer(false, game.ReplicatedStorage.Effects.Bullet:FindFirstChild("Fire"))
                    wait()
                fireServer("ChangeParent", game:GetService("Lighting").FireEffect, ReplicatedStorage.Effects.Bullet)
                success("Fire Bullets Enabled")
            end
        },

        ["snow"] = {
            Callback = function(Mod)
                Utils.Remotes["SwitchEnabled"]:FireServer(false, game.ReplicatedStorage.Effects.Bullet:FindFirstChild("Fire"))
                wait()
                fireServer("ChangeParent", game:GetService("ReplicatedStorage").Snow.Droplets1, ReplicatedStorage.Effects.Bullet)
                success("Snow Bullets Enabled")
            end
        },

        ["nosnow"] = {
            Callback = function(Mod)
                Utils.Remotes["SwitchEnabled"]:FireServer(true, game.ReplicatedStorage.Effects.Bullet:FindFirstChild("Fire"))
                wait()
                fireServer("ChangeParent", ReplicatedStorage.Effects.Bullet.Droplets1, ReplicatedStorage.Snow)
                success("Snow Bullets Disabled")
            end
        },

        ["unfire"] = {
            Callback = function(Mod)
                Utils.Remotes["SwitchEnabled"]:FireServer(true, game.ReplicatedStorage.Effects.Bullet:FindFirstChild("Fire"))
                    wait()
                    if not ReplicatedStorage.Effects.Bullet.FireEffect then
                        error("Fire has not been enabled yet!")
                        return end
                fireServer("ChangeParent", ReplicatedStorage.Effects.Bullet.FireEffect, Lighting)
                success("Fire Bullets Disabled")
            end
        },

        ["addbuilds"] = {
            Callback = function(Mod)
                local map 
                if workspace:FindFirstChild("Anchored Objects") then
                    map = workspace
                end
                if not map then
                    error(string.format("Map is currently set to nil"))
                else 
                    local Towns
                    if Lighting:FindFirstChild("Towns/Cities") then
                        Towns = Lighting
                        if not Towns then 
                            error(string.format("Towns are still in Anchored Objects"))
                            return
                        end
                        fireServer("ChangeParent", game.Lighting:FindFirstChild("Towns/Cities"), workspace["Anchored Objects"])
                        success(string.format("Buildings have been moved back"))
                    end
                end
            end
        },

        ["unforce"] = {
            Callback = function(Mod, Player, Material)
                for _, Player in pairs(returnplayers(Mod, Player)) do
                    local Value = 0
                    Material = GetMaterials("Plastic")
                    if checkargs("Material", Material) or checkargs("Transparency", tonumber(Value)) then return end	
                    fireServer("VehichleLightsSet", Player.Character, Material, setvalue(Value, 0, 1))
                    success(string.format("%s's material has been changed", Player.Name))
                end
            end
        },

        ["kick"] = {
            Callback = function(Mod, Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if noclient(Player.Name) then return end
                    kickplayer(Player.Name)
                    success(string.format("Kicked %s", Player.Name))
                end   
            end
        },

        ["offlist"] = {
            Callback = function(Mod)
                if OListT then
                    error("You are already off-listing.")
                return end
                OListT = true
                fireServer("ChangeParentLocal", Client)
                success("Successfully Enabled Offlist")
            end
        },

        ["unofflist"] = {
            Callback = function(Mod)
                if not OListT then
                    error("You are not off-listing.")
                return end
                OListT = false
                fireServer("ChangeParentLocal", Client, Players)
                success("Successfully Disabled Offlist")
            end
        },

        ["ban"] = {
            Callback = function(Mod,Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if noclient(Player.Name) then return end
                    local BanPlayer = tostring(Player)
                    if banData[BanPlayer] == true then
                        error(string.format("%s is already banned", BanPlayer))
                    end
                    banData[BanPlayer] = true
                    writefile("Neptunium/Neptunium_Bans.txt",HttpService:JSONEncode(banData))
                    kickplayer(BanPlayer)
                    success(string.format("Successfully Banned %s.",Player.Name))
                end   
            end
        },

        ["unban"] = {
            Callback = function(Mod,Player)
                if BanData[tostring(Player)] then
                    banData[tostring(Player)] = nil
                    writefile("Neptunium/Neptunium_Bans.txt",HttpService:JSONEncode(banData))
                else
                    error("Player Not Banned..")
                    return
                end
                success(string.format("Successfully Unbanned %s.",Player))
                return
            end 
        },

        ["clog"] = {
            Callback = function(Mod,Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    fireServer("ChangeValue",Player.playerstats:FindFirstChild("combat"),true)
                    kickplayer(Player.Name)
                    repeat wait() until Players[Player.Name] ~= true 
                    success(string.format("Successfully Combat Logged %s.",Player.Name))
                end
            end
        },


        ["novest"] = {
            Callback = function(Mod, Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    local VestObject
                    for _, v in pairs(Lighting.PlayerVests:GetChildren()) do
                        if Player.Character:FindFirstChild(v.Name) then
                            VestObject = Player.Character[v.Name]
                        end    
                    end
                    if not VestObject then 
                        error(string.format("%s's vest is already removed!", Player.Name))
                        return
                    end   
                    fireServer("ChangeParent", VestObject, game.ReplicatedStorage)
                    success(string.format("%s's vest has been removed!", Player.Name))
                end
            end
        },

        ["addvest"] = {
            Callback = function(Mod, Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    local VestObject
                    for _, v in pairs(Lighting.PlayerVests:GetChildren()) do
                        if game.ReplicatedStorage:FindFirstChild(v.Name) then
                            VestObject = game.ReplicatedStorage[v.Name]
                        end    
                    end
                    if not VestObject then 
                        error(string.format("%s vest has not been removed!", Player.Name))
                        return
                    end

                    fireServer("ChangeParent", VestObject, Player.Character)
                    success(string.format("%s's vest has been added!", Player.Name))
                end
            end
        },
        ["cleanloot"] = {
            Callback = function()
                spawn(function()
                    local Mats = Lighting.Materials
                    local Loot = Lighting.LootDrops
                    local Vehicles = workspace.Vehicles
                    Tick1 = tick();
                    local AC = 0;
                    local AA = {};
                    for _, v in pairs(workspace:GetChildren()) do
                        if (Mats:FindFirstChild(tostring(v)) or Loot:FindFirstChild(tostring(v))) and not v:FindFirstChild("Handle") and not v:FindFirstChild("Head") then
                            table.insert(AA, v);
                        elseif tostring(v) ~= "Floodlight" and Loot:FindFirstChild(tostring(v)) or tostring(v) == "Floodlight" and not v:FindFirstChild("Head") then
                            table.insert(AA, v);
                        end;
                    end;
                    for A, B in pairs(Vehicles:GetChildren()) do
                        for _, v in pairs(B:GetChildren()) do
                            if (Mats:FindFirstChild(tostring(v)) or Loot:FindFirstChild(tostring(v))) and not v:FindFirstChild("Handle") and not v:FindFirstChild("Head") then
                                table.insert(AA, v);
                            elseif tostring(v) ~= "Floodlight" and Loot:FindFirstChild(tostring(v)) or tostring(v) == "Floodlight" and not v:FindFirstChild("Head") then
                                table.insert(AA, v);
                            end;
                        end;
                    end;
                    if #AA > 7000 then
                        MaxAmount = 600;
                        TimeToWait = 1.5;
                    end;
                    for _ = 1, #AA do
                        AC = AC + 1;
                        Utils.Remotes["SpawnCrate"]:FireServer(AA[_]);
                        if AA[_] then
                            fireServer("ChangeParent", AA[_]);
                        end;
                        Limiter();
                    end;
                    MaxAmount = 1500;
                    TimeToWait = 1;
                    success(("Cleaned %s Items Took %.3fs."):format(AC, tick() - Tick1));
                end);
            end
        },

        ["cleanallparts"] = {
            Callback = function(Mod)
                local Vector3Objects=  {
                    Vector3.new(2,6,9),
                    Vector3.new(2,1,4),
                    Vector3.new(2,2,4),
                    Vector3.new(4,4,4),
                    Vector3.new(2,2,12),
                    Vector3.new(8,.4,2),
                    Vector3.new(2,8,2)
                }
                for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do 
                    if v.Name == "Floodlight" or v.Name == "LargeCrateOpen" or v.Name == "SmallCrateOpen" or v.Name == "Fireplace" then
                        fireServer("ChangeParent", v, nil)
                    elseif (v.Name == "Part" or v.Name == "Head" or v.Name == "Truss") then
                        if table.find(Vector3Objects,v.Size) then
                            fireServer("ChangeParent", v, nil)
                        end
                    end
                end
                success("Cleaned every Part.")
            end  
        },

        ["cleanclones"] = {
            Callback = function()
                for i,v in pairs(game.workspace:GetChildren()) do
                    if workspace["Anchored Objects"]["Towns/Cities"]:FindFirstChild(v.Name) and v:IsA("Model") then
                        fireServer("ChangeParent", v,nil)
                    end
                end
                success("Cleaned Clones")
            end
        },

        ["cleangarbage"] = {
            Callback = function(Mod)
                for _, v in pairs(workspace:GetChildren()) do
                    if v.Name == "C4Placed" or v.Name == "VS50Placed" or v.Name == "TM46Placed" or v.Name == "Fireplace" then
                        fireServer("ChangeParent", v, nil)
                    end
                end   
                success("Cleaned garbage")
            end  
        },



        ["kickgroup"] = {
            Callback = function(Mod, Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if checkgroup(Player.Name) then return end
                    Utils.Remotes["GroupKick"]:FireServer(Lighting.Groups[getgroup(Player.Name)], Player)
                    success(string.format("Kicked %s from his group", Player.Name))
                end
            end
        },

        ["joingroup"] = {
            Callback = function(Mod, Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if checkgroup(Player.Name) then return end
                    Utils.Remotes["GroupInvite"]:FireServer(Players[Mod], getgroup(Player.Name))
                    success(string.format("Sent %s an invite to %s group", Mod, Player.Name))
                end
            end
        },

        ["invgroup"] = {
            Callback = function(Mod, Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if checkgroup(Mod) then return end
                    Utils.Remotes["GroupInvite"]:FireServer(Player, getgroup(Mod))
                    success(string.format("Sent %s an invite to %s group", Player.Name, Mod))
                end
            end
        },

        --vitals 
        ["god"] = {
            Callback = function(Mod, Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    for _, v in pairs(Player.Character:GetDescendants()) do     
                        if v.Name == "DefenseMultiplier" then 
                            fireServer("ChangeParent", v, nil)
                        end    
                    end
                    Utils.Remotes["AddClothing"]:FireServer("DefenseMultiplier", Player.Character.Humanoid, 0, "","")
                    success(string.format("Godded %s",Player.Name))
                end
            end
        },

        ["ungod"] = {
            Callback = function(Mod, Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    for _, v in pairs(Player.Character:GetDescendants()) do
                        if v.Name == "DefenseMultiplier" then 
                            fireServer("ChangeParent", v, nil)
                        end    
                    end
                    success(string.format("Ungodded %s", Player.Name))
                end
            end
        }, 


        ["heal"] = {
            Callback = function(Mod, Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    fireServer("Damage", Player.Character:FindFirstChild("Humanoid"), -1000)
                    success(string.format("Healed %s", Player.Name))
                end   
            end
        },

        ["hunger"] = {
            Callback = function(Mod, Player, Value) 
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if checkargs("Value", tonumber(Value)) then return end	
                    fireServer("ChangeValue", Player.playerstats.Hunger, setvalue(Value, -9e9, 9e9, 0))
                    success(string.format("Set %s's hunger to %s", Player.Name, Value))
                end
            end
        },

        ["thirst"] = {
            Callback = function(Mod, Player, Value) 
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if checkargs("Value", tonumber(Value)) then return end	
                    fireServer("ChangeValue", Player.playerstats.Thirst, setvalue(Value, -9e9, 9e9, 0))
                    success(string.format("Set %s's thirst to %s", Player.Name, Value))
                end
            end
        },

        ["infvitals"] = {
            Callback = function(Mod, Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    fireServer("ChangeValue", Player.playerstats.Thirst, math.huge)
                    fireServer("ChangeValue", Player.playerstats.Hunger, math.huge)
                    success(string.format("Set %s's vitals to max", Player.Name))
                end
            end
        },

        ["novitals"] = {
            Callback = function(Mod, Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    fireServer("ChangeValue", Player.playerstats.Thirst, 0)
                    fireServer("ChangeValue", Player.playerstats.Hunger, 0)
                    success(string.format("Set %s's vitals to 0", Player.Name))
                end
            end
        },

        --stats 
        ["pkills"] = {
            Callback = function(Mod, Player, Value) 
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if checkargs("Value", tonumber(Value)) then return end	
                    fireServer("ChangeValue", Player.playerstats.PlayerKill.Bandit, setvalue(Value, -9e9, 9e9, 0))
                    success(string.format("Set %s players killed to %s", Player.Name, Value))
                end
            end
        },


        ["stamina"] = {
            Callback = function(Mod, Player, Value)
                for _, Player in pairs(returnplayers(Mod,Player)) do
                    if checkargs("Value", tonumber(Value)) then return end	
                    fireServer("ChangeValue", Player.Backpack.GlobalFunctions.Stamina, setvalue(Value, -9e9, 9e9, 0))
                    success(string.format("%s stamina has been set to %s!", Player.Name, Value))
                end
            end
        },

        ["days"] = {
            Callback = function(Mod, Player, Value) 
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if checkargs("Value", tonumber(Value)) then return end	
                    fireServer("ChangeValue", Player.playerstats.Days, setvalue(Value, -9e9, 9e9, 0))
                    success(string.format("Set %s's days survived to %s", Player.Name, Value))
                end
            end
        },

        ["zkills"] = {
            Callback = function(Mod, Player, Value) 
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if checkargs("Value", tonumber(Value)) then return end	
                    fireServer("ChangeValue", Player.playerstats.ZombieKill.Military, setvalue(Value, -9e9, 9e9, 0))
                    success(string.format("Set %s's zombies killed to %s", Player.Name, Value))
                end
            end
        },

        --weapons 
        ["pump"] = {
            Callback = function(Mod, Player, Weapon)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    Weapon = GetWeapon(Weapon)
                    if checkargs("Weapon", Weapon) then return end
                    if checkweapon(Weapon, Player.Name) then return end
                    fireServer("ChangeValue", Player.Backpack[Weapon].Stats.Action, 4)
                    fireServer("ChangeValue", Player.Backpack[Weapon].Stats.Action.Original, 4)
                    success(string.format("Set %s's %s's firemode to pump action", Player.Name, Weapon))
                end 
            end
        },

        ["shotgun"] = {
            Callback = function(Mod, Player, Weapon)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    Weapon = GetWeapon(Weapon)
                    if checkargs("Weapon", Weapon) then return end
                    if checkweapon(Weapon, Player.Name) then return end
                    fireServer("ChangeValue", Player.Backpack[Weapon].Stats.Action, 5)
                    fireServer("ChangeValue", Player.Backpack[Weapon].Stats.Action.Original, 5)
                    success(string.format("Set %s's %s's firemode to semi-auto shotgun", Player.Name, Weapon))
                end 
            end
        },

        ["bolt"] = {
            Callback = function(Mod, Player, Weapon)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    Weapon = GetWeapon(Weapon)
                    if checkargs("Weapon", Weapon) then return end
                    if checkweapon(Weapon, Player.Name) then return end
                    fireServer("ChangeValue", Player.Backpack[Weapon].Stats.Action, 2)
                    fireServer("ChangeValue", Player.Backpack[Weapon].Stats.Action.Original, 2)
                    success(string.format("Set %s's %s's firemode to bolt action", Player.Name, Weapon))
                end 
            end
        },

        ["oneshot"] = {
            Callback = function(Mod, Weapon)
                Weapon = GetWeapon(Weapon)
                if checkargs("Weapon", Weapon) then return end
                if checkweapon(Weapon, Client.Name) then return end
                local Instance = Client.Backpack[Weapon]
                local Oldname = Instance.Name
                Utils.Remotes["Detonate"]:FireServer(Instance)
                Client.Backpack:WaitForChild("C4Active")
                Instance.Name = Oldname
                fireServer("ChangeValue", Instance.Stats.Damage, getrenv()._G.Obfuscate(9e9)) --9e9
                success(string.format("Set %s's damage to 9e9", Weapon))
            end 
        },

        ["recoil"] = {
            Callback = function(Mod,Player,Weapon,Value)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    Weapon = GetWeapon(Weapon)
                    if checkargs("Weapon", Weapon) then return end
                    if checkweapon(Weapon, Player.Name) then return end
                    Value = setvalue(Value, 1, 99999999999999, .5)
                    if checkargs('Value', Value) then return end
                    if notspawned(Player.Name) then return end
                    fireServer("ChangeValue", Player.Backpack[Weapon].Stats.Recoil, getrenv()._G.Obfuscate(Value))
                    success(string.format("Successfully Set %s's %s's Recoil To %s",Player.Name,Weapon,tostring(Value)))
                end  
            end
        },

        ["norecoil"] = {
            Callback = function(Mod, Player, Weapon)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    Weapon = GetWeapon(Weapon)
                    if checkargs("Weapon", Weapon) then return end
                    if checkweapon(Weapon, Player.Name) then return end
                    fireServer("ChangeValue", Player.Backpack[Weapon].Stats.Recoil, getrenv()._G.Obfuscate(1))
                    success(string.format("Set %s's %s's recoil To 1", Player.Name, Weapon))
                end  
            end
        },

        ["ammo"] = {
            Callback = function(Mod, Player, Value)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if checkargs("Value", tonumber(Value)) then return end	
                    if notspawned(Player.Name) then return end
                    for _, v in pairs(Player.playerstats.slots:GetChildren()) do
                        if v:FindFirstChild("ObjectID") then
                            if v:FindFirstChild("ObjectID"):FindFirstChild("Clip") then 
                                fireServer("ChangeValue", v.ObjectID.Clip.MaxClip, Value)
                                fireServer("ChangeValue", v.ObjectID.Clip, getrenv()._G.Obfuscate(setvalue(Value, 1, 99999999999999, .5)))
                            end
                        end
                    end
                    success(string.format("Set %s's weapon ammo to %s", Player.Name, Value))
                end  
            end
        },

        ["firerate"] = {
            Callback = function(Mod,Player,Weapon,Value)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    Weapon = GetWeapon(Weapon)
                    if checkweapon(Weapon, Player.Name) then return end
                    if notspawned(Player.Name) then return end
                    if checkargs('Weapon', Weapon) or checkargs('Value', Value) then return end
                    if not Player:FindFirstChild("Shooter") then
                        error("Shooter not found. Drop The Weapon and try again.")
                    end
                    fireServer("ChangeParent",Player:FindFirstChild("Shooter"),nil)
                    fireServer("ChangeValue", Player.Backpack[Weapon].Stats.Action, 1)
                    fireServer("ChangeValue", Player.Backpack[Weapon].Stats.Action.Original, 3)
                    fireServer("ChangeParent",Player.Backpack[Weapon].Shooter,Player)
                    wait()
                    if not Player.Backpack[Weapon].Stats.Action:FindFirstChild("Rate") then
                        Utils.Remotes["AddClothing"]:FireServer("Rate", Player.Backpack[Weapon].Stats.Action, "","","")
                    end   
                    Player.Backpack[Weapon].Stats.Action:WaitForChild("Rate")
                    fireServer("ChangeValue", Player.Backpack[Weapon].Stats.Action.Rate, getrenv()._G.Obfuscate(setvalue(Value, 1, 99999999999999, .5)))
                    wait(.1)
                    fireServer("ChangeParent",Player.Shooter,Player.Backpack[Weapon])
                    success(string.format("Successfully Set %s's %s's FireRate To %s",Player.Name,Weapon, setvalue(Value, 1, 99999999999999, .5)))
                end 
            end
        },

        ["nospread"] = {
            Callback = function(Mod,Player,Weapon)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    Weapon = GetWeapon(Weapon)
                    if notspawned(Player.Name) then return end
                    if checkargs('Weapon', Weapon) then return end
                    if checkweapon(Weapon, Player.Name) then return end
                    if not Player:FindFirstChild("Shooter") then
                        error("Shooter not found. Drop The Weapon and try again.")
                    end
                    fireServer("ChangeParent",Player:FindFirstChild("Shooter"),nil)
                    fireServer("ChangeParent",Player.Backpack[Weapon].Shooter,Player)
                    wait()
                    fireServer("ChangeValue", Player.Backpack[Weapon].Stats.Accuracy, getrenv()._G.Obfuscate(1))
                    wait(.1)
                    fireServer("ChangeParent",Player.Shooter,Player.Backpack[Weapon])
                    success(string.format("Successfully Set %s's %s's Spread To 1",Player.Name,Weapon))
                end 
            end
        },

        ["qreload"] = {
            Callback = function(Mod,Player,Weapon)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    Weapon = GetWeapon(Weapon)
                    if checkargs('Weapon', Weapon) then return end
                    if notspawned(Player.Name) then return end
                    fireServer("ChangeValue", Player.Backpack[Weapon].Stats.Reload, -99999999999999)
                    success(string.format("Successfully Made %s's %s's Reload Speed Fast",Player.Name,Weapon))
                end   
            end
        },

        ["infammo"] = {
            Callback = function(Mod, Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if notspawned(Player.Name) then return end
                    for _, v in pairs(Player.playerstats.slots:GetChildren()) do
                        if v:FindFirstChild("ObjectID") then
                            if v:FindFirstChild("ObjectID"):FindFirstChild("Clip") then 
                                fireServer("ChangeValue", v.ObjectID.Clip.MaxClip, 99999999999999)
                                fireServer("ChangeValue", v.ObjectID.Clip, getrenv()._G.Obfuscate(99999999999999))
                            end
                        end
                    end
                    success(string.format("Set %s's ammo to 99999999999999", Player.Name))
                end  
            end
        },

        ["nohum"] = {
            Callback = function(Mod,Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if notloaded(Player.Name) then return end
                    if notspawned(Player.Name) then return end
                    if nohumanoid(Player.Name) then return end
                    for _, v in pairs(Player:GetChildren()) do
                        if v.Name == "Humanoid" then
                            fireServer("ChangeParent",v, nil)
                        end    
                    end    
                    fireServer("ChangeParent",Player.Character:FindFirstChild("Humanoid"), Player)
                    success(string.format("Successfully Removed %s's Humanoid.",Player.Name))
                end  
            end
        },
    
        ["addhum"] = {
            Callback = function(Mod,Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if notloaded(Player.Name) then return end
                    if notspawned(Player.Name) then return end
                    if Player.Character:FindFirstChild("Humanoid") then 
                        error(string.format("%s Has Their Humanoid Already",Player.Name))
                        return
                    end    
                    fireServer("ChangeParent",Player:FindFirstChild("Humanoid"), Player.Character)
                    success(string.format("Successfully Gave %s's Humanoid Back.",Player.Name))
                end
            end  
        },

        ["add"] = {
            Callback = function(Mod, Player, Weapon, Attachment)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    Weapon = GetWeapon(Weapon)
                    Attachment = GetAttachments(Attachment)
                    if checkargs("Weapon", Weapon) or checkargs("Attachment", Attachment) then return end
                    if checkweapon(Weapon, Player.Name) then return end
                    spawn(function()
                        local WeaponType = "primary"
                        if Player.Backpack[Weapon]:FindFirstChild("secondarymarker") then
                            WeaponType = "secondary"
                        end
                        if not Player.playerstats.attachments[WeaponType][AttachmentList[Attachment][1]]:FindFirstChild("ObjectID") then
                            Utils.Remotes["AddClothing"]:FireServer("ObjectID", Player.playerstats.attachments[WeaponType][AttachmentList[Attachment][1]], "","","")
                        end
                        Player.playerstats.attachments[WeaponType][AttachmentList[Attachment][1]]:WaitForChild("ObjectID")
                        fireServer("ChangeValue", Player.playerstats.attachments[WeaponType][AttachmentList[Attachment][1]],1)
                        fireServer("ChangeValue", Player.playerstats.attachments[WeaponType][AttachmentList[Attachment][1]].ObjectID, getrenv()._G.Obfuscate((AttachmentList[Attachment][2])))
                        Utils.Remotes["AddClothing"]:FireServer("anything lol", Player.playerstats.attachments[WeaponType][AttachmentList[Attachment][1]], "","","")
                        fireServer("ChangeParent", Player.playerstats.attachments[WeaponType][AttachmentList[Attachment][1]]:WaitForChild("anything lol"), nil)
                    end)
                    success(string.format("Added a %s on %s's %s", Attachment, Player.Name, Weapon))
                end
            end
        },

        --vehicles

        ["vspeed"] = {
            Callback = function(Mod, Vehicle, Value)
                for _, Vehicle in pairs(returnvehicles(Mod, Vehicle)) do 
                    if checkargs("Value", tonumber(Value)) then return end	
                    fireServer("ChangeValue", Vehicle.Stats.MaxSpeed, Value)
                    fireServer("ChangeValue", Vehicle.Stats.MaxSpeed.Offroad, Value)
                    success(string.format("Set %s speed to %s", Vehicle.Name, Value))
                end  
            end
        },
        
        ["vclone"] = {
            Callback = function(Mod,Vehicle,Player)
                for _, Vehicle in pairs(returnvehicles(Mod, Vehicle)) do 
                    for _, Player in pairs(returnplayers(Mod, Player)) do 
                        if notspawned(Player.Name) then return end
    
                        local X, Y = math.random(10, 15), math.random(10, 15)
                        if math.random(1, 4) >= 3 then
                            X = X*-1
                        end
                        if math.random(1, 4) >= 3 then
                            Y = Y*-1
                        end
                        Spawn(Player, Vehicle, workspace.Vehicles, Vector3.new(X, 0, Y))
                        success(string.format("Cloned %s to %s",Vehicle,Player.Name))
                    end
                end
            end
        },

        ["setprefix"] = {
            Callback = function(Mod, Key)
                if checkargs("Prefix", Key) then return end 
			    Prefix = prefix
			    writefile("Neptunium/Neptunium_Prefix.txt",HttpService:JSONEncode(prefix))
			    success(string.format("Successfully Set New Prefix To %s",prefix))
		    end
        },

        ["skin"] = {
            Callback = function(Mod,Player,Color,Texture,Color2,Texture2)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                if checkargs("Color code", tonumber(Color)) or checkargs("Texture code", tonumber(Texture)) or checkargs("Color code2", tonumber(Color2)) or checkargs("Texture code2", tonumber(Texture2)) then return end
                local Slot 
                for i = 1, 100 do
                    local skin = Player.playerstats.skins:FindFirstChild("skin" .. tostring(i))
                        if skin.Value == 0 then
                            Slot = skin
                        break
                    end
                end
                if Slot == nil then
                    warn(string.format("%s's Skin Slots Are Full.", Player.Name))
                    return
                end
                    fireServer("ChangeValue", Slot, Color)
                    fireServer("ChangeValue", Slot.material, Texture)
                -------------------------------------------------------------
                    fireServer("ChangeValue", Slot.secondary, Color2)
                    fireServer("ChangeValue", Slot.secondary.material, Texture2)
                    success(string.format("Gave Skin to %s", Player.Name))
                end
            end
        },

        ["fillskins"] = {
            Callback = function(Mod,Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    local count = 0 
                    for i = 1, 100 do
                        local skin = Player.playerstats.skins["skin" .. tostring(i)]
                        if skin.Value == 0 then
                            count = count + 1
                            local a,b,c,d = math.random(1,65),math.random(1,12),math.random(1,65),math.random(1,12)
                            fireServer("ChangeValue", skin, a)
                            fireServer("ChangeValue", skin.material, b)
                            fireServer("ChangeValue", skin.secondary, c)
                            fireServer("ChangeValue", skin.secondary.material, d)
                        end
                    end
                    if count == 0 then
                        error(string.format("%s's skin slots are full",Player.Name))
                        return
                    end 
                    success(string.format("Gave %s weapon skins",Player.Name))
                end
            end
        },

        ["noskins"] = {
            Callback = function(Mod,Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    for i, v in pairs(Player.playerstats.skins:GetChildren()) do
                        fireServer("ChangeValue", v.Parent["skin" .. tostring(i)], 0)
                        fireServer("ChangeValue", v.Parent["skin" .. tostring(i)].material, 0)
                        fireServer("ChangeValue", v.Parent["skin" .. tostring(i)].secondary, 0)
                        fireServer("ChangeValue", v.Parent["skin" .. tostring(i)].secondary.material, 0)
                    end
                    success(string.format("Removed %s weapon skins",Player.Name))
                end
            end
        },

        ["vfix"] = {
            Callback = function(Mod,Vehicle)
                for _, Vehicle in pairs(returnvehicles(Mod, Vehicle)) do 
                    repair(Vehicle, true, 350, 100)
                    success(string.format("Repaired %s", Vehicle.Name))
                end  
            end
        },

        ["vgod"] = {
            Callback = function(Mod, Vehicle)
                for _, Vehicle in pairs(returnvehicles(Mod, Vehicle)) do 
                    repair(Vehicle, false, 133742069, 9999999)
                    success(string.format("Godded %s", Vehicle.Name))
                end  
            end
        },


        ["vungod"] = {
            Callback = function(Mod, Vehicle)
                for _, Vehicle in pairs(returnvehicles(Mod, Vehicle)) do 
                    repair(Vehicle, false, 350, 9999999)
                    success(string.format("Ungodded %s", Vehicle.Name))
                end  
            end
        },

        ["vtp"] = {
            Callback = function(Mod, Player, Vehicle)
                for _, Player in pairs(returnplayers(Mod, Player)) do
                    local Vehicle = returnvehicles(Mod, Vehicle)[1]
                    if Vehicle == nil then return end
                    teleport(Player.Name, Vehicle.Essentials.Base.CFrame + Vector3.new(0, 10, 0))
                    success(string.format("Teleported %s to %s", Player.Name, Vehicle.Name))
                end
            end
        },

        

        ["getitems"] = {
            Callback = function()
                local Items = Lighting:FindFirstChild("LootDrops")
                for i,v in pairs(Items:GetChildren()) do
                    success(v.Name)
                end
            end
        },

        ["vbring"] = {
            Callback = function(Mod, Vehicle, Player)
                for _, Vehicle in pairs(returnvehicles(Mod, Vehicle)) do 	
                    local Player = returnplayers(Mod, Player)[1] 
                    if Player == nil then return end
                    spawn(function()
                        Utils.Remotes["AddClothing"]:FireServer("IsBuildingMaterial", Vehicle.Essentials.Base, "","","")
                        Vehicle.Essentials.Base:WaitForChild("IsBuildingMaterial")
                        Utils.Remotes["ReplicatePart"]:FireServer(Vehicle.Essentials.Base, Player.Character.HumanoidRootPart.CFrame + Vector3.new(math.random(10, 20), 4, math.random(10, 20)))
                        wait(1)
                        fireServer("ChangeParent", Vehicle.Essentials.Base:FindFirstChild("IsBuildingMaterial"), nil)
                    end)
                    success(string.format("Brought %s to %s", Vehicle.Name, Player.Name))
                end
            end
        },

        ["vexplode"] = {
            Callback = function(Mod, Vehicle)
                for _, Vehicle in pairs(returnvehicles(Mod, Vehicle)) do 
                    fireServer("ChangeValue", Vehicle.Stats.Engine, 0)
                    success(string.format("Exploded %s", Vehicle.Name))
                end
            end  
        },

        ["vunweld"] = {
            Callback = function(Mod, Vehicle)
                for _, Vehicle in pairs(returnvehicles(Mod, Vehicle)) do 
                    spawn(function()
                        for _, v in pairs(Vehicle:GetDescendants()) do
                            if v.Name == "Weld" then 
                                fireServer("ChangeParent", v, nil)
                            end
                        end   
                    end)
                    success(string.format("Removed %s's welds", Vehicle.Name))
                end  
            end
        },

        ["vdelete"] = {
            Callback = function(Mod, Vehicle)
                for _, Vehicle in pairs(returnvehicles(Mod, Vehicle)) do 
                    fireServer("ChangeParent", Vehicle, nil)
                    success(string.format("Deleted %s", Vehicle.Name))
                end  
            end
        },

        ["vcolor"] = {
            Callback = function(Mod, Vehicle, Color)
                for _, Vehicle in pairs(returnvehicles(Mod, Vehicle)) do 
                    if checkargs("Color code", tonumber(Color)) then return end
                    for _, v in pairs(Vehicle:GetDescendants()) do
                        if Vehicle.Stats.Armor.Value > 0 then 
                            if v.Name == "Special" or v.Name == "Color" or v.Name == "White" then 
                                colormodel(v, setvalue(Color, 1, 65, .5), 2)
                            end
                        elseif v.Name == "Special" or v.Name == "Color" or v.Name == "White" then
                            colormodel(v, setvalue(Color, 1, 65, .5), 1)
                        end    
                        if v.Name ~= "PoliceCar" and v.Name == "ArmorSkirt" then
                            colormodel(v, setvalue(Color, 1, 65, .5), 2)
                        end
                    end
                    success(string.format("Set %s's color code to %s", Vehicle.Name, Color))
                end  
            end
        },


        ["vmat"] = {
            Callback = function(Mod, Vehicle, Material, Value)
                for _, Vehicle in pairs(returnvehicles(Mod, Vehicle)) do 
                    Material = GetMaterials(Material)
                    if checkargs("Material", Material) or checkargs("Transparency", tonumber(Value)) then return end	
                    if Vehicle.Essentials.Color:FindFirstChild("ArmorSkirt") then
                        fireServer("ChangeParent", Vehicle.Essentials.Color:FindFirstChild("ArmorSkirt"), Vehicle)
                        fireServer("VehichleLightsSet", Vehicle.Essentials.Color:FindFirstChild("ArmorSkirt"), Material, 1, 0)
                    end   
                    for _, v in pairs(Vehicle:GetDescendants()) do
                        if v.Name == "Special" or v.Name == "Color" or v.Name == "Black" or v.Name == "White" or v.Name == "LMWheel" or v.Name == "LBWheel" or v.Name == "Black" then
                            fireServer("VehichleLightsSet", v, Material, setvalue(Value, 0, 1))
                        end
                        if v.Name == "LMWheel" or v.Name == "LBWheel" or v.Name == "Black" or v.Name == "LFWheel" or v.Name == "RFWheel" or v.Name == "RMWheel" or v.Name == "RBWheel" then 
                            fireServer("VehichleLightsSet", v, Material, setvalue(Value, 0, 0.99999))
                        end
                    end
                    Vehicle:WaitForChild("ArmorSkirt")
                    fireServer("ChangeParent", Vehicle:FindFirstChild("ArmorSkirt"), Vehicle.Essentials.Color)
                    success(string.format("Set %s's material to %s and transparency to %s", Vehicle.Name, Material, Value))
                end 
            end 
        },

        --apperance 
        ["shirt"] = {
            Callback = function(Mod ,Player, Value)
                local Playerlist = returnplayers(Mod,Player)
                for _, Player in pairs(Playerlist) do 
                    if checkargs("ID", tonumber(Value)) then return end	
                    setoutfit(Player.Name, "Shirt", Value)
                    success(string.format("Set %s's shirt to %s", Player.Name, Value))
                end    
            end
        },

        ["pants"] = {
            Callback = function(Mod ,Player, Value)
                local Playerlist = returnplayers(Mod,Player)
                for _, Player in pairs(Playerlist) do 
                    if checkargs("ID", tonumber(Value)) then return end	
                    setoutfit(Player.Name, "Pants", Value)
                    success(string.format("Set %s's pants to %s", Player.Name, Value))
                end    
            end
        },

        ["color"] = {
            Callback = function(Mod, Player, Color)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if checkargs("Color code", tonumber(Color)) then return end	
                    if notloaded(Player.Name) then return end
                    colormodel(Player.Character, setvalue(Color, 1, 65, .5), 1)
                    success(string.format("Set %s's color code to %s", Player.Name, Color)) 
                end
            end
        },

        ["invis"] = {
            Callback = function(Mod, Player) 
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    local Value = 1
                    if checkargs("Transparency", tonumber(Value)) then return end	
                    if notloaded(Player.Name) then return end
                    fireServer("VehichleLightsSet", Player.Character, "Plastic", setvalue(Value, 0, 1))
                    success(string.format("Set %s's transparency to %s", Player.Name, Value))
                end
            end
        },

        ["vis"] = {
            Callback = function(Mod, Player) 
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    local Value = 0
                    if checkargs("Transparency", tonumber(Value)) then return end	
                    if notloaded(Player.Name) then return end
                    fireServer("VehichleLightsSet", Player.Character, "Plastic", setvalue(Value, 0, 1))
                    success(string.format("Set %s's transparency to %s", Player.Name, Value))
                end
            end
        },

        ["vest"] = {
            Callback = function(Mod, Player, Color, Texture)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if checkargs("Color code", tonumber(Color)) or checkargs("Texture code", tonumber(Texture)) then return end	
                    local VestObject
                    for _, v in pairs(Lighting.PlayerVests:GetChildren()) do
                        if Player.Character:FindFirstChild(v.Name) then
                            VestObject = Player.Character[v.Name]
                        end    
                    end
                    if not VestObject then 
                        error(string.format("%s Does Not Have A Vest", Player.Name))
                        return
                    end   
                    colormodel(VestObject, setvalue(Color, 1, 65, .5), setvalue(Texture, 1, 12, .5))
                    success(string.format("Set %s's vest's color code to %s and texture code %s", Player.Name, Color, Texture))
                end    
            end
        },

        ["bag"] = {
            Callback = function(Mod, Player, Color, Texture)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if checkargs("Color code", tonumber(Color)) or checkargs("Texture code", tonumber(Texture)) then return end	
                    local BackPackObject
                    for _, v in pairs(Lighting.Backpacks:GetChildren()) do
                        if Player.Character:FindFirstChild(v.Name) then
                            BackPackObject = Player.Character[v.Name]
                        end    
                    end
                    if not BackPackObject then 
                        error(string.format("%s Does Not Have A Backpack", Player.Name))
                        return
                    end   
                    colormodel(BackPackObject, setvalue(Color, 1, 65, .5), setvalue(Texture, 1, 12, .5))
                    success(string.format("Set %s's backpack's color code to %s and texture code %s", Player.Name, Color, Texture))
                end  
            end 
        },


        --server
        ["map"] = {
            Callback = function(Mod, Color, Texture)
                if checkargs("Color code", tonumber(Color)) or checkargs("Texture code", tonumber(Texture)) then return end	
                if game.PlaceId == 237590761 or game.PlaceId == 302647266 or game.PlaceId == 1228676522 or game.PlaceId == 1228677045 then 
                    error(string.format("coloring and texturing is disabled On", Mapname))
                    return
                elseif not workspace["Anchored Objects"] then 
                    error("Anchored Objects is nil")
                    return
                end
                if game.PlaceId == 237590657 or game.PlaceId == 1228674372 then 
                    colormodel(workspace["Anchored Objects"].Plates, setvalue(Color, 1, 65, .5), setvalue(Texture, 1, 12, .5))
                    for _, v in pairs(workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
                        if v:IsA("Model") then
                            colormodel(v, setvalue(Color, 1, 65, .5), setvalue(Texture, 1, 12, .5))
                        end
                    end
                elseif game.PlaceId == 290815963 or game.PlaceId == 1228677761 then 
                    colormodel(workspace["Anchored Objects"].Plates.Plates, setvalue(Color, 1, 65, .5), setvalue(Texture, 1, 12, .5))
                    for _, v in pairs(workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
                        if v:IsA("Model") then
                            colormodel(v, setvalue(Color, 1, 65, .5), setvalue(Texture, 1, 12, .5))
                        end
                    end
                end
                success(string.format("Set %s's color code to %s and texture code %s", Mapname, Color, Texture))
            end
        },
        ["resetmap"] = {
            Callback = function(Mod)
                if game.PlaceId == 237590761 or game.PlaceId == 302647266 or game.PlaceId == 1228676522 or game.PlaceId == 1228677045 then 
                    error("Coloring Is Disabled On This Map")
                    return
                end
                if not workspace["Anchored Objects"] then 
                    error("Map Is Deleted")
                    return
                end
                if game.PlaceId == 237590657 or game.PlaceId == 1228674372 then
                    Utils.Remotes["AddClothing"]:FireServer("SecondaryColor", workspace["Anchored Objects"].Plates, "","","")
                    workspace["Anchored Objects"].Plates:WaitForChild("SecondaryColor")
                    Utils.Remotes["ColorGun"]:FireServer(workspace["Anchored Objects"].Plates, 8, 10, 8,10)
                    fireServer("ChangeParent", workspace["Anchored Objects"].Plates:FindFirstChild("SecondaryColor"), nil)
                    wait()
                    for _, v in pairs(workspace["Anchored Objects"].Plates.Hills:GetChildren()) do
                        Utils.Remotes["AddClothing"]:FireServer("SecondaryColor", v, "","","")
                        v:WaitForChild("SecondaryColor")
                        Utils.Remotes["ColorGun"]:FireServer(v, 8, 10, 8,10)
                    end
                    wait(.1)
                    for _, v in pairs(game:GetService("Workspace")["Anchored Objects"]:GetDescendants()) do
                        if v.Name == "SecondaryColor" then
                            fireServer("ChangeParent", v, nil)
                        end
                    end
                end   
                if game.PlaceId == 290815963 or game.PlaceId == 1228677761 then --//Amend
                    Utils.Remotes["AddClothing"]:FireServer("SecondaryColor", workspace["Anchored Objects"].Plates.Plates, "","","")
                    workspace["Anchored Objects"].Plates.Plates:WaitForChild("SecondaryColor")
                    Utils.Remotes["ColorGun"]:FireServer(workspace["Anchored Objects"].Plates.Plates,8, 10, 8, 10) 
                    fireServer("ChangeParent", workspace["Anchored Objects"].Plates.Plates:FindFirstChild("SecondaryColor"), nil)
                    wait()
                    for _, v in pairs(workspace["Anchored Objects"].Plates.Hills.MediumHills:GetChildren()) do
                        Utils.Remotes["AddClothing"]:FireServer("SecondaryColor", v, "","","")
                        v:WaitForChild("SecondaryColor")
                        Utils.Remotes["ColorGun"]:FireServer(v, 8, 10, 8, 10)
                    end
                    wait()
                    for _, v in pairs(workspace["Anchored Objects"].Plates.Hills.LargeHills:GetChildren()) do
                        Utils.Remotes["AddClothing"]:FireServer("SecondaryColor", v, "","","")
                        v:WaitForChild("SecondaryColor")
                        Utils.Remotes["ColorGun"]:FireServer(v, 8, 10, 8, 10)
                    end
                    wait()
                    for _, v in pairs(workspace["Anchored Objects"].Plates.Hills.SmallHills:GetChildren()) do
                        Utils.Remotes["AddClothing"]:FireServer("SecondaryColor", v, "","","")
                        v:WaitForChild("SecondaryColor")
                        Utils.Remotes["ColorGun"]:FireServer(v ,8, 10, 8, 10)
                    end
                    wait(.1)
                    for _, v in pairs(game:GetService("Workspace")["Anchored Objects"]:GetDescendants()) do
                        if v.Name == "SecondaryColor" then
                            fireServer("ChangeParent", v, nil)
                        end
                    end
                end
                success("Successfully Reset " .. workspace.mapname.Value .. "'s Map Color.")
            end
        },

        --etc (random) 
        ["mod"] = {
            Callback = function(Mod, Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if noclient(Player.Name) then return end
                    if table.find(Moderators, Player.Name) then 
                        error(string.format("%s is already a moderator", Player.Name))
                        return 
                    end
                    table.insert(Moderators, Player.Name)
                    success(string.format("Granted moderation to %s", Player.Name))
                end
            end
        },

        ["unmod"] = {
            Callback = function(Mod, Player)
                for _, Player in pairs(returnplayers(Mod, Player)) do 
                    if noclient(Player.Name) then return end
                    if not table.find(Moderators, Player.Name) then 
                        error(string.format("%s is not a moderator", Player.Name))
                        return 
                    end
                    table.remove(Moderators, table.find(Moderators, Player.Name))
                    success(string.format("Removed %s's moderation", Player.Name))
                end
            end
        },

        ["gethgods"] = {
            Callback = function()
                local GodCount = 0
                for _, Player in pairs(Players:GetPlayers()) do
                    if not Player.Character:FindFirstChild("Humanoid") then return end
                    if string.sub(tostring(Player.Character.Humanoid.Health), 1, 1) == "-" then 
                        success(Player.Name)
                        GodCount = GodCount+1
                    end
                end
                if GodCount == 0 then
                    error("No One Is HGodded") 
                end
            end
        },
    
        ["getgods"] = {
            Callback = function()
                local PKGodCount = 0
                for _, Player in pairs(Players:GetPlayers()) do
                    if not Player.Character:FindFirstChild("Humanoid") then return end
                    if not Player.Character.Humanoid:FindFirstChild("DefenseMultiplier") then return end
                    if tonumber(Player.Character.Humanoid:FindFirstChild("DefenseMultiplier").Value) == 0 then 
                        success(Player.Name)
                        PKGodCount = PKGodCount+1
                    end
                end
                if PKGodCount == 0 then
                    error("No One Is Godded") 
                end
            end
        },
    
        ["getbans"] = {
            Callback = function()
                local count = 0
                for i in pairs(banData) do
                    count = count + 1
                    local playerName
                    local userId = tonumber(i)
                    pcall(function()
                        playerName = Players:GetNameFromUserIdAsync(userId)
                    end)
                    success(playerName)
                end   
                if count == 0 then
                    error("No One Is Banned")
                end
            end
        },
        
        ["getmods"] = {
            Callback = function()
                local ModsCount = 0
                for _, Player in pairs(Moderators) do
                    success(Player)
                    ModsCount = ModsCount+1
                end
                if ModsCount == 0 then
                    error("No One Has Mod") 
                end
            end
        },

    }
    

    ChatHookEvent =
        Utils.Remotes["Chat"].OnClientEvent:connect(function(...)
        local Args = {...}
        local Player = Args[1]["Speaker"]
        local Message = Args[1]["Message"]
        if checkpermission(Player.Name) or Player == Client then
            if string.sub(Message, 1, #Prefix) == Prefix then
                local Formatted = string.sub(Message, 1 + #Prefix)
                fireCommand(Formatted, Player.Name)
            end
        end
    end)

    function fireCommand(text, Player)
        local Args = GetArgs(text)
        if not Args or #Args == 0 then return end
        local Command = Args[1]:lower()
    
        if not CommandDictionary[Command] then
            error("Invalid Command")
            Type.Text = "" 
            return    
        end   
    
        if Nonmods[Command] and table.find(Moderators, Player) then
            error("Thats A Client Commands Only")
            return
        end
    
        
        player("You" .. ": " .. "\"" .. text .. "\"")
        CommandDictionary[Command].Callback(Player,select(2, table.unpack(Args)))
        Type.Text = "" 
    end
    
    Type.FocusLost:Connect(function(enterPressed)
        if enterPressed and Type.Text ~= nil and Type.Text ~= "" then
            fireCommand(Type.Text, Client.Name)
        end    
    end)


    --//Drag Function 
    local IsDragging2, DragInput2, DragStart2, StartPos2
    Drag.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            IsDragging2 = true
            DragStart2 = input.Position
            StartPos2 = Console.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then IsDragging2 = false end
            end)
        end
    end)
    Drag.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then DragInput2 = input end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == DragInput2 and IsDragging2 then 
            local Delta = input.Position - DragStart2
            Console.Position = UDim2.new(StartPos2.X.Scale, StartPos2.X.Offset + Delta.X, StartPos2.Y.Scale, StartPos2.Y.Offset + Delta.Y)
        end
    end)

