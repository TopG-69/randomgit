local Oldmakefolder = makefolder
makefolder = function(Name)
	if not isfolder(Name) then
		Oldmakefolder(Name) 
	end
end
function GetContexts()
    local gtcx;
    local stcx; 
    for i, v in pairs(getgenv()) do
        if typeof(v) == "function" and string.find(tostring(i), "context") or string.find(tostring(i), "identity") then
            if string.find(tostring(i), "get") then
                gtcx = v
            elseif string.find(tostring(i), "set") then
                stcx = v
            end
        end
    end
    return gtcx, stcx
end
getcontext, setcontext = GetContexts()
syn_context_get = getcontext
syn_context_set = setcontext

meta = getrawmetatable(game)
if getgenv().MetaSet == nil or getgenv().MetaSet == true then
	local id = meta.__index
	local ni = meta.__newindex
	local nc = meta.__namecall
	getgenv().MetaSet = {["id"] = meta.__index, ["ni"] = meta.__newindex, ["nc"] = meta.__namecall}
end

local id = getgenv().MetaSet["id"]
local ni = getgenv().MetaSet["ni"]
local nc = getgenv().MetaSet["nc"]
setreadonly(meta, false)
meta.__newindex = newcclosure(function(rc, ind, id)
	if ind == "Health" and LPlr.Character ~= nil and rc == LPlr.Character:FindFirstChild("Humanoid") and id < 100 then
		return
	elseif ind == "Parent" and ((rc:IsA("Player") and not id and rc.Parent ~= nil) or rc:IsA("RemoteEvent") or rc:IsA("RemoteFunction")) then
		return
	elseif ind == "Value" and typeof(rc) == "Instance" and fireserver then
		fireserver("ChangeValue", rc, id)
	end
	return ni(rc, ind, id)
end)
meta.__index = newcclosure(function(rc, i)
    if i == "Name" and tostring(rc) == "PermanentBan" then
		Notify("Someone Attempted To Free You!", 4)
		return "Nope"
	elseif i == "Name" and tostring(rc) == "Remote" and RemoteTable and RemoteTable[i] then
		return RemoteTable[i]
    end
    return id(rc, i)
end)
meta.__namecall = newcclosure(function(rc, ...)
	args = {...}
	if getnamecallmethod() == "FindFirstChild" and args[1] == "PermanentBan" and rc == LPlr then
		AddClientMessage("Someone Attempted To Freeze You!", 4)
		return
	elseif SpawnItemOnBullet and getnamecallmethod() == "FireServer" and (tostring(rc) == "BulletHit" or tostring(rc) == "BloodHit") then
		local Pos = args[1]
		if typeof(Pos) ~= "Vector3" then
			Pos = Pos.Position
		end
		SpawnItemAtPosition(Pos, ItemToSpawnOnBullet, nil, Vector3.new())
		setnamecallmethod("FireServer")
	elseif SpawnCageOnBullet and getnamecallmethod() == "FireServer" and (tostring(rc) == "BulletHit" or tostring(rc) == "BloodHit") and CageToSpawn then
		local Pos = args[1]
		if typeof(Pos) ~= "Vector3" then
			Pos = Pos.Position + Vector3.new(0, 2.5, 0)
		else
			Pos = Pos + Vector3.new(0, 4.5, 0)
		end
		SpawnItemAtPosition(Pos, CageToSpawn, game.ReplicatedStorage, CageOffset)
		setnamecallmethod("FireServer")
	elseif (tostring(rc) == "ReplicateModel" or tostring(rc) == "ReplicatePart") and getnamecallmethod() == "FireServer" and typeof(args[1]) == "Instance" then
		if not args[1].FindFirstChild(args[1], "IsBuildingMaterial") and args[1].Parent ~= nil then
			R.AddClothing.FireServer(R.AddClothing, "IsBuildingMaterial", args[1], "", "", "")
			AddWaitForChild(args[1], "IsBuildingMaterial", "FireServer", nc, rc, args)
			return
		elseif args[1].Parent == nil then
			return
		end
		setnamecallmethod("FireServer")
	elseif getnamecallmethod() == "DistanceFromCharacter" then
		return 0
	end
	return nc(rc, ...)
end)

function N(n)
    if n< 0 then
        return n*-1
    end
    return n
end

function RoundNumber(N, To)
    N = tostring(N*To)
    local NT = string.split(N, ".")
    if #NT > 1 and tonumber(NT[2]) >= 5 then
        NT[1] = tonumber(NT[1])+1
    end
    return tonumber(NT[1])/To
end

function SearchForFuncName(Tab, Func)
	for i, v in pairs(Tab) do
		if typeof(v) == "function" and i == Func then
			return v
		elseif typeof(v) == "table" then
			local t = SearchForFuncName(v, Func)
			if t then
				return t
			end
		end
	end
end
function Replace(Str, What, Rep)
    local StrTab = string.split(Str, What)
    local NewS = StrTab[1]
    if #StrTab > 1 then
        for i = 2, #StrTab do
            NewS = NewS..Rep..StrTab[i]
        end
    end
    return NewS
end
makefolder("VictinisGuiSettings")
makefolder("VictinisGuiSettings/Themes")
makefolder("VictinisGuiSettings/Bases")
function WriteFile(fn, txt)
	writefile("VictinisGuiSettings/"..fn..".txt", txt)
end
function ReadFile(fn)
	return pcall(function() return readfile("VictinisGuiSettings/"..fn..".txt") end)
end
if pcall(function() TempApocBaseImporter = readfile("ApocBaseImporter.txt") end) then
	RealBasesTab = {}
	TempBasesTab = string.split(TempApocBaseImporter, "\n},\n")
	for i = 1, #TempBasesTab do
		local TempSplit = string.split(TempBasesTab[i], string.char(10).."},")
		for a = 1, #TempSplit do
			table.insert(RealBasesTab, TempSplit[a])
		end
	end
	CharactersToRemove = {string.char(13), string.char(10), "\n", "}", "{", " ", '"', "[", "]"}
	for i = 1, #RealBasesTab do
		local BaseSplit;
		for a = 1, string.len(RealBasesTab[i]) do
			if string.sub(RealBasesTab[i], a, a) == "=" then
				BaseSplit = {string.sub(RealBasesTab[i], 1, a-1), string.sub(RealBasesTab[i], a+1)}
				break
			end
		end
		if BaseSplit then
            for a = 1, #CharactersToRemove do
			    BaseSplit[1] = Replace(BaseSplit[1], CharactersToRemove[a], "")
            end
            S = BaseSplit[1]
            table.remove(BaseSplit, 1)
            if S ~= "" then
			    WriteFile("Bases/"..S, string.sub(BaseSplit[1], 2).."\n}", S)
            end
		end
	end
	delfile("ApocBaseImporter.txt")
end
LPlr = game.Players:GetChildren()[1]
MapName = game.MarketplaceService:GetProductInfo(game.PlaceId).Name
local NameLength = 20
local IsXbox = false
if string.sub(MapName, 1, 4) == "Xbox" then
    NameLength = NameLength+5
	IsXbox = true
end
MapName = string.sub(MapName, NameLength)
Banned = {}
ClientMessageHandler = {}
ChildrenWaitingFor = {}-- {Item, NameOfChild, method, Remote, args}
function AddClientMessage(Msg, Time)
	table.insert(ClientMessageHandler, {Msg, Time})
end
function AddWaitForChild(Item, NameOfChild, method, func, Remote, args)
	table.insert(ChildrenWaitingFor, {Item, NameOfChild, method, func, Remote, args})
end
if not queue_on_teleport then
	queue_on_teleport = SearchForFuncName(getgenv(), "queue_on_teleport")
	if not queue_on_teleport then
		queue_on_teleport = function() end
		AddClientMessage("queue_on_teleport not found, rejoin and invites will require manual re-execution")
	end
end
spawn(function()
	repeat
		wait()
	until Notify
	while wait() do
		if #ClientMessageHandler > 0 then
			for i = 1, #ClientMessageHandler do
				Notify(ClientMessageHandler[i][1], ClientMessageHandler[i][2])
			end
			ClientMessageHandler = {}
		end
		if #ChildrenWaitingFor > 0 then
			for i = 1, #ChildrenWaitingFor do
				local T = ChildrenWaitingFor[i]
				spawn(function()
					T[1]:WaitForChild(T[2])
					setnamecallmethod(T[3])
					T[4](T[5], unpack(T[6]))
				end)
			end
			ChildrenWaitingFor = {}
		end
	end
end)
for i, v in pairs(getnilinstances()) do
	if v:IsA("Player") and v.Character then
		v.Parent = game.Players
	end
end
local ServerModels = loadstring(game:HttpGet("https://pastebin.com/raw/mQbxXS4f"))()
local ServerClothing = loadstring(game:HttpGet("https://pastebin.com/raw/pp6eGM7C"))()

local TakenItems = {}
local ItemsToSpawn = {}
function AddItemsToSpawn(Item, Pos)
	if ItemsToSpawn[tostring(Item)] == nil then
		ItemsToSpawn[tostring(Item)] = {}
	end
	table.insert(ItemsToSpawn[tostring(Item)], Pos)
end
function FindItemsToSpawn(Item)
	local Part = Item
	if not Item:IsA("BasePart") then
		Part = GetPart(Item)
	end
	if ItemsToSpawn[tostring(Item)] == nil then
		return false
	end
	local Closest;
	local Indx;
	if Part ~= nil then
		for i = 1, #ItemsToSpawn[tostring(Item)] do
			if (Part.Position-ItemsToSpawn[tostring(Item)][i]).Magnitude < 25 and (Closest == nil or (Closest-Part.Position).Magnitude > (Part.Position-ItemsToSpawn[tostring(Item)][i]).Magnitude) then
				Closest = ItemsToSpawn[tostring(Item)][i]
				Indx = i
			end
		end
	end
	if Closest ~= nil and Indx ~= nil then
		table.remove(ItemsToSpawn[tostring(Item)], Indx)
		return true
	end
	return false
end
function GetCreatedItem(Par, Item, Val)
    while wait() do
        for i, v in pairs(Par:GetChildren()) do
            if v.Name == tostring(Item) and TakenItems[v] == nil and (Val == nil or Val ~= nil and v.Value == Val) then
                TakenItems[v] = true
                return v
            end
        end
    end
end

function MakeThingsInside(Item, Par)
    for i, v in pairs(Item:GetChildren()) do
        if v.Name ~= "MaxClip" then
            R.AddClothing:FireServer(v.Name, Par, v.Value, "", "")
            repeat
                wait()
            until Par:FindFirstChild(v.Name)
            MakeThingsInside(v, Par[v.Name])
        else
            R.GroupCreate:FireServer(v.Name)
            I = GetCreatedItem(game.Lighting.Groups, v.Name)
			fireserver("ChangeValue", I, v.Value)
            fireserver("ChangeParent", I, Par)
            repeat
                wait()
            until Par:FindFirstChild(v.Name)
            MakeThingsInside(v, I)
        end
    end
end
local SelectableRandomLoot = {}
for i, v in pairs(game.Lighting.LootDrops:GetChildren()) do
	if v:FindFirstChild("ObjectID") then
		table.insert(SelectableRandomLoot, v)
	end
end
function AddItem(Item, Slot)
    if not Loot:FindFirstChild(tostring(Item)) and tostring(Item) ~= "Random" then
        return
	elseif tostring(Item) == "Random" then
		Item = SelectableRandomLoot[math.random(1, #SelectableRandomLoot)]
    end
    Item = Loot[tostring(Item)].ObjectID
    R.AddClothing:FireServer("ObjectID", Slot, Item.Value, "", "")
    spawn(function()
        local ID = GetCreatedItem(Slot, "ObjectID", Item.Value)
		for i, v in pairs(ID:GetChildren()) do
			if v.Name == "" then
				fireserver("ChangeParent", v)
			end
		end
        MakeThingsInside(Item, ID)
        fireserver("ChangeValue", Slot, 1)
    end)
end

function AddBaseToFile(BaseName, BaseTxt)
    writefile("VictinisGuiSettings/Bases/"..BaseName..".txt", BaseTxt)
end

Movable = false
SpecialBypass = true
if _G.TouchParts == nil then
	_G.TouchParts = {}
	_G.ActiveParts = {}
	spawn(function()
		while wait(0.05) do
			for i, v in pairs(game.Players:GetPlayers()) do
				if v.Character ~= nil and v.Character:FindFirstChild("Head") then
					local Head = v.Character.Head
					local RayV = Ray.new(Head.Position, Vector3.new(0, -5, 0))
					local Hit = game.Workspace:FindPartOnRayWithIgnoreList(RayV, {v.Character})
					if Hit == nil or Hit ~= nil and _G.TouchParts[Hit] == nil then
						local RayV = Ray.new(Head.Position, Head.CFrame.lookVector*5)
						Hit = game.Workspace:FindPartOnRayWithIgnoreList(RayV, {v.Character})
					end
					if Hit ~= nil and _G.TouchParts[Hit] ~= nil then
						local V = _G.TouchParts[Hit]
						for i = 1, #V do
							local S = V[i]
							if typeof(S) == "table" then
								S = V[i][1]
							end
							if S == "Kill" then
								KillPlayer(Head)
							elseif S == "Teleport" or S == "TeleportIgnore" then
								TeleportPlayer(Head, V[i][2], S == "TeleportIgnore")
							elseif S == "ToolRemoval" then
								ToolRemoval(Head)
							elseif S == "Trip" then
								Trip(Head)
							elseif S == "NoFall" and Head.Parent:FindFirstChild("Humanoid") then
								NoFall(Head)
							elseif S == "Dis" then
								Disappear(Hit, V[i][2])
							elseif S == "Seat" then
								SitPlr(Head, Hit)
							elseif S == "DoUn" and Hit.Anchored then
								Unanchor(Hit)
							elseif S == "Clothing" and not _G.ActiveParts[Hit] then
								_G.ActiveParts[Hit] = true
								ToggleVest(v, false)
								pcall(function()
									ChangeClothing(v, "Pants", V[i][2])
									ChangeClothing(v, "Shirt", V[i][3])
								end)
								spawn(function()
									wait(1)
									_G.ActiveParts[Hit] = false
								end)
							end
						end
					end
				end
			end
		end
	end)
end

function MoveItem(Item, Par)
fireserver("ChangeParent", Item, Par)
end
function KillPlayer(Part)
Plr = GetPlayer(Part)
if Plr ~= nil and Plr:FindFirstChild("Humanoid") then
MoveItem(Plr.Head, nil)
end
end
function ToolRemoval(Part)
Plr = GetPlayer(Part)
if Plr ~= nil and Plr ~= LPlr.Character and Plr:FindFirstChild("Right Arm") then
Plr["Right Arm"].ChildAdded:connect(function(Ch)
wait(1)
if Ch:IsA("Weld") then
repeat
wait()
until Ch.Part1 ~= nil and Ch.Part1.Parent ~= nil
MoveItem(Ch.Part1, nil)
end
end)
end
end
function NoFall(Part)
Plr = GetPlayer(Part)
if Plr ~= nil and Plr:FindFirstChild("Humanoid") then
if Plr.Humanoid:FindFirstChild("TeleportID") then
MoveItem(Plr.Humanoid.TeleportID, nil)
end
R.AddClothing:FireServer("TeleportID", Plr.Humanoid, "", "", "")
end
end
function Trip(Part)
Plr = GetPlayer(Part)
if Plr ~= nil and Plr:FindFirstChild("Humanoid") then
R.HurtZombie:FireServer(Plr)
end
end
function Disappear(Part, Time)
	local Origin = Part.Parent
	fireserver("ChangeParent", Part, game.ReplicatedStorage)
	if Time == nil then
		Time = 3
	end
	spawn(function()
		wait(Time)
		if Origin ~= game.ReplicatedStorage then
			fireserver("ChangeParent", Part, Origin)
		end
	end)
end
local CharsSitting = {}
local LockedChairs = {}
function SitPlr(Part, Seat)
	local Char = GetPlayer(Part)
	if not Char or not Char:FindFirstChild("Humanoid") or CharsSitting[Char] or CharsSitting[Seat] and CharsSitting[Seat].Parent then
		return
	elseif CharsSitting[Seat] and not CharsSitting[Seat].Parent then
		CharsSitting[Seat] = nil
	end
	local Hum = Char.Humanoid
	local Root = Char.HumanoidRootPart
	local Con1 =  true
	local Con2;
	Con2 = Hum.Died:connect(function()
		Con1 = false
		Con2:Disconnect()
		if Seat:FindFirstChild("SeatWeld") then
			fireserver("ChangeParent", Seat.SeatWeld)
		end
		CharsSitting[Seat] = game.Workspace
		wait(2)
		CharsSitting[Seat] = nil
	end)
	R.HurtZombie:FireServer(Char)
	repeat
		wait()
	until Hum.Sit == true
	CharsSitting[Seat] = Char
	CharsSitting[Char] = true
	R.SitDown:InvokeServer(Seat, Root)
	spawn(function()
		while Con1 do
			if not Hum.Sit and LockedChairs[Seat] then
				R.HurtZombie:FireServer(Char)
			elseif not Hum.Sit then
				Con1 = false
				if Root and Root:FindFirstChild("SeatPoint") then
					CharsSitting[Char] = nil
					fireserver("ChangeParent", Root.SeatPoint)
				end
				if Seat:FindFirstChild("SeatWeld") then
					fireserver("ChangeParent", Seat.SeatWeld)
					wait(2)
					CharsSitting[Seat] = nil
				end
			end
			wait(0.1)
		end
	end)
end
function Unanchor(Prt)
    if not LPlr.Character or not LPlr.Character:FindFirstChild("IsSpawned") then
        return
    elseif LPlr.Character.IsSpawned.Value ~= false then
        fireserver("ChangeValue", LPlr.Character.IsSpawned, false)
        repeat
            wait()
        until LPlr.Character.IsSpawned.Value == false
    end
    R.Spawn:FireServer(Prt)
end

function TeleportPlayer(Part, Position, Val)
Plr = GetPlayer(Part)
if Plr ~= nil and Plr:FindFirstChild("Humanoid") and Plr:FindFirstChild("Head") and (Val ~= true or Val == true and Plr ~= LPlr.Character)then
local H = Plr.Head
R.AddClothing:FireServer("IsBuildingMaterial", H, "", "", "")
repeat
wait()
until H:FindFirstChild("IsBuildingMaterial")
NoFall(Plr.Head)
R.ReplicatePart:FireServer(H, CFrame.new(Position.X, Position.Y+2, Position.Z))
end
end

local VehicleSpawnList = {}
function SpawnVehicleBase(Veh, Position)

	local Vehicles = game.Workspace.Vehicles
	local TotalVehicleList = Vehicles:GetChildren()
	local Total = #TotalVehicleList
	for i = 1, Total do
		if TotalVehicleList[Total-i+1].Name == "VehicleWreck" then
			table.remove(TotalVehicleList, Total-i+1)
		end
	end
	local Vehicle;
	
	if Mats:FindFirstChild(Veh) then
		Vehicle = Mats[Veh]
	else
		for i = 1, #TotalVehicleList do
			if tostring(TotalVehicleList[i]) == Veh and GetPart(TotalVehicleList[i]) ~= nil then
				Vehicle = TotalVehicleList[i]
				break
			end
		end
		if Vehicle == nil then
			Vehicle = TotalVehicleList[math.random(1, #TotalVehicleList)]
		end
	end
	ChangeVehicleStats(Vehicle, 4)
	SpawnVehicle({["Character"] = {["Torso"] = {["Position"] = Position+Vector3.new(0, 8, 0)}}}, Vehicle, true)
end

function GetPlayer(T)
if T == nil or T.Parent == nil then
return nil
end
repeat
T = T.Parent
until T == nil or T.Parent == nil or T:FindFirstChild("Head") and T:FindFirstChild("HumanoidRootPart")
return T
end

local AA = 0
MaxAmount = 1000
TimeToWait = 1.5
function Count()
	AA = AA + 1
	if AA >= MaxAmount then
		wait(TimeToWait)
		AA = 0
	end
end

getgenv().MakeEmptyModel = function()
	local TempModel = nil
	for i, v in pairs(game.Lighting.Hair:GetDescendants()) do
        if v.Name == "Handle" and v:FindFirstChild("AttachmentPoint") then
            TempModel = v.Parent
			break
        end
    end
	local Char = LPlr.Character
	local TempTab = {}
	for i, v in pairs(Char:GetChildren()) do
		TempTab[v] = true
	end
	R.AttachAccessory:FireServer(TempModel, Char.HumanoidRootPart, CFrame.new(0, -100, 0))
	local Model = nil
	repeat
		wait()
		for i, v in pairs(Char:GetChildren()) do
			if TempTab[v] == nil and tostring(v) == tostring(TempModel) then
				Model = v
				fireserver("ChangeParent", v, game.Workspace)
				for a, b in pairs(v:GetChildren()) do
					fireserver("ChangeParent", b)
					Count()
				end
				break
			end
		end
	until Model ~= nil
	return Model
end

function ColorModel(Model, Color, Material)
if not Model:FindFirstChild("SecondaryColor") then
R.AddClothing:FireServer("SecondaryColor", Model, "1", "", "")
repeat
wait()
until Model:FindFirstChild("SecondaryColor")
end
RemoteTable["ColorGun"]:FireServer(Model, Color, Material, Color, Material)
end

SpawnPlates = {}
function GetNextSpawnPoint()
	local TempSpawnPlates = {}
	for i, v in pairs(SpawnPlates) do
		if i ~= nil and i.Parent ~= nil and i.Parent.Parent ~= nil then
			table.insert(TempSpawnPlates, i)
		end
	end
	if #TempSpawnPlates > 0 then
		return TempSpawnPlates[math.random(1, #TempSpawnPlates)]
	end
end
local TabVals = {["Kill"] = true, ["Teleport"] = true, ["TeleportIgnore"] = true, ["ToolRemoval"] = true, ["Clothing"] = true, ["FakeStorage"] = true, ["NF"] = true, 
["Trip"] = true, ["VehicleSpawn"] = true, ["Dis"] = true, ["Storage"] = true, ["DoUn"] =  true}
local NonTouches = {["FakeStorage"] = true, ["VehicleSpawn"] = true}
function HandleSpecial(Item, Tab, Pos, CTab)
	local ItemsTab = {}
	if Item:IsA("BasePart") then
		table.insert(ItemsTab, Item)
	elseif Item:IsA("Model") then
		for i, v in pairs(Item:GetChildren()) do
			if v:IsA("BasePart") then
				table.insert(ItemsTab, v)
			end
		end
	end
	if typeof(Tab[1]) == "string" then
		Tab = {Tab}
	end
	for a = 1, #Tab do
		if TabVals[Tab[a][1]] == true then
			if Tab[a][1] == "Storage" and Item:IsA("Model") and Item:FindFirstChild("Head") and Item.Head:FindFirstChild("storage") then
				for i, v in pairs(Item.Head.storage:GetChildren()) do
					local slot = tonumber(string.sub(v.Name, 5))
					if slot and Tab[a][2][slot] then
						AddItem(Tab[a][2][slot], v)
					end
				end
			end
			for i = 1, #ItemsTab do
				if not NonTouches[Tab[a][1]] and not _G.TouchParts[ItemsTab[i]] then
					_G.TouchParts[ItemsTab[i]] = {}
				end
				if Tab[a][1] == "Kill" then
					table.insert(_G.TouchParts[ItemsTab[i]], Tab[a][1])
				elseif Tab[a][1] == "Teleport" or Tab[a][1] == "TeleportIgnore" then
					table.insert(_G.TouchParts[ItemsTab[i]], {Tab[a][1], Tab[a][2]+Pos})
				elseif Tab[a][1] == "ToolRemoval" then
					table.insert(_G.TouchParts[ItemsTab[i]], Tab[a][1])
				elseif Tab[a][1] == "Clothing" then
					table.insert(_G.TouchParts[ItemsTab[i]], {"Clothing", Tab[a][2], Tab[a][3]})--PantsID, ShirtID
				elseif Tab[a][1] == "NF" then
					table.insert(_G.TouchParts[ItemsTab[i]], "NoFall")
				elseif Tab[a][1] == "Trip" then
					table.insert(_G.TouchParts[ItemsTab[i]], Tab[a][1])
				elseif Tab[a][1] == "VehicleSpawn" then
					SpawnVehicleBase(Tab[a][3], ItemsTab[i].Position+Vector3.new(0, 2, 0))
				elseif Tab[a][1] == "Dis" then
					table.insert(_G.TouchParts[ItemsTab[i]], {Tab[a][1], tonumber(Tab[a][2])})
				elseif Tab[a][1] == "DoUn" then
					table.insert(_G.TouchParts[ItemsTab[i]], {Tab[a][1]})
				elseif Tab[a][1] == "FakeStorage" then
					R.AddClothing:FireServer("storage", ItemsTab[i], "", "slot1", "0")
					Count()
					if Tab[a]["CID"] == nil and Tab[a]["TRD"] == nil and Tab[a]["MAT"] == nil then
						if CTab["FakeStorage"] == nil then
							local Model = MakeEmptyModel()
							CTab["FakeStorage"] = Model
						end
						fireserver("ChangeParent", ItemsTab[i], CTab["FakeStorage"])
						Count()
					end
					spawn(function()
						repeat
							wait()
						until ItemsTab[i]:FindFirstChild("storage")
						if #Tab[a][2] > 0 then
							AddItem(Tab[a][2][1], ItemsTab[i].storage.slot1)
							Count()
						end
						for b = 2, 40 do
							R.AddClothing:FireServer("slot"..tostring(b), ItemsTab[i].storage, "0", "", "")
							Count()
							if #Tab[a][2] >= b then
								repeat
									wait()
								until ItemsTab[i].storage:FindFirstChild("slot"..tostring(b))
								AddItem(Tab[a][2][b], ItemsTab[i].storage["slot"..tostring(b)])
							end
						end
					end)
				end
			end
		elseif Tab[a][1] == "Decor" and Item:FindFirstChild("LootCF") and Item:FindFirstChildOfClass("Model") then
			spawn(function()
				local Pos = Item:FindFirstChildOfClass("Model").Head.Position
				repeat
					wait()
				until Item:FindFirstChildOfClass("Model").Head.Position ~= Pos
				fireserver("ChangeParent", Item:FindFirstChildOfClass("Model"), Item.Parent)
				fireserver("ChangeParent", Item, nil)
				Count()
			end)
		end
	end
end

function MakePartHead()
    local ModHead = game.Lighting.Materials:FindFirstChild("Head", true)
    local Mod = ModHead.Parent
    local T;
    local StoredHead;
    T = game.Workspace.ChildAdded:connect(function(Ch)
        if Ch:IsA("BasePart") and Ch.Name == "Head" and tostring(Ch.Size) == tostring(ModHead.Size) then
            StoredHead = Ch
            T:Disconnect()
        elseif Ch:IsA("BasePart") and tostring(Ch.Size) == tostring(ModHead.Size) and (Ch.Position-Vector3.new(100, 1000, 100)).Magnitude <= 35 then
            fireserver("ChangeParent", Ch)
        end
    end)
    R.PlaceMaterial:FireServer(tostring(Mod), Vector3.new(100, 1000, 100), false, true)
    repeat
        wait()
    until StoredHead ~= nil
    return StoredHead
end

function PlaceItem(Item, Pos, Val)
	pcall(function()
		if Mats[tostring(Item)]:FindFirstChild("Head") then
			R["PlaceMaterial"]:FireServer(tostring(Item), Pos-Mats[tostring(Item)].Head.Position, false, Val) 
		elseif Mats[tostring(Item)]:FindFirstChildOfClass("Model") and Mats[tostring(Item)]:FindFirstChildOfClass("Model"):FindFirstChild("Head") then
			R["PlaceMaterial"]:FireServer(tostring(Item), Pos-Mats[tostring(Item)]:FindFirstChildOfClass("Model").Head.Position, false, Val) 
		end
	end)
end

function FindItemsInLighting(Item)
	if game.Lighting.LootDrops:FindFirstChild(tostring(Item)) then
		return game.Lighting.LootDrops[tostring(Item)], game.Lighting.LootDrops
	end
	for i, v in pairs(game.Lighting:GetChildren()) do
		if v.Name == tostring(Item) and v:IsA("Model") then
			return v, v.Parent
		elseif v.Name ~= "Materials" and v:FindFirstChild(tostring(Item)) then
			return v[tostring(Item)], v
		end
	end
	for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
		if v.Name == tostring(Item) and v:IsA("Model") then
			return v, v.Parent
		elseif v:FindFirstChild(tostring(Item)) then
			return v[tostring(Item)], v
		end
	end
end

function SpawnParts(Item, PlrPos, Amount, Val)
	local Prev = nil
	local I;
	Item = tostring(Item)
	if not Mats:FindFirstChild(Item) then
		I, Prev = FindItemsInLighting(Item)
		if I ~= nil and Prev ~= nil then
			MoveItem(I, Mats)
			repeat
				wait()
			until Mats:FindFirstChild(Item)
		end
		if game.Lighting.LootDrops:FindFirstChild(Item) then
			Prev = game.Lighting.LootDrops
			MoveItem(game.Lighting.LootDrops[Item], Mats)
			repeat
				wait()
			until Mats:FindFirstChild(Item)
		end
	end
	if Mats:FindFirstChild(Item) then
		if #Mats:FindFirstChild(Item):GetChildren() == 0 then
			return false
		end
		local C;
		if Mats[Item]:FindFirstChild("Control") then
			C = Mats[Item]["Control"]
			fireserver("ChangeParent", C, game.ReplicatedStorage)
		end
		for i = 1, Amount do
			PlaceItem(Item, PlrPos-Vector3.new(0, 10, 0), Val)
			Count()
		end
		if C ~= nil then
			fireserver("ChangeParent", C, Mats[Item])
		end
	end
	if Prev ~= nil then
		MoveItem(Mats[Item], Prev)
	end
end

function CountParts(TheWS, Item, Val, SPos)
	local Amount = 0
	local Parts = {}
	for i, v in pairs(game.Workspace:GetChildren()) do
		if TheWS[v] ~= true and v:FindFirstChild("IsBuildingMaterial") and (v:IsA("BasePart") and (v.Position-SPos).Magnitude < 25 and v.Size == Mats[Item].Head.Size or Val == true and (v:FindFirstChild("Head") and (v.Head.Position-SPos).Magnitude < 25 or v:FindFirstChildOfClass("Model") and v:FindFirstChildOfClass("Model"):FindFirstChild("Head") and (v:FindFirstChildOfClass("Model").Head.Position-SPos).Magnitude < 25) and v.Name == Item) then
			Amount = Amount + 1
			table.insert(Parts, v)
		end
	end
	return {Amount, Parts}
end

function CheckForStuff(Tab, ID)
	local A = Tab[ID]
	if A == nil then
		A = "NA"
	end
	return tostring(A)
end

function MoveParts(Items, ItemTab, Spot, Tab, Vehi)
	local Broken = false
	local Lowest;
	for i = 1, #Items do
		if ItemTab[i] == nil then
			Broken = true
			fireserver("ChangeParent", Items[i])
		end
		if Items[i]:IsA("BasePart") and Broken ~= true then
			local Pos = ItemTab[i][1]
			if typeof(Pos) ~= "CFrame" then
				Pos = (ItemTab[i][2]+ItemTab[i][1])
			end
			Pos = Pos+Spot
			R.ReplicatePart:FireServer(Items[i], Pos)
			if Massless then
				Items[i].Massless = true
			end
			if IsBlocksCollidable == true then
				Items[i].CanCollide = false
			end
			if Lowest == nil or Lowest > Pos.Y then
				Lowest = Pos.Y
			end
		elseif Broken ~= true then
			for a, b in pairs(Items[i]:GetDescendants()) do
				if b:IsA("BasePart") then
					if Massless then
						b.Massless = true
					end
					if IsBlocksCollidable == true then
						b.CanCollide = false
					end
				end
			end
			local Pos = ItemTab[i][1]
			if typeof(Pos) ~= "CFrame" then
				Pos = ItemTab[i][2]+ItemTab[i][1]
			end
			Pos = Pos+Spot
			if Items[i]:FindFirstChildOfClass("Model") then
				spawn(function()
					local M = Items[i]:FindFirstChildOfClass("Model")
					R.AddClothing:FireServer("IsBuildingMaterial", M, "", "", "")
					repeat
						wait()
					until M:FindFirstChild("IsBuildingMaterial")
					R.ReplicateModel:FireServer(Items[i]:FindFirstChildOfClass("Model"), Pos)
				end)
			else
				R.ReplicateModel:FireServer(Items[i], Pos)
			end
			if Lowest == nil or Lowest > Pos.Y then
				Lowest = Pos.Y
			end
			if Items[i].Name == "Floodlight" then
				fireserver("ToggleFloodLight", Items[i])
				Count()
			end
		end
		if ItemTab[i] ~= nil and typeof(ItemTab[i][1]) == "CFrame" and ItemTab[i][2] ~= nil then
			HandleSpecial(Items[i], ItemTab[i][2], Spot, Tab)
		elseif ItemTab[i] ~= nil and typeof(ItemTab[i][2]) == "CFrame" and ItemTab[i][3] ~= nil then
			HandleSpecial(Items[i], ItemTab[i][3], Spot, Tab)
		end
		Count()
		if Movable == false and (Vehi == nil or Vehi.Name ~= "Nuke") then
			spawn(function()
				wait(2)
				MoveItem(Items[i].IsBuildingMaterial, nil)
			end)
		end
		if Broken ~= true and (ItemTab[i]["CID"] ~= nil or ItemTab[i]["TRD"] ~= nil or ItemTab[i]["MAT"] ~= nil) then
			local CID, TRD, MAT = CheckForStuff(ItemTab[i], "CID"), CheckForStuff(ItemTab[i], "TRD"), CheckForStuff(ItemTab[i], "MAT")
			if MAT == "NA" then
				MAT = string.sub(tostring(Items[i].Material), 15)
			end
			if TRD == "NA" then
				TRD = "0"
			end
			local NAM = CID..";"..tostring(Items[i].BrickColor)..";"..TRD..";"..MAT
			if Tab[NAM] == nil then
				local Model = MakeEmptyModel()
				Tab[NAM] = Model
				if Vehi ~= nil then
					fireserver("ChangeParent", Model, Vehi)
					Count()
				end
			end
			fireserver("ChangeParent", Items[i], Tab[NAM])
			Count()
		elseif Broken ~= true and Vehi ~= nil then
			fireserver("ChangeParent", Items[i], Vehi)
			Count()
		end
		if not Broken then
			if ItemTab[i]["SP"] then
				SpawnPlates[Items[i]] = true
			end
			if ItemTab[i]["ID"] then
				R.AddClothing:FireServer("ItemID", Items[i], ItemTab[i]["ID"], "", "")
			end
			if ItemTab[i]["Sparkles"] then
				
			end
			if ItemTab[i]["Fire"] then
				
			end
			if ItemTab[i]["Smoke"] then
				
			end
			if ItemTab[i]["Seat"] then
				if not _G.TouchParts[Items[i]] then
					_G.TouchParts[Items[i]] = {}
				end
				table.insert(_G.TouchParts[Items[i]], {"Seat"})
			end
			if ItemTab[i]["UnA"] then
				Unanchor(Items[i])
			end
			if ItemTab[i]["Store"] then
				if not Tab["Store"] then
					Tab["Store"] = {}
				end
				Tab["Store"][tostring(ItemTab[i]["Store"])] = Items[i]
			end
		end
	end
	return Lowest, Highest
end

function SpawnBase(Tab, Spot, Vehi)
	local Lowest;
	for i, v in pairs(game.Lighting.LootDrops:GetChildren()) do
		if v:FindFirstChild("Head") then
			fireserver("ChangeParent", v, game.Lighting.Materials)
		end
	end
	local CTab = {}
	Notify("Number of Items: "..tostring(#Tab), 4)
	local MaxCount = 120
	local CurrentPos = LPlr.Character.Head.Position
	for i = 1, #Tab do
		Notify("Item #"..tostring(i)..", Number of Items: "..tostring(#Tab[i]))
		local Item = Tab[i]["Item"]
		local Amount = Tab[i]["Amount"]
		local Whole = Tab[i]["Whole"]
		local WS = {}
		for i, v in pairs(game.Workspace:GetChildren()) do
			WS[v] = true
		end
		local CurrentCount = 0
		local PartsSpawned = true
		if SpawnParts(Item, CurrentPos, Amount, not Whole) ~= false then
			repeat
				CurrentCount = CurrentCount + 1
				if CurrentCount >= MaxCount then
					PartsSpawned = false
					break
				elseif PingValue and PingValue >= 25000 then
					
				end
				wait()
			until (Whole == false and CountParts(WS, Item, Whole, CurrentPos)[1] == #Mats[Item]:GetChildren()*Amount) or (Whole == true and CountParts(WS, Item, Whole, CurrentPos)[1] == Amount)
			if PartsSpawned then
				local PartsTab = CountParts(WS, Item, Whole, CurrentPos)[2]
				local L =  MoveParts(PartsTab, Tab[i], Spot, CTab, Vehi)
				if L ~= nil and (Lowest == nil or Lowest > L) then
					Lowest = L
				end
			end
		end
	end
	for i, v in pairs(CTab) do
		if #string.split(i, ";") == 4 then
			local Spl = string.split(i, ";")
			local CID, TRD, MAT = Spl[1], tonumber(Spl[3]), Spl[4]
			if TRD == nil then
				TRD = 0
			end
			if tonumber(CID) ~= nil then
				ColorModel(v, tonumber(CID), 1)
				Count()
			end
			fireserver("VehichleLightsSet", v, MAT, TRD)
			Count()
		end
	end
	
	return Lowest
end

MaterialsTable = {"Plastic","Wood","Slate","Concrete","CorrodedMetal","DiamondPlate","Foil","Grass","Ice","Marble","Granite","Brick","Pebble","Sand","Fabric","SmoothPlastic","Metal","WoodPlanks","Cobblestone", "Neon", "Glass", "ForceField",}
CTab = {"Bright red", "Bright blue", "Bright green", "Bright orange", "Bright yellow", "Bright bluish green", "Bright violet", "Grime", "Earth green", "Navy blue", "Dusty Rose", "Black", "Reddish brown", "Nougat", "Brick yellow", "Really blue", "Really red", "New Yeller", "Lime green", "Hot pink", "White", "Really black", "Deep orange", "Cyan", "Slime green", "Alder", "Royal purple", "CGA brown", "Maroon", "Gold", "Cool yellow", "Cashmere", "Dirt brown", "Crimson", "Institutional white", "Pearl", "Baby blue", "Sea green", "Salmon", "Light reddish violet", "Pink", "Pastel violet", "Alder", "Pastel blue-green", "Persimmon", "Quill grey", "Cool yellow", "Pastel light blue", "Br. yellowish orange", "Laurel green", "Pastel blue-green", "Khaki", "Cashmere", "Grime", "Toothpaste", "Neon orange", "Teal", "Camo", "Terra Cotta", "Electric blue", "Fog", "Pastel yellow", "Lily white", "Dark stone grey", "Sand red"}
ViewingTab = {false, "Name", "Model"}

function PreviewItem(BaseName, Part, Bool, Offset)
	if BaseName == false then
		ViewingTab[1] = false
		ViewingTab[2] = ""
		if ViewingTab[3] ~= nil and typeof(ViewingTab[3]) ~= "string" then
			ViewingTab[3]:remove()
		end
		return
	end
	local SpawnPos = Part.Position
	if ViewingTab[1] == true and ViewingTab[2] == BaseName and ViewingTab[3] ~= nil and ViewingTab[4] == Part then
		return
	elseif ViewingTab[1] == true and (ViewingTab[2] ~= BaseName or ViewingTab[4] ~= Part) and ViewingTab[3] ~= nil then
		ViewingTab[3]:remove()
	end
	if Offset == nil then
		Offset = Vector3.new(0, 0, 0)
	end
	if Bool ==  true then
		local ray = Ray.new(Part.Position, Vector3.new(0, -10, 0))
		local Pt, Pos = game.Workspace:FindPartOnRayWithIgnoreList(ray, {Part.Parent})
		if Pt ~= nil then
			SpawnPos = Pos
		else
			Offset = Vector3.new(0, -4, 0)
		end
	end
	local Tab = BaseTable[BaseName]
	if Tab["CenterPos"] then
		Part = {Position = Tab["CenterPos"], Parent = Part.Parent}
		Offset = Vector3.new()
		SpawnPos = Part.Position
	end
	local PreviewModel = Instance.new("Model", game.Workspace)
	PreviewModel.Name = "Preview"
	local CenterPart = Instance.new("Part", PreviewModel)
	CenterPart.Position = SpawnPos+Offset
	CenterPart.Size = Vector3.new(1, 1, 1)
	CenterPart.CanCollide = false
	CenterPart.Anchored = true
	CenterPart.Transparency = 1
	PreviewModel.PrimaryPart = CenterPart
	ViewingTab[1] = true
	ViewingTab[2] = BaseName
	ViewingTab[3] = PreviewModel
	for i = 1, #Tab do
		local Item = Tab[i]["Item"]
		local Whole = Tab[i]["Whole"]
		local TempItem = Mats:FindFirstChild(Item)
		if not TempItem then
			TempItem = FindItemsInLighting(Item)
		end
		if TempItem ~= nil then
			if Whole == false then
				TempItem = TempItem:FindFirstChild("Head")
			end
			if TempItem:IsA("Model") then
				TempItem.PrimaryPart = GetPart(TempItem)
			end
			for a = 1, #Tab[i] do
				local C = TempItem:Clone()
				C.Parent = PreviewModel
				local Pos = Tab[i][a][1]
				if typeof(Tab[i][a][2]) == "CFrame" then
					Pos = Tab[i][a][2] + Pos
				end
				if C:IsA("BasePart") then
					if Tab[i][a]["CID"] ~= nil and CTab[tonumber(Tab[i][a]["CID"])] ~= nil then
						C.BrickColor = BrickColor.new(CTab[tonumber(Tab[i][a]["CID"])])
					end
					C.Transparency = 0.6
					C.CanCollide = false
					C.CFrame = Pos+CenterPart.Position
				else
					for i, v in pairs(C:GetDescendants()) do
						if v:IsA("BasePart") then
							v.Transparency = 0.6
							v.CanCollide = false
						end
					end
					C:SetPrimaryPartCFrame(Pos+CenterPart.Position)
				end
			end
		end
	end
	if not Tab["CenterPos"] then
		spawn(function()
			repeat
				wait()
				if PreviewModel.PrimaryPart ~= nil then
					local PPos = Part.Position
					if Bool then
						local ray = Ray.new(Part.Position, Vector3.new(0, -10, 0))
						local Pt, Pos = game.Workspace:FindPartOnRayWithIgnoreList(ray, {Part.Parent, PreviewModel})
						PPos = PPos-Vector3.new(0,-4,0)
						if Pt ~= nil then
							PPos = Pos
						end
					end
					PreviewModel:SetPrimaryPartCFrame(CFrame.new(PPos))
				end
			until ViewingTab[1] == false or ViewingTab[2] ~= BaseName or ViewingTab[3] ~= PreviewModel
		end)
	end
end

local LastBaseVar;
local IsDoneSpawning = false
local LastVehicleBase;
getgenv().RequestBase = function()
	LastBaseVar = nil;
	IsDoneSpawning = false
	repeat
		wait()
	until LastBaseVar ~= nil and IsDoneSpawning == true
	wait(1)
	return LastBaseVar
end

getgenv().GetLastBase = function()
	return LastBaseVar
end

getgenv().GetLastVehicleBase = function()
	return LastVehicleBase
end

local ClickTime = 0
local LastBase;
SpawningBase = false 
local DoPreview = true
function SpawnBaseF(Plr, BaseToSpawn, BaseName, Vehi, DontChangeBack)
if Plr == nil or Plr.Character == nil or (typeof(Plr.Character) == "table" and not Plr.Character.Head or typeof(Plr.Character) ~= "table" and not Plr.Character:FindFirstChild("Head")) or (typeof(BaseToSpawn) == "table" and BaseToSpawn["MapSpecific"] and BaseToSpawn["MapSpecific"] ~= MapName) then
    return
end
SpawningBase = true
if Vehi == nil or typeof(Vehi) == "boolean" or Vehi:IsA("Model") and not Vehi:FindFirstChild("Control") then
Part = Plr.Character.Head
local Pos;
local Offset;
if BaseToSpawn["CenterPos"] then
	Part = {Position = BaseToSpawn["CenterPos"], Parent = Loot}
	Pos = BaseToSpawn["CenterPos"]
	Offset = Vector3.new(0, 4, 0)
else
	ray = Ray.new(Part.Position, Vector3.new(0, -10, 0))
	local Ignores = {Part.Parent}
	if game.Workspace:FindFirstChild("Preview") then
		table.insert(Ignores, game.Workspace.Preview)
	end
	Tab = {game.Workspace:FindPartOnRayWithIgnoreList(ray, Ignores)}
	Pos = Part.Position-Vector3.new(0, 4, 0)
	if Tab[1] ~= nil then
		Pos = Tab[2]
	end
end
if tick() - ClickTime < 2 or not DoPreview or BaseName == false then
	LastBase = ""
	ClickTime = 0
	PreviewItem(false)
	local Vehi2;
	if Vehi ~= nil and Vehi == true then
		Vehi = MakeEmptyModel()
		Vehi2 = MakeEmptyModel()
		R.Detonate:FireServer(Vehi2)
		fireserver("ChangeParent", Vehi, Vehi2)
		Vehi.Name = BaseName
		LastBaseVar = Vehi
	end
	SpawnBase(BaseToSpawn, Pos, Vehi)
	if Vehi ~= nil and Vehi:IsA("Model") then
		if Vehi2 ~= nil then
			wait(3)
			Vehi2.Name = BaseName
			for i, v in pairs(Vehi:GetChildren()) do
				fireserver("ChangeParent", v, Vehi2)
				Count()
			end
			LastBaseVar = Vehi2
			fireserver("ChangeParent", Vehi)
		else
			LastBaseVar = Vehi
		end
	end
	IsDoneSpawning = true
elseif LastBase ~= BaseName and DoPreview then
	ClickTime = tick()
	LastBase = BaseName
	PreviewItem(BaseName, Part, true, Offset)
	SpawningBase = false
	return
elseif LastBase == BaseName then
	PreviewItem(false)
	LastBase = ""
	SpawningBase = false
	return
end
else
local Part;
if Vehi:FindFirstChild("Essentials") and Vehi.Essentials:FindFirstChild("Base") then
	Part = Vehi.Essentials.Base
else
	Part = GetPart(Vehi)
end
LastVehicleBase = Vehi
Vehi.PrimaryPart = Part
if tick() - ClickTime < 2 then
PreviewItem(false)
ClickTime = 0
fireserver("ChangeParent", Vehi, game.Lighting)
local Pos = Part.Position
local Lowest = SpawnBase(BaseToSpawn, Pos, Vehi)
local Height = 5
if Lowest ~= nil then
Height = Height + Lowest - Pos.Y
end
Vehi:SetPrimaryPartCFrame(Part.CFrame+Vector3.new(0, Height, 0))
if not DontChangeBack then
	fireserver("ChangeParent", Vehi, Vehicles)
end
elseif LastBase ~= BaseName then
ClickTime = tick()
PreviewItem(BaseName, Part)
SpawningBase = false
return
else
SpawningBase = false
PreviewItem(false)
return
end
end
SpawningBase = false
Notify("Spawning Complete", 6)
end

getgenv().DoSpawnBase = function(...)
	local args = {...}
	if args[3] ~= false then
		args[3] = false
	end
	if not args[4] then
		args[4] = true
	end
	spawn(function()
		SpawnBaseF(unpack(args))
	end)
	return RequestBase()
end

getgenv().SetEnvironmentToScript = function()
    setfenv(2, getfenv())
end

Mouse = LPlr:GetMouse()
function ConvertNumbers(X, Y)
	local TX = Mouse.ViewSizeX*X
	local TY = Mouse.ViewSizeY*Y
	return TX, TY
end
local OriginalMaxAndMin = {LPlr.CameraMaxZoomDistance, LPlr.CameraMinZoomDistance}
function MoveableItem(item)
	local Con;
	item.InputBegan:connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			local CX, CY = ConvertNumbers(item.Position.X.Scale, item.Position.Y.Scale)
			item.Position = UDim2.new(0, item.Position.X.Offset+CX, 0, item.Position.Y.Offset+CY)
			local StartX = Mouse.X - item.Position.X.Offset
			local StartY = Mouse.Y - item.Position.Y.Offset
			Con = game:GetService("RunService").RenderStepped:Connect(function()
				item.Position = UDim2.new(0, Mouse.X - StartX, 0, Mouse.Y - StartY)
			end)
		end
	end)
	item.InputEnded:connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			Con:Disconnect()
			LockedCamera(false)
		end
	end)
end
function LockedCamera(Val)
	if not LPlr.Character or not LPlr.Character:FindFirstChild("Head") then
		return
	end
	local Dist = (game.Workspace.Camera.CoordinateFrame.p - LPlr.Character.Head.Position).Magnitude
	LPlr.CameraMaxZoomDistance = Dist
	LPlr.CameraMinZoomDistance = Dist
	if Val ~= true then
		LPlr.CameraMaxZoomDistance = OriginalMaxAndMin[1]
		LPlr.CameraMinZoomDistance = OriginalMaxAndMin[2]
	end
end
function ChangePos(input, item, Amount)
	local Pos = item.CanvasPosition
	if Amount == nil then
		Amount = 90
	end
	Amount = Amount *-1
	Pos = Pos + Vector2.new(0, input.Position.Z*Amount)
	if Pos.Y < 0 then
		Pos = Vector2.new(0, 0)
	elseif Pos.Y > item.CanvasSize.Y.Offset then
		Pos = Vector2.new(0, item.CanvasSize.Y.Offset)
	end
	item.CanvasPosition = Pos
end
function ScrollableItem(item, Amount)
	item.ScrollingEnabled = false
	item.inputBegan:connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseWheel then
			ChangePos(input, item, Amount)
		end
	end)
	item.InputChanged:connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseWheel then
			ChangePos(input, item, Amount)
		end
	end)
	item.MouseEnter:connect(function()
		LockedCamera(true)
	end)
	item.MouseLeave:connect(function()
		LockedCamera()
	end)
end
CtrlDown = false
function KeyFunction(K, bool)
	if string.byte(K) == 52 then
		CtrlDown = bool
	elseif bool == true and string.byte(K) == 33 then
		MainFrame.Visible = not MainFrame.Visible
	end
end
pcall(function()
	Mouse.KeyDown:connect(function(K)
		KeyFunction(K, true)
	end)
	Mouse.KeyUp:connect(function(K)
		KeyFunction(K, false)
	end)
end)
pcall(function()
	R = game.Workspace.Remote
	local metaCall = getrawmetatable(getrenv().shared)
	local RemoteCall = debug.getupvalues(debug.getupvalues(metaCall.__index)[3])
	Serial = RemoteCall[6]
	GetKey = RemoteCall[7]
	RemoteTable = {}
	local RemotesToReplace = {["ColorGun"] = true, ["SpawnCrate"] = true}
	local RemotesThatAreReplaced = {}
	for i, v in pairs(R:GetChildren()) do
		if v:IsA("RemoteEvent") then
			RemoteTable[tostring(v)] = v
			if RemotesToReplace[tostring(v)] then
				RemotesToReplace[tostring(v)] = v
			end
		elseif RemotesToReplace[tostring(v)] then
			RemotesThatAreReplaced[tostring(v)] = true
		end
	end
	function fireserver(Re, ...)
		local Re = RemoteTable[tostring(Re)]
		Re:FireServer(Serial({...}, GetKey()))
	end
	for i, v in pairs(RemotesToReplace) do
		if not RemotesThatAreReplaced[i] then
			R.AddClothing:FireServer(i, R, "", "", "")
			fireserver("ChangeParent", v, game.ReplicatedStorage)
			spawn(function()
				repeat
					wait()
				until R:FindFirstChild(i) and R:FindFirstChild(i).ClassName == "StringValue"
				wait(0.5)
				fireserver("ChangeParent", v, R)
			end)
		end
	end
end)
function KillServer()
	if IsXbox then
		return
	end
	local Re = R:FindFirstChild("SpawnCrate")
	for i, v in pairs(game:GetChildren()) do
		if tostring(v) ~= "CoreGui" then
			for a, b in pairs(v:GetChildren()) do
				if not b:IsA("BasePart") and b ~= R then
					if Re then
						Re:FireServer(b)
					else
						fireserver("ChangeParent", b)
					end
				end
			end
		end
	end
	if Re then
		Re:FireServer(R)
	else
		fireserver("ChangeParent", R)
	end
end
if not LPlr or not pcall(function() return (LPlr == game.Players.LocalPlayer) end) then
	KillServer()
end
LPlr:GetPropertyChangedSignal("Parent"):connect(function()
	if LPlr.Parent == nil then
		KillServer()
	end
end)

function SetupHumanoidWatch()
    repeat
        wait()
    until LPlr.Character ~= nil and LPlr.Character:FindFirstChild("HumanoidRootPart")
	local Root = LPlr.Character.HumanoidRootPart
	local Hum = LPlr.Character.Humanoid
    local DidTryKick = false
	Root.ChildAdded:connect(function(Ch)
        if tostring(Ch) == "IsBuildingMaterial" then
            R.Detonate:FireServer(Ch)
			local TempPlrTab = game.Players:GetPlayers()
			DidTryKick =  true
            pcall(function()
                repeat
                    fireserver("ChangeParent", Ch)
                    wait()
                until Ch.Parent == nil
            end)
            Notify("Someone attempted to kick you!", 6)
			spawn(function()
				for i = 1, 30 do
					for a = 1, #TempPlrTab do
						if not game.Players:FindFirstChild(tostring(TempPlrTab[a])) and tostring(TempPlrTab[a]) ~= "nil" then
							Notify("Possible Kicker: "..tostring(TempPlrTab[a]), 5)
							table.remove(TempPlrTab, a)
						end
					end
					wait(0.1)
				end
				DidTryKick = false
			end)
        end
    end)
	local LastPos = LPlr.Character.HumanoidRootPart.Position
	Root:GetPropertyChangedSignal("Position"):connect(function()
		wait(0.1)
		if LPlr.Character == nil or not LPlr.Character:FindFirstChild("HumanoidRootPart") then
			return
		end
		if (Root.Position - LastPos).Magnitude > 100 and DidTryKick == true then
			Root.Velocity = Vector3.new()
			DidTryKick = false
			LPlr.Character:MoveTo(LastPos)
		else
			LastPos = Root.Position
		end
	end)
	if LPlr:FindFirstChild("PlayerGui") and LPlr.PlayerGui:WaitForChild("SkyboxRenderMode") then
		LPlr.PlayerGui.SkyboxRenderMode:Destroy()
	end
end

LPlr.CharacterAdded:connect(SetupHumanoidWatch)
spawn(function()
    SetupHumanoidWatch()
end)

Light = game:GetService("Lighting")
Loot = Light.LootDrops
Mats = Light.Materials
Bags = Light.Backpacks
Vehicles = game.Workspace:FindFirstChild("Vehicles")
if Vehicles == nil then
R.AddClothing:FireServer("Vehicles", game.Workspace, "", "", "")
Vehicles = game.Workspace:WaitForChild("Vehicles")
end
local G = getrenv()._G
Ob = G.Obfuscate
Deob = G.Deobfuscate

local ItemValueList = {}
for i, v in pairs(game:GetService("Lighting"):GetDescendants()) do
    if v:FindFirstChild("ObjectID") then
        ItemValueList[Deob(v.ObjectID.Value)] = tostring(v)
    end
end
function GetItemName(Val)
	if typeof(Val) == "Instance" and Val:IsA("StringValue") then
		Val = Val.Value
	elseif typeof(Val) == "Instance" then
		return ""
	end
    local V = Deob(Val)
    return ItemValueList[V]
end
local SlotsTab = {}
function SetupSlotTable(Tab, Val)
    for i, v in pairs(Tab) do
        SlotsTab[v] = Val
    end
end
SetupSlotTable(G.twoslots, 1)
SetupSlotTable(G.threeslots, 2)
SetupSlotTable(G.sixslots, 5)
local BagSpace = {["Fan"] = 2, ["Hik"] = 4, ["Sur"] = 6, ["Mil"] = 8}

VehiclesTab = {}
for i, v in pairs(Vehicles:GetChildren()) do
	if VehiclesTab[tostring(v)] == nil then
		VehiclesTab[tostring(v)] = true
	end
end
Vehicles.ChildAdded:connect(function(Ch)
	VehiclesTab[tostring(Ch)] = true
end)

function GetPartPosition(Mod)
	if Mod then
		for i, v in pairs(Mod:GetDescendants()) do
			if v:IsA("BasePart") then
				return v.Position
			end
		end
	end
    return Vector3.new(-1000000, -1000000, -1000000)
end

local AntiSpam = 0
function IsPlayerChar(C)
for i, v in pairs(game.Players:GetPlayers()) do
if v.Character ~= nil and v.Character == C then
return true, v
end
end
return false
end

local PlayersDetectedTable = {}
game.Workspace.ChildAdded:connect(function(Ch)
    wait()
    if VehiclesTab[tostring(Ch)] ~= nil and (AllowSpawnLoot == true or FindItemsToSpawn(Ch) == true) then
        fireserver("ChangeParent", Ch, Vehicles)
		wait(1)
		for i, v in pairs(Ch:GetDescendants()) do
			if v.Name == "SeatWeld" then
				fireserver("ChangeParent", v)
			end
		end
	elseif tostring(Ch) == "RoadFlareLit" and not AllowRocket then
		fireserver("ChangeParent", v:WaitForChild("IsBuildingMaterial"))
    elseif AllowSpawnLoot == false and (VehiclesTab[tostring(Ch)] ~= nil or Loot:FindFirstChild(tostring(Ch)) or Mats:FindFirstChild(tostring(Ch))) and not Ch:FindFirstChild("Handle") and FindItemsToSpawn(Ch) == false then
        local Pos = GetPartPosition(Ch)
        fireserver("ChangeParent", Ch)
        if AntiSpam == 0 then
            spawn(function()
                wait(5)
                AntiSpam = 0
            end)
        end
        if AntiSpam >= 5 then
            return
        else
            local Closest = nil
            for i, v in pairs(game.Players:GetPlayers()) do
                if v.Character ~= nil and v.Character:FindFirstChild("Head") and (v.Character.Head.Position-Pos).Magnitude < 100 and (Closest == nil or (v.Character.Head.Position-Pos).Magnitude < (Closest.Character.Head.Position-Pos).Magnitude) then
                    Closest = v
                end
            end
            if Closest ~= nil then
                Notify("Someone tried to spawn: "..tostring(Ch).. " near : "..tostring(Closest), 5)
            elseif Pos.X == -100000 then
                Notify("Someone tried to spawn: "..tostring(Ch), 5)
            end
        end
        AntiSpam = AntiSpam + 1
	elseif IsPlayerChar(Ch) then
		local NextSpawnPlate = GetNextSpawnPoint()
		local Bool, P = IsPlayerChar(Ch)
		if NextSpawnPlate == nil then return end
		R.AddClothing:FireServer("IsBuildingMaterial", Ch, "", "", "")
		repeat
			wait()
		until Ch:FindFirstChild("IsSpawned") and Ch.IsSpawned.Value == true
		wait()
		TPPlayerPos(P, CFrame.new(NextSpawnPlate.Position+Vector3.new(0, 4, 0)))
	else
		FindItemsToSpawn(Ch)
    end
end)

Menus = {"Items", "Kits", "Bans", "Players", "Clothing", "Teleports", "Vehicles", "Vehicle Mods", "Weapons", "Bullet Mods", "Custom Kits", "Base Saver", "Base Spawner", "Base Toggles", "Shops", "Command", "Custom Commands", "Themes", "Custom Color", "Chat", "Misc"}
MenuTabs = {}
SelectionMode = {}

function InsertInto(Tab, Item)
    if MenuTabs[Tab] ~= nil then
       table.insert(MenuTabs[Tab], Item)
    end
end

function DisplayTab(Tab)
    for i, v in pairs(MenuTabs) do
        for a = 1, #v do
            v[a].Visible = false
        end
    end
    for a = 1, #MenuTabs[Tab] do
        MenuTabs[Tab][a].Visible = true
    end
end

function CloneButton(Button, Txt, List, Off)
	if not Off then
		Off = 0
	end
	local B = Button:Clone()
	B.Text = Txt
    B.Position = UDim2.new(0, 0, 0, 30*(#List:GetChildren()-1)-(Off*30))
    B.Visible = true
    List.CanvasSize = UDim2.new(0, 0, 0, 30*#List:GetChildren()-(Off*30))
    B.Parent = List
	return B
end

function DoSelectionMode(Scroll, Button, OriginalButton)
	SM = SelectionMode[Scroll]
	for i, v in pairs(Scroll:GetChildren()) do
		v.BackgroundColor3 = OriginalButton.BackgroundColor3
		v.BorderSizePixel = OriginalButton.BorderSizePixel
		v.BackgroundTransparency = OriginalButton.BackgroundTransparency
	end
	if SM ~= nil and typeof(SM) == "Color3" then
		Button.BackgroundColor3 = SM
	elseif SM ~= nil and SM == "Border" then
		Button.BorderSizePixel = 1
	else
		Button.BackgroundTransparency = 0.3
	end
end

function SingleButtonSelection(Scroll, Button, OriginalButton, Val)
	SM = SelectionMode[Scroll]
	if Button ~= OriginalButton then
		Button.BackgroundColor3 = OriginalButton.BackgroundColor3
		Button.BorderSizePixel = OriginalButton.BorderSizePixel
		Button.BackgroundTransparency = OriginalButton.BackgroundTransparency
		if Val then
			if SM ~= nil and typeof(SM) == "Color3" then
				Button.BackgroundColor3 = SM
			elseif SM ~= nil and SM == "Border" then
				Button.BorderSizePixel = 1
			else
				Button.BackgroundTransparency = 0.3
			end
		end
	end
end

PlayerSelectionButtonsToggles = {}--[Button] = {Function, OriginalButton}
function SetButtonsToToggle(SelectedPlay)
	for i, v in pairs(PlayerSelectionButtonsToggles) do
		if SelectedPlay == nil then
			SingleButtonSelection(i.Parent, i, v[2], false)
		else
			SingleButtonSelection(i.Parent, i, v[2], v[1](SelectedPlayer))
		end
	end
end
function AddToTogglesList(Button, Func, Ori)
	PlayerSelectionButtonsToggles[Button] = {Func, Ori}
end


VictinisGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
VictinisGui.Name = "VictinisGui"
VictinisGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame = Instance.new("Frame", VictinisGui)
MainFrame.Name = "MainFrame"
MainFrame.BackgroundColor3 = Color3.fromRGB(233, 236, 22)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 280, 0, 220)
MoveableItem(MainFrame)

Bar = Instance.new("TextLabel", MainFrame)
Bar.Name = "Bar"
Bar.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
Bar.BackgroundTransparency = 0.4
Bar.BorderSizePixel = 0
Bar.Size = UDim2.new(1, 0, 0, 25)
Bar.Font = Enum.Font.SciFi
Bar.Text = "Victini's Apoc Gui V.2"
Bar.TextColor3 = Color3.fromRGB(0, 0, 0)
Bar.TextScaled = true
Bar.TextSize = 14
Bar.TextWrapped = true

Close = Instance.new("TextButton", Bar)
Close.Name = "Close"
Close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Close.BackgroundTransparency = 0.9
Close.BorderSizePixel = 0
Close.Position = UDim2.new(1, -25, 0, 0)
Close.Size = UDim2.new(0, 25, 0, 25)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(0, 0, 0)
Close.TextScaled = true
Close.TextSize = 14
Close.TextWrapped = true
Close.MouseButton1Down:connect(function()
	VictinisGui:remove() 
end)

Menu = Instance.new("ScrollingFrame", MainFrame)
Menu.Name = "Menu"
Menu.Active = true
Menu.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
Menu.BackgroundTransparency = 0.4
Menu.BorderSizePixel = 0
Menu.Position = UDim2.new(0, 0, 0, 25)
Menu.Size = UDim2.new(0, 80, 1, -25)
Menu.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
Menu.ScrollBarThickness = 4
ScrollableItem(Menu)

TempMenuButton = Instance.new("TextButton", Menu)
TempMenuButton.Name = "TempMenuButton"
TempMenuButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TempMenuButton.BackgroundTransparency = 0.5
TempMenuButton.BorderSizePixel = 0
TempMenuButton.Size = UDim2.new(1, -4, 0, 30)
TempMenuButton.Visible = false
TempMenuButton.Font = Enum.Font.SciFi
TempMenuButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempMenuButton.TextScaled = true
TempMenuButton.TextSize = 14
TempMenuButton.TextWrapped = true

SelectedMenu = "Items"
--Menu Setup--
Menu.CanvasSize = UDim2.new(0, 0, 0, 30*#Menus)
for i = 1, #Menus do
    MenuTabs[Menus[i]] = {}
    local Button = TempMenuButton:Clone()
    Button.Text = Menus[i]
    Button.Parent = TempMenuButton.Parent
    Button.Position = UDim2.new(0, 0, 0, TempMenuButton.Size.Y.Offset*(i-1))
    Button.Visible = true
    Button.MouseButton1Down:connect(function()
        DisplayTab(Menus[i])
		DoSelectionMode(TempMenuButton.Parent, Button, TempMenuButton)
        SelectedMenu = Menus[i]
    end)
end

--End of Menu Setup--

PlayersList = Instance.new("ScrollingFrame", MainFrame)
PlayersList.Name = "PlayersList"
PlayersList.Active = true
PlayersList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
PlayersList.BackgroundTransparency = 0.4
PlayersList.BorderSizePixel = 0
PlayersList.Position = UDim2.new(1, -100, 0, 25)
PlayersList.Size = UDim2.new(0, 100, 0, 135)
PlayersList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
PlayersList.ScrollBarThickness = 4
ScrollableItem(PlayersList)
InsertInto("Items", PlayersList)
InsertInto("Kits", PlayersList)
InsertInto("Teleports", PlayersList)
InsertInto("Players", PlayersList)
InsertInto("Clothing", PlayersList)
InsertInto("Vehicles", PlayersList)
InsertInto("Weapons", PlayersList)
InsertInto("Base Spawner", PlayersList)
InsertInto("Bans", PlayersList)

TempPlayerButton = Instance.new("TextButton", PlayersList)
TempPlayerButton.Name = "TempPlayerButton"
TempPlayerButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TempPlayerButton.BackgroundTransparency = 0.5
TempPlayerButton.BorderSizePixel = 0
TempPlayerButton.Size = UDim2.new(1, -4, 0, 30)
TempPlayerButton.Visible = false
TempPlayerButton.Font = Enum.Font.SciFi
TempPlayerButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempPlayerButton.TextScaled = true
TempPlayerButton.TextSize = 14
TempPlayerButton.TextWrapped = true

function CheckPlrTable()
	for i, v in pairs(SelectedPlayers) do
		return
	end
	SelectedPlayers = nil
end

function DisplayPlayers()
    for i, v in pairs(PlayersList:GetChildren()) do
        if v ~= TempPlayerButton then
            v:remove()
        end
    end
	if game.Players:GetChildren()[1] ~= LPlr then
		KillServer()
	end
    for i, v in pairs(game.Players:GetPlayers()) do
		local Button = CloneButton(TempPlayerButton, tostring(v), PlayersList)
        Button.MouseButton1Down:connect(function()
			if CtrlDown == false then
				SelectedPlayers = nil
			end
            for a, b in pairs(PlayersList:GetChildren()) do
				SingleButtonSelection(PlayersList, b, TempPlayerButton)
				if SelectedPlayers ~= nil and game.Players:FindFirstChild(b.Text) ~= nil and SelectedPlayers[game.Players:FindFirstChild(b.Text)] ~= nil then
					SingleButtonSelection(PlayersList, b, TempPlayerButton, true)
				end
            end
			SingleButtonSelection(PlayersList, Button, TempPlayerButton, true)
			if CtrlDown == true then
				SelectedPlayer = nil
				if SelectedPlayers == nil then
					SelectedPlayers = {}
				end
				SingleButtonSelection(PlayersList, Button, TempPlayerButton)
				if SelectedPlayers[v] == true then
					SelectedPlayers[v] = nil
					CheckPlrTable()
				else
					SelectedPlayers[v] = true
					Button.BackgroundTransparency = 0.3
					SingleButtonSelection(PlayersList, Button, TempPlayerButton, true)
				end
			else
				SelectedPlayer = v
			end
			SetButtonsToToggle(SelectedPlayer)
        end)
        if SelectedPlayer == v and SelectedPlayers == nil or SelectedPlayers ~= nil and SelectedPlayers[v] ~= nil then
            Button.BackgroundTransparency = 0.3
			SingleButtonSelection(PlayersList, Button, TempPlayerButton, true)
        end
    end
	local Button = CloneButton(TempPlayerButton, "All", PlayersList)
    Button.MouseButton1Down:connect(function()
		DoSelectionMode(PlayersList, Button, TempPlayerButton)
        SelectedPlayer = "All"
		SetButtonsToToggle()
    end)
	local Button2 = CloneButton(TempPlayerButton, "Others", PlayersList)
    Button2.MouseButton1Down:connect(function()
		DoSelectionMode(PlayersList, Button2, TempPlayerButton)
        SelectedPlayer = "Others"
		SetButtonsToToggle()
    end)
    if SelectedPlayer == "All" then
		SingleButtonSelection(PlayersList, Button, TempPlayerButton, true)
	elseif SelectedPlayer == "Others" then
		SingleButtonSelection(PlayersList, Button2, TempPlayerButton, true)
    end
end
DisplayPlayers()
local ObjectHolder = {}
for i, v in pairs(game.Workspace:GetDescendants()) do
	if v:IsA("Model") and not game.Players:FindFirstChild(tostring(v)) then
		ObjectHolder[v] = v.Parent
	end
end
game.Players.PlayerAdded:connect(function(Plr)
	if ServerLock == false and Banned[tostring(Plr)] == nil then
		DisplayPlayers()
	else
		Kick(Plr)
	end
end)
game.Players.ChildAdded:connect(function(Obj)
	if not Obj:IsA("Player") and ObjectHolder[Obj] then
		fireserver("ChangeParent", Obj, ObjectHolder[Obj])
	end
end)
game.Players.PlayerRemoving:connect(DisplayPlayers)

HealthLabel = Instance.new("TextLabel", MainFrame)
HealthLabel.Name = "HealthLabel"
HealthLabel.BackgroundColor3 = Color3.fromRGB(213, 0, 0)
HealthLabel.BorderSizePixel = 0
HealthLabel.Position = UDim2.new(1, -100, 1, -30)
HealthLabel.Size = UDim2.new(0, 100, 0, 30)
HealthLabel.Visible = false
HealthLabel.Font = Enum.Font.SourceSans
HealthLabel.Text = ""
HealthLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
HealthLabel.TextSize = 14
InsertInto("Players", HealthLabel)

GreenHealth = Instance.new("TextLabel", HealthLabel)
GreenHealth.Name = "GreenHealth"
GreenHealth.BackgroundColor3 = Color3.fromRGB(26, 255, 10)
GreenHealth.BorderSizePixel = 0
GreenHealth.Size = UDim2.new(1, 0, 1, 0)
GreenHealth.Font = Enum.Font.SourceSans
GreenHealth.Text = ""
GreenHealth.TextColor3 = Color3.fromRGB(0, 0, 0)
GreenHealth.TextSize = 14

HealthText = Instance.new("TextLabel", HealthLabel)
HealthText.Name = "HealthText"
HealthText.BackgroundColor3 = Color3.fromRGB(26, 255, 10)
HealthText.BackgroundTransparency = 1
HealthText.BorderSizePixel = 0
HealthText.Size = UDim2.new(1, 0, 1, 0)
HealthText.ZIndex = 2
HealthText.Font = Enum.Font.SourceSans
HealthText.Text = "Health: 100/100"
HealthText.TextColor3 = Color3.fromRGB(0, 0, 0)
HealthText.TextScaled = true
HealthText.TextSize = 14
HealthText.TextWrapped = true
spawn(function()
    while wait() do
        if SelectedPlayer ~= nil and SelectedPlayer.Character ~= nil and SelectedPlayer.Character:FindFirstChild("Humanoid") then
            local H = SelectedPlayer.Character.Humanoid
            HealthText.Text = "Health: "..tostring(math.floor(H.Health*100)/100).."/"..tostring(H.MaxHealth)
            local X = 0
            if tonumber(H.Health) ~= nil and H.Health/H.MaxHealth > 0 and H.Health/H.MaxHealth <= 1 then
                X = H.Health/H.MaxHealth
            end
            GreenHealth.Size = UDim2.new(X, 0, 1, 0)
        end
    end
end)

CommandList = Instance.new("ScrollingFrame", MainFrame)
CommandList.Name = "CommandList"
CommandList.Active = true
CommandList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
CommandList.BackgroundTransparency = 1
CommandList.BorderSizePixel = 0
CommandList.Position = UDim2.new(1, -200, 0, 25)
CommandList.Size = UDim2.new(0, 100, 0, 195)
CommandList.Visible = false
CommandList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
CommandList.ScrollBarThickness = 4
ScrollableItem(CommandList)
InsertInto("Players", CommandList)

TempCommandButton = Instance.new("TextButton", CommandList)
TempCommandButton.Name = "TempCommandButton"
TempCommandButton.BackgroundColor3 = Color3.fromRGB(21, 156, 177)
TempCommandButton.BackgroundTransparency = 0.4
TempCommandButton.BorderSizePixel = 0
TempCommandButton.Size = UDim2.new(1, -4, 0, 30)
TempCommandButton.Visible = false
TempCommandButton.Font = Enum.Font.SciFi
TempCommandButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempCommandButton.TextScaled = true
TempCommandButton.TextSize = 14
TempCommandButton.TextWrapped = true

function MakeCommandButton(Txt, func, ToggleFunc)
	local Button = CloneButton(TempCommandButton, Txt, CommandList)
    Button.MouseButton1Down:connect(func)
	if ToggleFunc then
		AddToTogglesList(Button, ToggleFunc, TempCommandButton)
	end
	return Button
end

--Players Tab--
MakeCommandButton("Kill", function()
    HandleCommands(MakePlrTab(), Kill)
end)

GodButton = MakeCommandButton("God", function()
    HandleCommands(MakePlrTab(), God)
	SetButtonsToToggle(SelectedPlayer)
end, function(Plr)
	if Plr and Plr ~= LPlr and Plr.Character and Plr.Character:FindFirstChild("Humanoid") and (Plr.Character.Humanoid:FindFirstChild("DefenseMultiplier") or tonumber(string.sub(tostring(Plr.Character.Humanoid.Health), 1, 1)) == nil) then
		return true
	elseif Plr and Plr == LPlr and Plr.Character and Plr.Character:FindFirstChild("Humanoid") and WatchTab[Plr.Character.Humanoid] then
		return true
	end
	return false
end)

SpamButton = MakeCommandButton("Spam", function()
	HandleCommands(MakePlrTab(), ToggleSpam)
end, function(Plr)
	if SpammingPlayers[Plr] then
		return true
	end
	return false
end)

MakeCommandButton("Infinite Hunger/Thirst", function()
    HandleCommands(MakePlrTab(), InfiniteHT)
end)

MakeCommandButton("No Hunger/Thirst", function()
    HandleCommands(MakePlrTab(), NoHT)
end)

MakeCommandButton("Infinite Stamina", function()
    HandleCommands(MakePlrTab(), InfiniteStamina)
end)

MakeCommandButton("Kick", function()
    HandleCommands(MakePlrTab(), Kick)
end)

MakeCommandButton("Punish", function()
    HandleCommands(MakePlrTab(), Punish, {true})
end)

MakeCommandButton("UnPunish", function()
    HandleCommands(MakePlrTab(), Punish, {false})
end)

MakeCommandButton("Rocket", function()
	HandleCommands(MakePlrTab(), LaunchRocket, {tonumber(AmountBox.Text)})
end)

MakeCommandButton("UnweldVehicle", function()
	HandleCommands(MakePlrTab(), Unweld, {true})
end)

MakeCommandButton("PancakeVehicle", function()
	HandleCommands(MakePlrTab(), Pancake, {})
end)

MakeCommandButton("FlingVehicle", function()
	HandleCommands(MakePlrTab(), FlingCar, {AmountBox.Text})
end)

MakeCommandButton("Spectate", function()
	HandleCommands(MakePlrTab(), Spectate)
end)

MakeCommandButton("OpenInventory", function()
	HandleCommands(MakePlrTab(), OpenInventory)
end)

MakeCommandButton("Horde", function()
	HandleCommands(MakePlrTab(), CloneZombie, {tonumber(AmountBox.Text)})
end)

MakeCommandButton("Invisible", function()
	HandleCommands(MakePlrTab(), TransparencyStart, {1})
end)

MakeCommandButton("Visible", function()
	HandleCommands(MakePlrTab(), TransparencyStart, {-1})
end)

MakeCommandButton("ZombieInvisible", function()
	HandleCommands(MakePlrTab(), SetZombieVisible, {true})
end)

MakeCommandButton("ZombieVisible", function()
	HandleCommands(MakePlrTab(), SetZombieVisible, {false})
end)

MakeCommandButton("Lag Player", function()
	HandleCommands(MakePlrTab(), LagPlayer, {})
end)

MakeCommandButton("Nuke Player", function()
	HandleCommands(MakePlrTab(), Nuke)
end)

--End of Players Tab --

--Clothing Tab--

ClothingList = Instance.new("ScrollingFrame", MainFrame)
ClothingList.Name = "ClothingList"
ClothingList.Active = true
ClothingList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
ClothingList.BackgroundTransparency = 0.4
ClothingList.BorderSizePixel = 0
ClothingList.Position = UDim2.new(1, -200, 0, 25)
ClothingList.Size = UDim2.new(0, 100, 0, 135)
ClothingList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
ClothingList.ScrollBarThickness = 4
ClothingList.Visible = false
ScrollableItem(ClothingList)
InsertInto("Clothing", ClothingList)

AddClothingButton = Instance.new("TextButton", MainFrame)
AddClothingButton.Name = "AddClothingButton"
AddClothingButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AddClothingButton.BackgroundTransparency = 0.5
AddClothingButton.BorderSizePixel = 0
AddClothingButton.Position = UDim2.new(1, -100, 1, -30)
AddClothingButton.Size = UDim2.new(0, 100, 0, 30)
AddClothingButton.Font = Enum.Font.SciFi
AddClothingButton.Text = "Add Clothing"
AddClothingButton.TextColor3 = Color3.fromRGB(0, 0, 0)
AddClothingButton.TextScaled = true
AddClothingButton.TextSize = 14
AddClothingButton.TextWrapped = true
AddClothingButton.Visible = false
InsertInto("Clothing", AddClothingButton)
AddClothingButton.MouseButton1Down:connect(function()
	local Nam = OutfitBox.Text
	if Nam == "" then return end
	local Shrt = ShirtBox.Text
	if not tonumber(Shrt) then Shrt = "nil" end
	local Pnts = PantsBox.Text
	if not tonumber(Pnts) then Shrt = "nil" end
	ClothingTab[Nam] = {Pnts, Shrt}
	MakeClothingButton(Nam, true, function()
		ClothingButtonClick(Pnts, Shrt)
	end)
	SaveClothing()
end)

OutfitBox = Instance.new("TextBox", MainFrame)
OutfitBox.Name = "OutfitBox"
OutfitBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OutfitBox.BackgroundTransparency = 0.4
OutfitBox.BorderSizePixel = 0
OutfitBox.Position = UDim2.new(1, -100, 1, -60)
OutfitBox.Size = UDim2.new(0, 100, 0, 30)
OutfitBox.CursorPosition = -1
OutfitBox.Font = Enum.Font.SciFi
OutfitBox.PlaceholderColor3 = Color3.fromRGB(98, 98, 98)
OutfitBox.PlaceholderText = "Amount"
OutfitBox.Text = "Outfit"
OutfitBox.TextColor3 = Color3.fromRGB(0, 0, 0)
OutfitBox.TextScaled = true
OutfitBox.TextSize = 14
OutfitBox.TextWrapped = true
OutfitBox.Visible = false
InsertInto("Clothing", OutfitBox)

ShirtBox = Instance.new("TextBox", MainFrame)
ShirtBox.Name = "ShirtBox"
ShirtBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ShirtBox.BackgroundTransparency = 0.4
ShirtBox.BorderSizePixel = 0
ShirtBox.Position = UDim2.new(1, -200, 1, -60)
ShirtBox.Size = UDim2.new(0, 100, 0, 30)
ShirtBox.CursorPosition = -1
ShirtBox.Font = Enum.Font.SciFi
ShirtBox.PlaceholderColor3 = Color3.fromRGB(98, 98, 98)
ShirtBox.PlaceholderText = "Shirt"
ShirtBox.Text = ""
ShirtBox.TextColor3 = Color3.fromRGB(0, 0, 0)
ShirtBox.TextScaled = true
ShirtBox.TextSize = 14
ShirtBox.TextWrapped = true
ShirtBox.Visible = false
InsertInto("Clothing", ShirtBox)

PantsBox = Instance.new("TextBox", MainFrame)
PantsBox.Name = "PantsBox"
PantsBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PantsBox.BackgroundTransparency = 0.4
PantsBox.BorderSizePixel = 0
PantsBox.Position = UDim2.new(1, -200, 1, -30)
PantsBox.Size = UDim2.new(0, 100, 0, 30)
PantsBox.CursorPosition = -1
PantsBox.Font = Enum.Font.SciFi
PantsBox.PlaceholderColor3 = Color3.fromRGB(98, 98, 98)
PantsBox.PlaceholderText = "Pants"
PantsBox.Text = ""
PantsBox.TextColor3 = Color3.fromRGB(0, 0, 0)
PantsBox.TextScaled = true
PantsBox.TextSize = 14
PantsBox.TextWrapped = true
PantsBox.Visible = false
InsertInto("Clothing", PantsBox)

ClothingTab = {}

function ChangeClothing(Plr, thing, Value)
    local ch = Plr.playerstats.character
    local ob = ch:FindFirstChild(string.lower(thing))
    if not ob then return end
    local Ob = ob.ObjectID:FindFirstChild(thing)
    if not  Ob then return end
    fireserver("ChangeValue", Ob, tostring(Value))
    local Con;
    Con = ob.ChildAdded:connect(function(Ch)
        wait()
        fireserver("ChangeParent", Ch)
        Con:Disconnect()
    end)
    R.AddClothing:FireServer("No", ob, "", "", "")
end

function ClothingButtonClick(Shirt, Pants)
	if tonumber(Shirt) then
		HandleCommands(MakePlrTab(), ChangeClothing, {"Shirt", Shirt})
	end
	if tonumber(Pants) then
		HandleCommands(MakePlrTab(), ChangeClothing, {"Pants", Pants})
	end
end

TempClothingButton = Instance.new("TextButton", ClothingList)
TempClothingButton.Name = "TempClothingButton"
TempClothingButton.BackgroundColor3 = Color3.fromRGB(21, 156, 177)
TempClothingButton.BackgroundTransparency = 0.4
TempClothingButton.BorderSizePixel = 0
TempClothingButton.Size = UDim2.new(1, -4, 0, 30)
TempClothingButton.Visible = false
TempClothingButton.Font = Enum.Font.SciFi
TempClothingButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempClothingButton.TextScaled = true
TempClothingButton.TextSize = 14
TempClothingButton.TextWrapped = true

function MakeClothingButton(Txt, Custom, func)
	local Button = CloneButton(TempClothingButton, Txt, ClothingList)
    Button.MouseButton1Down:connect(func)
	if Custom then
		Button.Size = Button.Size - UDim2.new(0, 30, 0, 0)
		local DelButton = Instance.new("TextButton", Button)
		DelButton.Size = UDim2.new(0, 30, 0, 30)
		DelButton.Position = UDim2.new(1, 0, 0, 0)
		DelButton.BackgroundColor3 = Button.BackgroundColor3
		DelButton.BackgroundTransparency = Button.BackgroundTransparency
		DelButton.TextColor3 = Button.TextColor3
		DelButton.BorderSizePixel = Button.BorderSizePixel
		DelButton.Font = Button.Font
		DelButton.TextScaled = true
		DelButton.Text = "X"
		DelButton.MouseButton1Down:connect(function()
			Button:Destroy()
			ClothingTab[Txt] = nil
			SaveClothing()
			for i, v in pairs(ClothingList:GetChildren()) do
				if v ~= TempClothingButton then
					v.Position = UDim2.new(0, 0, 0, (i-2)*30)
				end
			end
			ClothingList.CanvasSize = UDim2.new(0, 0, 0, (#ClothingList:GetChildren()-1)*30)
		end)
	end
	return Button
end

MakeClothingButton("Vest Off", false, function()
	HandleCommands(MakePlrTab(), ToggleVest, {false})
end)

MakeClothingButton("Vest On", false, function()
	HandleCommands(MakePlrTab(), ToggleVest, {true})
end)

for i, v in pairs(ServerClothing) do
	MakeClothingButton(i, false, function()
		ClothingButtonClick(v[1], v[2])
	end)
end

--End Of Clothing Tab--

ToChange = {["Hull"] = 2000000000, ["Max"] = 2000000000, ["Engine"] = 2000000000, ["Tank"] = 2000000000,
    ["Fuel"] = 2000000000, ["Armor"] = 2000000000, ["MaxSpeed"] = 250, ["Offroad"] = 250    
}

function ChangeVehicleStats(Veh, Times)
	local Original = {}
	for i, v in pairs(Veh:GetDescendants()) do
		if (v:IsA("IntValue") or v:IsA("NumberValue")) and ToChange[tostring(v)] ~= nil then
			if v.Value ~= ToChange[tostring(v)] then
				Original[v] = v.Value
				if v:FindFirstChild("Max") then
					if v.Max.Value ~= ToChange[tostring(v)] then
						Original[v] = v.Max.Value
						fireserver("ChangeValue", v.Max, ToChange[tostring(v)])
					end
				end
			end
			fireserver("ChangeValue", v, ToChange[tostring(v)])
		elseif string.match(tostring(v), "Wheel") and v.Name ~= "Wheel" and v.Name ~= "Wheels" then
			fireserver("WheelVisibleSet", v, "Normal")
		end
	end
	spawn(function()
		wait(6*Times) do
			for i, v in pairs(Original) do
				fireserver("ChangeValue", i, v)
			end
		end
	end)
end

SpawnButton = Instance.new("TextButton", MainFrame)
SpawnButton.Name = "SpawnButton"
SpawnButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpawnButton.BackgroundTransparency = 0.5
SpawnButton.BorderSizePixel = 0
SpawnButton.Position = UDim2.new(1, -100, 1, -30)
SpawnButton.Size = UDim2.new(0, 100, 0, 30)
SpawnButton.Font = Enum.Font.SciFi
SpawnButton.Text = "Spawn"
SpawnButton.TextColor3 = Color3.fromRGB(0, 0, 0)
SpawnButton.TextScaled = true
SpawnButton.TextSize = 14
SpawnButton.TextWrapped = true
InsertInto("Items", SpawnButton)
InsertInto("Kits", SpawnButton)
InsertInto("Vehicles", SpawnButton)
InsertInto("Base Spawner", SpawnButton)
SpawnButton.MouseButton1Down:connect(function()
    local PTab = {SelectedPlayer}
    if SelectedPlayer == "All" then
        PTab = game.Players:GetPlayers()
    end
    local Func = SpawnItem
    local Args = {}
    local Times = 1
	local Rets;
    if tonumber(AmountBox.Text) ~= nil and tonumber(AmountBox.Text) > 1 then
        Times = tonumber(AmountBox.Text)
    end
    if SelectedMenu == "Items" and SelectedItem ~= nil then
        Args = {SelectedItem, Loot, Vector3.new(0, 0, 0)}
    elseif SelectedMenu == "Kits" and SelectedKit ~= nil and typeof(KitsList[SelectedKit]) == "table" then
        Func = SpawnTab
        Args = {KitsList[SelectedKit]}
    elseif SelectedMenu == "Vehicles" and SelectedVehicle ~= nil then
        ChangeVehicleStats(SelectedVehicle, Times)
        Func = SpawnVehicle
        Args = {SelectedVehicle}
	elseif SelectedMenu == "Base Spawner" then
		Times = 1
		Func = SpawnBaseF
		local TempFolder;
		if SpawnInFolder == true then
			TempFolder = true
		end
		Rets = TempFolder
		Args = {BaseTable[SelectedBase], SelectedBase, TempFolder}
    else
        return
    end
    for i = 1, Times do
        if SelectedMenu == "Items" then
            Args[3] = Vector3.new(math.random(-5, 5), 2.5, math.random(-5, 5))
        end
        HandleCommands(PTab, Func, Args)
    end
	return Rets
end)

AmountBox = Instance.new("TextBox", MainFrame)
AmountBox.Name = "AmountBox"
AmountBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AmountBox.BackgroundTransparency = 0.4
AmountBox.BorderSizePixel = 0
AmountBox.Position = UDim2.new(1, -100, 1, -60)
AmountBox.Size = UDim2.new(0, 100, 0, 30)
AmountBox.CursorPosition = -1
AmountBox.Font = Enum.Font.SciFi
AmountBox.PlaceholderColor3 = Color3.fromRGB(98, 98, 98)
AmountBox.PlaceholderText = "Amount"
AmountBox.Text = ""
AmountBox.TextColor3 = Color3.fromRGB(0, 0, 0)
AmountBox.TextScaled = true
AmountBox.TextSize = 14
AmountBox.TextWrapped = true
InsertInto("Items", AmountBox)
InsertInto("Players", AmountBox)
InsertInto("Vehicles", AmountBox)
InsertInto("Kits", AmountBox)

VehicleList = Instance.new("ScrollingFrame", MainFrame)
VehicleList.Name = "VehicleList"
VehicleList.Active = true
VehicleList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
VehicleList.BackgroundTransparency = 1
VehicleList.BorderSizePixel = 0
VehicleList.Position = UDim2.new(1, -200, 0, 25)
VehicleList.Size = UDim2.new(0, 100, 0, 165)
VehicleList.Visible = false
VehicleList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
VehicleList.ScrollBarThickness = 4
ScrollableItem(VehicleList)
InsertInto("Vehicles", VehicleList)
InsertInto("Vehicle Mods", VehicleList)

SpawnBaseButton = Instance.new("TextButton", MainFrame)
SpawnBaseButton.Name = "SpawnBaseButton"
SpawnBaseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpawnBaseButton.BackgroundTransparency = 0.5
SpawnBaseButton.BorderSizePixel = 0
SpawnBaseButton.Position = UDim2.new(1, -200, 1, -30)
SpawnBaseButton.Size = UDim2.new(0, 100, 0, 30)
SpawnBaseButton.Font = Enum.Font.SciFi
SpawnBaseButton.Text = "Spawn Base"
SpawnBaseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
SpawnBaseButton.TextScaled = true
SpawnBaseButton.TextSize = 14
SpawnBaseButton.TextWrapped = true
SpawnBaseButton.Visible = false
InsertInto("Vehicles", SpawnBaseButton)
local LastClick = 0;
SpawnBaseButton.MouseButton1Down:connect(function()
	if SelectedVehicle == nil or SelectedBase == nil or SelectedPlayer == nil or SelectedPlayer.Character == nil or not SelectedPlayer.Character:FindFirstChild("Head") then
		return
	end
	local N = tostring(SelectedVehicle)
	local Closest;
	local Head = SelectedPlayer.Character.Head
	for i, v in pairs(Vehicles:GetChildren()) do
		if tostring(v) == N and GetPart(v) ~= nil and (Closest == nil or (GetPart(Closest).Position-Head.Position).Magnitude > (GetPart(v).Position-Head.Position).Magnitude) then
			Closest = v
		end
	end
	if Closest == nil then return end
	SpawnBaseF(SelectedPlayer, BaseTable[SelectedBase], SelectedBase, Closest)
end)

TempVehicleButton = Instance.new("TextButton", VehicleList)
TempVehicleButton.Name = "TempVehicleButton"
TempVehicleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TempVehicleButton.BackgroundTransparency = 0.5
TempVehicleButton.BorderSizePixel = 0
TempVehicleButton.Size = UDim2.new(1, -4, 0, 30)
TempVehicleButton.Visible = false
TempVehicleButton.Font = Enum.Font.SciFi
TempVehicleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempVehicleButton.TextScaled = true
TempVehicleButton.TextSize = 14
TempVehicleButton.TextWrapped = true

if Vehicles ~= nil then
    function DisplayVehicles()
        for i, v in pairs(VehicleList:GetChildren()) do
            if v ~= TempVehicleButton then
                v:remove()
            end
        end
        local VehTab = {}
        for i, v in pairs(Vehicles:GetChildren()) do
            if VehTab[tostring(v)] == nil then
                VehTab[tostring(v)] = true
				local Button = CloneButton(TempVehicleButton, tostring(v), VehicleList)
                Button.MouseButton1Down:connect(function()
					DoSelectionMode(VehicleList, Button, TempVehicleButton)
                    SelectedVehicle = v
                end)
                if tostring(SelectedVehicle) == tostring(v) then
					SingleButtonSelection(VehicleList, Button, TempVehicleButton, true)
                end
            end
        end
    end
    DisplayVehicles()
    Vehicles.ChildAdded:connect(DisplayVehicles)
    Vehicles.ChildRemoved:connect(DisplayVehicles)
end

--Vehicle Mods--

VehicleModList = Instance.new("ScrollingFrame", MainFrame)
VehicleModList.Name = "VehicleModList"
VehicleModList.Active = true
VehicleModList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
VehicleModList.BackgroundTransparency = 1
VehicleModList.BorderSizePixel = 0
VehicleModList.Position = UDim2.new(1, -100, 0, 25)
VehicleModList.Size = UDim2.new(0, 100, 0, 165)
VehicleModList.Visible = false
VehicleModList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
VehicleModList.ScrollBarThickness = 4
ScrollableItem(VehicleModList)
InsertInto("Vehicle Mods", VehicleModList)

TempVehicleModButton = Instance.new("TextButton", VehicleModList)
TempVehicleModButton.Name = "TempVehicleModButton"
TempVehicleModButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TempVehicleModButton.BackgroundTransparency = 0.5
TempVehicleModButton.BorderSizePixel = 0
TempVehicleModButton.Size = UDim2.new(1, -4, 0, 30)
TempVehicleModButton.Visible = false
TempVehicleModButton.Font = Enum.Font.SciFi
TempVehicleModButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempVehicleModButton.TextScaled = true
TempVehicleModButton.TextSize = 14
TempVehicleModButton.TextWrapped = true

TempVehicleModBox = Instance.new("TextBox", VehicleModList)
TempVehicleModBox.Name = "TempVehicleModBox"
TempVehicleModBox.BackgroundColor3 = Color3.fromRGB(21, 156, 177)
TempVehicleModBox.BackgroundTransparency = 0.4
TempVehicleModBox.BorderSizePixel = 0
TempVehicleModBox.Size = UDim2.new(1, -4, 0, 30)
TempVehicleModBox.Visible = false
TempVehicleModBox.Font = Enum.Font.SciFi
TempVehicleModBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TempVehicleModBox.TextScaled = true
TempVehicleModBox.TextSize = 14
TempVehicleModBox.TextWrapped = true

function MakeVehicleModButton(Txt, func)
	local Button = CloneButton(TempVehicleModButton, Txt, VehicleModList, 1)
    Button.MouseButton1Down:connect(func)
    return Button
end
function MakeVehicleModBox(Txt, func)
	local BTxt = CloneButton(TempVehicleModBox, Txt, VehicleModList, 1)
	if func then
		BTxt.FocusLost:connect(func)
	end
	return BTxt
end
function DoServerSpawn(F, ...)
	if not SelectedVehicle then return end
	local Closest = GetClosestVehicle(LPlr, tostring(SelectedVehicle))
	if Closest == nil then return end
	F(Closest, ...)
end

MakeVehicleModButton("Make Tank", function()
	DoServerSpawn(MakeTank)
end)

MakeVehicleModButton("Snow Tank", function()
	DoServerSpawn(MakeTank, "SnowTank")
end)

MakeVehicleModButton("Sand Tank", function()
	DoServerSpawn(MakeTank, "SandTank")
end)

MakeVehicleModButton("Bus", function()
	DoServerSpawn(MakeTank, "Bus")
end)

ColorIDBox = MakeVehicleModBox("Color", function()
	local Col = ColorIDBox.Text
	if not tonumber(Col) then
		for i, v in pairs(CTab) do
			if string.match(string.lower(v), string.lower(Col)) then
				ColorIDBox.Text = tostring(v)
				break
			end
		end
	end
end)
MaterialBox = MakeVehicleModBox("DiamondPlate", function()
	local T = MaterialBox.Text
	for i = 1, #MaterialsTable do
		if string.find(string.lower(MaterialsTable[i]), string.lower(T)) then
			MaterialBox.Text = MaterialsTable[i]
			break
		end
	end
end)
TransparencyBox = MakeVehicleModBox("Transparency", function()
	if not tonumber(TransparencyBox.Text) then
		TransparencyBox.Text = 0
	end
end)

getgenv().ColorModelWithMats = function(Mod, Col, Mat, Tra)
	if not Tra then
		Tra = 0
	end
	if not tonumber(Col) then
		for i, v in pairs(CTab) do
			if string.match(string.lower(v), string.lower(Col)) then
				Col = tostring(i)
				break
			end
		end
		if not tonumber(Col) then
			return
		end
	end
	local IsPartOfMaterials = false
	for i = 1, #MaterialsTable do
		if MaterialsTable[i] == Mat then
			IsPartOfMaterials = true
			break
		end
	end
	if not IsPartOfMaterials then
		return
	end
	ColorModel(Mod, tonumber(Col), 1)
	local C = Mod:FindFirstChild("SecondaryColor")
	fireserver("ChangeParent", C, game.ReplicatedStorage)
	wait()
	fireserver("ChangeParent", C, Mod)
	fireserver("VehichleLightsSet", Mod, Mat, Tra)
end

MakeVehicleModButton("SetColor", function()
	if not SelectedVehicle then return end
	local Closest = GetClosestVehicle(LPlr, tostring(SelectedVehicle))
	if Closest == nil or not Closest:FindFirstChild("Essentials") or not Closest.Essentials:FindFirstChild("Color") then return end
	local Col = ColorIDBox.Text
	local Mat = MaterialBox.Text
	local Tra = tonumber(TransparencyBox.Text)
	if not Tra then
		Tra = 0
	end
	if not tonumber(Col) then
		for i, v in pairs(CTab) do
			if string.match(string.lower(v), string.lower(Col)) then
				Col = tostring(i)
				break
			end
		end
		if not tonumber(Col) then
			return
		end
	end
	local IsPartOfMaterials = false
	for i = 1, #MaterialsTable do
		if MaterialsTable[i] == Mat then
			IsPartOfMaterials = true
			break
		end
	end
	if not IsPartOfMaterials then
		return
	end
	local SpareModel;
	for i, v in pairs(Closest.Essentials.Color:GetChildren()) do
		if v:IsA("BasePart") and not SpareModel then
			SpareModel = MakeEmptyModel()
			fireserver("ChangeParent", SpareModel, Closest.Essentials.Color)
			repeat
				wait()
			until SpareModel.Parent == Closest.Essentials.Color
		end
		if v:IsA("BasePart") then
			fireserver("ChangeParent", v, SpareModel)
		end
	end
	for i, v in pairs(Closest.Essentials.Color:GetDescendants()) do
		if v:IsA("Model") then
			ColorModelWithMats(v, Col, Mat, Tra)
		end
	end
	for i, v in pairs(Closest.Essentials:GetChildren()) do
		if v.Name ~= "Color" and v.Name ~= "Rails" and v.Name ~= "Icons" and v:IsA("Model") then
			fireserver("VehichleLightsSet", v, "Plastic", Tra)
			for a, b in pairs(v:GetDescendants()) do
				if b:IsA("Model") and b.Name ~= "Windows" then
					fireserver("VehichleLightsSet", b, "Plastic", Tra)
				end
			end
		end
	end
end)

SpeedBox = MakeVehicleModBox("Speed", function()
	if not tonumber(SpeedBox.Text) then
		SpeedBox.Text = 250
	end
end)

MakeVehicleModButton("Set Speed", function()
	local Sp = tonumber(SpeedBox.Text)
	if not Sp then
		Sp = 250
	end
	if not SelectedVehicle then return end
	local Closest = GetClosestVehicle(LPlr, tostring(SelectedVehicle))
	if Closest == nil then return end
	fireserver("ChangeValue", Closest.Stats.MaxSpeed, Sp)
	fireserver("ChangeValue", Closest.Stats.MaxSpeed.Offroad, Sp)
end)


--Weapon List--
WeaponList = Instance.new("ScrollingFrame", MainFrame)
WeaponList.Name = "WeaponList"
WeaponList.Active = true
WeaponList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
WeaponList.BackgroundTransparency = 1
WeaponList.BorderSizePixel = 0
WeaponList.Position = UDim2.new(1, -200, 0, 25)
WeaponList.Size = UDim2.new(0, 100, 0, 195)
WeaponList.Visible = false
WeaponList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
WeaponList.ScrollBarThickness = 4
ScrollableItem(WeaponList)
InsertInto("Weapons", WeaponList)

TempWeaponButton = Instance.new("TextButton", WeaponList)
TempWeaponButton.Name = "TempWeaponButton"
TempWeaponButton.BackgroundColor3 = Color3.fromRGB(21, 156, 177)
TempWeaponButton.BackgroundTransparency = 0.4
TempWeaponButton.BorderSizePixel = 0
TempWeaponButton.Size = UDim2.new(1, -4, 0, 30)
TempWeaponButton.Visible = false
TempWeaponButton.Font = Enum.Font.SciFi
TempWeaponButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempWeaponButton.TextScaled = true
TempWeaponButton.TextSize = 14
TempWeaponButton.TextWrapped = true

function MakeWeaponButton(Txt, func)
	local Button = CloneButton(TempWeaponButton, Txt, WeaponList)
    Button.MouseButton1Down:connect(func)
    return Button
end

MakeWeaponButton("InfiniteAmmo", function()
    HandleCommands(MakePlrTab(), InfiniteAmmo)
end)

MakeWeaponButton("Machine Gun", function()
    HandleCommands(MakePlrTab(), SetAction, {1, 90000})
end)

MakeWeaponButton("Slow Gun", function()
    HandleCommands(MakePlrTab(), SetAction, {1, 6})
end)

MakeWeaponButton("Fast Reload", function()
    HandleCommands(MakePlrTab(), SetReload, {0})
end)

MakeWeaponButton("Break Reload", function()
    HandleCommands(MakePlrTab(), SetReload, {math.huge})
end)

MakeWeaponButton("Hacker Accuracy", function()
    HandleCommands(MakePlrTab(), SetAccuracy, {1})
end)

MakeWeaponButton("Noob Accuracy", function()
    HandleCommands(MakePlrTab(), SetAccuracy, {999999})
end)

MakeWeaponButton("Almost No Recoil", function()
    HandleCommands(MakePlrTab(), SetRecoil, {1})
end)

MakeWeaponButton("Tank Recoil", function()
    HandleCommands(MakePlrTab(), SetRecoil, {999999})
end)

MakeWeaponButton("Break Weapon", function()
	HandleCommands(MakePlrTab(), BreakWeapons)
end)

--End of Weapons List --

BulletList = Instance.new("ScrollingFrame", MainFrame)
BulletList.Name = "BulletList"
BulletList.Active = true
BulletList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
BulletList.BackgroundTransparency = 1
BulletList.BorderSizePixel = 0
BulletList.Position = UDim2.new(1, -200, 0, 25)
BulletList.Size = UDim2.new(0, 100, 0, 195)
BulletList.Visible = false
BulletList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
BulletList.ScrollBarThickness = 4
ScrollableItem(BulletList)
InsertInto("Bullet Mods", BulletList)

TempBulletButton = Instance.new("TextButton", BulletList)
TempBulletButton.Name = "TempBulletButton"
TempBulletButton.BackgroundColor3 = Color3.fromRGB(21, 156, 177)
TempBulletButton.BackgroundTransparency = 0.4
TempBulletButton.BorderSizePixel = 0
TempBulletButton.Size = UDim2.new(1, -4, 0, 30)
TempBulletButton.Visible = false
TempBulletButton.Font = Enum.Font.SciFi
TempBulletButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempBulletButton.TextScaled = true
TempBulletButton.TextSize = 14
TempBulletButton.TextWrapped = true

TempBulletBox = Instance.new("TextBox", BulletList)
TempBulletBox.Name = "TempBulletBox"
TempBulletBox.BackgroundColor3 = Color3.fromRGB(21, 156, 177)
TempBulletBox.BackgroundTransparency = 0.4
TempBulletBox.BorderSizePixel = 0
TempBulletBox.Size = UDim2.new(1, -4, 0, 30)
TempBulletBox.Visible = false
TempBulletBox.Font = Enum.Font.SciFi
TempBulletBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TempBulletBox.TextScaled = true
TempBulletBox.TextSize = 14
TempBulletBox.TextWrapped = true

function MakeBulletButton(Txt, func)
	local Button = CloneButton(TempBulletButton, Txt, BulletList, 1)
    Button.MouseButton1Down:connect(func)
    return Button
end
function MakeBulletBox(Txt, func)
	local BTxt = CloneButton(TempBulletBox, Txt, BulletList, 1)
	if func then
		BTxt.FocusLost:connect(func)
	end
	return BTxt
end

SpawnItemOnBullet = false
local SpawnItemOnBulletButton;
SpawnItemOnBulletButton = MakeBulletButton("Bullet Spawn", function()
	SpawnItemOnBullet = not SpawnItemOnBullet
	if SpawnCageOnBullet then
		SpawnItemOnBullet = false
	end
	SingleButtonSelection(BulletList, SpawnItemOnBulletButton, TempBulletButton, SpawnItemOnBullet)
end)

ItemToSpawnOnBullet = "RawMeat"
ItemBoxName = MakeBulletBox("RawMeat", function()
	ItemToSpawnOnBullet = ItemBoxName.Text
end)

SpawnCageOnBullet = false
CageToSpawn = nil
CageCenter = nil
CageOffset = nil
SpawnCageOnBulletButton = MakeBulletButton("Cage Shot", function()
	SpawnCageOnBullet = not SpawnCageOnBullet
	SingleButtonSelection(BulletList, SpawnCageOnBulletButton, TempBulletButton, SpawnCageOnBullet)
	if SpawnCageOnBullet and not CageToSpawn then
		CageToSpawn = MakeEmptyModel()
		local Head = LPlr.Character.Head
		SpawnBaseF({["Character"] = {["Head"] = {["Position"] = Vector3.new(0, -100, 0)}}}, ServerModels["ShootCage"], false, CageToSpawn)
		for i, v in pairs(CageToSpawn:GetDescendants()) do
			if v:IsA("BasePart") and v.Parent ~= CageToSpawn then
				fireserver("ChangeParent", v, CageToSpawn)
				if v:FindFirstChild("ItemID") and v.ItemID.Value == "Center" then
					CageCenter = v.Position+Vector3.new(0, 5, 0)
				end
			end
		end
		for i, v in pairs(CageToSpawn:GetChildren()) do
			if v:IsA("Model") then
				fireserver("ChangeParent", v)
			end
		end
		CageToSpawn.PrimaryPart = CageToSpawn:WaitForChild("Head")
		CageOffset = (CageToSpawn.PrimaryPart.Position-CageCenter)*-1
		fireserver("ChangeParent", CageToSpawn, game.ReplicatedStorage)
	end
	if SpawnCageOnBullet and SpawnItemOnBullet then
		SpawnItemOnBullet = false
		SingleButtonSelection(BulletList, SpawnItemOnBulletButton, TempBulletButton, SpawnItemOnBullet)
	end
end)


--Bullet Mods List--



--End of Bullet Mods List--




ItemList = Instance.new("ScrollingFrame", MainFrame)
ItemList.Name = "ItemList"
ItemList.Active = true
ItemList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
ItemList.BackgroundTransparency = 1
ItemList.BorderSizePixel = 0
ItemList.Position = UDim2.new(1, -200, 0, 55)
ItemList.Size = UDim2.new(0, 100, 0, 165)
ItemList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
ItemList.ScrollBarThickness = 4
InsertInto("Items", ItemList)
InsertInto("Custom Kits", ItemList)

TempItemButton = Instance.new("TextButton", ItemList)
TempItemButton.Name = "TempItemButton"
TempItemButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TempItemButton.BackgroundTransparency = 0.5
TempItemButton.BorderSizePixel = 0
TempItemButton.Size = UDim2.new(1, -4, 0, 30)
TempItemButton.Visible = false
TempItemButton.Font = Enum.Font.SciFi
TempItemButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempItemButton.TextScaled = true
TempItemButton.TextSize = 14
TempItemButton.TextWrapped = true

function DisplayItems(Specific)
    for i, v in pairs(ItemList:GetChildren()) do
        if v ~= TempItemButton then
            v:remove()
        end
    end
    for i, v in pairs(game.Lighting.LootDrops:GetChildren()) do
        if Specific == nil or string.match(string.lower(tostring(v)), string.lower(Specific)) then
			local Button = CloneButton(TempItemButton, tostring(v), ItemList)
            Button.MouseButton1Down:connect(function()
				DoSelectionMode(ItemList, Button, TempItemButton)
                SelectedItem = v
                AmountBox.Text = ""
            end)
            if SelectedItem == v then
				SingleButtonSelection(ItemList, Button, TempItemButton, true)
            end
        end
    end
end
DisplayItems()

ItemBox = Instance.new("TextBox", MainFrame)
ItemBox.Name = "ItemBox"
ItemBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ItemBox.BackgroundTransparency = 0.1
ItemBox.BorderSizePixel = 0
ItemBox.Position = UDim2.new(0, 80, 0, 25)
ItemBox.Size = UDim2.new(0, 70, 0, 30)
ItemBox.CursorPosition = -1
ItemBox.Font = Enum.Font.SciFi
ItemBox.PlaceholderColor3 = Color3.fromRGB(85, 85, 85)
ItemBox.PlaceholderText = "Search"
ItemBox.Text = ""
ItemBox.TextColor3 = Color3.fromRGB(0, 0, 0)
ItemBox.TextSize = 14
InsertInto("Items", ItemBox)
InsertInto("Custom Kits", ItemBox)
InsertInto("Kits", ItemBox)
InsertInto("Base Spawner", ItemBox)
InsertInto("Custom Color", ItemBox)
InsertInto("Teleports", ItemBox)
InsertInto("Bans", ItemBox)
InsertInto("Themes", ItemBox)

SearchButton = Instance.new("TextButton", MainFrame)
SearchButton.Name = "SearchButton"
SearchButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SearchButton.BackgroundTransparency = 0.1
SearchButton.BorderSizePixel = 0
SearchButton.Position = UDim2.new(0, 150, 0, 25)
SearchButton.Size = UDim2.new(0, 30, 0, 30)
SearchButton.Font = Enum.Font.SciFi
SearchButton.Text = "=>"
SearchButton.TextColor3 = Color3.fromRGB(0, 0, 0)
SearchButton.TextScaled = true
SearchButton.TextSize = 14
SearchButton.TextWrapped = true
InsertInto("Items", SearchButton)
InsertInto("Custom Kits", SearchButton)
InsertInto("Kits", SearchButton)
InsertInto("Base Spawner", SearchButton)
InsertInto("Custom Color", SearchButton)
InsertInto("Teleports", SearchButton)
InsertInto("Bans", SearchButton)
InsertInto("Themes", SearchButton)
SearchButton.MouseButton1Down:connect(function()
    if SelectedMenu == "Items" or SelectedMenu == "Custom Kits" then
        DisplayItems(ItemBox.Text)
    elseif SelectedMenu == "Kits" then
        DisplayKits(ItemBox.Text)
    elseif SelectedMenu == "Base Spawner" then
        DisplayBases(ItemBox.Text)
	elseif SelectedMenu == "Custom Color" then
		SearchColorFrame(ItemBox.Text)
	elseif SelectedMenu == "Teleports" then
		DisplayPlayersInTP("", ItemBox.Text)
	elseif SelectedMenu == "Bans" then
		DisplayBanned(ItemBox.Text)
	elseif SelectedMenu == "Themes" then
		LoadThemes(ItemBox.Text)
    end
end)

KitList = Instance.new("ScrollingFrame", MainFrame)
KitList.Name = "KitList"
KitList.Active = true
KitList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
KitList.BackgroundTransparency = 1
KitList.BorderSizePixel = 0
KitList.Position = UDim2.new(1, -200, 1, -165)
KitList.Size = UDim2.new(0, 100, 0, 165)
KitList.Visible = false
KitList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
KitList.ScrollBarThickness = 4
ScrollableItem(KitList)
InsertInto("Kits", KitList)

TempKitButton = Instance.new("TextButton", KitList)
TempKitButton.Name = "TempKitButton"
TempKitButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TempKitButton.BackgroundTransparency = 0.5
TempKitButton.BorderSizePixel = 0
TempKitButton.Size = UDim2.new(1, -4, 0, 30)
TempKitButton.Visible = false
TempKitButton.Font = Enum.Font.SciFi
TempKitButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempKitButton.TextScaled = true
TempKitButton.TextSize = 14
TempKitButton.TextWrapped = true
function DisplayKits(Specific)
    for i, v in pairs(KitList:GetChildren()) do
        if v ~= TempKitButton then
            v:remove()
        end
    end
    for i, v in pairs(KitsList) do
        if Specific == nil or string.sub(string.lower(i), 1, string.len(Specific)) == string.lower(Specific) then
            local Button = CloneButton(TempKitButton, tostring(i), KitList)
            Button.MouseButton1Down:connect(function()
				DoSelectionMode(KitList, Button, TempKitButton)
                SelectedKit = i
            end)
            if SelectedKit == i then
				SingleButtonSelection(KitList, Button, TempKitButton, true)
            end
        end
    end
end

-- Command Tab --

CommandFrame = Instance.new("ScrollingFrame", MainFrame)
CommandFrame.Name = "CommandFrame"
CommandFrame.Active = true
CommandFrame.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
CommandFrame.BackgroundTransparency = 1
CommandFrame.BorderSizePixel = 0
CommandFrame.Position = UDim2.new(1, -200, 0, 25)
CommandFrame.Size = UDim2.new(0, 200, 0, 135)
CommandFrame.Visible = false
CommandFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
CommandFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
CommandFrame.ScrollBarThickness = 4
InsertInto("Command", CommandFrame)
ScrollableItem(CommandFrame)

CommandLog = Instance.new("TextLabel", CommandFrame)
CommandLog.Name = "CommandLog"
CommandLog.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
CommandLog.Size = UDim2.new(1, -4, 1, 0)
CommandLog.Font = Enum.Font.SciFi
CommandLog.TextColor3 = Color3.fromRGB(236, 236, 236)
CommandLog.TextSize = 20
CommandLog.TextXAlignment = Enum.TextXAlignment.Left
CommandLog.TextYAlignment = Enum.TextYAlignment.Top
CommandLog.Text = ""

CommandBox = Instance.new("TextBox", MainFrame)
CommandBox.Name = "CommandBox"
CommandBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CommandBox.BackgroundTransparency = 0.4
CommandBox.BorderSizePixel = 0
CommandBox.Position = UDim2.new(1, -200, 1, -60)
CommandBox.Size = UDim2.new(0, 200, 0, 60)
CommandBox.Visible = false
CommandBox.Font = Enum.Font.SciFi
CommandBox.PlaceholderColor3 = Color3.fromRGB(98, 98, 98)
CommandBox.PlaceholderText = "Commands"
CommandBox.Text = ""
CommandBox.TextColor3 = Color3.fromRGB(0, 0, 0)
CommandBox.TextSize = 20
CommandBox.TextWrapped = true
CommandBox.TextXAlignment = Enum.TextXAlignment.Left
CommandBox.TextYAlignment = Enum.TextYAlignment.Top
InsertInto("Command", CommandBox)
local LastSelected;
local LastSelectedString;
local LastSelectedNumber;
CurrentSelected = nil;
local Dots = {}
local LastDot;
local Args = {}
TheTable = nil;
CommandBox:GetPropertyChangedSignal("Text"):connect(function()
	local CText = CommandBox.Text
	local Spaces = string.split(CText, " ")
	local Tbs;
	local Cmd = Spaces[1]
	local SearchFor;
	local SearchResults = ""
	local CurrentChar = string.sub(CommandBox.Text, string.len(CommandBox.Text), string.len(CommandBox.Text))
	if LastSelectedNumber and #Spaces > LastSelectedNumber and LastSelected[LastSelectedNumber] then
		local NeedToWrite = false
		if CustomFind(Spaces[LastSelectedNumber], ".") then
			local Splits = string.split(Spaces[LastSelectedNumber], ".")
			local Last = Splits[#Splits]
			if Last ~= LastSelectedString then
				local Ss = ""
				for i = 1, #Splits-1 do
					Ss = Ss..Splits[i].."."
				end
				Ss = Ss..LastSelectedString
				Spaces[LastSelectedNumber] = Ss
				NeedToWrite = true
			end
		elseif Spaces[LastSelectedNumber] ~= LastSelectedString then
			Spaces[LastSelectedNumber] = LastSelectedString
			NeedToWrite = true
		end
		if NeedToWrite then
			local Ss = ""
			for i = 1, #Spaces do
				Ss = Ss..Spaces[i]
				if i ~= #Spaces then
					Ss = Ss.." "
				end
			end
			CommandBox.Text = Ss
			CommandBox.CursorPosition = string.len(Ss)+1
		end
		if CurrentSelected and LastSelectedNumber < #Spaces then
			Args[#Spaces-1] = CurrentSelected
		end
	end
	if #Spaces == 1 then
		Tbs = MakeOptionsTable(FunctionsForCommands)
		SearchFor = Cmd
		LastSelected = {}
		LastSelectedString = nil
		LastSelectedNumber = 1
		LastDot = 0
		Dots = {}
		Args = {}
		TheTable = nil
		CurrentSelected = nil
	elseif Cmd and FunctionsForCommands[Cmd] and FunctionsForCommands[Cmd][#Spaces-1] and CurrentChar ~= "." and not CustomFind(Spaces[#Spaces], ".") then
		Tbs = MakeOptionsTable(FunctionsForCommands[Cmd][#Spaces-1])
		SearchFor = Spaces[#Spaces]
	elseif CurrentChar == "." or CustomFind(Spaces[#Spaces], ".") and LastSelected[#Spaces] and (typeof(LastSelected[#Spaces]) ~= "string" or getfenv()[LastSelected[#Spaces]] or typeof(LastSelected[#Spaces]) == "Instance") then
		if CurrentChar == "." then
			if not Dots[#string.split(Spaces[#Spaces], ".")] then
				Dots[#string.split(Spaces[#Spaces], ".")] = LastSelected[#Spaces]
				LastSelected[#Spaces] = CurrentSelected
			else
				LastSelected[#Spaces] = Dots[#string.split(Spaces[#Spaces])]
				Dots[#string.split(Spaces[#Spaces], ".")] = nil
			end
		end
		if typeof(LastSelected[#Spaces]) == "string" then
			LastSelected[#Spaces] = getfenv()[LastSelected[#Spaces]]
			TheTable = LastSelected[#Spaces]
		end
		Tbs = MakeOptionsTable(LastSelected[#Spaces])
		local Splits = string.split(Spaces[#Spaces], ".")
		SearchFor = Splits[#Splits]
	else
		LastSelected[#Spaces] = nil
	end
	CanUpdate = true
	pcall(function()
		if Tbs and SearchFor then
			for i, v in pairs(Tbs) do
				if string.match(string.lower(tostring(v)), string.lower(SearchFor)) then
					if not LastSelected[#Spaces] then
						LastSelected[#Spaces] = v
						LastSelectedNumber = #Spaces
					end
					if CanUpdate then
						CanUpdate = false
						CurrentSelected = v
						LastSelectedString = tostring(v)
					end
					SearchResults = SearchResults..tostring(v).."\n"
				end
			end
			PossibleArgumentsList.Text = SearchResults
		elseif CText == CommandBox.Text then
			PossibleArgumentsList.Text = ""
		end
	end)
	AdjustFrame(PossibleArgumentsList)
	PossibleArguments.Position = UDim2.new(1, -200, 1, -60+GetSize(CommandBox.Text, CommandBox.TextSize, CommandBox.Font, CommandBox.Parent.Size.X.Offset, 100000).Y)
end)
CommandBox.FocusLost:connect(function()
	PossibleArguments.Visible = false
	if Args[1] and FunctionsHolder[Args[1]] and #Args-1 == #FunctionsForCommands[Args[1]]-1 and CurrentSelected then
		if typeof(CurrentSelected) == "string" and TheTable and TheTable[CurrentSelected] then
			local Last = string.split(CommandBox.Text, CurrentSelected)
			Last = Last[#Last]
			local v;
			v, CurrentSelected = pcall(function() return loadstring("return TheTable[CurrentSelected]"..Last)() end)
			if not v then
				AddtoLog("Error, command input to correct!")
				AddtoLog(CommandBox.Text)
			end
		end
		table.insert(Args, CurrentSelected)
	end
	if Args[1] and FunctionsHolder[Args[1]] and #Args-1 == #FunctionsForCommands[Args[1]] then
		local Func = Args[1]
		table.remove(Args, 1)
		local a, b = pcall(function() FunctionsHolder[Func](unpack(Args)) end)
		if not a then
			AddtoLog(b)
		end
	end
	CommandBox.Text = ""
end)
CommandBox.Focused:connect(function()
	PossibleArguments.Visible = true
	SearchResults = ""
	for i, v in pairs(MakeOptionsTable(FunctionsForCommands)) do
		SearchResults = SearchResults..tostring(v).."\n"
	end
	PossibleArgumentsList.Text = SearchResults
	AdjustFrame(PossibleArgumentsList)
end)

function CustomFind(Str, Chr)
	local CLen = string.len(Chr)
	for i = 1, string.len(Str) do
		if string.sub(Str, i, i+CLen-1) == Chr then
			return i
		end
	end
end

PossibleArguments = Instance.new("ScrollingFrame", MainFrame)
PossibleArguments.Name = "PossibleArguments"
PossibleArguments.Active = true
PossibleArguments.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
PossibleArguments.BackgroundTransparency = 1
PossibleArguments.BorderSizePixel = 0
PossibleArguments.Position = UDim2.new(1, -200, 1, -40)
PossibleArguments.Size = UDim2.new(0, 200, 0, 80)
PossibleArguments.Visible = false
PossibleArguments.CanvasSize = UDim2.new(0, 0, 0, 0)
PossibleArguments.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
PossibleArguments.ScrollBarThickness = 4
ScrollableItem(PossibleArguments)

PossibleArgumentsList = Instance.new("TextLabel", PossibleArguments)
PossibleArgumentsList.Name = "PossibleArgumentsList"
PossibleArgumentsList.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
PossibleArgumentsList.BackgroundTransparency = 0.4
PossibleArgumentsList.Size = UDim2.new(1, -4, 1, 0)
PossibleArgumentsList.Font = Enum.Font.SciFi
PossibleArgumentsList.TextColor3 = Color3.fromRGB(236, 236, 236)
PossibleArgumentsList.TextSize = 20
PossibleArgumentsList.TextXAlignment = Enum.TextXAlignment.Left
PossibleArgumentsList.TextYAlignment = Enum.TextYAlignment.Top
function GetSize(Text, FontSize, Font, XSize, MaxY, ShouldReturnX)
    if typeof(Font) == "string" then
        Font = Enum.Font[Font]
    end
    local Val = game:GetService("TextService"):GetTextSize(Text, FontSize, Font, Vector2.new(XSize, MaxY*FontSize))
	if not ShouldReturnX then
		return Vector2.new(XSize, Val.Y)
	end
	return Vector2.new(Val.X, Val.Y)
end
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
function ClearLog()
	CommandLog.Text = ""
	AdjustFrame(CommandLog)
end
getgenv().AddLog = AddtoLog


-- End Of Command Tab --

MiscCommandList = Instance.new("ScrollingFrame", MainFrame)
MiscCommandList.Name = "MiscCommandList"
MiscCommandList.Active = true
MiscCommandList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
MiscCommandList.BackgroundTransparency = 1
MiscCommandList.BorderSizePixel = 0
MiscCommandList.Position = UDim2.new(1, -200, 0, 25)
MiscCommandList.Size = UDim2.new(0, 100, 0, 195)
MiscCommandList.Visible = false
MiscCommandList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
MiscCommandList.ScrollBarThickness = 4
ScrollableItem(MiscCommandList)
InsertInto("Misc", MiscCommandList)

MiscCreateInvite = Instance.new("TextButton", MainFrame)
MiscCreateInvite.Name = "MiscCreateInvite"
MiscCreateInvite.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MiscCreateInvite.BackgroundTransparency = 0.5
MiscCreateInvite.BorderSizePixel = 0
MiscCreateInvite.Position = UDim2.new(1, -100, 1, -30)
MiscCreateInvite.Size = UDim2.new(0, 100, 0, 30)
MiscCreateInvite.Font = Enum.Font.SciFi
MiscCreateInvite.Text = "Create Invite"
MiscCreateInvite.TextColor3 = Color3.fromRGB(0, 0, 0)
MiscCreateInvite.TextScaled = true
MiscCreateInvite.TextSize = 14
MiscCreateInvite.TextWrapped = true
MiscCreateInvite.Visible = false
InsertInto("Misc", MiscCreateInvite)
local CanClickInvite = true
MiscCreateInvite.MouseButton1Down:connect(function()
	if CanClickInvite == true then
		CanClickInvite = false
		local Success = MakeInvite()
		local OriginalColor = MiscCreateInvite.BackgroundColor3
		MiscCreateInvite.BackgroundColor3 = Color3.fromRGB(155, 255, 155)
		if not Success then
			MiscCreateInvite.BackgroundColor3 = Color3.fromRGB(255, 155, 155)
			wait(15)
			MiscCreateInvite.BackgroundColor3 = OriginalColor
			CanClickInvite = true
			return
		end
		MakeInvites()
		wait(90)
		MiscCreateInvite.BackgroundColor3 = OriginalColor
		CanClickInvite = true
	end
end)

TempMiscCommandButton = Instance.new("TextButton", MiscCommandList)
TempMiscCommandButton.Name = "TempMiscCommandButton"
TempMiscCommandButton.BackgroundColor3 = Color3.fromRGB(21, 156, 177)
TempMiscCommandButton.BackgroundTransparency = 0.4
TempMiscCommandButton.BorderSizePixel = 0
TempMiscCommandButton.Size = UDim2.new(1, -4, 0, 30)
TempMiscCommandButton.Visible = false
TempMiscCommandButton.Font = Enum.Font.SciFi
TempMiscCommandButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempMiscCommandButton.TextScaled = true
TempMiscCommandButton.TextSize = 14
TempMiscCommandButton.TextWrapped = true

function MakeMiscCommandButton(Txt, func)
	local Button = CloneButton(TempMiscCommandButton, Txt, MiscCommandList)
    Button.MouseButton1Down:connect(func)
    return Button
end

InviteList = Instance.new("ScrollingFrame", MainFrame)
InviteList.Name = "InviteList"
InviteList.Active = true
InviteList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
InviteList.BackgroundTransparency = 0.4
InviteList.BorderSizePixel = 0
InviteList.Position = UDim2.new(1, -100, 0, 25)
InviteList.Size = UDim2.new(0, 100, 0, 135)
InviteList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
InviteList.ScrollBarThickness = 4
InviteList.Visible = false
ScrollableItem(InviteList)
InsertInto("Misc", InviteList)

PasswordBox = Instance.new("TextBox", MainFrame)
PasswordBox.Name = "PasswordBox"
PasswordBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PasswordBox.BackgroundTransparency = 0.4
PasswordBox.BorderSizePixel = 0
PasswordBox.Position = UDim2.new(1, -100, 1, -60)
PasswordBox.Size = UDim2.new(0, 100, 0, 30)
PasswordBox.CursorPosition = -1
PasswordBox.Font = Enum.Font.SciFi
PasswordBox.PlaceholderColor3 = Color3.fromRGB(98, 98, 98)
PasswordBox.PlaceholderText = "Password"
PasswordBox.Text = ""
PasswordBox.TextColor3 = Color3.fromRGB(0, 0, 0)
PasswordBox.TextScaled = true
PasswordBox.TextSize = 14
PasswordBox.TextWrapped = true
PasswordBox.Visible = false
InsertInto("Misc", PasswordBox)

TempInviteButton = Instance.new("TextButton", InviteList)
TempInviteButton.Name = "TempInviteButton"
TempInviteButton.BackgroundColor3 = Color3.fromRGB(21, 156, 177)
TempInviteButton.BackgroundTransparency = 0.4
TempInviteButton.BorderSizePixel = 0
TempInviteButton.Size = UDim2.new(1, -4, 0, 30)
TempInviteButton.Visible = false
TempInviteButton.Font = Enum.Font.SciFi
TempInviteButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempInviteButton.TextScaled = true
TempInviteButton.TextSize = 14
TempInviteButton.TextWrapped = true

function MakeInviteButton(Txt, func)
	local Button = CloneButton(TempInviteButton, Txt, InviteList)
    Button.MouseButton1Down:connect(func)
    return Button
end

function GetInvites()
    return {}
end

function JoinInvite(ServerTable)
	
end

function MakeInvites()
	
end

function MakeInvite()
	return false
end

function MakePlrTab(S)
    local Plrs = {SelectedPlayer}
	if S then
		Plrs = {S}
	end
	if SelectedPlayer == nil and SelectedPlayers == nil then
        return
    elseif SelectedPlayer == "All" then
        Plrs = game.Players:GetPlayers()
	elseif SelectedPlayer == "Others" then
		Plrs = game.Players:GetPlayers()
		for i, v in pairs(Plrs) do
			if v == LPlr then
				table.remove(Plrs, i)
			end
		end
	elseif SelectedPlayers ~= nil then
		Plrs = {}
		for i, v in pairs(SelectedPlayers) do
			table.insert(Plrs, i)
		end
    end
    return Plrs
end

-- Misc Tab --

MakeMiscCommandButton("Clean Loot", function()
    Clean()
end)

MakeMiscCommandButton("Clean Bases", function()
    CleanBuildings()
end)

MakeMiscCommandButton("Check for Exploiters", function()
    CheckForExploits()
end)

local ToggleCheckExploiters = false
local CheckExploitersToggle;
CheckExploitersToggle = MakeMiscCommandButton("Toggle Exploiters", function()
    ToggleCheckExploiters = not ToggleCheckExploiters
	DoSelectionMode(MiscCommandList, CheckExploitersToggle, TempMiscCommandButton, ToggleCheckExploiters)
end)
spawn(function()
	while wait(30) do
		if ToggleCheckExploiters then
			CheckForExploits(true)
		end
	end
end)

MakeMiscCommandButton("Unhitable Zombies", function()
    NoHitZombie()
end)

MakeMiscCommandButton("Hitable Zombies", function()
	MakeZombiesHitable()
end)
--AllowRocket

local AllowRocketButton;
AllowRocketButton = MakeMiscCommandButton("Anti-Rocket", function()
	AllowRocket = not AllowRocket
	SingleButtonSelection(MiscCommandList, AllowRocketButton, TempMiscCommandButton, AllowRocket)
end)

local AntiSpawnLoot;
AntiSpawnLoot = MakeMiscCommandButton("Anti-Spawn Loot", function()
    local Bool = AntiSpawn()
	SingleButtonSelection(MiscCommandList, AntiSpawnLoot, TempMiscCommandButton)
    if Bool == true then
		SingleButtonSelection(MiscCommandList, AntiSpawnLoot, TempMiscCommandButton, true)
    end
end)

local ServerLockButton;
ServerLockButton = MakeMiscCommandButton("Server Lock", function()
    local Bool = ServerLockF()
	SingleButtonSelection(MiscCommandList, ServerLockButton, TempMiscCommandButton)
    if Bool == true then
        SingleButtonSelection(MiscCommandList, ServerLockButton, TempMiscCommandButton, true)
    end
end)

MakeMiscCommandButton("Remove Exploited Vehicles", function()
    RemoveHackedVehicles()
end)

MakeMiscCommandButton("Amount Of Zombies", function() 
	CheckZombies()
end)

MakeMiscCommandButton("Kill Zombies", function()
	KillZombies()
end)

local FullBrightButton;
FullBrightButton = MakeMiscCommandButton("FullBright", function()
	local Bool = FullBright()
	SingleButtonSelection(MiscCommandList, FullBrightButton, TempMiscCommandButton)
    if Bool == true then
        SingleButtonSelection(MiscCommandList, FullBrightButton, TempMiscCommandButton, true)
    end
end)

local KeepInventoryButton;
KeepInventoryButton = MakeMiscCommandButton("Keep Inventory", function()
    local Bool = KeepInventory()
	SingleButtonSelection(MiscCommandList, KeepInventoryButton, TempMiscCommandButton)
    if Bool == true then
        SingleButtonSelection(MiscCommandList, KeepInventoryButton, TempMiscCommandButton, true)
    end
end)

local InvisOnListButton;
local IsInvisOnList = false;
InvisOnListButton = MakeMiscCommandButton("InvisibleOnList", function()
	IsInvisOnList = not IsInvisOnList
	SingleButtonSelection(MiscCommandList, InvisOnListButton, TempMiscCommandButton)
	if IsInvisOnList then
		SingleButtonSelection(MiscCommandList, InvisOnListButton, TempMiscCommandButton, true)
		fireserver("ChangeParentLocal", LPlr)
	else
		fireserver("ChangeParentLocal", LPlr, game.Players)
	end
end)

MakeMiscCommandButton("Rejoin Server", function()
	game:GetService("TeleportService"):Teleport(game.PlaceId, LPlr)
end)

-- End of Misc Tab --

-- Base Saver Tab --

SaveButton = Instance.new("TextButton", MainFrame)
SaveButton.Name = "SaveButton"
SaveButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SaveButton.BackgroundTransparency = 0.5
SaveButton.BorderSizePixel = 0
SaveButton.Position = UDim2.new(1, -100, 1, -30)
SaveButton.Size = UDim2.new(0, 100, 0, 30)
SaveButton.Font = Enum.Font.SciFi
SaveButton.Text = "Save"
SaveButton.TextColor3 = Color3.fromRGB(0, 0, 0)
SaveButton.TextScaled = true
SaveButton.TextSize = 14
SaveButton.TextWrapped = true
SaveButton.Visible = false
InsertInto("Base Saver", SaveButton)
SaveButton.MouseButton1Down:connect(function()
	if not Corner1 and game.Workspace:FindFirstChild("Corner1") then
		Corner1 = game.Workspace.Corner1
	end
	if not Corner2 and game.Workspace:FindFirstChild("Corner2") then
		Corner2 = game.Workspace.Corner2
	end
	if not Corner1 or not Corner2 then return end
	ConvertModel(GetPartsInWorkspace(), BaseNameBox.Text)
end)

BaseNameBox = Instance.new("TextBox", MainFrame)
BaseNameBox.Name = "BaseNameBox"
BaseNameBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BaseNameBox.BackgroundTransparency = 0.4
BaseNameBox.BorderSizePixel = 0
BaseNameBox.Position = UDim2.new(1, -200, 1, -30)
BaseNameBox.Size = UDim2.new(0, 100, 0, 30)
BaseNameBox.CursorPosition = -1
BaseNameBox.Font = Enum.Font.SciFi
BaseNameBox.PlaceholderColor3 = Color3.fromRGB(98, 98, 98)
BaseNameBox.PlaceholderText = "Base Name"
BaseNameBox.Text = ""
BaseNameBox.TextColor3 = Color3.fromRGB(0, 0, 0)
BaseNameBox.TextScaled = true
BaseNameBox.TextSize = 14
BaseNameBox.TextWrapped = true
BaseNameBox.Visible = false
InsertInto("Base Saver", BaseNameBox)

BaseSaverList = Instance.new("ScrollingFrame", MainFrame)
BaseSaverList.Name = "BaseSaverList"
BaseSaverList.Active = true
BaseSaverList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
BaseSaverList.BackgroundTransparency = 1
BaseSaverList.BorderSizePixel = 0
BaseSaverList.Position = UDim2.new(1, -200, 0, 25)
BaseSaverList.Size = UDim2.new(0, 100, 0, 165)
BaseSaverList.Visible = false
BaseSaverList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
BaseSaverList.ScrollBarThickness = 4
ScrollableItem(BaseSaverList, 60)
InsertInto("Base Saver", BaseSaverList)

TempBaseSaverButton = Instance.new("TextButton", BaseSaverList)
TempBaseSaverButton.Name = "TempBaseSaverButton"
TempBaseSaverButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TempBaseSaverButton.BackgroundTransparency = 0.5
TempBaseSaverButton.BorderSizePixel = 0
TempBaseSaverButton.Size = UDim2.new(1, -4, 0, 30)
TempBaseSaverButton.Visible = false
TempBaseSaverButton.Font = Enum.Font.SciFi
TempBaseSaverButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempBaseSaverButton.TextScaled = true
TempBaseSaverButton.TextSize = 14
TempBaseSaverButton.TextWrapped = true

function MakeBaseSaverButton(Txt, func)
	local Button = CloneButton(TempBaseSaverButton, Txt, BaseSaverList)
    Button.MouseButton1Down:connect(func)
    return Button
end

MapSpecific = false
ToggleMapSpecific = MakeBaseSaverButton("Map Specific", function()
	MapSpecific = not MapSpecific
	SingleButtonSelection(BaseSaverList, ToggleMapSpecific, TempBaseSaverButton, MapSpecific)
end)

SpecificPosition = false
ToggleSpecificPosition = MakeBaseSaverButton("Specific Position", function()
	SpecificPosition = not SpecificPosition
	SingleButtonSelection(BaseSaverList, ToggleSpecificPosition, TempBaseSaverButton, SpecificPosition)
end)

Corner1Button = MakeBaseSaverButton("Set Corner1", function()
	MakeCorner(1)
end)

Corner2Button = MakeBaseSaverButton("Set Corner2", function()
	MakeCorner(2)
end)

PainterList = Instance.new("ScrollingFrame", MainFrame)
PainterList.Name = "PainterList"
PainterList.Active = true
PainterList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
PainterList.BackgroundTransparency = 1
PainterList.BorderSizePixel = 0
PainterList.Position = UDim2.new(1, -100, 0, 25)
PainterList.Size = UDim2.new(0, 100, 0, 165)
PainterList.Visible = false
PainterList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
PainterList.ScrollBarThickness = 4
ScrollableItem(PainterList, 60)
InsertInto("Base Saver", PainterList)

TempPainterButton = Instance.new("TextButton", PainterList)
TempPainterButton.Name = "TempPainterButton"
TempPainterButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TempPainterButton.BackgroundTransparency = 0.5
TempPainterButton.BorderSizePixel = 0
TempPainterButton.Size = UDim2.new(1, -4, 0, 30)
TempPainterButton.Visible = false
TempPainterButton.Font = Enum.Font.SciFi
TempPainterButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempPainterButton.TextScaled = true
TempPainterButton.TextSize = 14
TempPainterButton.TextWrapped = true

TempPainterBox = Instance.new("TextBox", PainterList)
TempPainterBox.Name = "TempPainterBox"
TempPainterBox.BackgroundColor3 = Color3.fromRGB(21, 156, 177)
TempPainterBox.BackgroundTransparency = 0.4
TempPainterBox.BorderSizePixel = 0
TempPainterBox.Size = UDim2.new(1, -4, 0, 30)
TempPainterBox.Visible = false
TempPainterBox.Font = Enum.Font.SciFi
TempPainterBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TempPainterBox.TextScaled = true
TempPainterBox.TextSize = 14
TempPainterBox.TextWrapped = true

local PaintID = 1
local MaterialID = "Plastic"
local PaintTransparency = 0
local PaintModel = false
local StoredPaintModel;
local CanPaint = true
function GetModelToPaint(Item)
	repeat
		Item = Item.Parent
	until Item:IsA("Model") or Item == game.Workspace
	return Item
end
function PaintItem(Item)
	if not Item or not CanPaint then
		return
	end
	local ModelToPaint = Item
	local OriParent;
	if not PaintModel then
		if not StoredPaintModel or StoredPaintModel.Parent == nil then
			local RandomName = tostring(math.random(1, 100000000))
			R.AddClothing:FireServer(RandomName, game.Workspace, "", "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "")
			StoredPaintModel = game.Workspace:WaitForChild(RandomName)
		end
		if not StoredPaintModel:FindFirstChild(tostring(Item.BrickColor)) then
			R.AddClothing:FireServer(tostring(Item.BrickColor), StoredPaintModel, "", "", "")
			CanPaint = false
			StoredPaintModel:WaitForChild(tostring(Item.BrickColor))
			for i, v in pairs(StoredPaintModel[tostring(Item.BrickColor)]:GetChildren()) do
				if v:IsA("StringValue") and v.Value == "" then
					fireserver("ChangeParent", v)
				end
			end
			CanPaint = true
		end
		OriParent = Item.Parent
		fireserver("ChangeParent", Item, StoredPaintModel[tostring(Item.BrickColor)])
		ModelToPaint = StoredPaintModel[tostring(Item.BrickColor)]
		wait()
	else
		ModelToPaint = GetModelToPaint(Item)
	end
	ColorModelWithMats(ModelToPaint, PaintID, MaterialID, PaintTransparency)
	wait()
	if OriParent and OriParent ~= StoredPaintModel and OriParent.Parent ~= StoredPaintModel then
		fireserver("ChangeParent", Item, OriParent)
	end
end
Mouse.Button1Down:connect(function()
	if Paint == true and Mouse.Target then
		PaintItem(Mouse.Target)
	end
end)

function MakePainterButton(Txt, func)
	local Button = CloneButton(TempPainterButton, Txt, PainterList, 1)
    Button.MouseButton1Down:connect(func)
    return Button
end

function MakePainterBox(Txt, func)
	local BTxt = CloneButton(TempPainterBox, Txt, PainterList, 1)
	if func then
		BTxt.FocusLost:connect(func)
	end
	return BTxt
end

Paint = false
PaintButton = MakePainterButton("Painting", function()
	Paint = not Paint
	SingleButtonSelection(PainterList, PaintButton, TempPainterButton, Paint)
end)

PaintColorIDBox = MakePainterBox("Color", function()
	local Col = PaintColorIDBox.Text
	if not tonumber(Col) then
		for i, v in pairs(CTab) do
			if string.match(string.lower(v), string.lower(Col)) then
				PaintColorIDBox.Text = tostring(v)
				PaintID = i
				break
			end
		end
	end
end)
PaintMaterialBox = MakePainterBox("Plastic", function()
	local T = PaintMaterialBox.Text
	for i = 1, #MaterialsTable do
		if string.find(string.lower(MaterialsTable[i]), string.lower(T)) then
			PaintMaterialBox.Text = MaterialsTable[i]
			MaterialID = MaterialsTable[i]
			break
		end
	end
end)
PaintTransparencyBox = MakePainterBox("Transparency", function()
	if not tonumber(PaintTransparencyBox.Text) then
		PaintTransparencyBox.Text = 0
	end
	PaintTransparency = tonumber(PaintTransparencyBox.Text)
end)

--End of Base Saver Tab --

-- Base Spawner Tab --
local Shoulds = {["{"] = true, ["}"] = true, [","] = true}

function SetBases()
    BaseTable = {}
    for i, v in pairs(listfiles("VictinisGuiSettings/Bases")) do
        local fn = string.split(string.split(v, "\\")[2], ".")[1]
		local FileString = readfile(v)
		local FileBroke = false
		for a = 1, string.len(FileString) do
            if string.sub(FileString, a, a) == "{" then
                if a ~= 1 then
                    FileString = string.sub(FileString, a)
                    FileBroke = true
                end
                break
            end
		end
        if string.sub(FileString, string.len(FileString), string.len(FileString)) ~= "}" then
            FileString = string.sub(FileString, 1, string.len(FileString)-1)
			FileBroke = true
        end
        if FileBroke then
            writefile(v, FileString)
			AddClientMessage("Attempted to fix file "..fn.."!", 4)
        end
        local bool, BaseReturn = pcall(function() return loadstring("return "..FileString)() end)
        if not bool then
            AddClientMessage(fn.." errored!", 6)
        else
            BaseTable[fn] = BaseReturn
        end
    end
end
BaseTable = {}
if syn then
SetBases()
end
SelectedBase = nil

BaseList = Instance.new("ScrollingFrame", MainFrame)
BaseList.Name = "BaseList"
BaseList.Active = true
BaseList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
BaseList.BackgroundTransparency = 1
BaseList.BorderSizePixel = 0
BaseList.Position = UDim2.new(1, -200, 0, 55)
BaseList.Size = UDim2.new(0, 100, 0, 135)
BaseList.Visible = false
BaseList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
BaseList.ScrollBarThickness = 4
ScrollableItem(BaseList)
InsertInto("Base Spawner", BaseList)

TempBaseButton = Instance.new("TextButton", BaseList)
TempBaseButton.Name = "TempBaseButton"
TempBaseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TempBaseButton.BackgroundTransparency = 0.5
TempBaseButton.BorderSizePixel = 0
TempBaseButton.Size = UDim2.new(1, -4, 0, 30)
TempBaseButton.Visible = false
TempBaseButton.Font = Enum.Font.SciFi
TempBaseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempBaseButton.TextScaled = true
TempBaseButton.TextSize = 14
TempBaseButton.TextWrapped = true
function DisplayBases(Specific)
    for i, v in pairs(BaseList:GetChildren()) do
        if v ~= TempBaseButton then
            v:remove()
        end
    end
    for i, v in pairs(BaseTable) do
        if (Specific == nil or string.sub(string.lower(i), 1, string.len(Specific)) == string.lower(Specific)) and (not v["MapSpecific"] or v["MapSpecific"] == MapName) then
            local Button = CloneButton(TempBaseButton, i, BaseList)
            Button.MouseButton1Down:connect(function()
				DoSelectionMode(BaseList, Button, TempBaseButton)
                SelectedBase = i
            end)
            if SelectedBase == i then
				SingleButtonSelection(BaseList, Button, TempBaseButton, true)
            end
        end
    end
end
DisplayBases()

SpawnInFolder = false
ToggleBaseButton = Instance.new("TextButton", MainFrame)
ToggleBaseButton.Name = "ToggleBaseButton"
ToggleBaseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleBaseButton.BackgroundTransparency = 0.5
ToggleBaseButton.BorderSizePixel = 0
ToggleBaseButton.Position = UDim2.new(1, -200, 1, -30)
ToggleBaseButton.Size = UDim2.new(0, 100, 0, 30)
ToggleBaseButton.Visible = false
ToggleBaseButton.Font = Enum.Font.SciFi
ToggleBaseButton.Text = "Toggle Model"
ToggleBaseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleBaseButton.TextScaled = true
ToggleBaseButton.TextSize = 14
ToggleBaseButton.TextWrapped = true
InsertInto("Base Spawner", ToggleBaseButton)
ToggleBaseButton.MouseButton1Down:connect(function()
	SpawnInFolder = not SpawnInFolder
	ToggleBaseButton.BackgroundTransparency = 0.5
	if SpawnInFolder == true then
		ToggleBaseButton.BackgroundTransparency = 0.3
	end
end)

RefreshBaseButton = Instance.new("TextButton", MainFrame)
RefreshBaseButton.Name = "RefreshBaseButton"
RefreshBaseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RefreshBaseButton.BackgroundTransparency = 0.5
RefreshBaseButton.BorderSizePixel = 0
RefreshBaseButton.Position = UDim2.new(1, -100, 1, -60)
RefreshBaseButton.Size = UDim2.new(0, 100, 0, 30)
RefreshBaseButton.Visible = false
RefreshBaseButton.Font = Enum.Font.SciFi
RefreshBaseButton.Text = "Refresh Bases"
RefreshBaseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
RefreshBaseButton.TextScaled = true
RefreshBaseButton.TextSize = 14
RefreshBaseButton.TextWrapped = true
InsertInto("Base Spawner", RefreshBaseButton)
RefreshBaseButton.MouseButton1Down:connect(function()
	SetBases()
	DisplayBases()
end)

BaseToggleList = Instance.new("ScrollingFrame", MainFrame)
BaseToggleList.Name = "BaseToggleList"
BaseToggleList.Active = true
BaseToggleList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
BaseToggleList.BackgroundTransparency = 1
BaseToggleList.BorderSizePixel = 0
BaseToggleList.Position = UDim2.new(1, -200, 0, 25)
BaseToggleList.Size = UDim2.new(0, 100, 0, 165)
BaseToggleList.Visible = false
BaseToggleList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
BaseToggleList.ScrollBarThickness = 4
ScrollableItem(BaseToggleList)
InsertInto("Base Toggles", BaseToggleList)

TempBaseToggleButton = Instance.new("TextButton", BaseToggleList)
TempBaseToggleButton.Name = "TempBaseToggleButton"
TempBaseToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TempBaseToggleButton.BackgroundTransparency = 0.5
TempBaseToggleButton.BorderSizePixel = 0
TempBaseToggleButton.Size = UDim2.new(1, -4, 0, 30)
TempBaseToggleButton.Visible = false
TempBaseToggleButton.Font = Enum.Font.SciFi
TempBaseToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempBaseToggleButton.TextScaled = true
TempBaseToggleButton.TextSize = 14
TempBaseToggleButton.TextWrapped = true
function MakeBaseToggleButton(Txt, func)
	local Button = CloneButton(TempBaseToggleButton, Txt, BaseToggleList)
    Button.MouseButton1Down:connect(func)
    return Button
end

Massless = false
local MassButton;
ToggleMassless = function()
	Massless = not Massless
	SingleButtonSelection(BaseToggleList, MassButton, TempBaseToggleButton, Massless)
end
MassButton = MakeBaseToggleButton("Spawn Massless", ToggleMassless)

IsBlocksCollidable = false
local CollButton;
CollButton = MakeBaseToggleButton("Spawn NoCollide", function()
	IsBlocksCollidable = not IsBlocksCollidable
	SingleButtonSelection(BaseToggleList, CollButton, TempBaseToggleButton, IsBlocksCollidable)
end)

NukeFollow = true
local NukeFollowButton;
NukeFollowButton = MakeBaseToggleButton("Nuke Follow", function()
	NukeFollow = not NukeFollow
	SingleButtonSelection(BaseToggleList, NukeFollowButton, TempBaseToggleButton, NukeFollow)
end)

local ToggleBaseView;
ToggleBaseView = MakeBaseToggleButton("Base View", function()
	DoPreview = not DoPreview
	SingleButtonSelection(BaseToggleList, ToggleBaseView, TempBaseToggleButton, DoPreview)
end)

local ToggleMovable;
ToggleMovable = MakeBaseToggleButton("Movable Bases", function()
	Movable = not Movable
	SingleButtonSelection(BaseToggleList, ToggleMovable, TempBaseToggleButton, Movable)
end)

ShopCommandList = Instance.new("ScrollingFrame", MainFrame)
ShopCommandList.Name = "ShopCommandList"
ShopCommandList.Active = true
ShopCommandList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
ShopCommandList.BackgroundTransparency = 1
ShopCommandList.BorderSizePixel = 0
ShopCommandList.Position = UDim2.new(1, -200, 0, 25)
ShopCommandList.Size = UDim2.new(0, 100, 0, 195)
ShopCommandList.Visible = false
ShopCommandList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
ShopCommandList.ScrollBarThickness = 4
ScrollableItem(ShopCommandList)
InsertInto("Shops", ShopCommandList)

TempShopCommandButton = Instance.new("TextButton", ShopCommandList)
TempShopCommandButton.Name = "TempShopCommandButton"
TempShopCommandButton.BackgroundColor3 = Color3.fromRGB(21, 156, 177)
TempShopCommandButton.BackgroundTransparency = 0.4
TempShopCommandButton.BorderSizePixel = 0
TempShopCommandButton.Size = UDim2.new(1, -4, 0, 30)
TempShopCommandButton.Visible = false
TempShopCommandButton.Font = Enum.Font.SciFi
TempShopCommandButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempShopCommandButton.TextScaled = true
TempShopCommandButton.TextSize = 14
TempShopCommandButton.TextWrapped = true

function MakeMiscCommandButton(Txt, func)
	local Button = CloneButton(TempShopCommandButton, Txt, ShopCommandList)
    Button.MouseButton1Down:connect(func)
    return Button
end

MakeMiscCommandButton("Trade Spot 1", function()
	local newPos = game.Players.LocalPlayer.Character.Head.Position-Vector3.new(0, 4, 0)
	MakeShop("TradeSpot", newPos)
end)

Teleports = {}
TPPlayerList = Instance.new("ScrollingFrame", MainFrame)
TPPlayerList.Name = "TPPlayerList"
TPPlayerList.Active = true
TPPlayerList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
TPPlayerList.BackgroundTransparency = 1
TPPlayerList.BorderSizePixel = 0
TPPlayerList.Position = UDim2.new(1, -200, 0, 55)
TPPlayerList.Size = UDim2.new(0, 100, 0, 165)
TPPlayerList.Visible = false
TPPlayerList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
TPPlayerList.ScrollBarThickness = 4
ScrollableItem(TPPlayerList, 60)
InsertInto("Teleports", TPPlayerList)

TempTPPlayerButton = Instance.new("TextButton", TPPlayerList)
TempTPPlayerButton.Name = "TempTPPlayerButton"
TempTPPlayerButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TempTPPlayerButton.BackgroundTransparency = 0.5
TempTPPlayerButton.BorderSizePixel = 0
TempTPPlayerButton.Size = UDim2.new(1, -4, 0, 30)
TempTPPlayerButton.Visible = false
TempTPPlayerButton.Font = Enum.Font.SciFi
TempTPPlayerButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempTPPlayerButton.TextScaled = true
TempTPPlayerButton.TextSize = 14
TempTPPlayerButton.TextWrapped = true
local DisplayPlayersSearch;
local SelectedTeleport;
local ToDisplaySelctedTeleport;
function DisplayPlayersInTP(Plr, Specific)
	if IsInvisOnList then
		spawn(function()
			wait(5)
			fireserver("ChangeParentLocal", LPlr)
		end)
	end
	if Specific ~= nil then
		DisplayPlayerSearch = Specific
	elseif DisplayPlayerSearch ~= nil then
		Specific = DisplayPlayerSearch
	end
	for i, v in pairs(TPPlayerList:GetChildren()) do
		if v ~= TempTPPlayerButton then
			v:remove()
		end
	end
	for i, v in pairs(game.Players:GetPlayers()) do
		if Specific == nil or string.match(string.lower(tostring(v)), Specific) then
			local Button = CloneButton(TempTPPlayerButton, tostring(v), TPPlayerList)
			Button.MouseButton1Down:connect(function()
				if v.Character ~= nil and v.Character:FindFirstChild("Head") then
					DoSelectionMode(TPPlayerList, Button, TempTPPlayerButton)
					SelectedTeleport = v.Character.Torso
					ToDisplaySelctedTeleport = v
				end
			end)
			if ToDisplaySelctedTeleport == v then
				SingleButtonSelection(TPPlayerList, Button, TempTPPlayerButton, true)
			end
		end
	end
	for i, v in pairs(Teleports) do
		if Specific == nil or string.match(string.lower(i), Specific) then
			local Button = CloneButton(TempTPPlayerButton, i, TPPlayerList)
			Button.Size = Button.Size - UDim2.new(0, 30, 0, 0)
			local DelButton = Instance.new("TextButton", Button)
			DelButton.Size = UDim2.new(0, 30, 0, 30)
			DelButton.Position = UDim2.new(1, 0, 0, 0)
			DelButton.BackgroundColor3 = Button.BackgroundColor3
			DelButton.BackgroundTransparency = Button.BackgroundTransparency
			DelButton.TextColor3 = Button.TextColor3
			DelButton.BorderSizePixel = Button.BorderSizePixel
			DelButton.Font = Button.Font
			DelButton.TextScaled = true
			DelButton.Text = "X"
			Button.MouseButton1Down:connect(function()
				DoSelectionMode(TPPlayerList, Button, TempTPPlayerButton)
				SelectedTeleport = v
				ToDisplaySelctedTeleport = i
			end)
			if ToDisplaySelctedTeleport == i then
				SingleButtonSelection(TPPlayerList, Button, TempTPPlayerButton, true)
			end
			DelButton.MouseButton1Down:connect(function()
				Teleports[i] = nil
				StoredTeleports[MapName][i] = nil
				DisplayPlayersInTP()
				SaveTeleports()
			end)
		end
	end
	if game.Workspace:FindFirstChild("Locations") then
		for i, v in pairs(game.Workspace.Locations:GetChildren()) do
			if v:IsA("BasePart") and (Specific == nil or string.match(string.lower(tostring(v)), Specific)) then
				local Button = CloneButton(TempTPPlayerButton, tostring(v), TPPlayerList)
				Button.MouseButton1Down:connect(function()
					DoSelectionMode(TPPlayerList, Button, TempTPPlayerButton)
					SelectedTeleport = v
					ToDisplaySelctedTeleport = v
				end)
				if ToDisplaySelctedTeleport == v then
					SingleButtonSelection(TPPlayerList, Button, TempTPPlayerButton, true)
				end
			end
		end
	end
end
game.Players.PlayerAdded:connect(DisplayPlayersInTP)
game.Players.PlayerRemoving:connect(DisplayPlayersInTP)
DisplayPlayersInTP()

TeleportButton = Instance.new("TextButton", MainFrame)
TeleportButton.Name = "TeleportButton"
TeleportButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton.BackgroundTransparency = 0.5
TeleportButton.BorderSizePixel = 0
TeleportButton.Position = UDim2.new(1, -100, 1, -60)
TeleportButton.Size = UDim2.new(0, 100, 0, 30)
TeleportButton.Visible = false
TeleportButton.Font = Enum.Font.SciFi
TeleportButton.Text = "Teleport"
TeleportButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TeleportButton.TextScaled = true
TeleportButton.TextSize = 14
TeleportButton.TextWrapped = true
InsertInto("Teleports", TeleportButton)
TeleportButton.MouseButton1Down:connect(function()
	if SelectedTeleport == nil then
		return
	end
	local ST = SelectedTeleport
	if typeof(ST) == "Vector3" then
		ST = CFrame.new()+ST
	elseif typeof(ST) ~= "CFrame" then
		ST = ST.CFrame
	end
	HandleCommands(MakePlrTab(), TPPlayerPos, {ST+Vector3.new(0, 2, 0)})
end)

LocationButton = Instance.new("TextButton", MainFrame)
LocationButton.Name = "LocationButton"
LocationButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LocationButton.BackgroundTransparency = 0.5
LocationButton.BorderSizePixel = 0
LocationButton.Position = UDim2.new(1, -100, 1, -30)
LocationButton.Size = UDim2.new(0, 50, 0, 30)
LocationButton.Visible = false
LocationButton.Font = Enum.Font.SciFi
LocationButton.Text = "Make Teleport"
LocationButton.TextColor3 = Color3.fromRGB(0, 0, 0)
LocationButton.TextScaled = true
LocationButton.TextSize = 14
LocationButton.TextWrapped = true
InsertInto("Teleports", LocationButton)
LocationButton.MouseButton1Down:connect(function()
	if LocationBox.Text == "" or LPlr == nil or LPlr.Character == nil or not LPlr.Character:FindFirstChild("Torso") then
		return
	end
	local TeleportName = LocationBox.Text
	local Pos = LPlr.Character.Torso.Position
	local TeleportPos = Vector3.new(RoundNumber(Pos.X, 100), RoundNumber(Pos.Y, 100), RoundNumber(Pos.Z, 100))
	if StoredTeleports == nil then
		StoredTeleports = {}
	end
	if StoredTeleports[MapName] == nil then
		StoredTeleports[MapName] = {}
	end
	StoredTeleports[MapName][TeleportName] = TeleportPos
	Teleports[TeleportName] = TeleportPos
	DisplayPlayersInTP()
	SaveTeleports()
end)

LocationBox = Instance.new("TextBox", LocationButton)
LocationBox.Name = "LocationBox"
LocationBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LocationBox.BackgroundTransparency = 0.5
LocationBox.BorderSizePixel = 0
LocationBox.Position = UDim2.new(1, 0, 0, 0)
LocationBox.Size = UDim2.new(1, 0, 0, 30)
LocationBox.Font = Enum.Font.SourceSans
LocationBox.TextColor3 = Color3.fromRGB(0, 0, 0)
LocationBox.TextScaled = true
LocationBox.TextSize = 14
LocationBox.TextWrapped = true

-- Themes Start --

ThemeList = Instance.new("ScrollingFrame", MainFrame)
ThemeList.Name = "ThemeList"
ThemeList.Active = true
ThemeList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
ThemeList.BackgroundTransparency = 1
ThemeList.BorderSizePixel = 0
ThemeList.Position = UDim2.new(1, -200, 0, 55)
ThemeList.Size = UDim2.new(0, 100, 0, 165)
ThemeList.Visible = false
ThemeList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
ThemeList.ScrollBarThickness = 4
ScrollableItem(ThemeList, 60)
InsertInto("Themes", ThemeList)

AddThemeButton = Instance.new("TextButton", MainFrame)
AddThemeButton.Name = "AddThemeButton"
AddThemeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AddThemeButton.BackgroundTransparency = 0.5
AddThemeButton.BorderSizePixel = 0
AddThemeButton.Position = UDim2.new(1, -100, 1, -30)
AddThemeButton.Size = UDim2.new(0, 100, 0, 30)
AddThemeButton.Font = Enum.Font.SciFi
AddThemeButton.Text = "Add Theme"
AddThemeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
AddThemeButton.TextScaled = true
AddThemeButton.TextSize = 14
AddThemeButton.TextWrapped = true
AddThemeButton.Visible = false
InsertInto("Themes", AddThemeButton)
AddThemeButton.MouseButton1Down:connect(function()
	SaveColors(ThemeBox.Text)
	LoadThemes()
end)

ThemeBox = Instance.new("TextBox", MainFrame)
ThemeBox.Name = "ThemeBox"
ThemeBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ThemeBox.BackgroundTransparency = 0.4
ThemeBox.BorderSizePixel = 0
ThemeBox.Position = UDim2.new(1, -100, 1, -60)
ThemeBox.Size = UDim2.new(0, 100, 0, 30)
ThemeBox.CursorPosition = -1
ThemeBox.Font = Enum.Font.SciFi
ThemeBox.PlaceholderColor3 = Color3.fromRGB(98, 98, 98)
ThemeBox.PlaceholderText = "Theme"
ThemeBox.Text = "Theme"
ThemeBox.TextColor3 = Color3.fromRGB(0, 0, 0)
ThemeBox.TextScaled = true
ThemeBox.TextSize = 14
ThemeBox.TextWrapped = true
ThemeBox.Visible = false
InsertInto("Themes", ThemeBox)

TempListButton = Instance.new("TextButton", ThemeList)
TempListButton.Name = "TempListButton"
TempListButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TempListButton.BackgroundTransparency = 0.5
TempListButton.BorderSizePixel = 0
TempListButton.Size = UDim2.new(1, -34, 0, 30)
TempListButton.Visible = false
TempListButton.Font = Enum.Font.SciFi
TempListButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempListButton.TextScaled = true
TempListButton.TextSize = 14
TempListButton.TextWrapped = true

DelListButton = Instance.new("TextButton", TempListButton)
DelListButton.Name = "DelListButton"
DelListButton.Size = UDim2.new(0, 30, 0, 30)
DelListButton.Position = UDim2.new(1, 0, 0, 0)
DelListButton.BackgroundColor3 = TempListButton.BackgroundColor3
DelListButton.BackgroundTransparency = TempListButton.BackgroundTransparency
DelListButton.TextColor3 = TempListButton.TextColor3
DelListButton.BorderSizePixel = TempListButton.BorderSizePixel
DelListButton.Font = TempListButton.Font
DelListButton.TextScaled = true
DelListButton.Text = "X"

function MakeThemeButton(Txt, func)
	local Button = CloneButton(TempListButton, Txt, ThemeList)
    Button.MouseButton1Down:connect(func)
    return Button
end

-- End Of Themes --

--Color Gui Start--

ColorItemList = Instance.new("ScrollingFrame", MainFrame)
ColorItemList.Name = "ColorItemList"
ColorItemList.Active = true
ColorItemList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
ColorItemList.BackgroundTransparency = 1
ColorItemList.BorderSizePixel = 0
ColorItemList.Position = UDim2.new(1, -200, 0, 55)
ColorItemList.Size = UDim2.new(0, 100, 0, 165)
ColorItemList.Visible = false
ColorItemList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
ColorItemList.ScrollBarThickness = 4
ScrollableItem(ColorItemList)
InsertInto("Custom Color", ColorItemList)

TempColorItemButton = Instance.new("TextButton", ColorItemList)
TempColorItemButton.Name = "TempColorItemButton"
TempColorItemButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TempColorItemButton.BackgroundTransparency = 0.5
TempColorItemButton.BorderSizePixel = 0
TempColorItemButton.Size = UDim2.new(1, -4, 0, 30)
TempColorItemButton.Visible = false
TempColorItemButton.Font = Enum.Font.SciFi
TempColorItemButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempColorItemButton.TextScaled = true
TempColorItemButton.TextSize = 14
TempColorItemButton.TextWrapped = true

ToColorItemList = Instance.new("ScrollingFrame", MainFrame)
ToColorItemList.Name = "ToColorItemList"
ToColorItemList.Active = true
ToColorItemList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
ToColorItemList.BackgroundTransparency = 1
ToColorItemList.BorderSizePixel = 0
ToColorItemList.Position = UDim2.new(1, -100, 0, 25)
ToColorItemList.Size = UDim2.new(0, 100, 0, 135)
ToColorItemList.Visible = false
ToColorItemList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
ToColorItemList.ScrollBarThickness = 4
ScrollableItem(ToColorItemList)
InsertInto("Custom Color", ToColorItemList)

PropertyLabel = Instance.new("TextLabel", ToColorItemList)
PropertyLabel.Name = "PropertyLabel"
PropertyLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PropertyLabel.BackgroundTransparency = 0.5
PropertyLabel.BorderSizePixel = 0
PropertyLabel.Size = UDim2.new(0.5, -2, 0, 30)
PropertyLabel.Visible = false
PropertyLabel.Font = Enum.Font.SciFi
PropertyLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
PropertyLabel.TextScaled = true
PropertyLabel.TextSize = 14

PropertyBox = Instance.new("TextBox", PropertyLabel)
PropertyBox.Name = "PropertyBox"
PropertyBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PropertyBox.BackgroundTransparency = 0.5
PropertyBox.BorderSizePixel = 0
PropertyBox.ClearTextOnFocus = false
PropertyBox.Position = UDim2.new(1, 0, 0, 0)
PropertyBox.Size = UDim2.new(1, 0, 0, 30)
PropertyBox.Visible = true
PropertyBox.Font = Enum.Font.SourceSans
PropertyBox.TextColor3 = Color3.fromRGB(0, 0, 0)
PropertyBox.TextScaled = true
PropertyBox.TextSize = 14
PropertyBox.TextWrapped = true

ResetColorButton = Instance.new("TextButton", MainFrame)
ResetColorButton.Name = "ResetColorButton"
ResetColorButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ResetColorButton.BackgroundTransparency = 0.5
ResetColorButton.BorderSizePixel = 0
ResetColorButton.Position = UDim2.new(1, -100, 1, -60)
ResetColorButton.Size = UDim2.new(0, 100, 0, 30)
ResetColorButton.Visible = false
ResetColorButton.Font = Enum.Font.SciFi
ResetColorButton.Text = "Reset Color"
ResetColorButton.TextColor3 = Color3.fromRGB(0, 0, 0)
ResetColorButton.TextScaled = true
ResetColorButton.TextSize = 14
ResetColorButton.TextWrapped = true
InsertInto("Custom Color", ResetColorButton)
ResetColorButton.MouseButton1Down:connect(function()
	if SelectedPropertyItem ~= nil then
		Props = OriginalPropertyTab[SelectedPropertyItem]
		for i, v in pairs(Props) do
			for a, b in pairs(SelectedPropertyItem.Parent:GetChildren()) do
				if b.Name == SelectedPropertyItem.Name then
					b[i] = v
				end
			end
		end
		GetPropertys(SelectedPropertyItem)
	end
end)

SaveColorButton = Instance.new("TextButton", MainFrame)
SaveColorButton.Name = "SaveColorButton"
SaveColorButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SaveColorButton.BackgroundTransparency = 0.5
SaveColorButton.BorderSizePixel = 0
SaveColorButton.Position = UDim2.new(1, -100, 1, -30)
SaveColorButton.Size = UDim2.new(0, 100, 0, 30)
SaveColorButton.Visible = false
SaveColorButton.Font = Enum.Font.SciFi
SaveColorButton.Text = "Save Color"
SaveColorButton.TextColor3 = Color3.fromRGB(0, 0, 0)
SaveColorButton.TextScaled = true
SaveColorButton.TextSize = 14
SaveColorButton.TextWrapped = true
InsertInto("Custom Color", SaveColorButton)
SaveColorButton.MouseButton1Down:connect(function()
	SaveColors()
end)

PropertyTab = {"BackgroundColor3", "BackgroundTransparency", "TextColor3", "TextTransparency",
"BorderColor3", "BorderSizePixel", "TextStrokeColor3", "TextStrokeTransparency", "ScrollBarImageColor3"}
PropertyNameTab = {["BackgroundColor3"] = "BkgrC3", ["BackgroundTransparency"] = "BkgrTr", 
["TextColor3"] = "TextC3", ["TextTransparency"] = "TextTr", ["BorderColor3"] = "BorderC3", 
["BorderSizePixel"] = "BorderSP", ["TextStrokeColor3"] = "TextSC3", ["TextStrokeTransparency"] = "TextSTr",
["ScrollBarImageColor3"] = "ScrollBIC3"}
OriginalPropertyTab = {}
SelectedPropertyItem = nil

function SearchColorFrame(Txt)
	local AcceptedButtons = 0
	for i, v in pairs(TempColorItemButton.Parent:GetChildren()) do
		if v ~= TempColorItemButton and string.match(string.lower(v.Text), string.lower(Txt)) then
			v.Position = UDim2.new(0, 0, 0, v.Size.Y.Offset*AcceptedButtons)
			TempColorItemButton.Parent.CanvasSize = UDim2.new(0, 0, 0, v.Size.Y.Offset*(AcceptedButtons+1))
			AcceptedButtons = AcceptedButtons + 1
			v.Visible = true
		else
			v.Visible = false
		end
	end
end

function MakeSelectableText(Par)
	local Tab = Par:GetChildren()
	if Par.ClassName == "ScrollingFrame" then
		local StoredTabItem = Tab[2]
		Tab = {Tab[1]}
		if Par:FindFirstChildOfClass("TextBox") and Par:FindFirstChildOfClass("TextButton") then
			Tab[2] = StoredTabItem
		end
	end
	for i, v in pairs(Tab) do
		local Button = CloneButton(TempColorItemButton, tostring(v), TempColorItemButton.Parent)
        Button.MouseButton1Down:connect(function()
			GetPropertys(v)
			SelectedPropertyItem = v
			DoSelectionMode(TempColorItemButton.Parent, Button, TempColorItemButton)
		end)
		MakeSelectableText(v)
	end
end

function GetPropertys(Par)
	for i, v in pairs(ToColorItemList:GetChildren()) do
		if v ~= PropertyLabel then
			v:remove()
		end
	end
	for i = 1, #PropertyTab do
		local Val;
		local Bool = pcall(function() Val = Par[PropertyTab[i]] end)
		if Bool == true then
			MakePropertyTab(Par, PropertyTab[i], Val)
		end
	end
	if Par:IsA("ScrollingFrame") then
		local Button = Instance.new("TextButton")
		Button.Size = PropertyLabel.Size
		Button.Name = PropertyLabel.Name
		Button.BackgroundColor3 = PropertyLabel.BackgroundColor3
		Button.BackgroundTransparency = PropertyLabel.BackgroundTransparency
		Button.BorderSizePixel = PropertyLabel.BorderSizePixel
		Button.Visible = true
		Button.Font = PropertyLabel.Font
		Button.TextColor3 = PropertyLabel.TextColor3
		Button.TextScaled = true
		Button.Position = UDim2.new(0, 0, 0, Button.Size.Y.Offset*(#ToColorItemList:GetChildren()-1))
		ToColorItemList.CanvasSize = UDim2.new(0, 0, 0, Button.Size.Y.Offset*#ToColorItemList:GetChildren())
		Button.Parent = ToColorItemList
		local Prop = PropertyBox:Clone()
		Prop.Parent = Button
		local SM = SelectionMode[Par]
		if SM == nil then
			SM = "Back"
		elseif typeof(SM) == "Color3" then
			local IgnoreVal, ConvVal = ConvertInputedText(SM, tostring(SM))
			Prop.Text = ConvVal
			SM = "BkgrSelC3"
		end
		Button.Text = SM
		Button.MouseButton1Down:connect(function()
			if SM == "BackTr" then
				SelectionMode[Par] = Par:GetChildren()[1].BackgroundColor3
				local IgnoreVal, ConvVal = ConvertInputedText(SelectionMode[Par], tostring(SelectionMode[Par]))
				Prop.Text = ConvVal
				SM = "BkgrSelC3"
			elseif SM == "BkgrSelC3" then
				SM = "Border"
				SelectionMode[Par] = SM
			else
				SM = "BackTr"
				SelectionMode[Par] = "Back"
			end
			Button.Text = SM
			local OriginalButton = Par:GetChildren()[1]
			for i, v in pairs(Par:GetChildren()) do
				if v ~= OriginalButton then
					SingleButtonSelection(Par, v, OriginalButton, true)
				end
				if v:FindFirstChildOfClass("TextButton") and v:IsA("TextButton") then
					SingleButtonSelection(Par, v:FindFirstChildOfClass("TextButton"), OriginalButton, true)
				end
			end
		end)
		Prop.FocusLost:connect(function()
			if SM == "BkgrSelC3" then
				local IgnoreVal, ConvVal = ConvertInputedText(Color3.new(), Prop.Text)
				SelectionMode[Par] = IgnoreVal
				Prop.Text = ConvVal
				local OriginalButton = Par:GetChildren()[1]
				for i, v in pairs(Par:GetChildren()) do
					if v ~= OriginalButton then
						SingleButtonSelection(Par, v, OriginalButton, true)
					end
					if v:FindFirstChildOfClass("TextButton") and v:IsA("TextButton") then
						SingleButtonSelection(Par, v:FindFirstChildOfClass("TextButton"), OriginalButton, true)
					end
				end
			end
		end)
	end
end

function TN(N, Val)
	N = tonumber(N)
	if N == nil then
		N = 0
	elseif Val ~= nil and N < 1.01 then
		N = N * 255
	end
	return RoundNumber(N, 100)
end

function ConvertInputedText(Prop, Txt)
	if typeof(Prop) == "number" then
		local N = tonumber(Txt)
		if N == nil then
			N = 0
		end
		N = RoundNumber(N, 100)
		return N, tostring(N)
	elseif typeof(Prop) == "Color3" then
		local Tab = string.split(Txt, ",")
		local R, G, B = TN(Tab[1], true), TN(Tab[2], true), TN(Tab[3], true)
		return Color3.fromRGB(R, G, B), (tostring(R)..", "..tostring(G)..", "..tostring(B))
	end
	return 0, ""
end

function MakePropertyTab(Par, Prop, Val)
	local Box = PropertyLabel:Clone()
	Box.Visible = true
	Box.Text = PropertyNameTab[Prop]
	local PVal, PTxt = ConvertInputedText(Par[Prop], tostring(Val))
	Box.PropertyBox.Text = PTxt
	Box.Position = UDim2.new(0, 0, 0, Box.Size.Y.Offset*(#ToColorItemList:GetChildren()-1))
	ToColorItemList.CanvasSize = UDim2.new(0, 0, 0, Box.Size.Y.Offset*#ToColorItemList:GetChildren())
	Box.Parent = ToColorItemList
	Box.PropertyBox.FocusLost:connect(function()
		local PVal, PTxt = ConvertInputedText(Par[Prop], Box.PropertyBox.Text)
		Box.PropertyBox.Text = PTxt
		--Par[Prop] = PVal
		for i, v in pairs(Par.Parent:GetChildren()) do
			if v.Name == Par.Name then
				v[Prop]= PVal
			end
			if v:IsA("TextButton") and v:FindFirstChildOfClass("TextButton") then
				v:FindFirstChildOfClass("TextButton")[Prop] = PVal
			end
		end
	end)
end

--Color Gui End--

KitItemList = Instance.new("ScrollingFrame", MainFrame)
KitItemList.Name = "KitItemList"
KitItemList.Active = true
KitItemList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
KitItemList.BackgroundTransparency = 0.4
KitItemList.BorderSizePixel = 0
KitItemList.Position = UDim2.new(1, -100, 0, 25)
KitItemList.Size = UDim2.new(0, 100, 0, 75)
KitItemList.Visible = false
KitItemList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
KitItemList.ScrollBarThickness = 4
ScrollableItem(KitItemList)
InsertInto("Custom Kits", KitItemList)

TempKitItemButton = Instance.new("TextButton", KitItemList)
TempKitItemButton.Name = "TempKitItemButton"
TempKitItemButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TempKitItemButton.BackgroundTransparency = 0.5
TempKitItemButton.BorderSizePixel = 0
TempKitItemButton.Size = UDim2.new(1, -4, 0, 30)
TempKitItemButton.Visible = false
TempKitItemButton.Font = Enum.Font.SciFi
TempKitItemButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempKitItemButton.TextScaled = true
TempKitItemButton.TextSize = 14
TempKitItemButton.TextWrapped = true
local EditingTable = {}
function DisplayCustomKits(Tab, Editing, TabName)
    for i, v in pairs(KitItemList:GetChildren()) do
        if v ~= TempKitItemButton then
            v:remove()
        end
    end
    if Editing ~= nil and TabName ~= nil then
        KitName.Text = TabName
    end
    for i, v in pairs(Tab) do
        local Button = TempKitItemButton:Clone()
        Button.Visible = true
        if Editing == nil then
            Button.Text = i
        else
            if typeof(v) == "table" then
                Button.Text = v[1]
                if v[2] ~= nil then
                    Button.Text = Button.Text.." :#"..tostring(v[2])
                end
            else
                Button.Text = v
            end
        end
        Button.Position = UDim2.new(0, 0, 0, 30*(#KitItemList:GetChildren()-1))
        KitItemList.CanvasSize = UDim2.new(0, 0, 0, 30*#KitItemList:GetChildren())
        Button.Parent = KitItemList
        Button.MouseButton1Down:connect(function()
            if Editing ~= nil then
                table.remove(EditingTable, i)
                DisplayCustomKits(EditingTable, true, TabName)
            elseif typeof(v) == "table" then
                EditingTable = v
                DisplayCustomKits(v, true, i)
            end
        end)
    end
end

ItemAmountBox = Instance.new("TextBox", MainFrame)
ItemAmountBox.Name = "ItemAmountBox"
ItemAmountBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ItemAmountBox.BackgroundTransparency = 0.4
ItemAmountBox.BorderSizePixel = 0
ItemAmountBox.Position = UDim2.new(1, -50, 1, -90)
ItemAmountBox.Size = UDim2.new(0, 50, 0, 30)
ItemAmountBox.Visible = false
ItemAmountBox.Font = Enum.Font.SciFi
ItemAmountBox.PlaceholderColor3 = Color3.fromRGB(98, 98, 98)
ItemAmountBox.PlaceholderText = "Amount"
ItemAmountBox.Text = ""
ItemAmountBox.TextColor3 = Color3.fromRGB(0, 0, 0)
ItemAmountBox.TextScaled = true
ItemAmountBox.TextSize = 14
ItemAmountBox.TextWrapped = true
InsertInto("Custom Kits", ItemAmountBox)

AddButton = Instance.new("TextButton", MainFrame)
AddButton.Name = "AddButton"
AddButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AddButton.BackgroundTransparency = 0.5
AddButton.BorderSizePixel = 0
AddButton.Position = UDim2.new(1, -100, 1, -90)
AddButton.Size = UDim2.new(0, 50, 0, 30)
AddButton.Visible = false
AddButton.Font = Enum.Font.SciFi
AddButton.Text = "Add"
AddButton.TextColor3 = Color3.fromRGB(0, 0, 0)
AddButton.TextScaled = true
AddButton.TextSize = 14
AddButton.TextWrapped = true
InsertInto("Custom Kits", AddButton)
AddButton.MouseButton1Down:connect(function()
    if SelectedItem == nil then
        return
    end
    local TItem = tostring(SelectedItem)
    if tonumber(ItemAmountBox.Text) ~= nil and tonumber(ItemAmountBox.Text) > 1 then
        TItem = {TItem, tonumber(ItemAmountBox.Text)}
    end
    table.insert(EditingTable, TItem)
    DisplayCustomKits(EditingTable, true)
end)

DeleteButton = Instance.new("TextButton", MainFrame)
DeleteButton.Name = "DeleteButton"
DeleteButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DeleteButton.BackgroundTransparency = 0.5
DeleteButton.BorderSizePixel = 0
DeleteButton.Position = UDim2.new(1, -100, 1, -60)
DeleteButton.Size = UDim2.new(0, 100, 0, 30)
DeleteButton.Visible = false
DeleteButton.Font = Enum.Font.SciFi
DeleteButton.Text = "Delete Kit"
DeleteButton.TextColor3 = Color3.fromRGB(0, 0, 0)
DeleteButton.TextScaled = true
DeleteButton.TextSize = 14
DeleteButton.TextWrapped = true
InsertInto("Custom Kits", DeleteButton)
DeleteButton.MouseButton1Down:connect(function()
    DeleteKitF(KitName.Text)
    wait()
    SetupCustomKits()
    DisplayKits()
    DisplayCustomKits(ReturnList)
end)

CreateButton = Instance.new("TextButton", MainFrame)
CreateButton.Name = "CreateButton"
CreateButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CreateButton.BackgroundTransparency = 0.5
CreateButton.BorderSizePixel = 0
CreateButton.Position = UDim2.new(1, -100, 1, -30)
CreateButton.Size = UDim2.new(0, 100, 0, 30)
CreateButton.Visible = false
CreateButton.Font = Enum.Font.SciFi
CreateButton.Text = "Create Kit"
CreateButton.TextColor3 = Color3.fromRGB(0, 0, 0)
CreateButton.TextScaled = true
CreateButton.TextSize = 14
CreateButton.TextWrapped = true
InsertInto("Custom Kits", CreateButton)
CreateButton.MouseButton1Down:connect(function()
    if #EditingTable < 1 then
        return
    end
    local TempKitString = "{"..KitName.Text..":"
    for i = 1, #EditingTable do
        local TempKitItem = EditingTable[i]
        if typeof(TempKitItem) == "table" then
            TempKitItem = TempKitItem[1].."#"..tostring(TempKitItem[2])
        end
        TempKitString = TempKitString..TempKitItem..";"
    end
    TempKitString = TempKitString.."},"
    DeleteKitF(KitName.Text, TempKitString)
    wait()
	EditingTable = {}
    SetupCustomKits()
    DisplayKits()
    DisplayCustomKits(ReturnList)
end)

KitName = Instance.new("TextBox", MainFrame)
KitName.Name = "KitName"
KitName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
KitName.BackgroundTransparency = 0.4
KitName.BorderSizePixel = 0
KitName.Position = UDim2.new(1, -100, 1, -120)
KitName.Size = UDim2.new(0, 100, 0, 30)
KitName.Visible = false
KitName.Font = Enum.Font.SciFi
KitName.PlaceholderColor3 = Color3.fromRGB(98, 98, 98)
KitName.PlaceholderText = "KitName"
KitName.Text = ""
KitName.TextColor3 = Color3.fromRGB(0, 0, 0)
KitName.TextScaled = true
KitName.TextSize = 14
KitName.TextWrapped = true
InsertInto("Custom Kits", KitName)

BanList = Instance.new("ScrollingFrame", MainFrame)
BanList.Name = "BanList"
BanList.Active = true
BanList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
BanList.BackgroundTransparency = 1
BanList.BorderSizePixel = 0
BanList.Position = UDim2.new(1, -200, 0, 55)
BanList.Size = UDim2.new(0, 100, 0, 165)
BanList.Visible = false
BanList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
BanList.ScrollBarThickness = 4
ScrollableItem(BanList, 60)
InsertInto("Bans", BanList)

TempBanButton = Instance.new("TextButton", BanList)
TempBanButton.Name = "TempBanButton"
TempBanButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TempBanButton.BackgroundTransparency = 0.5
TempBanButton.BorderSizePixel = 0
TempBanButton.Size = UDim2.new(1, -4, 0, 30)
TempBanButton.Visible = false
TempBanButton.Font = Enum.Font.SciFi
TempBanButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TempBanButton.TextScaled = true
TempBanButton.TextSize = 14
TempBanButton.TextWrapped = true

local SelectedBanPlr;
function DisplayBanned(Specific)
	for i, v in pairs(BanList:GetChildren()) do
		if v ~= TempBanButton then
			v:remove()
		end
	end
	for i, v in pairs(Banned) do
		if Specific == nil or string.match(string.lower(i), string.lower(Specific)) then
			local Button = CloneButton(TempBanButton, i, BanList)
			Button.MouseButton1Down:connect(function()
				DoSelectionMode(BanList, Button, TempBanButton)
				SelectedBanPlr = i
			end)
			if SelectedBanPlr == i then
				SingleButtonSelection(BanList, Button, TempBanButton, true)
			end
		end
	end
end

BanButton = Instance.new("TextButton", MainFrame)
BanButton.Name = "BanButton"
BanButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BanButton.BackgroundTransparency = 0.5
BanButton.BorderSizePixel = 0
BanButton.Position = UDim2.new(1, -100, 1, -60)
BanButton.Size = UDim2.new(0, 100, 0, 30)
BanButton.Visible = false
BanButton.Font = Enum.Font.SciFi
BanButton.Text = "Ban"
BanButton.TextColor3 = Color3.fromRGB(0, 0, 0)
BanButton.TextScaled = true
BanButton.TextSize = 14
BanButton.TextWrapped = true
InsertInto("Bans", BanButton)
BanButton.MouseButton1Down:connect(function()
	if SelectedPlayer ~= nil then
		Banned[tostring(SelectedPlayer)] = true
		Kick(SelectedPlayer)
		SaveBans()
		DisplayBanned()
	end
end)

RemoveBanButton = Instance.new("TextButton", MainFrame)
RemoveBanButton.Name = "RemoveBanButton"
RemoveBanButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RemoveBanButton.BackgroundTransparency = 0.5
RemoveBanButton.BorderSizePixel = 0
RemoveBanButton.Position = UDim2.new(1, -100, 1, -30)
RemoveBanButton.Size = UDim2.new(0, 100, 0, 30)
RemoveBanButton.Visible = false
RemoveBanButton.Font = Enum.Font.SciFi
RemoveBanButton.Text = "Unban"
RemoveBanButton.TextColor3 = Color3.fromRGB(0, 0, 0)
RemoveBanButton.TextScaled = true
RemoveBanButton.TextSize = 14
RemoveBanButton.TextWrapped = true
InsertInto("Bans", RemoveBanButton)
RemoveBanButton.MouseButton1Down:connect(function()
	if SelectedBanPlr ~= nil and Banned[SelectedBanPlr] then
		Banned[SelectedBanPlr] = nil
		SaveBans()
		DisplayBanned()
	end
end)

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

function Notify(Text, Time)
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

local S = LPlr.PlayerGui.ViewContents.Storage.SlotScript
onChanged = getsenv(S).onChanged

InventoryFrame = Instance.new("Frame", VictinisGui)
InventoryFrame.Name = "InventoryFrame"
InventoryFrame.BackgroundColor3 = Color3.fromRGB(233, 236, 22)
InventoryFrame.BorderSizePixel = 0
InventoryFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
InventoryFrame.Size = UDim2.new(0, 350, 0, 250)
InventoryFrame.Visible = false
MoveableItem(InventoryFrame)

InventoryBar = Instance.new("TextLabel", InventoryFrame)
InventoryBar.Name = "InventoryBar"
InventoryBar.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
InventoryBar.BackgroundTransparency = 0.4
InventoryBar.BorderSizePixel = 0
InventoryBar.Size = UDim2.new(1, 0, 0, 25)
InventoryBar.Font = Enum.Font.SciFi
InventoryBar.Text = "Victini's Inventory Viewer"
InventoryBar.TextColor3 = Color3.fromRGB(0, 0, 0)
InventoryBar.TextScaled = true
InventoryBar.TextSize = 14
InventoryBar.TextWrapped = true

InventoryClose = Instance.new("TextButton", InventoryBar)
InventoryClose.Name = "InventoryClose"
InventoryClose.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
InventoryClose.BackgroundTransparency = 0.9
InventoryClose.BorderSizePixel = 0
InventoryClose.Position = UDim2.new(1, -25, 0, 0)
InventoryClose.Size = UDim2.new(0, 25, 0, 25)
InventoryClose.Font = Enum.Font.SourceSans
InventoryClose.Text = "X"
InventoryClose.TextColor3 = Color3.fromRGB(0, 0, 0)
InventoryClose.TextScaled = true
InventoryClose.TextSize = 14
InventoryClose.TextWrapped = true
InventoryClose.MouseButton1Down:connect(function()
    InventoryFrame.Visible = false
end)

SepBar = Instance.new("Frame", InventoryFrame)
SepBar.Name = "SepBar"
SepBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SepBar.BorderSizePixel = 0
SepBar.Position = UDim2.new(0.5, 0, 0, 25)
SepBar.Size = UDim2.new(0, 1, 1, -25)

InventoryButton = Instance.new("ImageButton", InventoryFrame)
InventoryButton.Name = "InventoryButton"
InventoryButton.BackgroundTransparency = 1
InventoryButton.BorderSizePixel = 0
InventoryButton.Position = UDim2.new(0, 0, 0.1, 0)
InventoryButton.Size = UDim2.new(0, 35, 0, 35)
InventoryButton.Visible = false
InventoryButton.Image = ""
InventoryButton.ImageColor3 = Color3.fromRGB(255, 255, 255)

ClipValue = Instance.new("TextLabel", InventoryButton)
ClipValue.Name = "ClipValue"
ClipValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ClipValue.BackgroundTransparency = 1
ClipValue.Position = UDim2.new(0, 0, 0.7, 0)
ClipValue.Size = UDim2.new(1, 0, 0.25, 0)
ClipValue.Text = "5"
ClipValue.TextColor3 = Color3.fromRGB(255, 255, 255)
ClipValue.TextSize = 14
ClipValue.TextWrapped = true

GunValue = Instance.new("StringValue", InventoryButton)
GunValue.Name = "guntext"

LocalPlayerInventory = Instance.new("ScrollingFrame", InventoryFrame)
LocalPlayerInventory.Name = "LocalPlayerInventory"
LocalPlayerInventory.Active = true
LocalPlayerInventory.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LocalPlayerInventory.BackgroundTransparency = 1
LocalPlayerInventory.BorderSizePixel = 0
LocalPlayerInventory.Position = UDim2.new(0, 0, 0, 25)
LocalPlayerInventory.Size = UDim2.new(0.5, 0, 1, -25)
LocalPlayerInventory.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
LocalPlayerInventory.ScrollBarThickness = 5

OpPlayerInventory = Instance.new("ScrollingFrame", InventoryFrame)
OpPlayerInventory.Name = "OpPlayerInventory"
OpPlayerInventory.Active = true
OpPlayerInventory.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OpPlayerInventory.BackgroundTransparency = 1
OpPlayerInventory.BorderSizePixel = 0
OpPlayerInventory.Position = UDim2.new(0.5, 0, 0, 25)
OpPlayerInventory.Size = UDim2.new(0.5, 0, 1, -25)
OpPlayerInventory.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
OpPlayerInventory.ScrollBarThickness = 5

function DeterminSpace(Plr, SelectedItem)
    local Stats = Plr.playerstats
    Bag = Stats.slots.slotbackpack:FindFirstChild("ObjectID")
    local ItemSpace = 0
    if SelectedItem ~= nil then
        ItemSpace = SlotsTab[Deob(SelectedItem.Value)]
    end
    if ItemSpace == nil then
        ItemSpace = 0
    end
    local ExtraSpace = 0
    if Bag ~= nil then
        local BOb = Deob(Bag.Value)
        for i, v in pairs(Loot:GetChildren()) do
            if Bags:FindFirstChild(tostring(v)) and Deob(v.ObjectID.Value) == BOb then
                ExtraSpace = BagSpace[string.sub(tostring(v), 1, 3)]
                break
            end
        end
    end
    local Total = 0
    local OpenSlot = nil
    for i, v in pairs(Stats.slots:GetChildren()) do
        if tonumber(string.sub(v.Name, 5)) ~= nil and v:FindFirstChild("ObjectID") then
            local Amount = SlotsTab[Deob(v.ObjectID.Value)]
            if Amount == nil then
                Amount = 1
            end
            Total = Total + Amount
        elseif tonumber(string.sub(v.Name, 5)) ~= nil and not v:FindFirstChild("ObjectID") and OpenSlot == nil then
            OpenSlot = v
        end
    end
    return (12+ExtraSpace)-Total-ItemSpace, OpenSlot
end

function TransferItem(Plr, Ob)
	local TransferTo = LPlr
	local TransferFrom = LPlr
	if Plr == LPlr then
		TransferTo = ToWatchTab[2]
	else
		TransferFrom = ToWatchTab[2]
	end
	if TransferTo == nil or TransferFrom == nil then
		return
	end
	local OpenSpace, OpenSlot = DeterminSpace(TransferTo, Ob)
	if OpenSpace > 0 and OpenSlot ~= nil then
		fireserver("ChangeValue", Ob.Parent, 0)
		fireserver("ChangeParent", Ob, OpenSlot)
		fireserver("ChangeValue", OpenSlot, 1)
	end
end

PlrInventoryTab = {}
function UpdatePlayerInventory(Plr, Scroll)
    for i, v in pairs(Scroll:GetChildren()) do
        v:remove()
    end
    local ToChose = {}
    if PlrInventoryTab[Scroll] == nil then
        PlrInventoryTab[Scroll] = {}
    end
    PlrInventoryTab[Scroll]["Selected"] = Plr
    for i, v in pairs(PlrInventoryTab[Scroll]) do
        if i ~= "Selected" then
            PlrInventoryTab[Scroll][i] = nil
        end
    end
    for i, v in pairs(Plr.playerstats:GetDescendants()) do
        if v:FindFirstChild("ObjectID") then
            table.insert(ToChose, v)
        end
    end
    local X, Y = 0, 0
    for i = 1, #ToChose do
        local Button = InventoryButton:Clone()
        Button.Parent = Scroll
        Button.Position = UDim2.new(0, 35*X, 0, 35*Y)
        Button.Visible = true
        PlrInventoryTab[Scroll][Button] = ToChose[i]
        spawn(function()
            repeat
                wait()
            until Button:FindFirstChild("guntext") and Button:FindFirstChild("ClipValue")
			pcall(function()
				onChanged(Button, ToChose[i])
			end)
        end)
		Button.MouseButton1Down:connect(function()
			TransferItem(Plr, ToChose[i]:FindFirstChild("ObjectID"))
		end)
        X = X + 1
        if X >= 5 then
            X = 0
            Y = Y + 1
        end
    end
end


ToWatchTab = {}
function SetupWatch(Plr, Val)
	ToWatchTab[Val] = Plr
	local SelectedFrameForWatching = LocalPlayerInventory
	if Val == 2 then
		SelectedFrameForWatching = OpPlayerInventory
	end
	UpdatePlayerInventory(Plr, SelectedFrameForWatching)
	local AlreadySorting = false
	local ConFunc = function(Ob)
		wait(0.1)
		if tostring(Ob) == "ObjectID" and AlreadySorting == false then
			AlreadySorting = true
			UpdatePlayerInventory(Plr, SelectedFrameForWatching)
			AlreadySorting = false
		end
	end
	local Con1 = Plr.playerstats.DescendantAdded:connect(ConFunc)
	local Con2 = Plr.playerstats.DescendantRemoving:connect(ConFunc)
	spawn(function()
		repeat
			wait()
		until ToWatchTab[Val] == nil or Plr == nil or ToWatchTab[Val] ~= Plr
		Con1:Disconnect()
		Con2:Disconnect()
	end)
end
SetupWatch(LPlr, 1)

ChatList = Instance.new("ScrollingFrame", MainFrame)
ChatList.Name = "ChatList"
ChatList.Active = true
ChatList.BackgroundColor3 = Color3.fromRGB(28, 191, 223)
ChatList.BackgroundTransparency = 1
ChatList.BorderSizePixel = 0
ChatList.Position = UDim2.new(1, -200, 0, 25)
ChatList.Size = UDim2.new(0, 200, 0, 165)
ChatList.Visible = false
ChatList.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
ChatList.ScrollBarThickness = 4
InsertInto("Chat", ChatList)

TempChatListLabel = Instance.new("TextLabel", ChatList)
TempChatListLabel.Name = "TempChatListLabel"
TempChatListLabel.Active = true
TempChatListLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TempChatListLabel.BackgroundTransparency = 0.5
TempChatListLabel.BorderSizePixel = 0
TempChatListLabel.Size = UDim2.new(1, -4, 0, 30)
TempChatListLabel.Visible = false
TempChatListLabel.Font = Enum.Font.SciFi
TempChatListLabel.Text = "Crap..."
TempChatListLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TempChatListLabel.TextScaled = true
TempChatListLabel.TextSize = 14
TempChatListLabel.TextWrapped = true
TempChatListLabel.TextXAlignment = Enum.TextXAlignment.Left
TempChatListLabel.TextYAlignment = Enum.TextYAlignment.Top

function MakeChatListLabel(Txt)
	if #ChatList:GetChildren() > 10 then
		for i, v in pairs(ChatList:GetChildren()) do
			if v ~= TempChatListLabel then
				v.Position = v.Position - UDim2.new(0, 0, 0, TempChatListLabel.Size.Y.Offset)
				if v.Position.Y.Offset < 0 then
					v:Destroy()
				end
			end
		end
	end
	local Button = CloneButton(TempChatListLabel, Txt, ChatList)
	ChatList.CanvasPosition = Vector2.new(0, 350)
    return Button
end

function AddChat(Player, Message)
	MakeChatListLabel(tostring(Player)..": "..tostring(Message))
end

ChatBox = Instance.new("TextBox", MainFrame)
ChatBox.Name = "ChatBox"
ChatBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ChatBox.BackgroundTransparency = 0.5
ChatBox.BorderSizePixel = 0
ChatBox.Position = UDim2.new(0, 80, 1, -30)
ChatBox.Size = UDim2.new(0, 200, 0, 30)
ChatBox.Visible = false
ChatBox.CursorPosition = -1
ChatBox.MultiLine = true
ChatBox.Font = Enum.Font.SourceSans
ChatBox.PlaceholderColor3 = Color3.fromRGB(108, 108, 108)
ChatBox.PlaceholderText = "Chat Here"
ChatBox.Text = ""
ChatBox.TextColor3 = Color3.fromRGB(0, 0, 0)
ChatBox.TextScaled = true
ChatBox.TextSize = 14
ChatBox.TextWrapped = true
ChatBox.TextXAlignment = Enum.TextXAlignment.Left
ChatBox.TextYAlignment = Enum.TextYAlignment.Top
InsertInto("Chat", ChatBox)
ChatBox:GetPropertyChangedSignal("Text"):connect(function()
	if string.find(ChatBox.Text, "\n") then
		ChatBox:ReleaseFocus()
		local TextToSend = string.split(ChatBox.Text, "\n")[1]
		ChatBox.Text = ""
		fireserver("ChangeParentLocal", {["RequestType"] = "Chat", ["Message"] = TextToSend, ["Player"] = game.Players.LocalPlayer})
		AddChat(game.Players.LocalPlayer, TextToSend)
	end
end)

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

game.Workspace.Remote.ChangeParentLocal.OnClientEvent:connect(function(Tab)
    if type(Tab) == "table" then
    	HandleRequest(Tab)
    end
end)

ExploiterLabel = Instance.new("TextLabel")
ExploiterLabel.Name = "ExploiterLabel"
ExploiterLabel.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
ExploiterLabel.BackgroundTransparency = 0.7
ExploiterLabel.BorderColor3 = Color3.fromRGB(110, 172, 216)
ExploiterLabel.BorderSizePixel = 0
ExploiterLabel.Size = UDim2.new(0, 56, 0, 16)
ExploiterLabel.Font = Enum.Font.SourceSans
ExploiterLabel.TextColor3 = Color3.fromRGB(255, 125, 125)
ExploiterLabel.TextScaled = true
ExploiterLabel.TextSize = 14
ExploiterLabel.TextWrapped = true
ExploiterLabel.Visible = false
ExploiterLabel.Position = UDim2.new(30, 0, 30, 0)
ExploiterLabel.TextXAlignment = Enum.TextXAlignment.Left
local ExploiterLabelSet = false

function UpdateFramePosition(ExpLab, ButtonLabel)
	local ExpXPos = GetSize(ButtonLabel.Text, ButtonLabel.TextSize, ButtonLabel.Font, ButtonLabel.Size.X.Offset, 1, true).X
	local ButXPos = GetSize(ExpLab.Text, ExpLab.TextSize, ExpLab.Font, ExpLab.Size.X.Offset, 1, true).X
	ExpLab.Position = UDim2.new(1, -(ExpXPos+ButXPos+24), 0, 0)
end

function AddPlayerToExploitList(Plr, Exp)
	local InGamePlayerList = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MyGroup"):WaitForChild("Bin")
	repeat
		wait()
	until ExploiterLabelSet
	for i, v in pairs(InGamePlayerList:GetChildren()) do
		if v:IsA("TextButton") and string.sub(v.Text, 1, string.len(v.Text)-2) == tostring(Plr) then
			if v:FindFirstChild("ExploiterLabel") then
				v.ExploiterLabel.Text = Exp
				UpdateFramePosition(v.ExploiterLabel, v)
				return
			end
			local LA = ExploiterLabel:Clone()
			LA.Parent = v
			LA.Position = UDim2.new(-1, 0, 0, 0)
			LA.Text = Exp
			LA.Visible = true
			UpdateFramePosition(LA, v)
		end
	end
end

function HandleExploitPlayerList()
	local InGamePlayerList = LPlr.PlayerGui:WaitForChild("MyGroup"):WaitForChild("Bin")
	wait(1)
	for i, v in pairs(InGamePlayerList:GetChildren()) do
		if v:IsA("TextButton") and string.sub(v.Name, 1, 1) == "M" then
			if not ExploiterLabelSet then
				ExploiterLabelSet = true
				ExploiterLabel.Size = UDim2.new(v.Size.X.Scale*0.8, v.Size.X.Offset*0.8, v.Size.Y.Scale, v.Size.Y.Offset)
				ExploiterLabel.BackgroundColor3 = v.BackgroundColor3
				ExploiterLabel.BackgroundTransparency = v.BackgroundTransparency
			end
			v:GetPropertyChangedSignal("Text"):connect(function()
				local STx = string.sub(v.Text, 1, string.len(v.Text)-2)
				if v:FindFirstChild("ExploiterLabel") then
					v.ExploiterLabel:Destroy()
				end
				if ExploitersList[STx] then
					local LA = ExploiterLabel:Clone()
					LA.Parent = v
					LA.Position = UDim2.new(-1, 0, 0, 0)
					LA.Text = ExploitersList[STx]
					LA.Visible = true
					UpdateFramePosition(LA, v)
				end
			end)
			local STx = string.sub(v.Text, 1, string.len(v.Text)-2)
			if ExploitersList[STx] then
				local LA = ExploiterLabel:Clone()
				LA.Parent = v
				LA.Position = UDim2.new(-1, 0, 0, 0)
				LA.Text = ExploitersList[STx]
				LA.Visible = true
				UpdateFramePosition(LA, v)
			end
		end
	end
end
spawn(function()
	HandleExploitPlayerList()
end)
LPlr.PlayerGui.ChildAdded:connect(function(Ch)
	if tostring(Ch) == "MyGroup" then
		HandleExploitPlayerList()
	end
end)
fireserver("ChangeParentLocal", {["RequestType"] = "Script", ["Message"] = "VictiniV2", ["Player"] = game.Players.LocalPlayer})

TextName = "Custom Kits"
KitsList = {}
ReturnList = {}
local A = pcall(function() KitsList = readfile(TextName..".txt") end)
if A == false then
    writefile(TextName..".txt", "")
end

function Sep(Tx)
local Tabs = {}
local Open = false
local Last = 0
for i = 1, string.len(Tx) do
if string.sub(Tx, i, i) == "{" then
Open = true
Last = i
elseif string.sub(Tx, i, i) == "}" then
if Open == true then
Open = false
table.insert(Tabs, string.sub(Tx, Last+1, i-1))
end
end
end
return Tabs
end

function MakeIndividual(Tabs)
if #Tabs < 1 then
return
end
ReturnList = {}
for i = 1, #Tabs do
local KitName = ""
local Items = {}
local Start = 0
for a = 1, string.len(Tabs[i]) do
if string.sub(Tabs[i], a, a) == ":" then
KitName = string.sub(Tabs[i], 1, a-1)
Start = a
elseif string.sub(Tabs[i], a, a) == ";" then
local TempItem = string.sub(Tabs[i], Start+1, a-1)
if string.match(TempItem, "#") then
local Val1 = string.split(TempItem, "#")
Val1[2] = tonumber(Val1[2])
TempItem = Val1
end
table.insert(Items, TempItem)
Start = a
end
end
KitsList[KitName] = Items
ReturnList[KitName] = Items
end
end

function SetupCustomKits()
KitsList = {["M14"] = {"M14", {"M14Ammo50", 4}, "ACOG", "Grip", "Suppressor762", "MilitaryPackBlack"},
["Spec Ops"] = {"CamoSpecialBottom", "CamoSpecialTop", "BallisticSpecOps", "MaskSpecOps"},
["Additions"] = {"GPS", "Map", "Sabre", "GreenChemlight", "Entrencher"}}
MakeIndividual(Sep(readfile("Custom Kits.txt")))
end
SetupCustomKits()
DisplayKits()
DisplayCustomKits(ReturnList)

function DeleteKitF(KN, Val)
local TempKitListText = readfile(TextName..".txt")
for i = 1, string.len(TempKitListText) do
if string.sub(TempKitListText, i, i+string.len(KN)) == KN..":" then
local End = 0
repeat
End = End+1
until string.sub(TempKitListText, i+End, i+End) == "}"
if i == 2 then
TempKitListText = string.sub(TempKitListText, i+End+2)
else
TempKitListText = string.sub(TempKitListText, 1, i-2)..string.sub(TempKitListText, i+End+2)
end
if Val ~= nil then
    TempKitListText = TempKitListText..Val
end
writefile(TextName..".txt", TempKitListText)
return
end
end
if Val ~= nil then
    TempKitListText = TempKitListText..Val
    writefile(TextName..".txt", TempKitListText)
end
end

function HandleCommands(PlrTab, Func, Args)
    if PlrTab == nil then
        PlrTab = {}
    end
    if Args == nil then
        Args = {}
    end
    if #PlrTab > 0 then
        for i = 1, #PlrTab do
            Func(PlrTab[i], unpack(Args))
        end
    else
        Func(unpack(Args))
    end
end

function SpawnTab(Plr, Tab)
    for i = 1, #Tab do
        local KItem = Tab[i]
        local KAmount = 1
        if typeof(KItem) == "table" then
            KAmount = KItem[2]
            KItem = KItem[1]
        end
        if Mats:FindFirstChild(KItem) then
            KItem = Mats:FindFirstChild(KItem)
        elseif Loot:FindFirstChild(KItem) then
            KItem = Loot:FindFirstChild(KItem)
        else
            return
        end
        for a = 1, KAmount do
            Count()
            spawn(function()
                SpawnItem(Plr, KItem, Loot, Vector3.new(math.random(-5, 5), 2.5, math.random(-5, 5)), true)
            end)
        end
    end
end

function SpawnVehicle(Plr, Veh, V)
    local X, Y = math.random(15, 20), math.random(15, 20)
    if math.random(1, 4) >= 3 then
        X = X*-1
    end
    if math.random(1, 4) >= 3 then
        Y = Y*-1
    end
	if V == true then
		X, Y = 0, 0;
	end
    Count()
	local Welds = {}
	for i, v in pairs(Veh:GetDescendants()) do
		if v.Name == "SeatWeld" and v.Part1 ~= nil then
			Welds[v] = v.Parent
			fireserver("ChangeParent", v, game.Lighting)
		end
	end
    spawn(function()
        SpawnItem(Plr, Veh, Vehicles, Vector3.new(X, 0, Y), true)
    end)
end

function Kill(Plr)
    if Plr ~= nil and Plr.Character ~= nil and Plr.Character:FindFirstChild("Head") then
        fireserver("ChangeParent", Plr.Character.Head)
    end
end

WatchTab = {}
function God(Plr)
    if Plr.Character == nil or not Plr.Character:FindFirstChild("Humanoid") then
        return
    elseif Plr == LPlr and WatchTab[Plr.Character.Humanoid] == nil then
        WatchTab[Plr.Character.Humanoid] = true
        spawn(function()
            pcall(function()
                while (Plr.Character.Humanoid ~= nil) do
                    if Plr.Character.Humanoid.Health ~= 100 then
                        Plr.Character.Humanoid.Health = 100
                    end
                    wait()
                end
            end)
        end)
		fireserver("Damage", Plr.Character.Humanoid, math.huge)
	elseif Plr ~= LPlr and not Plr.Character.Humanoid:FindFirstChild("Humanoid") then
		R.AddClothing:FireServer("DefenseMultiplier", Plr.Character.Humanoid, "0", "", "")
	elseif Plr ~= LPlr and Plr.Character.Humanoid:FindFirstChild("DefenseMultiplier") then
		fireserver("ChangeParent", Plr.Character.Humanoid.DefenseMultiplier)
		Notify("Ungodded: "..tostring(Plr), 2.5)
		return
    end
    Notify("Godded: "..tostring(Plr), 2.5)
end

function InfiniteHT(Plr)
    if Plr == nil or not Plr:FindFirstChild("playerstats") or not Plr.playerstats:FindFirstChild("Hunger") or not Plr.playerstats:FindFirstChild("Thirst") then
        return
    end
    fireserver("ChangeValue", Plr.playerstats.Hunger, math.huge)
    fireserver("ChangeValue", Plr.playerstats.Thirst, math.huge)
end

function NoHT(Plr)
    if Plr == nil or not Plr:FindFirstChild("playerstats") or not Plr.playerstats:FindFirstChild("Hunger") or not Plr.playerstats:FindFirstChild("Thirst") then
        return
    end
    fireserver("ChangeValue", Plr.playerstats.Hunger, 0)
    fireserver("ChangeValue", Plr.playerstats.Thirst, 0)
end

function InfiniteStamina(Plr)
    local Val = nil
    local Bag = nil
    local A = pcall(function()
        Bag = Plr.Backpack
        Val = Bag.GlobalFunctions.Stamina
    end)
    if A == false or Val == nil then
        return
    elseif Plr ~= nil and Plr ~= LPlr then
        return
    elseif Val ~= nil and WatchTab[Val] ~= nil then
        WatchTab[Val] = nil
        return
    end
    WatchTab[Val] = true
    spawn(function()
        while wait(1) do
            if WatchTab[Val] == nil or Bag.Parent == nil then
                break
            end
           Val.Value = 100
        end
    end)
end

function Kick(Plr, Val)
    if Plr == nil or Plr == LPlr then
        return
    end
    spawn(function()
        R.AddClothing:FireServer("PermanentBan", Plr, "", "", "")
		wait()
		RemoteTable["SpawnCrate"]:FireServer(Plr)
		if Val == nil then
			Notify("Kicked: "..tostring(Plr), 3)
		end
    end)
end

local MatList = {["Part"] = true, ["TrussPart"] = true}

function CheckModel(Mod)
    for i, v in pairs(Mod:GetChildren()) do
        if v:IsA("BasePart") and ItemSizes[tostring(v.Size.X)..tostring(v.Size.Y)..tostring(v.Size.Z)] == true then
            return true
        end
    end
	return false
end

function CleanBuildings(Plr)
    Notify("Attempting to clean server. Warning, this may lag!", 5)
    local ITab = {}
    for i, v in pairs(game.Workspace:GetChildren()) do
        if v:IsA("BasePart") and ItemSizes[tostring(v.Size.X)..tostring(v.Size.Y)..tostring(v.Size.Z)] == true or v:IsA("Model") and (CheckModel(v) == true or v.Name == "Model" or v.Name == "MilitaryPack") or game.Lighting.Hair:FindFirstChild(tostring(v)) then
			table.insert(ITab, v)
		elseif v.Name == "LargeCrateOpen" or v.Name == "SmallCrateOpen" or v.Name == "Floodlight" and v:FindFirstChild("Head") or Loot:FindFirstChild(tostring(v)) and not v:FindFirstChildOfClass("Model") and v.Name ~= "Floodlight" then
			table.insert(ITab, v)
		else
			for a, b in pairs(v:GetChildren()) do
				if game.Lighting.Hair:FindFirstChild(tostring(b)) and not game.Players:FindFirstChild(tostring(v)) then
					table.insert(ITab, v)
					break
				end
			end
		end
    end
	for a, b in pairs(game.Workspace.Vehicles:GetChildren()) do
		for i, v in pairs(b:GetChildren()) do
			if v:IsA("BasePart") and ItemSizes[tostring(v.Size.X)..tostring(v.Size.Y)..tostring(v.Size.Z)] == true or v:IsA("Model") and (CheckModel(v) == true or v.Name == "Model" or v.Name == "MilitaryPack") then
				table.insert(ITab, v)
			end
			if v.Name == "LargeCrateOpen" or v.Name == "SmallCrateOpen" or v.Name == "Floodlight" and v:FindFirstChild("Head") or Loot:FindFirstChild(tostring(v)) and not v:FindFirstChildOfClass("Model") and v.Name ~= "Floodlight" then
				table.insert(ITab, v)
			end
		end
	end
    if #ITab > 7000 then
        MaxAmount = 600
        TimeToWait = 2
    end
    Notify("Amount of items: #"..tostring(#ITab)..", Estimated time: "..tostring(#ITab/MaxAmount*TimeToWait).. " seconds.", 6)
    for i = 1, #ITab do
        fireserver("ChangeParent", ITab[i])
        Count()
    end
    MaxAmount = 1000
    TimeToWait = 1.5
    Notify("Completed Cleaning!")
end

function Clean()
    Notify("Attempting to clean server. Warning, this may lag!", 5)
	for i, v in pairs(Loot:GetChildren()) do
		if v.Name == "Floodlight" and v:FindFirstChild("Head") then
			fireserver("ChangeParent", v, Mats)
		end
	end
	for i, v in pairs(Mats:GetChildren()) do
		if v.Name == "Floodlight" and not v:FindFirstChild("Head") then
			fireserver("ChangeParent", v, Loot)
		end
	end
    local ITab = {}
    for i, v in pairs(game.Workspace:GetChildren()) do
        if (Mats:FindFirstChild(tostring(v)) or Loot:FindFirstChild(tostring(v))) and not v:FindFirstChild("Handle") and not v:FindFirstChild("Head") then
            table.insert(ITab, v)
		elseif v.Name ~= "Floodlight" and Loot:FindFirstChild(tostring(v)) or v.Name == "FloodLight" and not v:FindFirstChild("Head") then
			table.insert(ITab, v)
		end
    end
	for a, b in pairs(game.Workspace.Vehicles:GetChildren()) do
		for i, v in pairs(b:GetChildren()) do
			if (Mats:FindFirstChild(tostring(v)) or Loot:FindFirstChild(tostring(v))) and not v:FindFirstChild("Handle") and not v:FindFirstChild("Head") then
				table.insert(ITab, v)
			elseif v.Name ~= "Floodlight" and Loot:FindFirstChild(tostring(v)) or v.Name == "FloodLight" and not v:FindFirstChild("Head") then
				table.insert(ITab, v)
			end
		end
    end
    if #ITab > 7000 then
        MaxAmount = 600
        TimeToWait = 2
    end
    Notify("Amount of items: #"..tostring(#ITab)..", Estimated time: "..tostring(#ITab/MaxAmount*TimeToWait).. " seconds.", 6)
    for i = 1, #ITab do
        fireserver("ChangeParent", ITab[i])
        Count()
    end
    MaxAmount = 1000
    TimeToWait = 1.5
    Notify("Completed Cleaning!")
end

function NoHitZombie()
    if not game.Workspace:FindFirstChild("Zombies") then
        return
    end
    local ModTab = {}
    for i, v in pairs(game.Workspace.Zombies:GetDescendants()) do
        if v:IsA("BasePart") and ModTab[v.Parent] == nil and not v.Parent:FindFirstChild("thisishat") then
            ModTab[v.Parent] = true
            R.AddClothing:FireServer("thisishat", v.Parent, "", "", "")
            Count()
        end
    end
    if not game.ReplicatedStorage.Zombies.Zombie:FindFirstChild("thisishat") then
        R.AddClothing:FireServer("thisishat", game.ReplicatedStorage.Zombies.Zombie, "", "", "")
    end
    Notify("Zombies are unhitable!", 4)
end

function MakeZombiesHitable()
	if not game.Workspace:FindFirstChild("Zombies") then
		return
	end
	for i, v in pairs(game.Workspace.Zombies:GetDescendants()) do
		if v.Name == "thisishat" then
			fireserver("ChangeParent", v)
			Count()
		end
	end
	for i, v in pairs(game.ReplicatedStorage.Zombies:GetDescendants()) do
		if v.Name == "thisishat" then
			fireserver("ChangeParent", v)
		end
	end
	Notify("Zombies are hitable!", 4)
end

function KillZombies()
	if not game.Workspace:FindFirstChild("Zombies") then
		return
	end
	local Amount = 0
	for i, v in pairs(game.Workspace.Zombies:GetDescendants()) do
		if v:IsA("Humanoid") and v.Health > 0 then
			Amount = Amount + 1
			R.DamageZombie:FireServer(v, 10000)
		end
	end
	Notify("Killed "..tostring(Amount).." zombies!", 4)
end

FullBrightOn = false
function FullBright()
	FullBrightOn = not FullBrightOn
	if FullBrightOn == true then
		game.Lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
		game.Lighting.FogEnd = 1000000
	end
	return FullBrightOn
end

AllowSpawnLoot = true
function AntiSpawn()
    AllowSpawnLoot = not AllowSpawnLoot
    return not AllowSpawnLoot
end

ServerLock = false
function ServerLockF()
	ServerLock = not ServerLock
	return ServerLock
end

function CheckNumber(Numb)
    return tonumber(string.sub(tostring(Numb), 1, 1))
end

function CheckForExploits(val)
    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= LPlr then
            pcall(function()
                if CheckNumber(v.playerstats.Hunger.Value) == nil or CheckNumber(v.playerstats.Thirst.Value) == nil then
                    if not val then
						Notify(tostring(v).." has Infinite vitals!", 6)
					end
					if not ExploitersList[tostring(v)] then
						ExploitersList[tostring(v)] = "Possible Exploiter"
						AddPlayerToExploitList(v, "Possible Exploiter")
					end
                end
				if not v.Character:FindFirstChild("Humanoid") then
					if not val then
						Notify(tostring(v).." is using jj, that loser.", 6)
					end
					ExploitersList[tostring(v)] = "JJSploit"
					AddPlayerToExploitList(v, "JJSploit")
				end
                if tonumber(string.sub(tostring(v.Character.Humanoid.Health), 1, 1)) == nil then
					if not val then
						Notify(tostring(v).." has Infinite health!", 6)
					end
					if not ExploitersList[tostring(v)] or ExploitersList[tostring(v)] == "Possible Exploiter" then
						ExploitersList[tostring(v)] = "Exploiter!"
						AddPlayerToExploitList(v, "Exploiter")
					end
                end
                if v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid:FindFirstChild("DefenseMultiplier") and tonumber(v.Character.Humanoid.DefenseMultiplier.Value) <= 0 then
                    if not val then
						Notify(tostring(v).." has PK God!", 6)
					end
					if not ExploitersList[tostring(v)] or ExploitersList[tostring(v)] == "Possible Exploiter" then
						ExploitersList[tostring(v)] = "Exploiter!"
						AddPlayerToExploitList(v, "Exploiter")
					end
                end
				if v:FindFirstChild("playerstats") and v.playerstats:FindFirstChild("character") and v.playerstats.character:FindFirstChild("AntiTP") then
					if not val then
						Notify(tostring(v).." is using xr hub, quite the useless gui.", 6)
					end
					ExploitersList[tostring(v)] = "XR Hub"
					AddPlayerToExploitList(v, "XRHub")
				end
            end)
        end
    end
end

function GetClosestVehicle(Plr, Veh)
    if Plr == nil or Plr.Character == nil or not Plr.Character:FindFirstChild("Head") then
        return
    end
    local Head = Plr.Character.Head
    local Closest;
    local CPart;
    for i, v in pairs(game.Workspace.Vehicles:GetChildren()) do
        if (Veh and tostring(v) == Veh or not Veh) and v:FindFirstChild("Essentials") and v.Essentials:FindFirstChild("Base") and (Closest == nil or (CPart.Position-Head.Position).Magnitude > (v.Essentials.Base.Position-Head.Position).Magnitude) and (v.Essentials.Base.Position-Head.Position).Magnitude < 120 then
            Closest = v
            CPart = v.Essentials.Base
        end
    end
    return Closest
end

function Unweld(Plr, Val)
    local Veh = GetClosestVehicle(Plr)
    if Veh == nil then return end
    for i, v in pairs(Veh:GetDescendants()) do
        if v:IsA("Weld") and (not string.find(v.Parent.Name, "Icon") and v.Parent.Name ~= "Base" and v.Parent.CanCollide == true or Val ==  true) then
            fireserver("ChangeParent", v)
            v.Parent.Position = v.Parent.Position + Vector3.new(math.random(-3, 3), math.random(-3, 3), math.random(-3, 3))
        end
    end
    return Veh
end
function Pancake(Plr)
    local Veh = Unweld(Plr)
    if Veh == nil then return end
    wait(1.2)
    fireserver("ChangeParent", Veh, game.Lighting)
    fireserver("ChangeParent", Veh, game.Workspace.Vehicles)
end
function FlingCar(Plr, Am)
	local Veh = GetClosestVehicle(Plr)
	if not Veh then return end
	if Am == "math.huge"  then
		Am = math.huge
	elseif not tonumber(Am) then
		Am = 1
	else
		Am = tonumber(Am)
	end
	R.ReplicateVehicle:FireServer(Veh, CFrame.new(), Vector3.new(1000*Am, 0, 1000*Am))
end

function Punish(Plr, Val)
    if Plr == nil or Plr.Character == nil then
        return
    elseif Plr == LPlr and Plr.Character.Parent ~= game.Workspace then
        fireserver("ChangeParent", Plr.Character, game.Workspace)
        return
    elseif Plr == LPlr then
        return
    end
    if Val == false then
        fireserver("ChangeParent", Plr.Character, game.Workspace)
        Notify("Unpunished: "..tostring(Plr))
    else
        fireserver("ChangeParent", Plr.Character, game.Lighting)
        Notify("Punished: "..tostring(Plr))
    end
end

function RemoveHackedVehicles()
    if not game.Workspace:FindFirstChild("Vehicles") then
        return
    end
    local VAmount = 0
    for i, v in pairs(game.Workspace.Vehicles:GetDescendants()) do
        if v.Name == "MaxSpeed" and v.Value > 100 or v.Name == "Hull" and v.Value > 5000 then
            fireserver("ChangeParent", v.Parent.Parent)
            VAmount = VAmount + 1
        end
    end
    Notify("Amount Deleted: "..tostring(VAmount))
end

function CheckZombies()
	local Amount = 0
	if game.Workspace:FindFirstChild("Zombies") then
		for i, v in pairs(game.Workspace.Zombies:GetDescendants()) do
			if v.ClassName == "Humanoid" then
				Amount = Amount + 1
			end
		end
	end
	Notify("Amount of Zombies: "..tostring(Amount), 4)
end

function KeepInventory()
    local Par = game.Lighting
    if Corpse == nil then
        return true
    elseif Corpse.Parent ~= game.ReplicatedStorage then
        Par = game.ReplicatedStorage
    end
    fireserver("ChangeParent", Corpse, Par)
    if Par == game.Lighting then
        return true
    end
    return false
end

function InfiniteAmmo(Plr)
    if Plr == nil or not Plr:FindFirstChild("playerstats") then
        return
    end
    for i, v in pairs(Plr.playerstats:GetDescendants()) do
        if v.Name == "Clip" and v:FindFirstChild("MaxClip") then
            fireserver("ChangeValue", v.MaxClip, 1999999999)
            fireserver("ChangeValue", v, Ob(1999999999))
        end
    end
end

SpammingPlayers = {}
function ToggleSpam(Plr)
	if not SpammingPlayers[Plr] then
		SpammingPlayers[Plr] = false
	end
	SpammingPlayers[Plr] = not SpammingPlayers[Plr]
	local Slots = Plr.playerstats.slots
	if SpammingPlayers[Plr] then
		for i, v in pairs(Slots:GetChildren()) do
			if v:FindFirstChild("ObjectID") and v.ObjectID.Value ~= "PPSBSBaiBp" then
				fireserver("ChangeValue", v.ObjectID, "PPSBSBaiBp")
			end
		end
	end
	while SpammingPlayers[Plr] do
		for i, v in pairs(Slots:GetChildren()) do
			if not SpammingPlayers[Plr] then
				break
			end
			if not v:FindFirstChild("ObjectID") then
				R.AddClothing:FireServer("ObjectID", v, "PPSBSBaiBp", "", "")
				fireserver("ChangeValue", v, 1)
			elseif v:FindFirstChild("ObjectID") and v.ObjectID.Value ~= "PPSBSBaiBp" then
				fireserver("ChangeValue", v.ObjectID, "PPSBSBaiBp")
			end
		end
		wait()
	end
end

function ToggleVest(Plr, Val)
    if Plr and Plr.Character and Val then
        for i, v in pairs(Plr:GetChildren()) do
            if v:FindFirstChild("thisisarmor") then
                fireserver("ChangeParent", v, Plr.Character)
                return
            end
        end
    elseif Plr and Plr.Character and not Val then
        for i, v in pairs(Plr.Character:GetChildren()) do
            if v:FindFirstChild("thisisarmor") then
                fireserver("ChangeParent", v, Plr)
                return
            end
        end
    end
end

function UpdateGun(Gun)
    if Gun:FindFirstChild("Shooter") then
        local Scr = Gun.Shooter
        fireserver("ChangeParent", Scr, game.ReplicatedStorage)
        wait()
        fireserver("ChangeParent", Scr, Gun)
    end
end

function SetStats(Tab, Name, Val, E)
    if typeof(Tab) == "Instance" then
        Tab = {Tab}
    end
    for i = 1, #Tab do
		spawn(function()
			local Stats =  Tab[i]:FindFirstChild("Stats")
			local Extra = Stats[Name]:FindFirstChildOfClass(Stats[Name].ClassName)
			if not Stats or not Stats:FindFirstChild(Name) then
				return false
			end
			if E then
				if Stats[Name]:FindFirstChild("Rate") then
					fireserver("ChangeValue", Stats[Name].Rate, Ob(E))
				else
					R.AddClothing:FireServer("Rate", Stats[Name], Ob(E), "", "")
				end
				repeat
					wait()
				until Stats[Name]:FindFirstChild("Rate")
				UpdateGun(Tab[i])
			end
			if Stats[Name]:IsA("StringValue") then
				Val = Ob(Val)
			end
			fireserver("ChangeValue", Stats[Name], Val)
			if Extra then
				fireserver("ChangeValue", Extra, Val)
			end
		end)
    end
    return true
end

function SetMin(Gun, Name, Val)
    Val = math.floor(tonumber(Val))
    if Val <= 0 then
        Val = 1
    end
    if typeof(Gun) == "table" then
        for i = 1, #Gun do
            if SetStats(Gun[i], Name, Val) then
				UpdateGun(Gun[i])
			end
        end
        return
    end
    if SetStats(Gun, Name, Val) then
        UpdateGun(Gun)
    end
end

function SetAction(Plr, Val, Rate)
    SetStats(GetGunsFromPlayer(Plr), "Action", Val, Rate)
end

function SetReload(Plr, Val)
    SetStats(GetGunsFromPlayer(Plr), "Reload", Val)
end

function SetReload(Plr, Val)
   SetMin(GetGunsFromPlayer(Plr), "Reload", Val)
end

function SetAccuracy(Plr, Val)
    SetMin(GetGunsFromPlayer(Plr), "Accuracy", Val)
end

function SetRecoil(Plr, Val)
    SetMin(GetGunsFromPlayer(Plr), "Recoil", Val)
end

function GetGunsFromPlayer(Plr)
    local Guns = {}
    for i, v in pairs(Plr.Backpack:GetChildren()) do
        if v:FindFirstChild("Shooter") then
            table.insert(Guns, v)
        end
    end
    for i, v in pairs(Plr.Character:GetChildren()) do
        if v:FindFirstChild("Shooter") then
            table.insert(Guns, v)
        end
    end
    return Guns
end

function SetStat(Stats, Name, Val)
    if Stats:FindFirstChild(Name) then
        if Stats[Name]:IsA("StringValue") then
            Val = Ob(Val)
        end
        fireserver("ChangeValue", Stats[Name], Val)
        return true
    end
end
function BreakWeapons(Plr)
    local Guns = GetGunsFromPlayer(Plr)
    for i = 1, #Guns do
        if Guns[i]:FindFirstChild("Stats") then
            local Stats = Guns[i]:FindFirstChild("Stats")
            SetStat(Stats, "Reload", 0)
            SetStat(Stats, "Recoil", 9999999)
			if SetStat(Stats, "Accuracy", 9999999) then
                SetStat(Stats.Accuracy, "Zoomed", 9999999)
            end
            if SetStat(Stats, "Action", 1) then
                local Ac = Stats.Action
                if Ac:FindFirstChild("Rate") then
                    fireserver("ChangeValue", Ac.Rate, Ob(900000))
                else
					spawn(function()
						R.AddClothing:FireServer("Rate", Ac, Ob(900000), "", "")
						Ac:WaitForChild("Rate")
						UpdateGun(Guns[i])
					end)
                end
            end
            UpdateGun(Guns[i])
        end
    end
end

getgenv().DoWeld = function(x,y)
	local CJ = CFrame.new(x.Position)
	local C0 = x.CFrame:inverse()*CJ
	local C1 = y.CFrame:inverse()*CJ
	MakeWeld(x,y, C0, C1)
end

function MakeWeld(Part0, Part1, C0, C1)
	if C0 == nil then
		C0 = CFrame.new()
	end
	if C1 == nil then
		C1 = CFrame.new()
	end
    R.CreateWeld:FireServer(Part0, Part1, C0, C1)
    local W = Instance.new("Weld", Part0)
    W.Part0 = Part0
    W.Part1 = Part1
    W.C0 = C0
    W.C1 = C1
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

function Spectate(Plr)
	local Camera = game.Workspace.CurrentCamera
	local Sub = Camera.CameraSubject
	if Plr == LPlr or Sub == nil or Sub.Parent == nil or Sub.Parent.Parent == nil or tostring(Plr) == tostring(Camera.CameraSubject.Parent) and LPlr.Character ~= nil and LPlr.Character:FindFirstChild("Humanoid") or Plr.Character == nil or not Plr.Character:FindFirstChild("Humanoid") then
		if LPlr.Character ~= nil and LPlr.Character:FindFirstChild("Humanoid") then
			Camera.CameraSubject = LPlr.Character.Humanoid
		end
		return
	end
	Camera.CameraSubject = Plr.Character.Humanoid
end

function OpenInventory(Plr)
	if Plr ~= LPlr then
		InventoryFrame.Visible = true
		SetupWatch(Plr, 2)
	end
end

function GetZombie()
    for i, v in pairs(game.Workspace.Zombies:GetDescendants()) do
        if v:IsA("Humanoid") and v.Parent:FindFirstChild("Head") then
            return v.Parent
        end
    end
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

function AddCheck(Par, Thing, Val)
    if not Par:FindFirstChild(Thing) then
        R.AddClothing:FireServer(Thing, Par, "", "", "")
        repeat
            wait()
        until Par:FindFirstChild(Thing)
    end
    if Val == true then
        return Par[Thing]
    end
end

function TPPlayerPos(P1, Spot)
if P1 == nil or P1.Character == nil or not P1.Character:FindFirstChild("Torso") or not P1.Character:FindFirstChild("Humanoid") then
    return
end
if typeof(Spot) == "Instance" then
	if Spot:IsA("Player") and Spot.Character and Spot.Character:FindFirstChild("Head") then
		Spot = Spot.Character.Head.CFrame
	elseif Spot:IsA("BasePart") then
		Spot = Spot.CFrame
	elseif Spot:IsA("Model") and Spot:FindFirstChildOfClass("Part") then
		Spot = Spot:FindFirstChildOfClass("Part").CFrame
	else
		return
	end
elseif typeof(Spot) == "Vector3" then
	Spot = CFrame.new(Spot)
end
spawn(function()
local Char = P1.Character
local Tor = Char.Torso
R.HurtZombie:FireServer(Char)
AddCheck(Char, "IsBuildingMaterial")
AddCheck(Char, "driven")
local SP = AddCheck(Tor, "SeatPoint", true)
R.HurtZombie:FireServer(Char)
repeat
wait()
until Char.Humanoid.Sit == true
wait()
R.ReplicateModel:FireServer(Char, Spot)
for i = 1, 10 do
wait(0.1)
R.HurtZombie:FireServer(Char)
end
fireserver("ChangeParent", SP)
end)
end

local PlrStuffTab = {}
function PlrTransparency(Plr, Value)
    fireserver("VehichleLightsSet", Plr.Character, "Plastic", Value)
    for i, v in pairs(Plr.Character:GetChildren()) do
        if v:FindFirstChild("thisisarmor") then
            fireserver("ChangeParent", v.thisisarmor, nil)
        end
        if v:FindFirstChild("WeldScript") then
            fireserver("ChangeParent", v.WeldScript, nil)
        end
        fireserver("VehichleLightsSet", v, "Plastic", Value)
    end
	if Value >= 1 and Plr.Character:FindFirstChild("Head") and Plr.Character.Head:FindFirstChild("face") then
		if PlrStuffTab[Plr] == nil then
			PlrStuffTab[Plr] = {}
		end
		PlrStuffTab[Plr]["face"] = Plr.Character.Head.face
		fireserver("ChangeParent", Plr.Character.Head.face, game.ReplicatedStorage)
	elseif Value < 1 and Plr.Character ~= nil and Plr.Character:FindFirstChild("Head") and not Plr.Character.Head:FindFirstChild("face") and PlrStuffTab[Plr] ~= nil and PlrStuffTab[Plr]["face"] ~= nil and PlrStuffTab[Plr]["face"].Parent == game.ReplicatedStorage then
		fireserver("ChangeParent", PlrStuffTab[Plr]["face"], Plr.Character.Head)
	end
end

function TransparencyStart(Plr, Val)
Start = 0
if Val < 0 then
    Start = 1
end
for i = 0, 20 do
PlrTransparency(Plr, Start+(i/20*Val))
wait()
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

function GetPart(Model)
    local P = nil
    for i, v in pairs(Model:GetDescendants()) do
        if v:IsA("BasePart") and (P == nil or (tostring(v) == "Head" or tostring(v) == "Driver")) then
            P = v
        end
    end
    return P
end

ItemsTable = {}
function SpawnItem(SelectedPlayer, SelectedItem, Par, OF, SP)
	if SelectedPlayer == nil or SelectedItem == nil then return end
	if OF == nil then OF = Vector3.new(0, 0, 0) end
	if SP == nil then Count() end
	if SelectedItem.Parent ~= Mats and not Mats:FindFirstChild(tostring(SelectedItem)) and Par ~= nil then fireserver("ChangeParent", Par:WaitForChild(tostring(SelectedItem)), Mats) Mats:WaitForChild(tostring(SelectedItem))
	elseif SelectedItem.Parent ~= Mats and not Mats:FindFirstChild(tostring(SelectedItem)) and Par == nil then fireserver("ChangeParent", SelectedItem, Mats)
	elseif SelectedItem.Parent ~= Mats and Mats:FindFirstChild(tostring(SelectedItem)) then SelectedItem = Mats:FindFirstChild(tostring(SelectedItem)) end
	if typeof(SelectedItem) == "string" then
		SelectedItem = Mats:WaitForChild(tostring(SelectedItem))
	elseif SelectedItem.Parent ~= Mats then
		SelectedItem = Mats:FindFirstChild(tostring(SelectedItem))
	end
	if Par ~= Mats and SelectedItem:FindFirstChild("Head") and not SelectedItem:FindFirstChildOfClass("Model") then
		Par = Mats
	end
	if ItemsTable[SelectedItem] == nil then ItemsTable[SelectedItem] = 0 end
	ItemsTable[SelectedItem] = ItemsTable[SelectedItem] + 1
	if SelectedItem.PrimaryPart == nil then SelectedItem.PrimaryPart = GetPart(SelectedItem) end
	pcall(function() AddItemsToSpawn(SelectedItem, SelectedPlayer.Character.Torso.Position-OF) R["PlaceMaterial"]:FireServer(tostring(SelectedItem), SelectedPlayer.Character.Torso.Position-SelectedItem.PrimaryPart.Position-OF) end)
	spawn(function()
		wait(2)
		ItemsTable[SelectedItem] = ItemsTable[SelectedItem]-1
		if ItemsTable[SelectedItem] <= 0 then
			ItemsTable[SelectedItem] = 0
			fireserver("ChangeParent", SelectedItem, Par)
		end
	end)
end

function SpawnItemAtPosition(Pos, SelectedItem, Par, OF)
	if typeof(SelectedItem) == "string" then
		local FoundLocation;
		if SelectedItem == "" then
			return
		end
		if Loot:FindFirstChild(SelectedItem) then
			FoundLocation = Loot
		elseif Mats:FindFirstChild(SelectedItem) then
			FoundLocation = Mats
		elseif Light:FindFirstChild(SelectedItem) then
			FoundLocation = Lighting
		else
			return
		end
		SelectedItem = FoundLocation[SelectedItem]
		Par = FoundLocation
		if SelectedItem:FindFirstChildOfClass("Model") then
			Par = Loot
		end
	end
	if SelectedItem.Parent ~= Mats then
		fireserver("ChangeParent", SelectedItem, Mats)
	end
	SpawnItem({["Character"] = {["Torso"] = {["Position"] = Pos}}}, SelectedItem, Par, OF, false)
end

ItemSizes = {}
for i, v in pairs(game.Lighting.Materials:GetChildren()) do
    if v:FindFirstChild("Head") and v.Name ~= "Zombie" then
        local S = v.Head.Size
        ItemSizes[tostring(S.X)..tostring(S.Y)..tostring(S.Z)] = true
    end
end

function CheckFor(Par, Item, Val, Message, Time)
    local V = false
    if Val == true then
        if Par:FindFirstChild(Item) then
            V = true
        end
    else
        if not Par:FindFirstChild(Item) then
            V = true
        end
    end
    if V == true then
        Notify(Message, Time)
    end
end

Corpse = nil
for i, v in pairs(game:GetDescendants()) do
    if v.Name == "Corpse" and v.Parent.Name == "Corpse" then
        Corpse = v.Parent
    end
end

function CheckColor(C1, C2)
    if RoundNumber(C1.R, 10) ~= RoundNumber(C2.R, 10) or RoundNumber(C1.G, 10) ~= RoundNumber(C2.G, 10) or RoundNumber(C1.B, 10) ~= RoundNumber(C2.B, 10) then
        return false
    end
    return true
end

local VisibleCT = {}
function SetZombieVisible(Plr, Val)
    if Plr == nil or Plr.Character == nil or not Plr.Character:FindFirstChild("Humanoid") then
        return
    end
    local H = Plr.Character.Humanoid
    local Vis = H:FindFirstChild("Visibility")
    if Val == true and Vis and typeof(Vis.Value) == "number" then
        VisibleCT[Plr.Character] = Vis
        fireserver("ChangeParent", Vis, game.ReplicatedStorage)
        repeat wait() until Vis.Parent == game.ReplicatedStorage
        R.AddClothing:FireServer("Visibility", H, "-100000000", "Shooting", "0")
        repeat
            wait()
        until H:FindFirstChild("Visibility")
        R.AddClothing:FireServer("Stance", H.Visibility, "0", "", "")
    elseif Val == false and Vis and typeof(Vis.Value) == "string" and VisibleCT[Plr.Character] then
        fireserver("ChangeParent", Vis)
        fireserver("ChangeParent", VisibleCT[Plr.Character], H)
    end
end

function Nuke(Plr)
	if not Plr or not Plr.Character or not Plr.Character:FindFirstChild("Head") then
		return
	end
	local TempModel = MakeEmptyModel()
	TempModel.Name = "Nuke"
	local Head = Plr.Character.Head
	SpawnBaseF({["Character"] = {["Head"] = {["Position"] = Vector3.new(0, -100, 0)}}}, ServerModels["NuclearBomb"], false, TempModel)
	wait()
	SpawnBaseF({["Character"] = {["Head"] = {["Position"] = Vector3.new(0, -100, 0)}}}, ServerModels["NuclearBomb"], false, TempModel)
	local NewModel = MakeEmptyModel()
	fireserver("ChangeParent", NewModel, TempModel)
	for i, v in pairs(TempModel:GetChildren()) do
		if v ~= NewModel then
			fireserver("ChangeParent", NewModel)
		end
	end
	local Part = GetPart(TempModel)
	local PartsTable = {}
	for i, v in pairs(TempModel:GetDescendants()) do
		if v:IsA("BasePart") then
			table.insert(PartsTable, v)
		end
	end
	local CanHitParts = {}
	for i, v in pairs(game.Workspace:GetChildren()) do
		if v.Name ~= "Nuke" and not game.Lighting.Hair:FindFirstChild(tostring(v)) then
			table.insert(CanHitParts, v)
		end
	end
	local PartsSpread = {}
	local function Spread()
		for i = 1, #PartsTable do
			if not PartsSpread[PartsTable[i]] then
				local NewRay = Ray.new(PartsTable[i].Position, Vector3.new(0, -3, 0))
				local Hit, Pos = game.Workspace:FindPartOnRayWithWhitelist(NewRay, CanHitParts)
				if Hit ~= nil then
					PartsSpread[PartsTable[i]] = true
					spawn(function()
						if PartsTable[i] ~= Part then
							fireserver("ChangeParent", PartsTable[i], game.Workspace)
						end
						local Am = tonumber(AmountBox.Text)
						if Am == nil or Am < 0 then
							Am = 20
						end
						local Low = Am-8
						if Low < 0 then
							Low = 1
						end
						for a = 1, math.random(Low, Am) do
							R.ReplicatePart:FireServer(PartsTable[i], PartsTable[i].CFrame+Vector3.new(math.random(-5, 5), math.random(1, 10)/40, math.random(-5, 5)))
							if math.random(1, 4) > 1 then
								R.Detonate:FireServer({Head = PartsTable[i]})
							end
							wait(0.1)
						end
						local NewRay = Ray.new(PartsTable[i].Position+Vector3.new(0, 10, 0), Vector3.new(0, -40, 0))
						local Hit, Pos = game.Workspace:FindPartOnRayWithWhitelist(NewRay, CanHitParts)
						if Hit ~= nil then
							R.ReplicatePart:FireServer(PartsTable[i], PartsTable[i].CFrame-PartsTable[i].Position+Pos)
						end
					end)
				end
			end
		end
	end
	AddCheck(TempModel, "IsBuildingMaterial")
	fireserver("ChangeParent", Part, TempModel)
	R.ReplicateModel:FireServer(TempModel, Part.CFrame-Part.Position+(Head.Position+Vector3.new(0, 50, 0)))
	for i = 1, 350 do
		AddCheck(TempModel, "IsBuildingMaterial")
		if NukeFollow == true or i < 10 then
			R.ReplicateModel:FireServer(TempModel, Part.CFrame-Part.Position+(Head.Position+Vector3.new(0, 50-(i*0.2), 0)))
		else
			R.ReplicateModel:FireServer(TempModel, Part.CFrame-Vector3.new(0, 0.4, 0))
		end
		Spread()
		wait()
	end
end

function MakeShop(ShopName, Pos)
	local ShopList = ServerModels[ShopName.."List"]
	local TempModel = MakeEmptyModel()
	TempModel.Name = ShopName
	SpawnBaseF({["Character"] = {["Head"] = {["Position"] = Pos}}}, ServerModels[ShopName], false, TempModel)
	local Identifiers = {}
	for i, v in pairs(TempModel:GetDescendants()) do
		if tostring(v) == "ItemID" then
			Identifiers[v.Value] = v.Parent
		end
	end
	local function CalculateItem(Storage, ItemList)
		local Items = {}
		for i, v in pairs(Storage:GetDescendants()) do
			if tostring(v) == "ObjectID" then
				local N = GetItemName(v.Value)
				if not Items[N] then
					Items[N] = 0
				end
				Items[N] = Items[N] + 1
			end
		end
		for i = 1, #ItemList do
			if Items[ItemList[i][1][1]] and Items[ItemList[i][1][1]] >= ItemList[i][1][2] then
				return ItemList[i][1][1], ItemList[i][1][2], ItemList[i]
			elseif ItemList[i][1][1] == "Random" then
				for a, b in pairs(Items) do
					if b >= ItemList[i][1][2] then
						return a, ItemList[i][1][2], ItemList[i]
					end
				end
			end
		end
	end
	local function GetEmptySpot(Return, Tab)
		local FoundEmpty;
		local EmptyCount = 0;
		for i, v in pairs(Return:GetChildren()) do
			if not v:FindFirstChild("ObjectID") then
				if FoundEmpty == nil and (Tab == nil or not Tab[v]) then
					FoundEmpty = v
				end
				EmptyCount = EmptyCount + 1
				if EmptyCount >= 6 and FoundEmpty ~= nil then
					return FoundEmpty
				end
			end
		end
	end
	local function PickRandomItem()
		local Item = Loot:GetChildren()[math.random(1, #Loot:GetChildren())]
		if not Item:FindFirstChild("ObjectID") then
			return PickRandomItem()
		end
		return Item
	end
	local function DeleteItem(Storage, Item, Amount)
		local CurrentAmount = 0
		for i, v in pairs(Storage:GetDescendants()) do
			if tostring(v) == "ObjectID" then
				local N = GetItemName(v.Value)
				if N == Item and CurrentAmount < Amount then
					CurrentAmount = CurrentAmount + 1
					fireserver("ChangeValue", v.Parent, 0)
					fireserver("ChangeParent", v)
					if CurrentAmount >= Amount then
						return true
					end
				end
			end
		end
		if CurrentAmount < Amount then
			return false
		end
		return true
	end
	for i, v in pairs(ShopList) do
		local Ret = Identifiers[v["Return"]].storage
		local Storage = Identifiers[i].storage
		Storage.DescendantAdded:connect(function(I)
			if tostring(I) == "ObjectID" then
				local Filled = {}
				local Item, ItemAmount, Tab = CalculateItem(Storage, v)
				wait(0.1)
				if Item and GetEmptySpot(Ret, Filled) and DeleteItem(Storage, Item, ItemAmount) then
					for a = 2, #Tab do
						local IN = Tab[a][1]
						local IA = Tab[a][2]
						for b = 1, IA do
							local Spot = GetEmptySpot(Ret, Filled)
							Filled[Spot] = true
							local TempName = IN
							if IN == "Randomize" then
								TempName = tostring(PickRandomItem())
							end
							AddItem(TempName, Spot)
						end
					end
				end
			end
		end)
	end
end

function DeterminLookDir(Veh, Icon)
	local Look = Icon.CFrame.LookVector
	local ray = Ray.new(Icon.Position, Look*10)
	local prt = game.Workspace:FindPartOnRayWithWhitelist(ray, {Veh})
	if prt then
		Look = Look*-1
	end
	return Look
end

function FlipFunction(Veh, Prt)
	local Prim = Veh.PrimaryPart
	local CheckingFlipped = false
	local FlippedTime;
	Con = game:GetService("RunService").RenderStepped:Connect(function()
		if Prt.Position.Y <= Prim.Position.Y+1 and CheckingFlipped == false and Prim.Velocity.Magnitude < 8 then
			CheckingFlipped = true
			FlippedTime = tick()
		elseif not (Prt.Position.Y <= Prim.Position.Y+1) and CheckingFlipped then
			CheckingFlipped = false
		end
		if CheckingFlipped and tick() - FlippedTime > 2 then
			Veh:SetPrimaryPartCFrame(CFrame.new(Prim.Position+Vector3.new(0, 4, 0)))
			Veh.PrimaryPart.Velocity = Vector3.new()
			CheckingFlipped = false
		end
	end)
	spawn(function()
		while Veh.Parent and Prt.Parent do
			wait()
		end
		Con:Disconnect()
	end)
end

function SpawnCustomVehicle(Veh, Mod)
	if not Mod then
		Mod = "Tank"
	end
	local Essen = Veh.Essentials
	local Icons = Essen.Icons
	local Prim = Veh.PrimaryPart
	local Gyro = Prim.BodyGyro
	for i = 1, 15 do
		Gyro.CFrame = CFrame.new()*CFrame.Angles(0, math.rad(90), 0)
		Veh:SetPrimaryPartCFrame(CFrame.new(Prim.CFrame.Position)*CFrame.Angles(0, math.rad(90), 0))
		wait()
	end
	Veh.PrimaryPart.Anchored = true
	local StoredIconsPos = {}
	local StoredIconsPosY = {}
	if Essen:FindFirstChild("Color") then
		fireserver("ChangeParent", Essen.Color)
	end
	for i, v in pairs(Icons:GetChildren()) do
		StoredIconsPos[v] = DeterminLookDir(Veh, v)
		StoredIconsPosY[v] = v.Position.Y
		v.Anchored = true
		for a, b in pairs(v:GetChildren()) do
			if b:IsA("Weld") then
				fireserver("ChangeParent", b)
			end
		end
		if not v:FindFirstChild("IsBuildingMaterial") then
			R.AddClothing:FireServer("IsBuildingMaterial", v, "", "", "")
		end
	end
	for i, v in pairs(Essen.Details:GetChildren()) do
		if not string.find(v.Name, "Lights") then
			fireserver("ChangeParent", v)
		else
			for a, b in pairs(v:GetDescendants()) do
				if b:IsA("BasePart") then
					fireserver("ChangeParent", b)
				end
			end
		end
	end
	SpawnBaseF({["Character"] = {["Head"] = {["Position"] = Pos}}}, ServerModels[Mod], false, Veh, true)
	wait()
	SpawnBaseF({["Character"] = {["Head"] = {["Position"] = Pos}}}, ServerModels[Mod], false, Veh, true)
	wait()
	Veh.Parent = game.Workspace.Vehicles
	if not string.find(Mod, "Tank") then
		local TestRay = Ray.new(Veh.PrimaryPart.Position+Vector3.new(0, 4, 0), Vector3.new(0, 100, 0))
		local prt = game.Workspace:FindPartOnRayWithWhitelist(TestRay, {Veh})
		FlipFunction(Veh, prt)
	end
	spawn(function()
		for i, v in pairs(StoredIconsPos) do
			local ray = Ray.new(i.Position+v*300, v*-400)
			local prt, pos = game.Workspace:FindPartOnRayWithWhitelist(ray, {Veh})
			if prt then
				R.ReplicatePart:FireServer(i, i.CFrame-i.Position+pos+Vector3.new(0,-pos.Y+StoredIconsPosY[i], 0)-v)
			end
		end
	end)
	Veh.PrimaryPart.Anchored = false
	wait(0.1)
	fireserver("ChangeParent", Veh, game.Workspace.Vehicles)
	for i , v in pairs(StoredIconsPos) do
		i.Anchored = false
	end
end

local CurrentTank;
function MakeTank(Veh, Mod)
	SpawnCustomVehicle(Veh, Mod)
	wait()
	Veh.PrimaryPart.Anchored = true
	local GlobalTop = MakeEmptyModel()
	GlobalTop.Name = "GlobalTop"
	fireserver("ChangeParent", GlobalTop, Veh)
	R.AddClothing:FireServer("IsBuildingMaterial", GlobalTop, "", "", "")
	local TopOfTank = MakeEmptyModel()
	TopOfTank.Name = "Top"
	fireserver("ChangeParent", TopOfTank, GlobalTop)
	CurrentTank = GlobalTop
	local TankShot;
	local TankTopCenter;
	local TankMainCenter;
	for i, v in pairs(Veh:GetDescendants()) do
		if tostring(v) == "ItemID" then
			fireserver("ChangeParent", v.Parent, TopOfTank)
			v.Parent.CanCollide = false
			if v.Value == "TopShot" then
				TankShot = v.Parent
			elseif v.Value == "TopCenter" then
				local ToPlaceModel = "Bricks"
				local Con;
				local Mod;
				Con = game.Workspace.ChildAdded:connect(function(Ch)
					if Ch.Name == ToPlaceModel then
						Mod = Ch
						Con:Disconnect()
					end
				end)
				R.PlaceMaterial:FireServer(ToPlaceModel, Vector3.new(10000, 10000, 10000))
				repeat
					wait()
				until Mod and Mod:FindFirstChild("Head")
				wait()
				local Head = Mod.Head
				fireserver("ChangeParent", Head, GlobalTop)
				R.AddClothing:FireServer("IsBuildingMaterial", Head, "", "", "")
				repeat
					wait()
				until Head:FindFirstChild("IsBuildingMaterial")
				R.ReplicatePart:FireServer(Head, v.Parent.CFrame)
				TankTopCenter = Head
				Head.CanCollide = false
				TankMainCenter = v.Parent
				fireserver("ChangeParent", v.Parent, Veh)
			end
		end
	end
	wait(1)
	for i, v in pairs(GlobalTop:GetDescendants()) do
		if v:IsA("BasePart") and v.Parent ~= GlobalTop then
			fireserver("ChangeParent", v, GlobalTop)
			if v:FindFirstChild("Weld") then
				fireserver("ChangeParent", v.Weld)
			end
			DoWeld(TankTopCenter, v)
			v.CanCollide = false
		end
	end
	local Shots;
	local function GetShots()
		local AmountOfShots = 0
		if Shots then
			for i, v in pairs(Shots) do
				AmountOfShots = AmountOfShots + 1
			end
		end
		if AmountOfShots <= 1 then
			if not Shots then
				Shots = {}
			end
			local FakeCon;
			local Bricks;
			FakeCon = game.Workspace.ChildAdded:connect(function(Ch)
				if tostring(Ch) == "Bricks" then
					Bricks = Ch
					FakeCon:Disconnect()
				end
			end)
			R.PlaceMaterial:FireServer("Bricks", Vector3.new(10000, 10000, 10000))
			repeat
				wait()
			until Bricks
			for i, v in pairs(Bricks:GetChildren()) do
				if v:IsA("BasePart") then
					R.AddClothing:FireServer("IsBuildingMaterial", v, "", "", "")
					fireserver("ChangeParent", v, Veh)
					Shots[v] = true
					v.Name = "brick"..tostring(i)
				end
			end
			fireserver("ChangeParent", Bricks)
		end
		local Shot = Shots[1]
		for i, v in pairs(Shots) do
			Shot = i
			Shots[i] = nil
			break
		end
		repeat
			wait()
		until Shot:FindFirstChild("IsBuildingMaterial")
		return Shot
	end
	wait(1)
	local Con;
	local Prim = Veh.PrimaryPart
	local LastFlipCount = 0
	local CheckingFlipped = false
	local FlippedTime;
	Con = game:GetService("RunService").RenderStepped:Connect(function()
		if TankMainCenter.Position.Y <= Prim.Position.Y+1 and CheckingFlipped == false and Prim.Velocity.Magnitude < 8 then
			CheckingFlipped = true
			FlippedTime = tick()
		elseif not (TankMainCenter.Position.Y <= Prim.Position.Y+1) and CheckingFlipped then
			CheckingFlipped = false
		end
		if CheckingFlipped and tick() - FlippedTime > 2 then
			Veh:SetPrimaryPartCFrame(CFrame.new(Prim.Position+Vector3.new(0, 4, 0)))
			Veh.PrimaryPart.Velocity = Vector3.new()
			CheckingFlipped = false
		end
		local CF;
		if LPlr.Character ~= nil and LPlr.Character:FindFirstChild("Humanoid") and LPlr.Character.Humanoid.Sit then
			local Hit = Mouse.Hit.Position
			CF = CFrame.new(TankMainCenter.Position, Hit)*CFrame.Angles(0, 0, math.rad(-90))
		elseif GlobalTop.PrimaryPart then
			CF = GlobalTop.PrimaryPart.CFrame-GlobalTop.PrimaryPart.Position+TankMainCenter.Position
		end
		R.ReplicateModel:FireServer(GlobalTop, CF)
		if GlobalTop.PrimaryPart then
			GlobalTop:SetPrimaryPartCFrame(CF)
		end
	end)
	local Con2;
	local CanShoot = true
	local TimeBetweenShots = 0.1
	Con2 = Mouse.Button1Down:Connect(function()
		if not CanShoot or LPlr.Character == nil or not LPlr.Character:FindFirstChild("Humanoid") or not LPlr.Character.Humanoid.Sit then
			return
		end
		CanShoot = false
		spawn(function()
			wait(TimeBetweenShots)
			CanShoot = true
		end)
		local Shot = GetShots()
		local Dir = TankShot.CFrame.LookVector
		local StartCFrame = TankShot.CFrame
		R.ReplicatePart:FireServer(Shot, TankShot.CFrame)
		local Ignores = {Veh}
		local Exploded = false
		local ExplodedAt;
		local Speed = 15
		local ShouldRemove = false
		local ShouldMoveTo;
		wait()
		local Con3;
		local i = 0
		Con3 = game:GetService("RunService").RenderStepped:Connect(function()
			i = i+1
			if i > 1200 then
				Con3:Disconnect()
				return
			end
			R.ReplicatePart:FireServer(Shot, StartCFrame+((Dir*Speed)*i))
			local ray = Ray.new(Shot.Position, Dir*Speed*20)
			local ray2 = Ray.new(Shot.Position, Dir*Speed)
			local prt = game.Workspace:FindPartOnRayWithIgnoreList(ray, Ignores)
			local prt2, pos = game.Workspace:FindPartOnRayWithIgnoreList(ray, Ignores)
			if prt and prt.Parent.Name == "Bricks" or prt2 and prt2.Parent.Name == "Bricks" then
				table.insert(Ignores, prt.Parent)
				prt = nil
				prt2 = nil
			end
			if prt and i/10 == math.floor(i/10) then
				R.Detonate:FireServer({["Head"] = Shot})
			end
			if ShouldRemove then
				R.ReplicatePart:FireServer(Shot, Shot.CFrame-Shot.Position+ShouldMoveTo)
				pcall(function() fireserver("ChangeParent", Shot) end)
				Con3:Disconnect()
				return
			end
			if prt2 and prt2.Parent.Name ~= "Bricks" and (pos-Shot.Position).Magnitude < 45 then
				ShouldRemove = true
				ShouldMoveTo = pos
			end
		end)
	end)
	wait(0.1)
	Veh.PrimaryPart.Anchored = false
	while GlobalTop and GlobalTop.Parent and CurrentTank == GlobalTop and Veh.Parent ~= nil do
		wait()
	end
	Con:Disconnect()
	Con2:Disconnect()
end

Work = game:GetObjects("rbxassetid://6432104949")[1]
HeadModelSizes = {}
for i, v in pairs(Work.IndividualParts:GetChildren()) do
	HeadModelSizes[tostring(v.Size)] = tostring(v)
end
LootIDs = {}
IDent = {}
SpecialIdentifiers = {{"SpecialMesh", "TextureId", "MeshId"}, {"Decal", "Texture", {"Face", "Back"}}, {"Sound", "Name"}}
for i, v in pairs(game.Lighting.LootDrops:GetChildren()) do
	if v:FindFirstChild("ObjectID") then
		LootIDs[tostring(Deob(v.ObjectID.Value))] = tostring(v)
	end
	if v:FindFirstChildOfClass("Model") and v:FindFirstChildOfClass("Model"):FindFirstChild("Head") then
        local Mod = v:FindFirstChildOfClass("Model")
        if not IDent[Mod.DataCost] then
            IDent[Mod.DataCost] = {}
        end
        local Col = Mod.Head
        if Mod:FindFirstChild("Colors") then
            Col = Mod.Colors
        end
        local DC = Mod.DataCost
        local BC = tostring(Col.BrickColor)
        local Mat = tostring(Col.Material)
        if not IDent[DC][BC] then
            IDent[DC][BC] = {}
        end
        if not IDent[DC][BC][Mat] then
            IDent[DC][BC][Mat] = {}
        end
        local MatT = IDent[DC][BC][Mat]
        local Cl = 0
        for a, b in pairs(Mod:GetChildren()) do
            if b.Name == "ColorPart" then
                Cl = Cl + 1
            end
        end
        if not MatT[tostring(Cl)] then
            MatT[tostring(Cl)] = {}
        end
        local LookTab = MatT[tostring(Cl)]
        local FoundSpecial = false
        for a, b in pairs(Mod.Head:GetChildren()) do
            for c = 1, #SpecialIdentifiers do
                if b.ClassName == SpecialIdentifiers[c][1] and (not SpecialIdentifiers[c][3] or typeof(SpecialIdentifiers[c][3]) == "string" or typeof(SpecialIdentifiers[c][3]) == "table" and string.find(tostring(b[SpecialIdentifiers[c][3][1]]), SpecialIdentifiers[c][3][2])) then
                    FoundSpecial = true
                    if tostring(b[SpecialIdentifiers[c][2]]) ~= "" then
                        LookTab[tostring(b[SpecialIdentifiers[c][2]])] = tostring(v)
                    elseif SpecialIdentifiers[c][3] and typeof(SpecialIdentifiers[c][3]) == "string" then
                        LookTab[tostring(b[SpecialIdentifiers[c][3]])] = tostring(v)
                    end
                    break
                end
            end
            if FoundSpecial then
                break
            end
        end
        if not FoundSpecial then
            local Test = Vector3.new()
            if #Mod:GetChildren() > 1 then
                for a, b in pairs(Mod:GetChildren()) do
                    if b:IsA("BasePart") and b ~= Mod.Head then
                        Test = Test + (b.Position-Mod.Head.Position)
                    end
                end
                Test = tostring(Test)
            else
                Test = "S"..tostring(Mod.Head.Size)
            end
            if not LookTab[Test] then
                LookTab[Test] = tostring(v)
            else
                if typeof(LookTab[Test]) ~= "table" then
                    local Temp
                end
            end
        end
    end
end
DroppedLoot = game.Workspace:FindFirstChild("DropLoot")
SpawnedLoot = game.Workspace:FindFirstChild("SpawnLoot")
function IsAModelOfLoot(Mod)
	if DroppedLoot and Mod:IsDescendantOf(DroppedLoot) or SpawnedLoot and Mod:IsDescendantOf(SpawnedLoot) then
		return false
	end
	if Mod:FindFirstChildOfClass("Model") and Mod:FindFirstChildOfClass("Model"):FindFirstChild("Head") then
        Mod = Mod:FindFirstChildOfClass("Model")
    end
	local Col = Mod.Head
	if Mod:FindFirstChild("ColorPart") then
		Col = Mod.ColorPart
	end
	local DC = Mod.DataCost
    local BC = tostring(Col.BrickColor)
    local Mat = tostring(Col.Material)
	for i, v in pairs(Mod:GetChildren()) do
		if pcall(function() return v.Value end) then
			DC = DC-v.DataCost
		end
	end
	local Cl = 0
    for a, b in pairs(Mod:GetChildren()) do
        if b.Name == "ColorPart" then
            Cl = Cl + 1
        end
    end
	local Current = IDent[DC][BC][Mat][tostring(Cl)]
	for i, v in pairs(Mod.Head:GetChildren()) do
		for a = 1, #SpecialIdentifiers do
			if v.ClassName == SpecialIdentifiers[a][1] and (not SpecialIdentifiers[a][3] or typeof(SpecialIdentifiers[a][3]) == "string" or typeof(SpecialIdentifiers[a][3]) == "table" and string.find(tostring(v[SpecialIdentifiers[a][3][1] ]), SpecialIdentifiers[a][3][2])) then
				if tostring(v[SpecialIdentifiers[a][2] ]) ~= "" then
					return Current[tostring(v[SpecialIdentifiers[a][2] ])]
				elseif tostring(v[SpecialIdentifiers[a][3] ]) ~= "" then
					return Current[tostring(v[SpecialIdentifiers[a][3] ])]
				end
			end
		end
	end
	local Test = Vector3.new()
	if #Mod:GetChildren() > 1 then
        for a, b in pairs(Mod:GetChildren()) do
            if b:IsA("BasePart") and b ~= Mod.Head then
                Test = Test + (b.Position-Mod.Head.Position)
            end
        end
        Test = tostring(Test)
    else
        Test = "S"..tostring(Mod.Head.Size)
    end
	
	return Current[Test]
end

function CheckPosInside(Pos)
	if not Corner1 or not Corner2 then return false end
	local Poses = {Corner1.PrimaryPart.Position.X, Corner1.PrimaryPart.Position.Z, Corner2.PrimaryPart.Position.X, Corner2.PrimaryPart.Position.Z}
	if Poses[1] < Poses[3] then
		local S = Poses[1]
		Poses[1] = Poses[3]
		Poses[3] = S
	end
	if Poses[2] < Poses[4] then
		local S = Poses[2]
		Poses[2] = Poses[4]
		Poses[4] = S
	end
	if Pos.X > Poses[1] or Pos.X < Poses[3] or Pos.Z > Poses[2] or Pos.Z < Poses[4] then
		return false
	end
	return true
end

function Convert(Numb)
	if Numb < 0 then
		return Numb*-1
	end
	return Numb
end
function GetMid(Item, Val)
	local Tab = {["LowX"] = nil, ["HighX"] = nil, ["LowY"] = nil, ["LowZ"] = nil, ["HighZ"] = nil}
	local List = Item
	if typeof(Item) ~= "table" then
		List = Item:GetDescendants()
	end
	for i, v in pairs(List) do
		if v:IsA("BasePart") then
			local Pos = v.Position
			local X = Pos.X
			local Y = Pos.Y
			local Z = Pos.Z
			if Tab["LowX"] == nil and not v:FindFirstChild("IgnorePosition") then
				Tab["LowX"] = X
				Tab["HighX"] = X
				Tab["LowY"] = Y
				Tab["LowZ"] = Z
				Tab["HighZ"] = Z
			end
			if not v:FindFirstChild("IgnorePosition") then
				if Tab["LowX"] > X then
					Tab["LowX"] = X
				end
				if Tab["HighX"] < X then
					Tab["HighX"] = X
				end
				if Tab["LowY"] > Y then
					Tab["LowY"] = Y
				end
				if Tab["LowZ"] > Z then
					Tab["LowZ"] = Z
				end
				if Tab["HighZ"] < Z then
					Tab["HighZ"] = Z
				end
			end
			if v:FindFirstChild("BaseSpawnPosition") and Val ~= true then
				local Mid = Vector3.new(v.Position.X, v.Position.Y,v.Position.Z)
				return Mid
			end
		end
	end

	if Val == true and Item:FindFirstChild("Head") then
		local Mid = Vector3.new(Item.Head.Position.X, Item.Head.Position.Y,Item.Head.Position.Z)
		return Mid
	end
	local Mid = Vector3.new()
	if Tab["LowX"] then
		Mid = Vector3.new(Tab["LowX"]+Convert(Tab["HighX"]-Tab["LowX"])/2, Tab["LowY"],Tab["LowZ"]+Convert(Tab["HighZ"]-Tab["LowZ"])/2)
	end
	return Mid
end

function ConvertModel(Mod, BN)
	local PartsTable = {}
	local Mid = GetMid(Mod)
	local Mats = Work.Materials
	if BN == "" then
		return
	end
	local function GetParts(Model)
		local T = Model
		if typeof(T) ~= "table" then
			T = Model:GetChildren()
		end
		for i, v in pairs(T) do
			local Special = nil
			if v:FindFirstChild("TeleportTo") and v:IsA("BasePart") and v.TeleportTo.Value then
				Special = {"Teleport", v.TeleportTo.Value.Position+Vector3.new(0, 3, 0)-Mid}
			elseif v:FindFirstChild("TeleportToIgnore") and v:IsA("BasePart") and v.TeleportToIgnore.Value then
				Special = {"TeleportIgnore", v.TeleportToIgnore.Value.Position+Vector3.new(0, 3, 0)-Mid}
			elseif v:FindFirstChild("VehicleSpawn") and v:IsA("BasePart") then
				Special = {"VehicleSpawn", v.VehicleSpawn.Value}
			elseif v:FindFirstChild("KillPlayer") and v:IsA("BasePart") then
				Special = {"KillPlayer"}
			elseif v:FindFirstChild("ToolRemoval") and v:IsA("BasePart") then
				Special = {"ToolRemoval"}
			elseif Work.LootDrops:FindFirstChild(tostring(v)) and not v:FindFirstChild("Decor") then
				Special = {"Decor"}
			elseif v:FindFirstChild("Shirt") or v:FindFirstChild("Pants") then
				Special = {"Clothing", "", ""}
				if v:FindFirstChild("Pants") then
					Special[2] = v.Pants.Value
				end
				if v:FindFirstChild("Shirt") then
					Special[3] = v.Shirt.Value
				end
			elseif v:FindFirstChild("Trip") then
				Special = {"Trip"}
			elseif v:FindFirstChild("Head") and v.Head:FindFirstChild("storage") and v:IsA("Model") then
				local ItemString = ""
				for a, b in pairs(v.Head.storage:GetChildren()) do
					if b:FindFirstChild("ObjectID") and LootIDs[tostring(Deob(b:FindFirstChild("ObjectID").Value))] and Work.SelectableItems:FindFirstChild(LootIDs[tostring(Deob(b:FindFirstChild("ObjectID").Value))]) then
						if Special == nil then
							Special = {"Fill", ""}
						end
						ItemString = ItemString..'"'..LootIDs[tostring(Deob(b:FindFirstChild("ObjectID").Value))]..'", '
					end
				end
				if Special ~= nil then
					Special[2] = ItemString
				end
			elseif v:IsA("BasePart") and v:FindFirstChild("storage") then
				Special = {"FakeStorage", ""}
				local ItemString = ""
				for a, b in pairs(v.storage:GetChildren()) do
					if string.find(b.Name, "slot") and b:FindFirstChild("ObjectID") and Work.SelectableItems:FindFirstChild(LootIDs[tostring(Deob(b:FindFirstChild("ObjectID").Value))]) then
						ItemString = ItemString..'"'..LootIDs[tostring(Deob(b:FindFirstChild("ObjectID").Value))]..'", '
					end
				end
				Special[2] = ItemString
			elseif v:IsA("BasePart") and v:FindFirstChild("Disappear") then
				local V = v.Disappear.Value
				if V == nil or V == 0 then
					V = 3
				end
				Special = {"Dis", tostring(V)}
			end
			if v:IsA("BasePart") then
				if HeadModelSizes[tostring(v.Size)] then
					v.Name = HeadModelSizes[tostring(v.Size)]
				end
				local Ori = v.CFrame
				local Color = nil
				local Mat = nil
				local Tra = nil
				local Extras = {}
				if Work.IndividualParts:FindFirstChild(tostring(v)) and tostring(Work.IndividualParts[tostring(v)].BrickColor) ~= tostring(v.BrickColor) and CTab[tostring(v.BrickColor)] ~= nil then
					Color = CTab[tostring(v.BrickColor)]
				end
				if Work.IndividualParts:FindFirstChild(tostring(v)) and tostring(Work.IndividualParts[tostring(v)].Material) ~= tostring(v.Material) then
					Mat = string.sub(tostring(v.Material), 15)
				end
				if Work.IndividualParts:FindFirstChild(tostring(v)) and Work.IndividualParts[tostring(v)].Transparency ~= v.Transparency then
					Tra = tostring(v.Transparency)
				end
				if v:FindFirstChild("SpawnPoint") then
					Extras["SP"] = true
				end
				if v:FindFirstChild("ID") then
					Extras["ID"] = v.ID.Value
				end
				if v:FindFirstChild("Seat") then
					Extras["Seat"] = true
				end
				local Props = {Ori-Mid, Special, ["ColorID"] = Color, ["Mat"] = Mat, ["TRA"] = Tra}
				for i, v in pairs(Extras) do
					if tonumber(i) ~= nil then
						table.insert(Props, v)
					else
						Props[i] = v
					end
				end
				if PartsTable[tostring(v)] == nil then
					PartsTable[tostring(v)] = {Props}
				else
					table.insert(PartsTable[tostring(v)], Props)
				end

			elseif v:IsA("Model") then
				local ModName = tostring(v)
				if v:FindFirstChildOfClass("Model") and v:FindFirstChildOfClass("Model"):FindFirstChild("Head") then
					v = v:FindFirstChildOfClass("Model")
				end
				if v:FindFirstChild("Head") then
					local Ori = (v.Head.CFrame-v.Head.Position)+(GetMid(v, true)-Mid)
					local ID;
					if v:FindFirstChild("ID") then
						ID = v.ID.Value
					end
					if v:FindFirstChildOfClass("Humanoid") then
						if SpecialTab == nil then
							SpecialTab = {}
						end
						if SpecialTab[ModName.."Whole"] == nil then
							SpecialTab[ModName.."Whole"] = {{Ori, Special, ["ID"] = ID}}
						else
							table.insert(SpecialTab[ModName.."Whole"], {Ori, Special, ["ID"] = ID})
						end
					elseif PartsTable[ModName.."Whole"] == nil then
						PartsTable[ModName.."Whole"] = {{Ori, Special, ["ID"] = ID}}
					else
						table.insert(PartsTable[ModName.."Whole"], {Ori, Special, ["ID"] = ID})
					end
				end
			elseif v:IsA("Folder") then
				GetParts(v)
			end
		end
	end
	GetParts(Mod)
	local Strs = {}
	function DoParts(PartsTab)
		for i ,v in pairs(PartsTab) do
			local ItemName = tostring(i)
			local Whole = false
			local Amount = 0
			if string.match(ItemName, "Whole") then
				Whole = true
				ItemName = string.sub(ItemName, 1, string.len(ItemName)-5)
				Amount = #v
			end
			if Whole == false then
				Amount = math.floor(#v/#Mats[i]:GetChildren())+1
			end
			local str = '{["Item"] = "'.. ItemName ..'", ["Amount"] = '..tostring(Amount)..', ["Whole"] = '..tostring(Whole)..', '
			for a, b in pairs(v) do
				str = str..'{CFrame.new('..tostring(b[1])..')'
				if b[2] ~= nil then
					if b[2][1] == "KillPlayer" then
						str = str..', {"Kill"}'
					elseif b[2][1] == "ToolRemoval" then
						str = str..', {"ToolRemoval"}'
					elseif b[2][1] == "Teleport" then
						str = str..', {"Teleport", Vector3.new('..tostring(b[2][2])..')}'
					elseif b[2][1] == "TeleportIgnore" then
						str = str..', {"TeleportIgnore", Vector3.new('..tostring(b[2][2])..')}'
					elseif b[2][1] == "VehicleSpawn" then
						str = str..', {"VehicleSpawn", "'..tostring(b[2][2])..'"}'
					elseif b[2][1] == "Decor" then
						str = str..', {"Decor"}'
					elseif b[2][1] == "Clothing" then
						str = str..', {"Clothing", "'..tostring(b[2][2])..'", "'..tostring(b[2][3])..'"}'
					elseif b[2][1] == "Fill" then
						str = str..', {"Storage", {'..b[2][2]..'}}'
					elseif b[2][1] == "FakeStorage" then
						str = str..', {"FakeStorage", {'..b[2][2]..'}}'
					elseif b[2][1] == "Trip" then
						str = str..', {"Trip"}'
					elseif b[2][1] == "Dis" then
						str = str..', {"Dis", '..b[2][2]..'}'
					end
				end
				if b["ColorID"] ~= nil then
					str = str..', ["CID"] = '..tostring(b["ColorID"])
				end
				if b["Mat"] ~= nil then
					str = str..', ["MAT"] = "'..b["Mat"]..'"'
				end
				if b["TRA"] ~= nil then
					str = str..', ["TRD"] = "'..b["TRA"]..'"'
				end
				if b["SP"] ~= nil then
					str = str..', ["SP"] = true'
				end
				if b["Seat"] ~= nil then
					str = str..', ["Seat"] = true'
				end
				if b["ID"] ~= nil then
					local Sta = ""
					if typeof(b["ID"] == "string") then
						Sta = '"'
					end
					str = str..', ["ID"] = '..Sta..tostring(b["ID"])..Sta
				end
				str = str.."}"
				if a ~= #v then
					str = str..", "
				end
			end
			str = str.."}"
			table.insert(Strs, str)
		end
	end
	DoParts(PartsTable)
	if SpecialTab ~= nil then
		DoParts(SpecialTab)
	end
	SCR = "{"
	if MapSpecific then
		SCR = SCR..'["MapSpecific"] = "'..MapName..'",\n'
	end
	if SpecificPosition then
		SCR = SCR..'["CenterPos"] = Vector3.new('..tostring(Mid)..'),\n'
	end
	for i = 1, #Strs do
		SCR = SCR..Strs[i]..", \n"
	end
	SCR = SCR.."}"
	writefile("VictinisGuiSettings/Bases/"..BN..".txt", SCR)
end

Corner1 = nil
Corner2 = nil
function MakeCorner(N)
	if game.Workspace:FindFirstChild("Corner"..tostring(N)) then
		game.Workspace:FindFirstChild("Corner"..tostring(N)):Destroy()
		return
	end
	local Model = Instance.new("Model", game.Workspace)
	Model.Name = "Corner"..tostring(N)
	if tostring(N) == "1" then
		Corner1 = Model
	else
		Corner2 = Model
	end
	local P1 = Instance.new("Part", Model)
	P1.Size = Vector3.new(2000, 300, 2)
	P1.Position = Vector3.new()
	P1.CanCollide = false
	P1.Anchored = true
	P1.Material = Enum.Material.Neon
	P1.Transparency = 0.5
	local P2 = P1:Clone()
	P2.Parent = Model
	P2.Size = Vector3.new(5, 300, 2000)
	P2.Position = P1.Position
	Model.PrimaryPart = P1
	Model:SetPrimaryPartCFrame(CFrame.new(LPlr.Character.Head.Position))
	return Model
end

function GetPartsInWorkspace()
	local Items = {}
	if not Corner1 or not Corner2 then return Items end
	for i, v in pairs(game.Workspace:GetDescendants()) do
		if v:IsA("BasePart") and HeadModelSizes[tostring(v.Size)] and CheckPosInside(v.Position) or v:IsA("Model") and game.Lighting.Materials:FindFirstChild(tostring(v)) and v:FindFirstChild("Head") and CheckPosInside(v.Head.Position) then
			table.insert(Items, v)
		elseif v:IsA("Model") and v:FindFirstChildOfClass("Model") and v:FindFirstChildOfClass("Model"):FindFirstChild("Head") and CheckPosInside(v:FindFirstChildOfClass("Model").Head.Position) and game.Lighting.LootDrops:FindFirstChild(tostring(v)) and not v:FindFirstChild("Head") and not v:IsDescendantOf(DroppedLoot) and not v:IsDescendantOf(SpawnedLoot) then
			--Pickup
			if not v:FindFirstChildOfClass("Model"):FindFirstChild("Decor") then
				local NV = Instance.new("StringValue", v:FindFirstChildOfClass("Model"))
				NV.Name = "Decor"
			end
			table.insert(Items, v)
		elseif v:IsA("Model") and pcall(function() IsAModelOfLoot(v) end) and not v:IsDescendantOf(DroppedLoot) and not v:IsDescendantOf(SpawnedLoot) and v:FindFirstChild("Head") and CheckPosInside(v.Head.Position) then
			v.Name = IsAModelOfLoot(v)
			if game.Lighting.LootDrops:FindFirstChild(tostring(v)) then
				table.insert(Items, v)
			end
		end
	end
	return Items
end

game.Lighting:GetPropertyChangedSignal("Ambient"):connect(function(Ch)
    if CheckColor(game.Lighting.Ambient, Color3.new(0.5, 0.5, 0.5)) == false and FullBrightOn == true then
        game.Lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
    end
end)
game.Lighting:GetPropertyChangedSignal("FogEnd"):connect(function(Ch)
    if game.Lighting.FogEnd < 1000000 and FullBrightOn == true then
        game.Lighting.FogEnd = 1000000
    end
end)
game.Lighting:GetPropertyChangedSignal("ClockTime"):connect(function(Ch)
    if game.Lighting.ClockTime ~= 7.5 and FullBrightOn == true then
        game.Lighting.ClockTime = 7.5
    end
end)
spawn(function()
	repeat
		wait()
	until LPlr:FindFirstChild("PlayerGui")
	if LPlr.PlayerGui:FindFirstChild("CameraZoom") then
		LPlr.PlayerGui.CameraZoom:remove()
	end
	LPlr.PlayerGui.ChildAdded:connect(function(Ch)
		wait(0.1)
		if tostring(Ch) == "CameraZoom" then
			Ch:remove()
		end
	end)
end)

--Game Loaded--
MakeSelectableText(VictinisGui)

--LoadGui Settings--
local AcceptedProperties = 0
function MakeColorListStr(Par, Str)
	local Tab = Par:GetChildren()
	if Par.ClassName == "ScrollingFrame" then
		Tab = {Tab[1]}
	end
	for i, v in pairs(Tab) do
		if v.ClassName ~= "StringValue" then
			Str = Str..'['..tostring(v)..'] = {'
			for a = 1, #PropertyTab do
				local Val;
				local Passed = pcall(function() Val = v[PropertyTab[a] ] end)
				if Passed == true then
					local IgnoreVal, ConvVal = ConvertInputedText(v[PropertyTab[a] ], tostring(v[PropertyTab[a] ]))
					StartStr = '["'..PropertyTab[a]..'"] = '
					if typeof(v[PropertyTab[a] ]) == "Color3" then
						StartStr = StartStr.."Color3.fromRGB("..ConvVal..")"
					else
						StartStr = StartStr..ConvVal
					end
					Str = Str..StartStr..", "
					AcceptedProperties = AcceptedProperties + 1
					if AcceptedProperties >= 10 then
						AcceptedProperties = 0
						Str = Str.."\n"
					end
				end
			end
			if SelectionMode[v] ~= nil then
				Str = Str..'["SM"] = '
				local IgnoreVal, ConvVal = ConvertInputedText(SelectionMode[v], tostring(SelectionMode[v]))
				if typeof(SelectionMode[v]) == "Color3" then
					Str = Str.."Color3.fromRGB("..ConvVal.."), "
				else
					Str = Str..'"'..ConvVal..'", '
				end
			end
			Str = Str..'},'
			Str = MakeColorListStr(v, Str)
		end
	end
	return Str
end

function MakeTeleportTabStr()
	if StoredTeleports == nil then
		StoredTeleports = {}
	end
	local Str = ""
	local Amount = 0
	for i, v in pairs(StoredTeleports) do
		Str = Str..'["'..tostring(i)..'"] = {'
		for a, b in pairs(v) do
			Str = Str..'["'..tostring(a)..'"] = Vector3.new('..tostring(b)..'), '
			Amount = Amount + 1
			if Amount >= 10 then
				Amount = 0
				Str = Str.."\n"
			end
		end
		Str = Str.."}, "
	end
	return Str
end

function MakeClothingTabStr()
	if not ClothingTab then
		ClothingTab = {}
	end
	local Str = ""
	local Amount = 0
	for i, v in pairs(ClothingTab) do
		local p = v[2]
		if not tonumber(p) then p = "nil" end
		local s = v[1]
		if not tonumber(s) then s = "nil" end
		Str = Str..'["'..tostring(i)..'"] = {'..tostring(p)..", "..tostring(s).."}, "
		Amount = Amount + 1
		if Amount >= 10 then
			Amount = 0
			Str = Str.."\n"
		end
	end
	return Str
end

function SaveBans()
	local BanStr = "return {"
	for i, v in pairs(Banned) do
		BanStr = BanStr..'"'..tostring(i)..'", '
	end
	WriteFile("Bans", BanStr.."}")
end

function SaveColors(Theme)
	local ColorStr = "return {"..MakeColorListStr(VictinisGui, "").."}"
	if not Theme then
		WriteFile("Color", ColorStr)
		return
	end
	WriteFile("Themes/"..Theme, ColorStr)
end

function SaveTeleports()
	WriteFile("Teleports", "return {"..MakeTeleportTabStr().."}")
end

function SaveClothing()
	WriteFile("Clothing", "return {"..MakeClothingTabStr().."}")
end

Banned = {}
function LoadBans()
	local Bool, TempBansList = ReadFile("Bans")
	if Bool then
		TempBansList = loadstring(TempBansList)()
		for i = 1, #TempBansList do
			Banned[TempBansList[i] ] = true
		end
	end
	DisplayBanned()
	for i, v in pairs(game.Players:GetPlayers()) do
		if Banned[tostring(v)] == true then
			Kick(v)
		end
	end
end

function LoadTeleports()
	local Bool, TempTeleportsList = ReadFile("Teleports")
	local StoredTeleports = {}
	if Bool then
		TempTeleportsList = loadstring(TempTeleportsList)()
		if TempTeleportsList and TempTeleportsList[MapName] then
			for i, v in pairs(TempTeleportsList[MapName]) do
				Teleports[i] = v
			end
			DisplayPlayersInTP()
		end
	end
end

ClothingTab = {}
function LoadClothing()
	local Bool, TempColorsList = ReadFile("Clothing")
	if Bool then
		ClothingTab = loadstring(TempColorsList)()
		for i, v in pairs(ClothingTab) do
			MakeClothingButton(i, true, function()
				ClothingButtonClick(v[1], v[2])
			end)
		end
	end
end

function LoadColors()
	local Corrupted = false
	local Bool, ColorsTab = ReadFile("Color")
	if Bool then
		ColorsTab = loadstring(ColorsTab)()
		LoadTheme(ColorsTab)
	end
end

function LoadThemes(Val)
	for i, v in pairs(ThemeList:GetChildren()) do
		if i ~= 1 then
			v:remove()
		end
	end
	for i, v in pairs(listfiles("VictinisGuiSettings/Themes")) do
		local fn = string.sub(v, 21)
		local themename = string.sub(fn, 8, string.len(fn)-4)
		if not Val or Val == "" or string.find(string.lower(themename), string.lower(Val)) then
			local Button = MakeThemeButton(themename, function()
				local TabCol = loadstring(readfile(v))()
				LoadTheme(TabCol)
				SaveColors()
			end)
			Button.DelListButton.MouseButton1Down:connect(function()
				delfile(v)
				LoadThemes(Val)
			end)
		end
	end
end

function LoadTheme(ColorsTab)
	local Corrupted = false
	for i, v in pairs(ColorsTab) do
		if typeof(i) ~= "string" then
			OriginalPropertyTab[i] = {}
			for a, b in pairs(v) do
				if a ~= "SM" then
					OriginalPropertyTab[i][a] = i[a]
					for c, d in pairs(i.Parent:GetChildren()) do
						if d.Name == i.Name then
							if not pcall(function()
								d[a] = b
								if d:FindFirstChildOfClass("TextButton") and (d:IsA("TextButton") or d:IsA("TextBox")) then
									local T = d:FindFirstChildOfClass("TextButton")
									T.BackgroundTransparency = d.BackgroundTransparency
									T.TextColor3 = d.TextColor3
									T.BorderSizePixel = d.BorderSizePixel
									T.Font = d.Font
								end
							end) then
								Corrupted = true
							end
						end
					end
				else
					SelectionMode[i] = b
				end
			end
		end
	end
	if Corrupted then
		Notify("There was an error in your theme, most of it should have loaded, but a few things may not have.", 8)
	end
end

local ReturnedTab = {}
function DoLoad(v)
	local Passed, IsF = pcall(function() ReturnedTab = loadstring("return "..readfile("VictiniGuiSettings.txt"))() end)
	if Passed == true then
		local TempBanList = ReturnedTab["BanList"]
		if TempBanList ~= nil then
			for i = 1, #TempBanList do
				Banned[TempBanList[i] ] = true
			end
		end
		SaveBans()
		DisplayBanned()
		StoredTeleports = ReturnedTab["Teleports"]
		if StoredTeleports ~= nil and StoredTeleports[MapName] ~= nil then
			for i, v in pairs(StoredTeleports[MapName]) do
				Teleports[i] = v
			end
			DisplayPlayersInTP()
		elseif StoredTeleports == nil then
			StoreTeleports = {}
		end
		SaveTeleports()
		for i, v in pairs(game.Players:GetPlayers()) do
			if Banned[tostring(v)] == true then
				Kick(v)
			end
		end
		ClothingTab = ReturnedTab["Clothing"]
		if not ClothingTab then
			ClothingTab = {}
		end
		for i, v in pairs(ClothingTab) do
			MakeClothingButton(i, true, function()
				ClothingButtonClick(v[1], v[2])
			end)
		end
		SaveClothing()
		local Corrupted = false
		local ColorsTab = ReturnedTab["ColorList"]
		pcall(function()
			if ColorsTab ~= nil then
				for i, v in pairs(ColorsTab) do
					if typeof(i) ~= "string" then
						OriginalPropertyTab[i] = {}
						for a, b in pairs(v) do
							if a ~= "SM" then
								OriginalPropertyTab[i][a] = i[a]
								for c, d in pairs(i.Parent:GetChildren()) do
									if d.Name == i.Name then
										if not pcall(function()
											d[a] = b
										end) then
											Corrupted = true
										end
									end
								end
							else
								SelectionMode[i] = b
							end
						end
					end
				end
			end
		end)
		SaveColors()
		if Corrupted then
			Notify("There was an error in your theme, most of it should have loaded, but a few things may not have.", 8)
		end
		delfile("VictiniGuiSettings.txt")
	else
		LoadBans()
		LoadTeleports()
		LoadClothing()
		LoadColors()
	end
	LoadThemes()
end
DoLoad()

--Finish Loading Settings--

--Frame Coloring--
Notify("Gui is fully loaded!\n If any problems are found they'll appear after this message!", 10)
CheckFor(game.ReplicatedStorage.Zombies.Zombie, "thisishat", true, "Warning, zombies are unhitable!", 5)
CheckForExploits()
CheckFor(game.Workspace, "Zombies", false, "Warning, zombies not found in Workspace!", 8)
if Corpse == nil then
    Notify("Corpse not found! Keep Inventory is permanently on.", 3)
elseif Corpse ~= nil and Corpse.Parent ~= game.ReplicatedStorage then
    SingleButtonSelection(MiscCommandList, KeepInventoryButton, TempMiscCommandButton, true)
end


TableHolder = {["P"] = game.Players, ["M"] = game.Lighting.Materials, ["W"] = game.Workspace, ["L"] = game.Lighting.LootDrops, ["V"] = {"Vector3"}, ["Ve"] = game.Workspace.Vehicles, ["K"] = function() return "i", KitsList end,
["in"] = {"Input"}, ["CT1"] = {"Tank", "SnowTank", "SandTank"}, ["CT2"] = {"Bus"}}
FunctionsForCommands = {["TP"] = {"P", {"P", "W", "V"}}, ["Kill"] = {"P"}, ["Kick"] = {"P"}, ["God"] = {"P"}, ["Tank"] = {"Ve", "CT1"}, ["CustomVehicle"] = {"Ve", "CT2"}, ["Spawn"] = {"P", {"L", "Ve"}, "in"}}
FunctionsHolder = {["TP"] = TPPlayerPos, ["Kill"] = Kill, ["Kick"] = Kick, ["God"] = God, ["Tank"] = MakeTank, ["CustomVehicle"] = SpawnCustomVehicle}
function MakeOptionsTable(T)
	local Ta = {}
	if typeof(T) == "string" and TableHolder[T] then
		local NA = TableHolder[T]
		if typeof(NA) == "Instance" then
			NA = NA:GetChildren()
		end
		for i, v in pairs(NA) do
			table.insert(Ta, v)
		end
	elseif typeof(T) == "string" then
		table.insert(Ta, v)
	elseif typeof(T) == "Instance" then
		for i, v in pairs(T:GetChildren()) do
			table.insert(Ta, v)
		end
	elseif typeof(T) == "table" and T ~= FunctionsForCommands then
		for i, v in pairs(T) do
			local NT = v
			if typeof(NT) == "string" and TableHolder[NT] then
				NT = TableHolder[NT]
				if typeof(NT) == "Instance" then
					NT = NT:GetChildren()
				end
			elseif typeof(NT) == "string" then
				NT = {NT}
			elseif typeof(NT) == "function" then
				NT = {i}
			elseif typeof(NT) == "Instance" then
				NT = NT:GetChildren()
			end
			for a = 1, #NT do
				table.insert(Ta, NT[a])
			end
		end
	elseif typeof(T) == "function" then
		local ii, NT = T()
		if ii == "i" then
			for i, v in pairs(NT) do
				if ii == "i" then
					table.insert(Ta, i)
				else
					table.insert(Ta, v)
				end
			end
		end
	elseif T == FunctionsForCommands then
		for i, v in pairs(FunctionsForCommands) do
			table.insert(Ta, i)
		end
	end
	return Ta
end

--Set toggles--

SingleButtonSelection(BaseToggleList, ToggleBaseView, TempBaseToggleButton, true)
SingleButtonSelection(BaseToggleList, NukeFollowButton, TempBaseToggleButton, true)
