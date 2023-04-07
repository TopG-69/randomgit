--[[
          ╭╭━━━━━╮╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮╭━━━━━╮╮
          ┃┃ ━━━ ┃┃\       █████╗  ██████╗  █████╗ ███╗  ██╗██╗   ██╗      /┃┃ ━━━ ┃┃
          ┃┃     ┃┃       ██╔══██╗██╔════╝ ██╔══██╗████╗ ██║╚██╗ ██╔╝       ┃┃     ┃┃
          ┃┃     ┃┃       ███████║██║  ██╗ ██║  ██║██╔██╗██║ ╚████╔╝        ┃┃     ┃┃
          ┃┃     ┃┃       ██╔══██║██║  ╚██╗██║  ██║██║╚████║  ╚██╔╝         ┃┃     ┃┃
          ┃┃     ┃┃       ██║  ██║╚██████╔╝╚█████╔╝██║ ╚███║   ██║          ┃┃     ┃┃
          ┃┃ ━━━ ┃┃/      ╚═╝  ╚═╝ ╚═════╝  ╚════╝ ╚═╝  ╚══╝   ╚═╝         \┃┃ ━━━ ┃┃
          ╰╰━━━━━╯╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯╰━━━━━╯╯
 
╭━━━━━━━━━━━━━━━━╮╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮╭━━━━━━━━━━━━━━━━╮
                      █▀▀▀█ █▀▀█ █──█ █▀▀█ █▀▀ █▀▀ 　 █▀▀█ █▀▀█ █▀▀▄ █▀▀
                     ─▀▀▀▄▄ █──█ █──█ █▄▄▀ █── █▀▀ 　 █─── █──█ █──█ █▀▀
                      █▄▄▄█ ▀▀▀▀ ─▀▀▀ ▀─▀▀ ▀▀▀ ▀▀▀ 　 █▄▄█ ▀▀▀▀ ▀▀▀─ ▀▀▀
╰━━━━━━━━━━━━━━━━╯╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯╰━━━━━━━━━━━━━━━━╯
--]]

OSstart = os.time()
ShowFunctionAlerts = true
ShowLeaveAlerts = true
ShowJoinAlerts = true
ShowExploitAlerts = true
TogglePunishExploiters = false
ExecutorName = syn and "Synapse X" or getexecutorname and "ScriptWare" or KRNL_LOADED and "Krnl / Oxygen U / Comet" or is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or secure_load and "Sentinel" or "n/a"

--[[rconsoleclear()
rconsolename('Log')--]]
success, result = pcall(function()



--setup
MainGui = Instance.new("ScreenGui")
MainGui.Name = "ApocGui"
MainGui.Parent = game.CoreGui

NotifyFrame = Instance.new("Frame", MainGui)
NotifyFrame.Name = "NotifyFrame"
NotifyFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotifyFrame.BackgroundTransparency = 1
NotifyFrame.BorderSizePixel = 0
NotifyFrame.Position = UDim2.new(0.4405, 0, 0.2, 0)
NotifyFrame.Size = UDim2.new(0, 1, 0, 20)

NotifyLabel = Instance.new("TextLabel", NotifyFrame)
NotifyLabel.Name = "NotifyLabel"
NotifyLabel.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
NotifyLabel.BackgroundTransparency = 1
NotifyLabel.BorderColor3 = Color3.fromRGB(110, 172, 216)
NotifyLabel.BorderSizePixel = 0
NotifyLabel.Size = UDim2.new(0, 170, 0, NotifyFrame.Size.Y.Offset)
NotifyLabel.Font = Enum.Font.SourceSans
NotifyLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
NotifyLabel.TextSize = 30
NotifyLabel.Visible = false

function Notify(Text, Time, ColorR, ColorG, ColorB)
	NotifyLabel.TextColor3 = Color3.fromRGB(ColorR, ColorG, ColorB)
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
end

AnnnounceFrame = Instance.new("Frame", MainGui)
AnnnounceFrame.Name = "NotifyFrame"
AnnnounceFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AnnnounceFrame.BackgroundTransparency = 1
AnnnounceFrame.BorderSizePixel = 0
AnnnounceFrame.Position = UDim2.new(0.75, 0, 0.92, 0)--75
AnnnounceFrame.Size = UDim2.new(0, 1, 0, 45)

AnnnounceMessageBox = Instance.new("TextLabel", AnnnounceFrame)
AnnnounceMessageBox.Name = "ABox"
AnnnounceMessageBox.Text = ""
AnnnounceMessageBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AnnnounceMessageBox.BackgroundTransparency = 0.6
AnnnounceMessageBox.BorderColor3 = Color3.fromRGB(255, 255, 255)
AnnnounceMessageBox.BorderSizePixel = 0
AnnnounceMessageBox.Size = UDim2.new(0, 350, 0, 45)
AnnnounceMessageBox.TextColor3 = Color3.fromRGB(0, 0, 0)
AnnnounceMessageBox.TextSize = 30
AnnnounceMessageBox.Visible = false

AnnnounceMessageBoxPersonal = Instance.new("TextLabel", AnnnounceFrame)
AnnnounceMessageBoxPersonal.Name = "ABox"
AnnnounceMessageBoxPersonal.Text = ""
AnnnounceMessageBoxPersonal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AnnnounceMessageBoxPersonal.BackgroundTransparency = 0
AnnnounceMessageBoxPersonal.BorderColor3 = Color3.fromRGB(110, 172, 216)
AnnnounceMessageBoxPersonal.BorderSizePixel = 0
AnnnounceMessageBoxPersonal.Size = UDim2.new(0, 1, 0, 45)
AnnnounceMessageBoxPersonal.TextColor3 = Color3.fromRGB(0, 0, 0)
AnnnounceMessageBoxPersonal.TextSize = 30
AnnnounceMessageBoxPersonal.Visible = false

TopAnnouncementLabel = Instance.new("TextLabel", AnnnounceFrame)
TopAnnouncementLabel.Name = "TopALabel"
TopAnnouncementLabel.Text = ""
TopAnnouncementLabel.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
TopAnnouncementLabel.BackgroundTransparency = 1
TopAnnouncementLabel.BorderColor3 = Color3.fromRGB(110, 172, 216)
TopAnnouncementLabel.BorderSizePixel = 0
TopAnnouncementLabel.Size = UDim2.new(0, 350, 0, AnnnounceFrame.Size.Y.Offset-25)--20
TopAnnouncementLabel.Font = Enum.Font.SourceSansBold
TopAnnouncementLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TopAnnouncementLabel.TextSize = 25
TopAnnouncementLabel.Visible = false

AnnouncementLabel = Instance.new("TextLabel", AnnnounceFrame)
AnnouncementLabel.Name = "BottomALabel"
AnnouncementLabel.Text = ""
AnnouncementLabel.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
AnnouncementLabel.BackgroundTransparency = 1
AnnouncementLabel.BorderColor3 = Color3.fromRGB(110, 172, 216)
AnnouncementLabel.BorderSizePixel = 0
AnnouncementLabel.Size = UDim2.new(0, 350, 0, AnnnounceFrame.Size.Y.Offset+15)--20
AnnouncementLabel.Position = UDim2.new(0, 0, 0, 25)
AnnouncementLabel.Font = Enum.Font.SourceSans
AnnouncementLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AnnouncementLabel.TextSize = 15
AnnouncementLabel.Visible = false
--AnnouncementLabel.TextScaled = true
AnnouncementLabel.TextWrapped = true

function AnnounceBox(MainText, SideText, Time, RGBMainTextR, RGBMainTextG, RGBMainTextB, RGBSideTextR, RGBSideTextG, RGBSideTextB)
    AnnouncementLabel.TextColor3 = Color3.fromRGB(RGBMainTextR, RGBMainTextG, RGBMainTextB)
    TopAnnouncementLabel.TextColor3 = Color3.fromRGB(RGBSideTextR, RGBSideTextG, RGBSideTextB)
    AnnnounceMessageBoxPersonal.BackgroundColor3 = Color3.fromRGB(RGBMainTextR, RGBMainTextG, RGBMainTextB)
    for i, v in pairs(AnnnounceFrame:GetChildren()) do
		if v ~= AnnouncementLabel and v ~= TopAnnouncementLabel and v ~= AnnnounceMessageBox and v ~= AnnnounceMessageBoxPersonal then
			v.Position = UDim2.new(0, 0, 0, -AnnnounceFrame.Size.Y.Offset*(#AnnnounceFrame:GetChildren()-(i-1)))
		end
    end
    local F2 = AnnnounceMessageBox:Clone()
	F2.Visible = true
    F2.Parent = AnnnounceFrame
    F2.Position = UDim2.new(0, 0, 0, 0)
	F2.BorderColor3 = Color3.fromRGB(RGBMainTextR, RGBMainTextG, RGBMainTextB)
    local F3 = AnnnounceMessageBoxPersonal:Clone()
	F3.Visible = true
    F3.Parent = F2
    F3.Position = UDim2.new(0, 0, 0, 0)
    local F = AnnouncementLabel:Clone()
	F.Visible = true
    F.Parent = F2
    F.Position = UDim2.new(0, 0, 0, 0)
    F.Text = MainText
    local F1 = TopAnnouncementLabel:Clone()
	F1.Visible = true
    F1.Parent = F2
    F1.Position = UDim2.new(0, 0, 0, 0)
    F1.Text = SideText
    if Time == nil then
        Time = 3
    end
    spawn(function()
        wait(Time-1)
        for i, v in pairs(AnnnounceFrame:GetChildren()) do
            if v ~= AnnouncementLabel and v ~= TopAnnouncementLabel and v ~= AnnnounceMessageBox and v ~= AnnnounceMessageBoxPersonal then 
                v.Position = UDim2.new(0, 0, 0, -AnnnounceFrame.Size.Y.Offset*(#AnnnounceFrame:GetChildren()-(i)))
            end
            if v == F2 then
                F2:TweenPosition(UDim2.new(0, math.floor(F2.Size.X.Offset*2), 0, -AnnnounceFrame.Size.Y.Offset*(#AnnnounceFrame:GetChildren()-(i))),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,2,true)
            end
        end

        wait(1)
        F:remove()
        F1:remove()
        F2:remove()
        F3:remove()
    end)
end
--setup



--warning
if ExecutorName ~= "Synapse X" then
	AnnounceBox("Synapse X was not detected!", "ERROR", 15, 95, 60, 60, 255, 255, 255)
	AnnounceBox("Warning your executor (" .. ExecutorName .. ") has a high chance of not supporting the script!", "SCRIPT", 15, 255, 255, 255, 255, 255, 255)
else
	if ExecutorName == "Synapse X" then
		AnnounceBox("Synapse X detected script will load correctly!", "SCRIPT", 5, 255, 255, 255, 255, 255, 255)
	else
		AnnounceBox("Synapse X was not detected!", "ERROR", 15, 95, 60, 60, 255, 255, 255)
		AnnounceBox("Warning your executor (" .. ExecutorName .. ") has a high chance of not supporting the script!", "SCRIPT", 15, 255, 255, 255, 255, 255, 255)
	end
end
--warning



--setup
LocalPlayer = game.Players:GetChildren()[1]
UserInputService = game:GetService("UserInputService")

CoreGui = game:GetService("CoreGui")
Lighting = game:GetService("Lighting")
Workspace = game:GetService("Workspace")
Players = game:GetService("Players")
ReplicatedStorage = game:GetService("ReplicatedStorage")
RunService = Game:GetService("RunService")
Loot = Lighting.LootDrops
Mats = Lighting.Materials
Bags = Lighting.Backpacks
Vehicles = game.Workspace:FindFirstChild("Vehicles")
rconsoleprint("[!] " .. tostring(Loot) .. "\n")
if Vehicles == nil then
R.AddClothing:FireServer("Vehicles", game.Workspace, "", "", "")
Vehicles = game.Workspace:WaitForChild("Vehicles")
end
local G = getrenv()._G
Ob = G.Obfuscate
Deob = G.Deobfuscate
--setup



--functions
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

function Texture(model, texture, value)
    if model:IsA("Model") then 
	    fireserver("VehichleLightsSet", model, texture, value)
    end
end

function PlayerTeleport(teleporter, reciver, mode)
	if mode == 1 then
		spawn(function()								
			AddClothing = game.Workspace.Remote.AddClothing

			AddClothing:FireServer("driven", teleporter.Character, "","","")
			AddClothing:FireServer("IsBuildingMaterial", teleporter.Character.HumanoidRootPart, "poop","","")
			AddClothing:FireServer("SeatPoint", teleporter.Character.Torso, "","","")
			game:GetService("Workspace").Remote.HurtZombie:FireServer(teleporter.Character)
			wait(0.2)
			game:GetService("Workspace").Remote.ReplicatePart:FireServer(teleporter.Character.HumanoidRootPart, reciver.Character.Head.CFrame)
			wait(1)
			fireserver("ChangeParent", teleporter.Character.driven, nil)
			fireserver("ChangeParent", teleporter.Character.HumanoidRootPart.IsBuildingMaterial, nil)
			fireserver("ChangeParent", teleporter.Character.Torso.SeatPoint, nil)
			return
		end)
	elseif mode == 2 then
		--for map locations!
	elseif mode == nil or mode == nan then
		--Notify("[Error]: Invalid mode usage!", 5, 95, 60, 60)
		if ShowFunctionAlerts then
			AnnounceBox("Invalid mode usage!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
		end
	end
end

local S = LocalPlayer.PlayerGui.ViewContents.Storage.SlotScript
onChanged = getsenv(S).onChanged

InventoryZeroPhrame = Instance.new("Frame")
InventoryZeroPhrame.Size = UDim2.new(0, 350, 0, 250)
InventoryZeroPhrame.Position = UDim2.new(0.3, 0, 0.1, 0)
InventoryZeroPhrame.BorderSizePixel = 5
InventoryZeroPhrame.Transparency = 1
InventoryZeroPhrame.Draggable = false
InventoryZeroPhrame.Active = false
InventoryZeroPhrame.Selectable = false
InventoryZeroPhrame.Parent = MainGui

InventoryFrame = Instance.new("Frame", InventoryZeroPhrame)
InventoryFrame.Name = "InventoryFrame"
InventoryFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
InventoryFrame.Transparency = 0.3
InventoryFrame.BorderSizePixel = 0
InventoryFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
InventoryFrame.Size = UDim2.new(0, 350, 0, 250)
InventoryFrame.Visible = false

InventoryBar = Instance.new("TextLabel", InventoryFrame)
InventoryBar.Name = "InventoryBar"
InventoryBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
InventoryBar.BackgroundTransparency = 0.4
InventoryBar.BorderSizePixel = 0
InventoryBar.Size = UDim2.new(1, 0, 0, 25)
InventoryBar.Text = "Inventory"
InventoryBar.TextColor3 = Color3.fromRGB(255, 255, 255)
InventoryBar.Transparency = 0.01
InventoryBar.TextScaled = true
InventoryBar.TextSize = 14
InventoryBar.TextWrapped = true

InventoryClose = Instance.new("ImageButton")
InventoryClose.Size = UDim2.new(0, 25, 0, 25)
InventoryClose.Position = UDim2.new(1, -25, 0, 0)
InventoryClose.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
InventoryClose.BorderColor3 = Color3.fromRGB(255, 255, 255)
InventoryClose.BackgroundTransparency = 1
InventoryClose.BorderSizePixel = 0
InventoryClose.Visible = true
InventoryClose.Image = "rbxassetid://12942585305"
InventoryClose.ImageColor3 = Color3.fromRGB(110, 110, 110)
InventoryClose.Parent = InventoryBar
InventoryClose.MouseButton1Down:connect(function()
    InventoryFrame.Visible = false
    InventoryZeroPhrame.Draggable = false
    InventoryZeroPhrame.Active = false
    InventoryZeroPhrame.Selectable = false
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
ClipValue.Text = "nil"
ClipValue.TextColor3 = Color3.fromRGB(255, 255, 255)
ClipValue.TextSize = 14
ClipValue.TextWrapped = true

GunValue = Instance.new("StringValue", InventoryButton)
GunValue.Name = "guntext"

LocalPlayerInventory = Instance.new("ScrollingFrame", InventoryFrame)
LocalPlayerInventory.Name = "LocalPlayerInventory"
LocalPlayerInventory.Active = true
LocalPlayerInventory.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LocalPlayerInventory.CanvasSize = UDim2.new(0, 0, 1, 32)
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
OpPlayerInventory.CanvasSize = UDim2.new(0, 0, 1, 32)
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
	local TransferTo = LocalPlayer
	local TransferFrom = LocalPlayer
	if Plr == LocalPlayer then
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

local SpawnedItems = {}
function SpawnItem(Par, OF, SelectedItem, SelectedPlayer)
if SelectedPlayer == nil or SelectedItem == nil then
return
end
if SpawnedItems[SelectedItem] == nil then
SpawnedItems[SelectedItem] = {true}
else
table.insert(SpawnedItems[SelectedItem], true)
end
if SelectedItem.Parent ~= Mats then
fireserver("ChangeParent", Par:WaitForChild(tostring(SelectedItem)), Mats)
end
local ItemI = Mats:WaitForChild(tostring(SelectedItem))
pcall(function() R["PlaceMaterial"]:FireServer(Mats:WaitForChild(tostring(SelectedItem)).Name, SelectedPlayer.Character.Torso.Position-ItemI.PrimaryPart.Position-OF) end)
spawn(function()
wait(2)
table.remove(SpawnedItems[SelectedItem], 1)
if #SpawnedItems[SelectedItem] < 1 then
fireserver("ChangeParent", Mats:WaitForChild(tostring(SelectedItem)), Par)
end
end)
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
		Button.MouseButton1Click:connect(function()
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
SetupWatch(LocalPlayer, 1)

function Inventory(Plr)
	if Plr ~= LocalPlayer then
	    InventoryFrame.Visible = true
	    SetupWatch(Plr, 2)
        InventoryZeroPhrame.Draggable = true
        InventoryZeroPhrame.Active = true
        InventoryZeroPhrame.Selectable = true
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
	if ind == "Health" and LocalPlayer.Character ~= nil and rc == LocalPlayer.Character:FindFirstChild("Humanoid") and id < 100 then
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
		AnnounceBox("Someone attempted to free you!", "WARNING", 5, 130, 130, 60, 255, 255, 255)
		return "Nope"
	elseif i == "Name" and tostring(rc) == "Remote" and RemoteTable and RemoteTable[i] then
		return RemoteTable[i]
    end
    return id(rc, i)
end)
meta.__namecall = newcclosure(function(rc, ...)
	args = {...}
	if getnamecallmethod() == "FindFirstChild" and args[1] == "PermanentBan" and rc == LocalPlayer then
		AnnounceBox("Someone attempted to freeze you!", "WARNING", 5, 130, 130, 60, 255, 255, 255)
		return
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
if not LocalPlayer or not pcall(function() return (LocalPlayer == game.Players.LocalPlayer) end) then
	KillServer()
end
LocalPlayer:GetPropertyChangedSignal("Parent"):connect(function()
	if LocalPlayer.Parent == nil then
		KillServer()
	end
end)

function SetupHumanoidWatch()
    repeat
        wait()
    until LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	local Root = LocalPlayer.Character.HumanoidRootPart
	local Hum = LocalPlayer.Character.Humanoid
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
			if ShowFunctionAlerts then
				AnnounceBox("Someone attempted to kick you!", "ANTI KICK", 5, 130, 130, 60, 255, 255, 255)
			end
			spawn(function()
				for i = 1, 30 do
					for a = 1, #TempPlrTab do
						if not game.Players:FindFirstChild(tostring(TempPlrTab[a])) and tostring(TempPlrTab[a]) ~= "nil" then
							Notify("Possible Kicker: "..tostring(TempPlrTab[a]), 5)
							if ShowFunctionAlerts then
								AnnounceBox("Possible kicker ".. tostring(TempPlrTab[a]) .. "!", "ANTI KICK", 5, 130, 130, 60, 255, 255, 255)
							end
							table.remove(TempPlrTab, a)
						end
					end
					wait(0.1)
				end
				DidTryKick = false
			end)
        end
    end)
	local LastPos = LocalPlayer.Character.HumanoidRootPart.Position
	Root:GetPropertyChangedSignal("Position"):connect(function()
		wait(0.1)
		if LocalPlayer.Character == nil or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
			return
		end
		if (Root.Position - LastPos).Magnitude > 100 and DidTryKick == true then
			Root.Velocity = Vector3.new()
			DidTryKick = false
			LocalPlayer.Character:MoveTo(LastPos)
		else
			LastPos = Root.Position
		end
	end)
	if LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:WaitForChild("SkyboxRenderMode") then
		LocalPlayer.PlayerGui.SkyboxRenderMode:Destroy()
	end
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
    else
        fireserver("ChangeParent", Plr.Character, game.Lighting)
    end
end

ExploitersList = {}
ExploiterLabel = Instance.new("TextLabel")
ExploiterLabel.Name = "ExploiterLabel"
ExploiterLabel.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
ExploiterLabel.BackgroundTransparency = 0.7
ExploiterLabel.BorderColor3 = Color3.fromRGB(110, 172, 216)
ExploiterLabel.BorderSizePixel = 0
ExploiterLabel.Size = UDim2.new(0, 56, 0, 16)
ExploiterLabel.Font = Enum.Font.SourceSans
ExploiterLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ExploiterLabel.TextScaled = true
ExploiterLabel.TextSize = 14
ExploiterLabel.TextWrapped = true
ExploiterLabel.Visible = false
ExploiterLabel.Position = UDim2.new(30, 0, 30, 0)
ExploiterLabel.TextXAlignment = Enum.TextXAlignment.Left
ExploiterLabel.Parent = MainGui
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
	local InGamePlayerList = LocalPlayer.PlayerGui:WaitForChild("MyGroup"):WaitForChild("Bin")
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
LocalPlayer.PlayerGui.ChildAdded:connect(function(Ch)
	if tostring(Ch) == "MyGroup" then
		HandleExploitPlayerList()
	end
end)

function CheckNumber(Numb)
    return tonumber(string.sub(tostring(Numb), 1, 1))
end
function CheckForExploits()
    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= LocalPlayer then
            pcall(function()
                if CheckNumber(v.playerstats.Hunger.Value) == nil or CheckNumber(v.playerstats.Thirst.Value) == nil then
                    if ShowExploitAlerts then
                        AnnounceBox("Warning player " .. tostring(v) .. " has infinite vitals!", "DETECT EXPLOITS", 5, 130, 130, 60, 255, 255, 255)
					end
					if not ExploitersList[tostring(v)] then
						ExploitersList[tostring(v)] = "Inf Vitals"
						AddPlayerToExploitList(v, "Inf Vitals")
					end
					if TogglePunishExploiters then
					    Vitals(v, 1)
					    if ShowFunctionAlerts then
					        AnnounceBox("Warning removed vitals from " .. tostring(v) .. "!", "PUNISH EXPLOITS", 5, 130, 130, 60, 255, 255, 255)
                        end
					end
                end
				if not v.Character:FindFirstChild("Humanoid") then
                    if ShowExploitAlerts then
                        AnnounceBox("Warning player " .. tostring(v) .. " is using JJSploit!", "DETECT EXPLOITS", 5, 130, 130, 60, 255, 255, 255)
					end
					ExploitersList[tostring(v)] = "JJ Sploit"
					AddPlayerToExploitList(v, "JJ Sploit")
					if TogglePunishExploiters then
					    Kick(v)
					    if ShowFunctionAlerts then
					        AnnounceBox("Warning kicked " .. tostring(v) .. "!", "PUNISH EXPLOITS", 5, 130, 130, 60, 255, 255, 255)
                        end
					end
				end
                if tonumber(string.sub(tostring(v.Character.Humanoid.Health), 1, 1)) == nil then
                    if ShowExploitAlerts then
                        AnnounceBox("Warning player " .. tostring(v) .. " has infinite health!", "DETECT EXPLOITS", 5, 130, 130, 60, 255, 255, 255)
					end
					if not ExploitersList[tostring(v)] or ExploitersList[tostring(v)] == "Inf Vitals" then
						ExploitersList[tostring(v)] = "Inf Health"
						AddPlayerToExploitList(v, "Inf Health")
					end
					if TogglePunishExploiters then
					    Kill(v)
					    if ShowFunctionAlerts then
					        AnnounceBox("Warning killed " .. tostring(v) .. "!", "PUNISH EXPLOITS", 5, 130, 130, 60, 255, 255, 255)
                        end
					end
                end
                if v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid:FindFirstChild("DefenseMultiplier") and tonumber(v.Character.Humanoid.DefenseMultiplier.Value) <= 0 then
                    if ShowExploitAlerts then
                        AnnounceBox("Warning player " .. tostring(v) .. " has PKGod!", "DETECT EXPLOITS", 5, 130, 130, 60, 255, 255, 255)
					end
					if not ExploitersList[tostring(v)] or ExploitersList[tostring(v)] == "Inf Vitals" then
						ExploitersList[tostring(v)] = "PK God"
						AddPlayerToExploitList(v, "PK God")
					end
					if TogglePunishExploiters then
					    PKGod(v, 2)
					    if ShowFunctionAlerts then
					        AnnounceBox("Warning removed PKGod from " .. tostring(v) .. "!", "PUNISH EXPLOITS", 5, 130, 130, 60, 255, 255, 255)
                        end
					end
                end
				if v:FindFirstChild("playerstats") and v.playerstats:FindFirstChild("character") and v.playerstats.character:FindFirstChild("AntiTP") then
                    if ShowExploitAlerts then
                        AnnounceBox("Warning player " .. tostring(v) .. " is using XR Hub!", "DETECT EXPLOITS", 5, 130, 130, 60, 255, 255, 255)
					end
					ExploitersList[tostring(v)] = "XR Hub"
					AddPlayerToExploitList(v, "XR Hub")
					if TogglePunishExploiters then
					    Kick(v)
					    if ShowFunctionAlerts then
					        AnnounceBox("Warning kicked " .. tostring(v) .. "!", "PUNISH EXPLOITS", 5, 130, 130, 60, 255, 255, 255)
                        end
					end
				end
            end)
        end
    end
end

local VisibleCT = {}
function ZombieVisible(Plr, Val)
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

function CleanCows()
    local CowsCleaned = 0
    for _, v in pairs(Workspace:GetChildren()) do
        if  v.Name == "Animal1" or v.Name == "Animal2" or v.Name == "Animal3" or v.Name == "Animal4" or v.Name == "Animal5" or v.Name == "Animal6" then
            fireserver("ChangeParent", v, nil)
            CowsCleaned = CowsCleaned + 1
        end
    end
    if ShowFunctionAlerts then
        AnnounceBox("Successfully cleaned cows! (" .. tostring(CowsCleaned) .. ")", "CLEAN COWS", 5, 130, 130, 60, 255, 255, 255)
    end
end

function CleanLoot()
    local LootCleaned = 0
    for _, v in pairs(Workspace:GetChildren()) do
        if Lighting.LootDrops:FindFirstChild(v.Name) then
            LootCleaned = LootCleaned + 1
            fireserver("ChangeParent", v, nil)
        end
    end
    if ShowFunctionAlerts then
        AnnounceBox("Successfully cleaned loot! (" .. tostring(LootCleaned) .. ")", "CLEAN LOOT", 5, 130, 130, 60, 255, 255, 255)
    end
end

function CleanGarbage()
    local GarbageCleaned = 0
    for _, v in pairs(Workspace:GetChildren()) do
        if v.Name == "C4Placed" or v.Name == "VS50Placed" or v.Name == "TM46Placed" or v.Name == "Fireplace" or v.Name == "RoadFlareLit" or v.Name == "Animal1" or v.Name == "Animal2" or v.Name == "Animal3" or v.Name == "Animal4" or v.Name == "Animal5" or v.Name == "Animal6" then
            GarbageCleaned = GarbageCleaned + 1
            fireserver("ChangeParent", v, nil)
        end
    end
    if ShowFunctionAlerts then
        AnnounceBox("Successfully cleaned garbage! (" .. tostring(GarbageCleaned) .. ")", "CLEAN GARBAGE", 5, 130, 130, 60, 255, 255, 255)
    end
end

function CleanBuildings()
    local CleanedBuildings = 0
    for i, v in pairs(game.Workspace:GetChildren()) do
        if v:IsA("BasePart") then
			CleanedBuildings = CleanedBuildings + 1
			fireserver("ChangeParent", v)
		end
    end
    AnnounceBox("Successfully cleaned buildings! (" .. tostring(CleanedBuildings) .. ")", "CLEAN BUILDINGS", 5, 130, 130, 60, 255, 255, 255)
end

function CleanVehicles()
    local VehiclesCleaned = 0
    for _, v in pairs(Workspace:FindFirstChild("Vehicles"):GetDescendants()) do
        if v.Name == "MaxSpeed" and v.Value > 100 or v.Name == "Hull" and v.Value > 5000 then
            VehiclesCleaned = VehiclesCleaned + 1
            fireserver("ChangeParent", v.Parent.Parent)
        end
    end
    if ShowFunctionAlerts then
        AnnounceBox("Successfully cleaned vehicles! (" .. tostring(VehiclesCleaned) .. ")", "CLEAN VEHICLES", 5, 130, 130, 60, 255, 255, 255)
    end
end

function CleanExplosives()
    local ExplosivesCleaned = 0
    for _, v in pairs(Workspace:GetChildren()) do
        local IsMine = v.Name == "VS50Placed" or v.Name == "TM46Placed"
        local IsC4 = v.Name == "C4Placed"
        if IsMine then
            ExplosivesCleaned = ExplosivesCleaned + 1
            fireserver("ChangeValue", v.Active, true)
        elseif IsC4 then
            ExplosivesCleaned = ExplosivesCleaned + 1
            R.Detonate:FireServer(v)
        end
    end
    if ShowFunctionAlerts then
        AnnounceBox("Successfully cleaned explosives! (" .. tostring(ExplosivesCleaned) .. ")", "DETO EXPLOSIVES", 5, 130, 130, 60, 255, 255, 255)
    end
end

function CleanParts()
    local PartsCleaned =  0
    spawn(function()
		for _, v in pairs(Workspace:GetDescendants()) do 
			if v.Name == "Floodlight" or v.Name == "LargeCrateOpen" or v.Name == "SmallCrateOpen" or v.Name == "Fireplace" then
			    PartsCleaned = PartsCleaned + 1
				fireserver("ChangeParent", v, nil)
			elseif (v.Name == "Part" or v.Name == "Head" or v.Name == "Truss") then
				if table.find(Vector3Objects,v.Size) then
				    PartsCleaned = PartsCleaned + 1
					fireserver("ChangeParent", v, nil)
				end
			end
		end
    end)
    if ShowFunctionAlerts then
        AnnounceBox("Successfully cleaned parts! (" .. tostring(PartsCleaned) .. ")", "CLEAN PARTS", 5, 130, 130, 60, 255, 255, 255)
    end
end

function Vitals(player, mode, amount)
	if mode == 1 then
    	fireserver("ChangeValue", player.playerstats.Hunger, nil)
		fireserver("ChangeValue", player.playerstats.Thirst, nil)
	elseif mode == 2 then
    	fireserver("ChangeValue", player.playerstats.Hunger, math.huge)
		fireserver("ChangeValue", player.playerstats.Thirst, math.huge)
	elseif mode == 3 then
    	fireserver("ChangeValue", player.playerstats.Hunger, 100)
		fireserver("ChangeValue", player.playerstats.Thirst, 100)
	elseif mode == 4 then
		if amount == nil then
			if ShowFunctionAlerts then
				AnnounceBox("Amount is invalid!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
			end
		else
			fireserver("ChangeValue", player.playerstats.Hunger, amount)
		end
	elseif mode == 5 then
		if amount == nil then
			if ShowFunctionAlerts then
				AnnounceBox("Amount is invalid!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
			end
		else
			fireserver("ChangeValue", player.playerstats.Thirst, amount)
		end
	elseif mode == nil or mode == nan then
		--Notify("[Error]: Invalid mode usage!", 5, 95, 60, 60)
		if ShowFunctionAlerts then
		    AnnounceBox("Invalid mode usage!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
		end
	end
end

function LaunchRocket(Plr, Dist)
end

function GetPlayers(Str)
	local Users = {} 
	for newString in Str:gmatch("([^,]+)") do
		if newString:lower() == "random" then
			table.insert(Users, service.Players:GetChildren()[math.random(#service.Players:GetChildren())])
		else
			for i,v in pairs(service.Players:GetChildren()) do
				if v.Name:lower():sub(1, #newString) == newString:lower() then
					table.insert(Users, v)
				end
			end
		end
	end
	return Users
end

function InventoryClear(Players)
	local Players = GetPlayers(Players)
	for i = 1, #Players do
		local Player = Players[i]
		if service.Workspace:findFirstChild(Player.Name) and Player:findFirstChild("playerstats") then
			local Slots = Player.playerstats.Slots:GetChildren()
			for i = 1, #Slots do
				local Slot = Slots[i]
				if Slot:findFirstChild("ObjectID") then
					Destroy(Slot.ObjectID)
				end
			end
		end
	end
end
                
function CheckVest(player, mode)
	if mode == 1 then
		local vest;
		for i, v in pairs(Lighting.PlayerVests:GetChildren()) do
			if player:FindFirstChild(v.Name) then
				vest = player[v.Name]
			end    
		end
		if not vest then 
			return
		end
		fireserver("ChangeParent", vest, player.Character)
	elseif mode == 2 then
		local vest;
		for i,v in pairs(Lighting.PlayerVests:GetChildren()) do
			if player.Character:FindFirstChild(v.Name) then
				vest = player.Character[v.Name]
			end    
		end
		if not vest then 
			return
		end
		fireserver("ChangeParent", vest, player)
    elseif mode == nil or mode == nan then
    	--Notify("[Error]: Invalid mode usage!", 5, 95, 60, 60)
	    if ShowFunctionAlerts then
		    AnnounceBox("Invalid mode usage!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	    end
	end
end

function Vest(Plr, mode)
    if Plr and Plr.Character and mode == 1 then
        for i, v in pairs(Plr:GetChildren()) do
            if v:FindFirstChild("thisisarmor") then
                fireserver("ChangeParent", v, Plr.Character)
                return
            end
        end
    elseif Plr and Plr.Character and mode == 2 then
        for i, v in pairs(Plr.Character:GetChildren()) do
            if v:FindFirstChild("thisisarmor") then
                fireserver("ChangeParent", v, Plr)
                return
            end
        end
    elseif mode == nil or mode == nan then
	    if ShowFunctionAlerts then
		    AnnounceBox("Invalid mode usage!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	    end
    end
end

function Loot(mode)
	if mode == 1 then
		fireserver("ChangeParent", Workspace["SpawnLoot"], Lighting)
		fireserver("ChangeParent", Workspace["DropLoot"], Lighting)
    elseif mode == 2 then
		fireserver("ChangeParent", Lighting["SpawnLoot"], Workspace)
		fireserver("ChangeParent", Lighting["DropLoot"], Workspace)
    elseif mode == nil or mode ~= 1 and mode ~= 2 then
    	--Notify("[Error]: Invalid mode usage!", 5, 95, 60, 60)
	    if ShowFunctionAlerts then
		    AnnounceBox("Invalid mode usage!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	    end
    end
end

function StatMod(player, value, mode)
	if mode == 1 then
		fireserver("ChangeValue", player.playerstats.PlayerKill.Aggressive, value)
    elseif mode == 2 then
		fireserver("ChangeValue", player.playerstats.ZombieKill.Civilian, value)
	elseif mode == 3 then
		fireserver("ChangeValue", player.playerstats.Days, value)
    elseif mode == nil or mode == nan then
    	--Notify("[Error]: Invalid mode usage!", 5, 95, 60, 60)
		if ShowFunctionAlerts then
			AnnounceBox("Invalid mode usage!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
		end
    end
end

function Buildings(mode)
	if mode == 1 then
		fireserver("ChangeParent", Workspace["Anchored Objects"]["Towns/Cities"], Lighting)
		fireserver("ChangeParent", Workspace["Anchored Objects"]["Plates"]["Hills"], Lighting)
		fireserver("ChangeParent", Workspace["Anchored Objects"]["Plates"]["Roads"], Lighting)
		fireserver("ChangeParent", Workspace["Anchored Objects"]["Plates"]["Dirt Roads"], Lighting)
		fireserver("ChangeParent", Workspace["Anchored Objects"]["Plates"]["Fields"], Lighting)
		fireserver("ChangeParent", Workspace["Anchored Objects"]["RoadSigns"], Lighting)
		fireserver("ChangeParent", Workspace["Anchored Objects"]["Trees/Foliage"], Lighting)
    elseif mode == 2 then
		fireserver("ChangeParent", Lighting["Towns/Cities"], Workspace["Anchored Objects"])
		fireserver("ChangeParent", Lighting["Hills"], Workspace["Anchored Objects"]["Plates"])
		fireserver("ChangeParent", Lighting["Roads"], Workspace["Anchored Objects"]["Plates"])
		fireserver("ChangeParent", Lighting["Dirt Roads"], Workspace["Anchored Objects"]["Plates"])
		fireserver("ChangeParent", Lighting["Fields"], Workspace["Anchored Objects"]["Plates"])
		fireserver("ChangeParent", Lighting["RoadSigns"], Workspace["Anchored Objects"])
		fireserver("ChangeParent", Lighting["Trees/Foliage"], Workspace["Anchored Objects"])
    elseif mode == nil or mode ~= 1 and mode ~= 2 then
    	--Notify("[Error]: Invalid mode usage!", 5, 95, 60, 60)
	    if ShowFunctionAlerts then
	    	AnnounceBox("Invalid mode usage!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	    end
    end
end

function Map(mode)
	if mode == 1 then
		if game.PlaceId == 237590657 or game.PlaceId == 290815963 then
			fireserver("ChangeParent", Workspace["Anchored Objects"]["Plates"], Lighting)
		elseif game.PlaceId == 237590761 then
			fireserver("ChangeParent", Workspace["TerrainChunks"], Lighting)
		end
    elseif mode == 2 then
		if game.PlaceId == 237590657 or game.PlaceId == 290815963 then
			fireserver("ChangeParent", Lighting["Plates"], Workspace["Anchored Objects"])
		elseif game.PlaceId == 237590761 then
			fireserver("ChangeParent", Lighting["TerrainChunks"], Workspace)
		end
    elseif mode == nil or mode ~= 1 and mode ~= 2 then
    	--Notify("[Error]: Invalid mode usage!", 5, 95, 60, 60)
    	if ShowFunctionAlerts then
	        AnnounceBox("Invalid mode usage!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	   end
    end
end

function PKGod(player, mode)
	if mode == 1 then
    	for _, v in pairs(player.Character:GetDescendants()) do
        	if v.Name == "DefenseMultiplier" then
            	fireserver("ChangeParent", v, nil)
        	end
    	end
    	R.AddClothing:FireServer("DefenseMultiplier", player.Character.Humanoid, 0, "", "")
    elseif mode == 2 then
    	for _, v in pairs(player.Character:GetDescendants()) do
        	if v.Name == "DefenseMultiplier" then
         	   fireserver("ChangeParent", v, nil)
        	end
    	end
    elseif mode == nil or mode ~= 1 and mode ~= 2 then
    	--Notify("[Error]: Invalid mode usage!", 5, 95, 60, 60)
        if ShowFunctionAlerts then
	        AnnounceBox("Invalid mode usage!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	    end
    end
end

function Kill(Plr)
    if Plr ~= nil and Plr.Character ~= nil and Plr.Character:FindFirstChild("Head") then
    	if Plr ~= LocalPlayer then
        	fireserver("ChangeParent", Plr.Character.Head)
        else
        	--Notify("[Error]: Can't kill localplayer!", 5, 95, 60, 60)
            if ShowFunctionAlerts then
		        AnnounceBox("Can't kill localplayer!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
            end
        end
    end
end

function Kick(Plr)
    if Plr ~= nil then
    	spawn(function()
    		if Plr ~= LocalPlayer then
        		R.AddClothing:FireServer("PermanentBan", Plr, "", "", "")
				wait()
				RemoteTable["SpawnCrate"]:FireServer(Plr)
			else
				--Notify("[Error]: Can't kick localplayer!", 5, 95, 60, 60)
				if ShowFunctionAlerts then
				    AnnounceBox("Can't kick localplayer!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
				end
			end
    	end)
	end
end
--functions



--setup
ZeroPhrame = Instance.new("Frame")
ZeroPhrame.Size = UDim2.new(0, 600, 0, 300)
ZeroPhrame.Position = UDim2.new(0, -900, 0, -900)
ZeroPhrame.BorderSizePixel = 5
ZeroPhrame.Transparency = 1
ZeroPhrame.Draggable = true
ZeroPhrame.Active = true
ZeroPhrame.Selectable = true
ZeroPhrame.Parent = MainGui

GuiBarPhrame = Instance.new("Frame")
GuiBarPhrame.Size = UDim2.new(1, 0, 0.08, 0)
GuiBarPhrame.Position = UDim2.new(0, 0, 0, 0)
GuiBarPhrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
GuiBarPhrame.BorderSizePixel = 0
GuiBarPhrame.Transparency = 0.01
GuiBarPhrame.Active = false
GuiBarPhrame.Selectable = true
GuiBarPhrame.Parent = ZeroPhrame

GuiBarText1 = Instance.new("TextLabel")
GuiBarText1.Size = UDim2.new(1, 0, 1, 0)
GuiBarText1.Position = UDim2.new(0.01, 0, 0, 0)
GuiBarText1.BorderSizePixel = 0
GuiBarText1.Text = "Agony's "
GuiBarText1.Transparency = 0.1
GuiBarText1.TextColor3 = Color3.fromRGB(255,255,255)
GuiBarText1.TextSize = 12
GuiBarText1.BackgroundTransparency = 1
GuiBarText1.TextXAlignment = "Left"
GuiBarText1.Parent = GuiBarPhrame
--// linked
GuiBarText2 = Instance.new("TextLabel")
GuiBarText2.Size = UDim2.new(1, 0, 1, 0)
GuiBarText2.Position = UDim2.new(0.12, 0, 0, 0)
GuiBarText2.BorderSizePixel = 0
GuiBarText2.Text = "A"
GuiBarText2.TextColor3 = Color3.fromRGB(255,60,60)
GuiBarText2.Transparency = 0.1
GuiBarText2.TextSize = 12
GuiBarText2.BackgroundTransparency = 1
GuiBarText2.TextXAlignment = "Left"
GuiBarText2.Parent = GuiBarPhrame
--// linked
GuiBarText2 = Instance.new("TextLabel")
GuiBarText2.Size = UDim2.new(1, 0, 1, 0)
GuiBarText2.Position = UDim2.new(0.139, 0, 0, 0)
GuiBarText2.BorderSizePixel = 0
GuiBarText2.Text = "R"
GuiBarText2.TextColor3 = Color3.fromRGB(190,190,190)
GuiBarText2.Transparency = 0.1
GuiBarText2.TextSize = 12
GuiBarText2.BackgroundTransparency = 1
GuiBarText2.TextXAlignment = "Left"
GuiBarText2.Parent = GuiBarPhrame
--// linked
GuiBarText2 = Instance.new("TextLabel")
GuiBarText2.Size = UDim2.new(1, 0, 1, 0)
GuiBarText2.Position = UDim2.new(0.172, 0, 0, 0)
GuiBarText2.BorderSizePixel = 0
GuiBarText2.Text = "Script"
GuiBarText2.TextColor3 = Color3.fromRGB(255,255,255)
GuiBarText2.Transparency = 0.1
GuiBarText2.TextSize = 12
GuiBarText2.BackgroundTransparency = 1
GuiBarText2.TextXAlignment = "Left"
GuiBarText2.Parent = GuiBarPhrame

ResizeButton = Instance.new("ImageButton")
ResizeButton.Size = UDim2.new(0, 23, 0, 23)
ResizeButton.Position = UDim2.new(0.75, 0, 0, 0)
ResizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
ResizeButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
ResizeButton.BackgroundTransparency = 1
ResizeButton.BorderSizePixel = 0
ResizeButton.Visible = true
ResizeButton.Image = "rbxassetid://13001263103"
ResizeButton.ImageColor3 = Color3.fromRGB(110, 110, 110)
ResizeButton.Parent = GuiBarPhrame

ResizeButtonPhrame = Instance.new("Frame")
ResizeButtonPhrame.Size = UDim2.new(0, 100, 0, 50)
ResizeButtonPhrame.Position = UDim2.new(0.68, 0, -0.2, 0)
ResizeButtonPhrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
ResizeButtonPhrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
ResizeButtonPhrame.BorderSizePixel = 1
ResizeButtonPhrame.Transparency = 0.3
ResizeButtonPhrame.Active = true
ResizeButtonPhrame.Selectable = true
ResizeButtonPhrame.Visible = false
ResizeButtonPhrame.Parent = ZeroPhrame

ResizeButtonPhrameButton = Instance.new("TextButton")
ResizeButtonPhrameButton.Size = UDim2.new(1, 0, 1, 0)
ResizeButtonPhrameButton.Position = UDim2.new(0, 0, 0, 0)
ResizeButtonPhrameButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
ResizeButtonPhrameButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
ResizeButtonPhrameButton.BackgroundTransparency = 1
ResizeButtonPhrameButton.Text = "Move mouse Left or Right"
ResizeButtonPhrameButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ResizeButtonPhrameButton.TextSize = 10
ResizeButtonPhrameButton.TextWrapped = true
ResizeButtonPhrameButton.BorderSizePixel = 0
ResizeButtonPhrameButton.Visible = true
ResizeButtonPhrameButton.Parent = ResizeButtonPhrame

CopyButton = Instance.new("ImageButton")
CopyButton.Size = UDim2.new(0, 23, 0, 23)
CopyButton.Position = UDim2.new(0.8, 0, 0, 0)
CopyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
CopyButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.BackgroundTransparency = 1
CopyButton.BorderSizePixel = 0
CopyButton.Visible = true
CopyButton.Image = "rbxassetid://12902317255"
CopyButton.ImageColor3 = Color3.fromRGB(110, 110, 110)
CopyButton.Parent = GuiBarPhrame

IdkButton = Instance.new("ImageButton")
IdkButton.Size = UDim2.new(0, 23, 0, 23)
IdkButton.Position = UDim2.new(0.85, 0, 0, 0)
IdkButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
IdkButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
IdkButton.BackgroundTransparency = 1
IdkButton.BorderSizePixel = 0
IdkButton.Visible = true
IdkButton.Image = "rbxassetid://12902309246"
IdkButton.ImageColor3 = Color3.fromRGB(110, 110, 110)
IdkButton.Parent = GuiBarPhrame

MinimizeButton = Instance.new("ImageButton")
MinimizeButton.Size = UDim2.new(0, 23, 0, 23)
MinimizeButton.Position = UDim2.new(0.9, 0, 0, 0)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
MinimizeButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Visible = true
MinimizeButton.Image = "rbxassetid://12902246420"
MinimizeButton.ImageColor3 = Color3.fromRGB(110, 110, 110)
MinimizeButton.Parent = GuiBarPhrame

ExitButton = Instance.new("ImageButton")
ExitButton.Size = UDim2.new(0, 23, 0, 23)
ExitButton.Position = UDim2.new(0.95, 0, 0, 0)
ExitButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
ExitButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
ExitButton.BackgroundTransparency = 1
ExitButton.BorderSizePixel = 0
ExitButton.Visible = true
ExitButton.Image = "rbxassetid://12902232003"
ExitButton.ImageColor3 = Color3.fromRGB(110, 110, 110)
ExitButton.Parent = GuiBarPhrame

GuiPhrame = Instance.new("Frame")
GuiPhrame.Size = UDim2.new(1, 0, 1, 0)
GuiPhrame.Position = UDim2.new(0, 0, 0.08, 0)
GuiPhrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
GuiPhrame.BorderSizePixel = 0
GuiPhrame.Transparency = 0.3
GuiPhrame.Active = false
GuiPhrame.Selectable = true
GuiPhrame.Parent = ZeroPhrame
--setup



--Tabs
GuiTabBarPhrame = Instance.new("Frame")
GuiTabBarPhrame.Size = UDim2.new(0.4, 0, 0.08, 0)
GuiTabBarPhrame.Position = UDim2.new(0, 0, 1.08, 0)
GuiTabBarPhrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
GuiTabBarPhrame.BorderSizePixel = 0
GuiTabBarPhrame.Transparency = 0.01
GuiTabBarPhrame.Active = false
GuiTabBarPhrame.Selectable = true
GuiTabBarPhrame.Visible = true
GuiTabBarPhrame.Parent = ZeroPhrame

LocalButton = Instance.new("ImageButton")
LocalButton.Size = UDim2.new(0, 20, 0, 20)
LocalButton.Position = UDim2.new(0.05, 0, 0.1, 0)
LocalButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
LocalButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
LocalButton.BackgroundTransparency = 1
LocalButton.BorderSizePixel = 0
LocalButton.Visible = true
LocalButton.Image = "rbxassetid://12899885269"
LocalButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
LocalButton.Parent = GuiTabBarPhrame
OtherButton = Instance.new("ImageButton")
OtherButton.Size = UDim2.new(0, 20, 0, 20)
OtherButton.Position = UDim2.new(0.15, 0, 0.1, 0)
OtherButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
OtherButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
OtherButton.BackgroundTransparency = 1
OtherButton.BorderSizePixel = 0
OtherButton.Visible = true
OtherButton.Image = "rbxassetid://12899886897"
OtherButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
OtherButton.Parent = GuiTabBarPhrame
ServerButton = Instance.new("ImageButton")
ServerButton.Size = UDim2.new(0, 20, 0, 20)
ServerButton.Position = UDim2.new(0.25, 0, 0.1, 0)
ServerButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
ServerButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
ServerButton.BackgroundTransparency = 1
ServerButton.BorderSizePixel = 0
ServerButton.Visible = true
ServerButton.Image = "rbxassetid://6034509993"
ServerButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
ServerButton.Parent = GuiTabBarPhrame
SettingsButton = Instance.new("ImageButton")
SettingsButton.Size = UDim2.new(0, 20, 0, 20)
SettingsButton.Position = UDim2.new(0.35, 0, 0.1, 0)
SettingsButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
SettingsButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
SettingsButton.BackgroundTransparency = 1
SettingsButton.BorderSizePixel = 0
SettingsButton.Visible = true
SettingsButton.Image = "rbxassetid://12897667997"
SettingsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
SettingsButton.Parent = GuiTabBarPhrame
MiscButton = Instance.new("ImageButton")
MiscButton.Size = UDim2.new(0, 20, 0, 20)
MiscButton.Position = UDim2.new(0.45, 0, 0.1, 0)
MiscButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
MiscButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
MiscButton.BackgroundTransparency = 1
MiscButton.BorderSizePixel = 0
MiscButton.Visible = true
MiscButton.Image = "rbxassetid://12899931172"
MiscButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
MiscButton.Parent = GuiTabBarPhrame
TestButton = Instance.new("ImageButton")
TestButton.Size = UDim2.new(0, 20, 0, 20)
TestButton.Position = UDim2.new(0.55, 0, 0.1, 0)
TestButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
TestButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
TestButton.BackgroundTransparency = 1
TestButton.BorderSizePixel = 0
TestButton.Visible = true
TestButton.Image = "rbxassetid://12899882477"
TestButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
TestButton.Parent = GuiTabBarPhrame
ToolsButton = Instance.new("ImageButton")
ToolsButton.Size = UDim2.new(0, 20, 0, 20)
ToolsButton.Position = UDim2.new(0.65, 0, 0.1, 0)
ToolsButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
ToolsButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
ToolsButton.BackgroundTransparency = 1
ToolsButton.BorderSizePixel = 0
ToolsButton.Visible = true
ToolsButton.Image = "rbxassetid://12899929616"
ToolsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
ToolsButton.Parent = GuiTabBarPhrame
ScripButton = Instance.new("ImageButton")
ScripButton.Size = UDim2.new(0, 20, 0, 20)
ScripButton.Position = UDim2.new(0.75, 0, 0.1, 0)
ScripButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
ScripButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
ScripButton.BackgroundTransparency = 1
ScripButton.BorderSizePixel = 0
ScripButton.Visible = true
ScripButton.Image = "rbxassetid://12899952249"
ScripButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
ScripButton.Parent = GuiTabBarPhrame
FavoriteButton = Instance.new("ImageButton")
FavoriteButton.Size = UDim2.new(0, 20, 0, 20)
FavoriteButton.Position = UDim2.new(0.85, 0, 0.1, 0)
FavoriteButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
FavoriteButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
FavoriteButton.BackgroundTransparency = 1
FavoriteButton.BorderSizePixel = 0
FavoriteButton.Visible = true
FavoriteButton.Image = "rbxassetid://12899953795"
FavoriteButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
FavoriteButton.Parent = GuiTabBarPhrame
--Tabs



--OtherTabF
GuiOtherEBarPhrame = Instance.new("Frame")
GuiOtherEBarPhrame.Size = UDim2.new(0.3, 0, 0.08, 0)
GuiOtherEBarPhrame.Position = UDim2.new(0.05, 0, 1.17, 0)
GuiOtherEBarPhrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
GuiOtherEBarPhrame.BorderSizePixel = 0
GuiOtherEBarPhrame.Transparency = 0.01
GuiOtherEBarPhrame.Active = false
GuiOtherEBarPhrame.Selectable = true
GuiOtherEBarPhrame.Visible = false
GuiOtherEBarPhrame.Parent = ZeroPhrame

OtherTab1Button = Instance.new("ImageButton")
OtherTab1Button.Size = UDim2.new(0, 20, 0, 20)
OtherTab1Button.Position = UDim2.new(0.25, 0, 0.1, 0)
OtherTab1Button.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
OtherTab1Button.BorderColor3 = Color3.fromRGB(255, 255, 255)
OtherTab1Button.BackgroundTransparency = 1
OtherTab1Button.BorderSizePixel = 0
OtherTab1Button.Visible = true
OtherTab1Button.Image = "rbxassetid://12900265786"
OtherTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
OtherTab1Button.Parent = GuiOtherEBarPhrame
OtherTab2Button = Instance.new("ImageButton")
OtherTab2Button.Size = UDim2.new(0, 20, 0, 20)
OtherTab2Button.Position = UDim2.new(0.45, 0, 0.1, 0)
OtherTab2Button.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
OtherTab2Button.BorderColor3 = Color3.fromRGB(255, 255, 255)
OtherTab2Button.BackgroundTransparency = 1
OtherTab2Button.BorderSizePixel = 0
OtherTab2Button.Visible = true
OtherTab2Button.Image = "rbxassetid://12900267647"
OtherTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
OtherTab2Button.Parent = GuiOtherEBarPhrame
OtherTab3Button = Instance.new("ImageButton")
OtherTab3Button.Size = UDim2.new(0, 20, 0, 20)
OtherTab3Button.Position = UDim2.new(0.65, 0, 0.1, 0)
OtherTab3Button.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
OtherTab3Button.BorderColor3 = Color3.fromRGB(255, 255, 255)
OtherTab3Button.BackgroundTransparency = 1
OtherTab3Button.BorderSizePixel = 0
OtherTab3Button.Visible = true
OtherTab3Button.Image = "rbxassetid://12900269313"
OtherTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
OtherTab3Button.Parent = GuiOtherEBarPhrame
--OtherTabF



--ToolsTabF
GuiToolsEBarPhrame = Instance.new("Frame")
GuiToolsEBarPhrame.Size = UDim2.new(0.3, 0, 0.08, 0)
GuiToolsEBarPhrame.Position = UDim2.new(0.05, 0, 1.17, 0)
GuiToolsEBarPhrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
GuiToolsEBarPhrame.BorderSizePixel = 0
GuiToolsEBarPhrame.Transparency = 0.01
GuiToolsEBarPhrame.Active = false
GuiToolsEBarPhrame.Selectable = true
GuiToolsEBarPhrame.Visible = false
GuiToolsEBarPhrame.Parent = ZeroPhrame

ToolsTab1Button = Instance.new("ImageButton")
ToolsTab1Button.Size = UDim2.new(0, 20, 0, 20)
ToolsTab1Button.Position = UDim2.new(0.25, 0, 0.1, 0)
ToolsTab1Button.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
ToolsTab1Button.BorderColor3 = Color3.fromRGB(255, 255, 255)
ToolsTab1Button.BackgroundTransparency = 1
ToolsTab1Button.BorderSizePixel = 0
ToolsTab1Button.Visible = true
ToolsTab1Button.Image = "rbxassetid://12900265786"
ToolsTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
ToolsTab1Button.Parent = GuiToolsEBarPhrame
ToolsTab2Button = Instance.new("ImageButton")
ToolsTab2Button.Size = UDim2.new(0, 20, 0, 20)
ToolsTab2Button.Position = UDim2.new(0.45, 0, 0.1, 0)
ToolsTab2Button.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
ToolsTab2Button.BorderColor3 = Color3.fromRGB(255, 255, 255)
ToolsTab2Button.BackgroundTransparency = 1
ToolsTab2Button.BorderSizePixel = 0
ToolsTab2Button.Visible = true
ToolsTab2Button.Image = "rbxassetid://12900267647"
ToolsTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
ToolsTab2Button.Parent = GuiToolsEBarPhrame
ToolsTab3Button = Instance.new("ImageButton")
ToolsTab3Button.Size = UDim2.new(0, 20, 0, 20)
ToolsTab3Button.Position = UDim2.new(0.65, 0, 0.1, 0)
ToolsTab3Button.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
ToolsTab3Button.BorderColor3 = Color3.fromRGB(255, 255, 255)
ToolsTab3Button.BackgroundTransparency = 1
ToolsTab3Button.BorderSizePixel = 0
ToolsTab3Button.Visible = true
ToolsTab3Button.Image = "rbxassetid://12900269313"
ToolsTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
ToolsTab3Button.Parent = GuiToolsEBarPhrame
--ToolsTabF



--ServerTabF
GuiServerEBarPhrame = Instance.new("Frame")
GuiServerEBarPhrame.Size = UDim2.new(0.3, 0, 0.08, 0)
GuiServerEBarPhrame.Position = UDim2.new(0.05, 0, 1.17, 0)
GuiServerEBarPhrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
GuiServerEBarPhrame.BorderSizePixel = 0
GuiServerEBarPhrame.Transparency = 0.01
GuiServerEBarPhrame.Active = false
GuiServerEBarPhrame.Selectable = true
GuiServerEBarPhrame.Visible = false
GuiServerEBarPhrame.Parent = ZeroPhrame

ServerTab1Button = Instance.new("ImageButton")
ServerTab1Button.Size = UDim2.new(0, 20, 0, 20)
ServerTab1Button.Position = UDim2.new(0.25, 0, 0.1, 0)
ServerTab1Button.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
ServerTab1Button.BorderColor3 = Color3.fromRGB(255, 255, 255)
ServerTab1Button.BackgroundTransparency = 1
ServerTab1Button.BorderSizePixel = 0
ServerTab1Button.Visible = true
ServerTab1Button.Image = "rbxassetid://12900265786"
ServerTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
ServerTab1Button.Parent = GuiServerEBarPhrame
ServerTab2Button = Instance.new("ImageButton")
ServerTab2Button.Size = UDim2.new(0, 20, 0, 20)
ServerTab2Button.Position = UDim2.new(0.45, 0, 0.1, 0)
ServerTab2Button.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
ServerTab2Button.BorderColor3 = Color3.fromRGB(255, 255, 255)
ServerTab2Button.BackgroundTransparency = 1
ServerTab2Button.BorderSizePixel = 0
ServerTab2Button.Visible = true
ServerTab2Button.Image = "rbxassetid://12900267647"
ServerTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
ServerTab2Button.Parent = GuiServerEBarPhrame
ServerTab3Button = Instance.new("ImageButton")
ServerTab3Button.Size = UDim2.new(0, 20, 0, 20)
ServerTab3Button.Position = UDim2.new(0.65, 0, 0.1, 0)
ServerTab3Button.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
ServerTab3Button.BorderColor3 = Color3.fromRGB(255, 255, 255)
ServerTab3Button.BackgroundTransparency = 1
ServerTab3Button.BorderSizePixel = 0
ServerTab3Button.Visible = true
ServerTab3Button.Image = "rbxassetid://12900269313"
ServerTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
ServerTab3Button.Parent = GuiServerEBarPhrame
--ServerTabF



--LocalTabF
GuiLocalEBarPhrame = Instance.new("Frame")
GuiLocalEBarPhrame.Size = UDim2.new(0.3, 0, 0.08, 0)
GuiLocalEBarPhrame.Position = UDim2.new(0.05, 0, 1.17, 0)
GuiLocalEBarPhrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
GuiLocalEBarPhrame.BorderSizePixel = 0
GuiLocalEBarPhrame.Transparency = 0.01
GuiLocalEBarPhrame.Active = false
GuiLocalEBarPhrame.Selectable = true
GuiLocalEBarPhrame.Visible = false
GuiLocalEBarPhrame.Parent = ZeroPhrame

LocalTab1Button = Instance.new("ImageButton")
LocalTab1Button.Size = UDim2.new(0, 20, 0, 20)
LocalTab1Button.Position = UDim2.new(0.25, 0, 0.1, 0)
LocalTab1Button.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
LocalTab1Button.BorderColor3 = Color3.fromRGB(255, 255, 255)
LocalTab1Button.BackgroundTransparency = 1
LocalTab1Button.BorderSizePixel = 0
LocalTab1Button.Visible = true
LocalTab1Button.Image = "rbxassetid://12900265786"
LocalTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
LocalTab1Button.Parent = GuiLocalEBarPhrame
LocalTab2Button = Instance.new("ImageButton")
LocalTab2Button.Size = UDim2.new(0, 20, 0, 20)
LocalTab2Button.Position = UDim2.new(0.45, 0, 0.1, 0)
LocalTab2Button.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
LocalTab2Button.BorderColor3 = Color3.fromRGB(255, 255, 255)
LocalTab2Button.BackgroundTransparency = 1
LocalTab2Button.BorderSizePixel = 0
LocalTab2Button.Visible = true
LocalTab2Button.Image = "rbxassetid://12900267647"
LocalTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
LocalTab2Button.Parent = GuiLocalEBarPhrame
LocalTab3Button = Instance.new("ImageButton")
LocalTab3Button.Size = UDim2.new(0, 20, 0, 20)
LocalTab3Button.Position = UDim2.new(0.65, 0, 0.1, 0)
LocalTab3Button.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
LocalTab3Button.BorderColor3 = Color3.fromRGB(255, 255, 255)
LocalTab3Button.BackgroundTransparency = 1
LocalTab3Button.BorderSizePixel = 0
LocalTab3Button.Visible = true
LocalTab3Button.Image = "rbxassetid://12900269313"
LocalTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
LocalTab3Button.Parent = GuiLocalEBarPhrame
--LocalTabF



--frames
Welcome1PageSection1Phrame = Instance.new("Frame")
Welcome1PageSection1Phrame.Size = UDim2.new(0.9, 0, 0.9, 0)
Welcome1PageSection1Phrame.Position = UDim2.new(0.05, 0, 0.05, 0)
Welcome1PageSection1Phrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Welcome1PageSection1Phrame.BorderSizePixel = 1
Welcome1PageSection1Phrame.Transparency = 0.2
Welcome1PageSection1Phrame.Active = false
Welcome1PageSection1Phrame.Selectable = true
Welcome1PageSection1Phrame.Visible = true
Welcome1PageSection1Phrame.Parent = GuiPhrame

BigText = Instance.new("TextLabel")
BigText.Size = UDim2.new(0.01, 0, 0.01, 0)
BigText.Position = UDim2.new(0.05, 0, 0.05, 0)
BigText.BorderSizePixel = 0
BigText.Text = "Script Info [7/04/2023] [17/12] ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
BigText.TextColor3 = Color3.fromRGB(255,255,255)
BigText.TextSize = 8
BigText.BackgroundTransparency = 1
BigText.TextXAlignment = "Left"
BigText.Parent = Welcome1PageSection1Phrame
SmallText = Instance.new("TextLabel")
SmallText.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallText.Position = UDim2.new(0.08, 0, 0.15, 0)
SmallText.BorderSizePixel = 0
SmallText.Text = "(/) Owner: DeaTh X AngEl"
SmallText.TextColor3 = Color3.fromRGB(255,255,255)
SmallText.TextSize = 8
SmallText.BackgroundTransparency = 1
SmallText.TextXAlignment = "Left"
SmallText.Parent = Welcome1PageSection1Phrame
SmallText = Instance.new("TextLabel")
SmallText.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallText.Position = UDim2.new(0.08, 0, 0.2, 0)
SmallText.BorderSizePixel = 0
SmallText.Text = "(/) Owner: psychedelic"
SmallText.TextColor3 = Color3.fromRGB(255,255,255)
SmallText.TextSize = 8
SmallText.BackgroundTransparency = 1
SmallText.TextXAlignment = "Left"
SmallText.Parent = Welcome1PageSection1Phrame
SmallText = Instance.new("TextLabel")
SmallText.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallText.Position = UDim2.new(0.08, 0, 0.25, 0)
SmallText.BorderSizePixel = 0
SmallText.Text = "(/) Owner: glator"
SmallText.TextColor3 = Color3.fromRGB(255,255,255)
SmallText.TextSize = 8
SmallText.BackgroundTransparency = 1
SmallText.TextXAlignment = "Left"
SmallText.Parent = Welcome1PageSection1Phrame
SmallText = Instance.new("TextLabel")
SmallText.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallText.Position = UDim2.new(0.08, 0, 0.3, 0)
SmallText.BorderSizePixel = 0
SmallText.Text = "(/) UI version: 0.0.1a"
SmallText.TextColor3 = Color3.fromRGB(255,255,255)
SmallText.TextSize = 8
SmallText.BackgroundTransparency = 1
SmallText.TextXAlignment = "Left"
SmallText.Parent = Welcome1PageSection1Phrame
SmallText = Instance.new("TextLabel")
SmallText.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallText.Position = UDim2.new(0.08, 0, 0.35, 0)
SmallText.BorderSizePixel = 0
SmallText.Text = "(/) Loader version: 2.0.1a"
SmallText.TextColor3 = Color3.fromRGB(255,255,255)
SmallText.TextSize = 8
SmallText.BackgroundTransparency = 1
SmallText.TextXAlignment = "Left"
SmallText.Parent = Welcome1PageSection1Phrame
SmallText = Instance.new("TextLabel")
SmallText.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallText.Position = UDim2.new(0.08, 0, 0.4, 0)
SmallText.BorderSizePixel = 0
SmallText.Text = "(/) Script version: 117"
SmallText.TextColor3 = Color3.fromRGB(255,255,255)
SmallText.TextSize = 8
SmallText.BackgroundTransparency = 1
SmallText.TextXAlignment = "Left"
SmallText.Parent = Welcome1PageSection1Phrame

--[[AgonyLogoImage = Instance.new("ImageLabel")
AgonyLogoImage.Size = UDim2.new(0, 200, 0, 120)
AgonyLogoImage.Position = UDim2.new(0.6, 0, 0.5, 0)
AgonyLogoImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
AgonyLogoImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
AgonyLogoImage.BackgroundTransparency = 1
AgonyLogoImage.BorderSizePixel = 0
AgonyLogoImage.Visible = true
AgonyLogoImage.Image = "rbxassetid://13010662773"
AgonyLogoImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
AgonyLogoImage.Parent = Welcome1PageSection1Phrame--]]

Welcome1PageSection1Phrame1Statuses = Instance.new("Frame")
Welcome1PageSection1Phrame1Statuses.Size = UDim2.new(0, 160, 0, 20)
Welcome1PageSection1Phrame1Statuses.Position = UDim2.new(0.01, 0, 0.90, 0)
Welcome1PageSection1Phrame1Statuses.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Welcome1PageSection1Phrame1Statuses.BorderSizePixel = 1
Welcome1PageSection1Phrame1Statuses.Transparency = 0.2
Welcome1PageSection1Phrame1Statuses.Active = false
Welcome1PageSection1Phrame1Statuses.Selectable = true
Welcome1PageSection1Phrame1Statuses.Visible = true
Welcome1PageSection1Phrame1Statuses.Parent = Welcome1PageSection1Phrame

AgonyStatusText0 = Instance.new("TextLabel")
AgonyStatusText0.Size = UDim2.new(0.01, 0, 0.01, 0)
AgonyStatusText0.Position = UDim2.new(0.56, 0, 0.45, 0)
AgonyStatusText0.BorderSizePixel = 0
AgonyStatusText0.Text = "(ORIGINAL)"
AgonyStatusText0.TextColor3 = Color3.fromRGB(170,170,170)
AgonyStatusText0.TextSize = 8
AgonyStatusText0.BackgroundTransparency = 1
AgonyStatusText0.TextXAlignment = "Left"
AgonyStatusText0.Parent = Welcome1PageSection1Phrame1Statuses

AgonyStatusText1 = Instance.new("TextLabel")
AgonyStatusText1.Size = UDim2.new(0.01, 0, 0.01, 0)
AgonyStatusText1.Position = UDim2.new(0.01, 0, 0.45, 0)
AgonyStatusText1.BorderSizePixel = 0
AgonyStatusText1.Text = "Status"
AgonyStatusText1.TextColor3 = Color3.fromRGB(255,255,255)
AgonyStatusText1.TextSize = 8
AgonyStatusText1.BackgroundTransparency = 1
AgonyStatusText1.TextXAlignment = "Left"
AgonyStatusText1.Parent = Welcome1PageSection1Phrame1Statuses

AgonyStatusText2 = Instance.new("TextLabel")
AgonyStatusText2.Size = UDim2.new(0.01, 0, 0.01, 0)
AgonyStatusText2.Position = UDim2.new(0.26, 0, 0.45, 0)
AgonyStatusText2.BorderSizePixel = 0
AgonyStatusText2.Text = "Online"
AgonyStatusText2.TextColor3 = Color3.fromRGB(0,255,255)
AgonyStatusText2.TextSize = 8
AgonyStatusText2.BackgroundTransparency = 1
AgonyStatusText2.TextXAlignment = "Left"
AgonyStatusText2.Parent = Welcome1PageSection1Phrame1Statuses
--frames



--frames
Other2PageSection1Phrame = Instance.new("ScrollingFrame")
Other2PageSection1Phrame.Size = UDim2.new(0.27, 0, 0.80, 0)
Other2PageSection1Phrame.Position = UDim2.new(0.01, 0, 0.05, 0)
Other2PageSection1Phrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Other2PageSection1Phrame.BorderSizePixel = 1
Other2PageSection1Phrame.Transparency = 0.2
Other2PageSection1Phrame.CanvasSize = UDim2.new(0, 0, 3, 0)
Other2PageSection1Phrame.Active = false
Other2PageSection1Phrame.Selectable = true
Other2PageSection1Phrame.Visible = false
Other2PageSection1Phrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
Other2PageSection1Phrame.ScrollBarThickness = 4
Other2PageSection1Phrame.Parent = GuiPhrame

Other2PageSection2Phrame = Instance.new("Frame")
Other2PageSection2Phrame.Size = UDim2.new(0.7, 0, 0.9, 0)
Other2PageSection2Phrame.Position = UDim2.new(0.29, 0, 0.05, 0)
Other2PageSection2Phrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Other2PageSection2Phrame.BorderSizePixel = 1
Other2PageSection2Phrame.Transparency = 0.2
Other2PageSection2Phrame.Active = false
Other2PageSection2Phrame.Selectable = true
Other2PageSection2Phrame.Visible = false
Other2PageSection2Phrame.Parent = GuiPhrame

--setup players
PlayerListFrame2 = Instance.new("Frame", Other2PageSection1Phrame)
PlayerListFrame2.Name = "NotifyFrame2"
PlayerListFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayerListFrame2.BackgroundTransparency = 1
PlayerListFrame2.BorderSizePixel = 0
PlayerListFrame2.Position = UDim2.new(0, 0, 0, 0)
PlayerListFrame2.Size = UDim2.new(0, 1, 0, 20)

PlayerListLabel2 = Instance.new("TextButton", PlayerListFrame2)
PlayerListLabel2.Name = "NotifyLabel2"
PlayerListLabel2.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
PlayerListLabel2.BackgroundTransparency = 1
PlayerListLabel2.BorderColor3 = Color3.fromRGB(110, 172, 216)
PlayerListLabel2.BorderSizePixel = 0
PlayerListLabel2.Size = UDim2.new(0, 160, 0, PlayerListFrame2.Size.Y.Offset)
PlayerListLabel2.Font = Enum.Font.SourceSans
PlayerListLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerListLabel2.TextSize = 20
PlayerListLabel2.Visible = false

function CreatePlayerListsLabelP2(Text, Time)
    for i, v in pairs(PlayerListFrame2:GetChildren()) do
		if v ~= PlayerListLabel2 then
			v.Position = UDim2.new(0, 0, 0, 20*(#PlayerListFrame2:GetChildren()-(i-1)))
		end
    end
    local F = PlayerListLabel2:Clone()
	F.Visible = true
    F.Parent = PlayerListFrame2
    F.Position = UDim2.new(0, 0, 0, 0)
    F.Text = Text
    if Time == nil then
        Time = 3
    end
    F.MouseButton1Click:Connect(function()
		F.TextColor3 = Color3.fromRGB(170, 170, 170)
		--Notify("[Selected]: ".. F.Text, 5, 255, 255, 255)
		if ShowFunctionAlerts then
			AnnounceBox("Player ".. F.Text .. " was selected!", "PLAYER", 5, 255, 255, 255, 255, 255, 255)
		end
		wait(1)
		F.TextColor3 = Color3.fromRGB(255, 255, 255)
	end)
    spawn(function()
        wait(Time)
        F:remove()
        for i, v in pairs(PlayerListFrame2:GetChildren()) do
			if v ~= PlayerListLabel2 then 
				v.Position = UDim2.new(0, 0, 0, 20*(#PlayerListFrame2:GetChildren()-(i)))
			end
        end
    end)
end
--setup players

--setup players	
spawn(function()
while wait(30) do
    for _, v in pairs(Players:GetPlayers()) do
    	--if v ~= Client then
    	CreatePlayerListsLabelP2(tostring(v), 30, 60, 160, 60)
    	--end
	end
  end
end)

for _, v in pairs(Players:GetPlayers()) do
    CreatePlayerListsLabelP2(tostring(v), 30, 60, 160, 60)
end
--setup players

Other2Page2FeaturesAmount = Instance.new("TextBox")
Other2Page2FeaturesAmount.Size = UDim2.new(0, 162, 0, 20)
Other2Page2FeaturesAmount.Position = UDim2.new(-0.4, 0, 0.92, 0)
Other2Page2FeaturesAmount.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Other2Page2FeaturesAmount.BackgroundTransparency = 0.4
Other2Page2FeaturesAmount.BorderSizePixel = 1
Other2Page2FeaturesAmount.Text = "Amount"
Other2Page2FeaturesAmount.TextColor3 = Color3.fromRGB(255, 255, 255)
--Other2Page2FeaturesAmount.TextScaled = true
Other2Page2FeaturesAmount.TextSize = 8
Other2Page2FeaturesAmount.TextWrapped = true
Other2Page2FeaturesAmount.TextXAlignment = "Center"
Other2Page2FeaturesAmount.Parent = Other2PageSection2Phrame
--frames



--frames
Other1PageSection1Phrame = Instance.new("ScrollingFrame")
Other1PageSection1Phrame.Size = UDim2.new(0.27, 0, 0.80, 0)
Other1PageSection1Phrame.Position = UDim2.new(0.01, 0, 0.05, 0)
Other1PageSection1Phrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Other1PageSection1Phrame.CanvasSize = UDim2.new(0, 0, 3, 0)
Other1PageSection1Phrame.BorderSizePixel = 1
Other1PageSection1Phrame.Transparency = 0.2
Other1PageSection1Phrame.Active = false
Other1PageSection1Phrame.Selectable = true
Other1PageSection1Phrame.Visible = false
Other1PageSection1Phrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
Other1PageSection1Phrame.ScrollBarThickness = 4
Other1PageSection1Phrame.Parent = GuiPhrame

Other1PageSection2Phrame = Instance.new("Frame")
Other1PageSection2Phrame.Size = UDim2.new(0.7, 0, 0.9, 0)
Other1PageSection2Phrame.Position = UDim2.new(0.29, 0, 0.05, 0)
Other1PageSection2Phrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Other1PageSection2Phrame.BorderSizePixel = 1
Other1PageSection2Phrame.Transparency = 0.2
Other1PageSection2Phrame.Active = false
Other1PageSection2Phrame.Selectable = true
Other1PageSection2Phrame.Visible = false
Other1PageSection2Phrame.Parent = GuiPhrame

--setup players
PlayerListFrame = Instance.new("Frame", Other1PageSection1Phrame)
PlayerListFrame.Name = "NotifyFrame"
PlayerListFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayerListFrame.BackgroundTransparency = 1
PlayerListFrame.BorderSizePixel = 0
PlayerListFrame.Position = UDim2.new(0, 0, 0, 0)
PlayerListFrame.Size = UDim2.new(0, 1, 0, 20)

PlayerListLabel = Instance.new("TextButton", PlayerListFrame)
PlayerListLabel.Name = "NotifyLabel"
PlayerListLabel.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
PlayerListLabel.BackgroundTransparency = 1
PlayerListLabel.BorderColor3 = Color3.fromRGB(110, 172, 216)
PlayerListLabel.BorderSizePixel = 0
PlayerListLabel.Size = UDim2.new(0, 160, 0, PlayerListFrame.Size.Y.Offset)
PlayerListLabel.Font = Enum.Font.SourceSans
PlayerListLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerListLabel.TextSize = 20
PlayerListLabel.Visible = false

local LocalTab1SelectedPlayer = ""
function CreatePlayerListsLabelP1(Text, Time)
    for i, v in pairs(PlayerListFrame:GetChildren()) do
		if v ~= PlayerListLabel then
			v.Position = UDim2.new(0, 0, 0, 20*(#PlayerListFrame:GetChildren()-(i-1)))
		end
    end
    local F = PlayerListLabel:Clone()
	F.Visible = true
    F.Parent = PlayerListFrame
    F.Position = UDim2.new(0, 0, 0, 0)
    F.Text = Text
    if Time == nil then
        Time = 3
    end
    F.MouseButton1Click:Connect(function()
    	LocalTab1SelectedPlayer = F.Text
		F.TextColor3 = Color3.fromRGB(170, 170, 170)
		--Notify("[Selected]: ".. LocalTab1SelectedPlayer, 5, 255, 255, 255)
		if ShowFunctionAlerts then
			AnnounceBox("Player ".. F.Text .. " was selected!", "PLAYER", 5, 255, 255, 255, 255, 255, 255)
		end
		wait(1)
		F.TextColor3 = Color3.fromRGB(255, 255, 255)
	end)
    spawn(function()
        wait(Time)
        F:remove()
        for i, v in pairs(PlayerListFrame:GetChildren()) do
			if v ~= PlayerListLabel then 
				v.Position = UDim2.new(0, 0, 0, 20*(#PlayerListFrame:GetChildren()-(i)))
			end
        end
    end)
end
--setup players

--setup players	
spawn(function()
while wait(30) do
    for _, v in pairs(Players:GetPlayers()) do
    	--if v ~= Client then
    	CreatePlayerListsLabelP1(tostring(v), 30, 60, 160, 60)
    	--end
	end
  end
end)
for _, v in pairs(Players:GetPlayers()) do
    CreatePlayerListsLabelP1(tostring(v), 30, 60, 160, 60)
end
--setup players

Other1Page2FeaturesAmount = Instance.new("TextBox")
Other1Page2FeaturesAmount.Size = UDim2.new(0, 162, 0, 20)
Other1Page2FeaturesAmount.Position = UDim2.new(-0.4, 0, 0.92, 0)
Other1Page2FeaturesAmount.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Other1Page2FeaturesAmount.BackgroundTransparency = 0.4
Other1Page2FeaturesAmount.BorderSizePixel = 1
Other1Page2FeaturesAmount.Text = "Amount"
Other1Page2FeaturesAmount.TextColor3 = Color3.fromRGB(255, 255, 255)
--Other1Page2FeaturesAmount.TextScaled = true
Other1Page2FeaturesAmount.TextSize = 8
Other1Page2FeaturesAmount.TextWrapped = true
Other1Page2FeaturesAmount.TextXAlignment = "Center"
Other1Page2FeaturesAmount.Parent = Other1PageSection2Phrame

Other1Page2FeaturesSpectate = Instance.new("TextButton")
Other1Page2FeaturesSpectate.Size = UDim2.new(0, 120, 0, 20)
Other1Page2FeaturesSpectate.Position = UDim2.new(0.02, 0, 0.02, 0)
Other1Page2FeaturesSpectate.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2FeaturesSpectate.BackgroundTransparency = 0.4
Other1Page2FeaturesSpectate.BorderSizePixel = 1
Other1Page2FeaturesSpectate.Text = "Spectate"
Other1Page2FeaturesSpectate.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesSpectate.TextSize = 8
Other1Page2FeaturesSpectate.TextXAlignment = "Center"
Other1Page2FeaturesSpectate.Parent = Other1PageSection2Phrame

Other1Page2FeaturesSpectateImage = Instance.new("ImageLabel")
Other1Page2FeaturesSpectateImage.Size = UDim2.new(0, 20, 0, 20)
Other1Page2FeaturesSpectateImage.Position = UDim2.new(0.012, 0, 0.018, 0)
Other1Page2FeaturesSpectateImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2FeaturesSpectateImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesSpectateImage.BackgroundTransparency = 1
Other1Page2FeaturesSpectateImage.BorderSizePixel = 0
Other1Page2FeaturesSpectateImage.Visible = true
Other1Page2FeaturesSpectateImage.Image = "rbxassetid://12900717295"
Other1Page2FeaturesSpectateImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesSpectateImage.Parent = Other1PageSection2Phrame

SpectatingPhrame = Instance.new("Frame")
SpectatingPhrame.Size = UDim2.new(0, 350, 0, 20)
SpectatingPhrame.Position = UDim2.new(0.445, 0, 0.95, 0)
SpectatingPhrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
SpectatingPhrame.BorderSizePixel = 1
SpectatingPhrame.Transparency = 0.2
SpectatingPhrame.Active = true
SpectatingPhrame.Visible = false
SpectatingPhrame.Draggable = true
SpectatingPhrame.Selectable = true
SpectatingPhrame.Parent = MainGui

SpectatingPhrameFeaturesImageNext = Instance.new("ImageButton")
SpectatingPhrameFeaturesImageNext.Size = UDim2.new(0, 20, 0, 20)
SpectatingPhrameFeaturesImageNext.Position = UDim2.new(0.95, 0, 0, 0)
SpectatingPhrameFeaturesImageNext.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
SpectatingPhrameFeaturesImageNext.BorderColor3 = Color3.fromRGB(255, 255, 255)
SpectatingPhrameFeaturesImageNext.BackgroundTransparency = 1
SpectatingPhrameFeaturesImageNext.BorderSizePixel = 0
SpectatingPhrameFeaturesImageNext.Visible = true
SpectatingPhrameFeaturesImageNext.Image = "rbxassetid://12908345654"
SpectatingPhrameFeaturesImageNext.ImageColor3 = Color3.fromRGB(255, 255, 255)
SpectatingPhrameFeaturesImageNext.Parent = SpectatingPhrame

SpectatingPhrameFeaturesImagePre = Instance.new("ImageButton")
SpectatingPhrameFeaturesImagePre.Size = UDim2.new(0, 20, 0, 20)
SpectatingPhrameFeaturesImagePre.Position = UDim2.new(0.90, 0, 0, 0)
SpectatingPhrameFeaturesImagePre.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
SpectatingPhrameFeaturesImagePre.BorderColor3 = Color3.fromRGB(255, 255, 255)
SpectatingPhrameFeaturesImagePre.BackgroundTransparency = 1
SpectatingPhrameFeaturesImagePre.BorderSizePixel = 0
SpectatingPhrameFeaturesImagePre.Visible = true
SpectatingPhrameFeaturesImagePre.Image = "rbxassetid://12908220881"
SpectatingPhrameFeaturesImagePre.ImageColor3 = Color3.fromRGB(255, 255, 255)
SpectatingPhrameFeaturesImagePre.Parent = SpectatingPhrame

SpectatingPhrameFeaturesName = Instance.new("TextLabel")
SpectatingPhrameFeaturesName.Size = UDim2.new(0, 1, 0, 20)
SpectatingPhrameFeaturesName.Position = UDim2.new(0.5, 0, 0, 0)
SpectatingPhrameFeaturesName.BorderSizePixel = 0
SpectatingPhrameFeaturesName.Text = "!"
SpectatingPhrameFeaturesName.TextColor3 = Color3.fromRGB(255,255,255)
SpectatingPhrameFeaturesName.Transparency = 0.1
SpectatingPhrameFeaturesName.TextSize = 12
SpectatingPhrameFeaturesName.BackgroundTransparency = 1
SpectatingPhrameFeaturesName.TextXAlignment = "Center"
SpectatingPhrameFeaturesName.Parent = SpectatingPhrame

SpectatingPhrameFeaturesImageReset = Instance.new("ImageButton")
SpectatingPhrameFeaturesImageReset.Size = UDim2.new(0, 20, 0, 20)
SpectatingPhrameFeaturesImageReset.Position = UDim2.new(0.01, 0, 0, 0)
SpectatingPhrameFeaturesImageReset.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
SpectatingPhrameFeaturesImageReset.BorderColor3 = Color3.fromRGB(255, 255, 255)
SpectatingPhrameFeaturesImageReset.BackgroundTransparency = 1
SpectatingPhrameFeaturesImageReset.BorderSizePixel = 0
SpectatingPhrameFeaturesImageReset.Visible = true
SpectatingPhrameFeaturesImageReset.Image = "rbxassetid://12908216377"
SpectatingPhrameFeaturesImageReset.ImageColor3 = Color3.fromRGB(255, 255, 255)
SpectatingPhrameFeaturesImageReset.Parent = SpectatingPhrame

SpectatingPhrameFeaturesImageGoTo = Instance.new("ImageButton")
SpectatingPhrameFeaturesImageGoTo.Size = UDim2.new(0, 20, 0, 20)
SpectatingPhrameFeaturesImageGoTo.Position = UDim2.new(0.06, 0, 0, 0)
SpectatingPhrameFeaturesImageGoTo.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
SpectatingPhrameFeaturesImageGoTo.BorderColor3 = Color3.fromRGB(255, 255, 255)
SpectatingPhrameFeaturesImageGoTo.BackgroundTransparency = 1
SpectatingPhrameFeaturesImageGoTo.BorderSizePixel = 0
SpectatingPhrameFeaturesImageGoTo.Visible = true
SpectatingPhrameFeaturesImageGoTo.Image = "rbxassetid://12920417393"
SpectatingPhrameFeaturesImageGoTo.ImageColor3 = Color3.fromRGB(255, 255, 255)
SpectatingPhrameFeaturesImageGoTo.Parent = SpectatingPhrame
        
Other1Page2FeaturesSpectate.MouseButton1Click:Connect(function()
	local SPlayer = game.Players:FindFirstChild(LocalTab1SelectedPlayer)
	if Other1Page2FeaturesSpectateImage.Image == "rbxassetid://12900717295" then
		if LocalTab1SelectedPlayer ~= nil and LocalTab1SelectedPlayer ~= nan and LocalTab1SelectedPlayer ~= "" then
			Other1Page2FeaturesSpectateImage.Image = "rbxassetid://12900770221"
			--Notify("[Spectate]: Spectating ".. LocalTab1SelectedPlayer .. "!", 5, 60, 160, 60)
			AnnounceBox("Spectating " .. LocalTab1SelectedPlayer .. "!", "SPECTATE", 5, 60, 160, 60, 255, 255, 255)
			SpectatingPhrame.Visible = true
			SpectatingPhrameFeaturesName.Text = LocalTab1SelectedPlayer
			workspace.CurrentCamera.CameraSubject = SPlayer.Character.Humanoid
		else
			--Notify("[Error]: No player selected!", 5, 95, 60, 60)
			AnnounceBox("No player selected!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
			SpectatingPhrame.Visible = false
			workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
		end
	else
		Other1Page2FeaturesSpectateImage.Image = "rbxassetid://12900717295"
		--Notify("[Spectate]: Spectating ".. Game.Players.LocalPlayer.Name .. "!", 5, 60, 160, 60)
		AnnounceBox("Spectating " .. Game.Players.LocalPlayer.Name .. "!", "SPECTATE", 5, 60, 160, 60, 255, 255, 255)
		SpectatingPhrame.Visible = false
		workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
	end
end)

Other1Page2FeaturesBring = Instance.new("TextButton")
Other1Page2FeaturesBring.Size = UDim2.new(0, 120, 0, 20)
Other1Page2FeaturesBring.Position = UDim2.new(0.02, 0, 0.12, 0)
Other1Page2FeaturesBring.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2FeaturesBring.BackgroundTransparency = 0.4
Other1Page2FeaturesBring.BorderSizePixel = 1
Other1Page2FeaturesBring.Text = "Bring"
Other1Page2FeaturesBring.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesBring.TextSize = 8
Other1Page2FeaturesBring.TextXAlignment = "Center"
Other1Page2FeaturesBring.Parent = Other1PageSection2Phrame

Other1Page2FeaturesBringImage = Instance.new("ImageLabel")
Other1Page2FeaturesBringImage.Size = UDim2.new(0, 20, 0, 20)
Other1Page2FeaturesBringImage.Position = UDim2.new(0.012, 0, 0.12, 0)
Other1Page2FeaturesBringImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2FeaturesBringImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesBringImage.BackgroundTransparency = 1
Other1Page2FeaturesBringImage.BorderSizePixel = 0
Other1Page2FeaturesBringImage.Visible = true
Other1Page2FeaturesBringImage.Image = "rbxassetid://12908948638"
Other1Page2FeaturesBringImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesBringImage.Parent = Other1PageSection2Phrame

Other1Page2FeaturesBring.MouseButton1Click:Connect(function()
	local SPlayer = game.Players:FindFirstChild(LocalTab1SelectedPlayer)
	if LocalTab1SelectedPlayer ~= nil and LocalTab1SelectedPlayer ~= nan and LocalTab1SelectedPlayer ~= "" then
		--Notify("[Teleport]: Teleported ".. LocalTab1SelectedPlayer .. " to you!", 5, 60, 160, 60)
		AnnounceBox("Teleported " .. LocalTab1SelectedPlayer .. " to you!", "TELEPORT", 5, 60, 160, 60, 255, 255, 255)
		PlayerTeleport(SPlayer, LocalPlayer, 1)
	else
		--Notify("[Error]: No player selected!", 5, 95, 60, 60)
		AnnounceBox("No player selected!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	end
end)

Other1Page2FeaturesGoTo = Instance.new("TextButton")
Other1Page2FeaturesGoTo.Size = UDim2.new(0, 120, 0, 20)
Other1Page2FeaturesGoTo.Position = UDim2.new(0.02, 0, 0.22, 0)
Other1Page2FeaturesGoTo.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2FeaturesGoTo.BackgroundTransparency = 0.4
Other1Page2FeaturesGoTo.BorderSizePixel = 1
Other1Page2FeaturesGoTo.Text = "GoTo"
Other1Page2FeaturesGoTo.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesGoTo.TextSize = 8
Other1Page2FeaturesGoTo.TextXAlignment = "Center"
Other1Page2FeaturesGoTo.Parent = Other1PageSection2Phrame

Other1Page2FeaturesGoToImage = Instance.new("ImageLabel")
Other1Page2FeaturesGoToImage.Size = UDim2.new(0, 20, 0, 20)
Other1Page2FeaturesGoToImage.Position = UDim2.new(0.012, 0, 0.22, 0)
Other1Page2FeaturesGoToImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2FeaturesGoToImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesGoToImage.BackgroundTransparency = 1
Other1Page2FeaturesGoToImage.BorderSizePixel = 0
Other1Page2FeaturesGoToImage.Visible = true
Other1Page2FeaturesGoToImage.Image = "rbxassetid://12900618433"
Other1Page2FeaturesGoToImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesGoToImage.Parent = Other1PageSection2Phrame

Other1Page2FeaturesGoTo.MouseButton1Click:Connect(function()
	local SPlayer = game.Players:FindFirstChild(LocalTab1SelectedPlayer)
	if LocalTab1SelectedPlayer ~= nil and LocalTab1SelectedPlayer ~= nan and LocalTab1SelectedPlayer ~= "" then
		--Notify("[Teleport]: Teleported you to ".. LocalTab1SelectedPlayer .. "!", 5, 60, 160, 60)
		AnnounceBox("Teleported you to " .. LocalTab1SelectedPlayer .. "!", "TELEPORT", 5, 60, 160, 60, 255, 255, 255)
		PlayerTeleport(LocalPlayer, SPlayer, 1)
	else
		--Notify("[Error]: No player selected!", 5, 95, 60, 60)
		AnnounceBox("No player selected!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	end
end)

Other1Page2Features = Instance.new("TextButton")
Other1Page2Features.Size = UDim2.new(0, 120, 0, 20)
Other1Page2Features.Position = UDim2.new(0.02, 0, 0.32, 0)
Other1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features.BackgroundTransparency = 0.4
Other1Page2Features.BorderSizePixel = 1
Other1Page2Features.Text = "Nugget"
Other1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features.TextSize = 8
Other1Page2Features.TextXAlignment = "Center"
Other1Page2Features.Parent = Other1PageSection2Phrame

Other1Page2FeaturesImage = Instance.new("ImageLabel")
Other1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Other1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.32, 0)
Other1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesImage.BackgroundTransparency = 1
Other1Page2FeaturesImage.BorderSizePixel = 0
Other1Page2FeaturesImage.Visible = true
Other1Page2FeaturesImage.Image = "rbxassetid://12900618433"
Other1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesImage.Parent = Other1PageSection2Phrame

Other1Page2FeaturesOpenInv = Instance.new("TextButton")
Other1Page2FeaturesOpenInv.Size = UDim2.new(0, 120, 0, 20)
Other1Page2FeaturesOpenInv.Position = UDim2.new(0.02, 0, 0.42, 0)
Other1Page2FeaturesOpenInv.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2FeaturesOpenInv.BackgroundTransparency = 0.4
Other1Page2FeaturesOpenInv.BorderSizePixel = 1
Other1Page2FeaturesOpenInv.Text = "OpenInv"
Other1Page2FeaturesOpenInv.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesOpenInv.TextSize = 8
Other1Page2FeaturesOpenInv.TextXAlignment = "Center"
Other1Page2FeaturesOpenInv.Parent = Other1PageSection2Phrame

Other1Page2FeaturesOpenInvImage = Instance.new("ImageLabel")
Other1Page2FeaturesOpenInvImage.Size = UDim2.new(0, 20, 0, 20)
Other1Page2FeaturesOpenInvImage.Position = UDim2.new(0.012, 0, 0.42, 0)
Other1Page2FeaturesOpenInvImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2FeaturesOpenInvImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesOpenInvImage.BackgroundTransparency = 1
Other1Page2FeaturesOpenInvImage.BorderSizePixel = 0
Other1Page2FeaturesOpenInvImage.Visible = true
Other1Page2FeaturesOpenInvImage.Image = "rbxassetid://12900618433"
Other1Page2FeaturesOpenInvImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesOpenInvImage.Parent = Other1PageSection2Phrame

Other1Page2FeaturesOpenInv.MouseButton1Click:Connect(function()
	local SPlayer = game.Players:FindFirstChild(LocalTab1SelectedPlayer)
	if LocalTab1SelectedPlayer ~= nil and LocalTab1SelectedPlayer ~= nan and LocalTab1SelectedPlayer ~= "" then
		--Notify("[Inventory]: Opened ".. LocalTab1SelectedPlayer .. " inventory!", 5, 60, 160, 60)
		AnnounceBox("Opened " .. LocalTab1SelectedPlayer .. " inventory!", "INVENTORY", 5, 60, 160, 60, 255, 255, 255)
		Inventory(SPlayer)
	else
		--Notify("[Error]: No player selected!", 5, 95, 60, 60)
		AnnounceBox("No player selected!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	end
end)

Other1Page2FeaturesClearInv = Instance.new("TextButton")
Other1Page2FeaturesClearInv.Size = UDim2.new(0, 120, 0, 20)
Other1Page2FeaturesClearInv.Position = UDim2.new(0.02, 0, 0.52, 0)
Other1Page2FeaturesClearInv.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2FeaturesClearInv.BackgroundTransparency = 0.4
Other1Page2FeaturesClearInv.BorderSizePixel = 1
Other1Page2FeaturesClearInv.Text = "ClearInv"
Other1Page2FeaturesClearInv.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesClearInv.TextSize = 8
Other1Page2FeaturesClearInv.TextXAlignment = "Center"
Other1Page2FeaturesClearInv.Parent = Other1PageSection2Phrame

Other1Page2FeaturesClearInvImage = Instance.new("ImageLabel")
Other1Page2FeaturesClearInvImage.Size = UDim2.new(0, 20, 0, 20)
Other1Page2FeaturesClearInvImage.Position = UDim2.new(0.012, 0, 0.52, 0)
Other1Page2FeaturesClearInvImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2FeaturesClearInvImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesClearInvImage.BackgroundTransparency = 1
Other1Page2FeaturesClearInvImage.BorderSizePixel = 0
Other1Page2FeaturesClearInvImage.Visible = true
Other1Page2FeaturesClearInvImage.Image = "rbxassetid://12900618433"
Other1Page2FeaturesClearInvImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesClearInvImage.Parent = Other1PageSection2Phrame

Other1Page2FeaturesClearInv.MouseButton1Click:Connect(function()
	local SPlayer = game.Players:FindFirstChild(LocalTab1SelectedPlayer)
	if LocalTab1SelectedPlayer ~= nil and LocalTab1SelectedPlayer ~= nan and LocalTab1SelectedPlayer ~= "" then
		--Notify("[Inventory]: Cleared ".. LocalTab1SelectedPlayer .. " inventory!", 5, 60, 160, 60)
		AnnounceBox("Cleared " .. LocalTab1SelectedPlayer .. " inventory!", "INVENTORY", 5, 60, 160, 60, 255, 255, 255)
		InventoryClear(SPlayer)
	else
		--Notify("[Error]: No player selected!", 5, 95, 60, 60)
		AnnounceBox("No player selected!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	end
end)

Other1Page2FeaturesRocket = Instance.new("TextButton")
Other1Page2FeaturesRocket.Size = UDim2.new(0, 120, 0, 20)
Other1Page2FeaturesRocket.Position = UDim2.new(0.02, 0, 0.62, 0)
Other1Page2FeaturesRocket.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2FeaturesRocket.BackgroundTransparency = 0.4
Other1Page2FeaturesRocket.BorderSizePixel = 1
Other1Page2FeaturesRocket.Text = "Rocket"
Other1Page2FeaturesRocket.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesRocket.TextSize = 8
Other1Page2FeaturesRocket.TextXAlignment = "Center"
Other1Page2FeaturesRocket.Parent = Other1PageSection2Phrame

Other1Page2FeaturesRocketImage = Instance.new("ImageLabel")
Other1Page2FeaturesRocketImage.Size = UDim2.new(0, 20, 0, 20)
Other1Page2FeaturesRocketImage.Position = UDim2.new(0.012, 0, 0.62, 0)
Other1Page2FeaturesRocketImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2FeaturesRocketImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesRocketImage.BackgroundTransparency = 1
Other1Page2FeaturesRocketImage.BorderSizePixel = 0
Other1Page2FeaturesRocketImage.Visible = true
Other1Page2FeaturesRocketImage.Image = "rbxassetid://12900618433"
Other1Page2FeaturesRocketImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesRocketImage.Parent = Other1PageSection2Phrame

Other1Page2FeaturesRocket.MouseButton1Click:Connect(function()
	local SPlayer = game.Players:FindFirstChild(LocalTab1SelectedPlayer)
	if LocalTab1SelectedPlayer ~= nil and LocalTab1SelectedPlayer ~= nan and LocalTab1SelectedPlayer ~= "" then
		--Notify("[Rocket]: Rocketed ".. LocalTab1SelectedPlayer .. "!", 5, 60, 160, 60)
		AnnounceBox("Rocketed " .. LocalTab1SelectedPlayer .. "!", "ROCKET", 5, 60, 160, 60, 255, 255, 255)
		LaunchRocket(SPlayer)
	else
		--Notify("[Error]: No player selected!", 5, 95, 60, 60)
		AnnounceBox("No player selected!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	end
end)

Other1Page2FeaturesFreeze = Instance.new("TextButton")
Other1Page2FeaturesFreeze.Size = UDim2.new(0, 120, 0, 20)
Other1Page2FeaturesFreeze.Position = UDim2.new(0.02, 0, 0.72, 0)
Other1Page2FeaturesFreeze.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2FeaturesFreeze.BackgroundTransparency = 0.4
Other1Page2FeaturesFreeze.BorderSizePixel = 1
Other1Page2FeaturesFreeze.Text = "Freeze"
Other1Page2FeaturesFreeze.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesFreeze.TextSize = 8
Other1Page2FeaturesFreeze.TextXAlignment = "Center"
Other1Page2FeaturesFreeze.Parent = Other1PageSection2Phrame

Other1Page2FeaturesFreezeImage = Instance.new("ImageLabel")
Other1Page2FeaturesFreezeImage.Size = UDim2.new(0, 20, 0, 20)
Other1Page2FeaturesFreezeImage.Position = UDim2.new(0.012, 0, 0.72, 0)
Other1Page2FeaturesFreezeImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2FeaturesFreezeImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesFreezeImage.BackgroundTransparency = 1
Other1Page2FeaturesFreezeImage.BorderSizePixel = 0
Other1Page2FeaturesFreezeImage.Visible = true
Other1Page2FeaturesFreezeImage.Image = "rbxassetid://12900618433"
Other1Page2FeaturesFreezeImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesFreezeImage.Parent = Other1PageSection2Phrame

local Other1LastModifiedFreezedPlayer = ""
Other1Page2FeaturesFreeze.MouseButton1Click:Connect(function()
	local SPlayer = game.Players:FindFirstChild(LocalTab1SelectedPlayer)
	if LocalTab1SelectedPlayer ~= nil and LocalTab1SelectedPlayer ~= nan and LocalTab1SelectedPlayer ~= "" then
	    Other1LastModifiedFreezedPlayer = LocalTab1SelectedPlayer
		if Other1Page2FeaturesFreeze.Text == "Freeze" then
			Other1Page2FeaturesFreeze.Text = "UnFreeze"
			AnnounceBox("Punished " .. LocalTab1SelectedPlayer .. "!", "PUNISH", 5, 60, 160, 60, 255, 255, 255)
			Punish(SPlayer, true)
		elseif Other1Page2FeaturesFreeze.Text == "UnFreeze" then
			Other1Page2FeaturesFreeze.Text = "Freeze"
			AnnounceBox("Unpunished " .. LocalTab1SelectedPlayer .. "!", "PUNISH", 5, 60, 160, 60, 255, 255, 255)
			Punish(SPlayer, false)
		end
	else
		AnnounceBox("No player selected!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	end
end)

Other1Page2Features = Instance.new("TextButton")
Other1Page2Features.Size = UDim2.new(0, 120, 0, 20)
Other1Page2Features.Position = UDim2.new(0.02, 0, 0.82, 0)
Other1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features.BackgroundTransparency = 0.4
Other1Page2Features.BorderSizePixel = 1
Other1Page2Features.Text = "Lag"
Other1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features.TextSize = 8
Other1Page2Features.TextXAlignment = "Center"
Other1Page2Features.Parent = Other1PageSection2Phrame

Other1Page2FeaturesImage = Instance.new("ImageLabel")
Other1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Other1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.82, 0)
Other1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesImage.BackgroundTransparency = 1
Other1Page2FeaturesImage.BorderSizePixel = 0
Other1Page2FeaturesImage.Visible = true
Other1Page2FeaturesImage.Image = "rbxassetid://12900618433"
Other1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2FeaturesImage.Parent = Other1PageSection2Phrame

Other1Page2Features2 = Instance.new("TextButton")
Other1Page2Features2.Size = UDim2.new(0, 120, 0, 20)
Other1Page2Features2.Position = UDim2.new(0.36, 0, 0.02, 0)
Other1Page2Features2.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features2.BackgroundTransparency = 0.4
Other1Page2Features2.BorderSizePixel = 1
Other1Page2Features2.Text = "CombatLog"
Other1Page2Features2.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2.TextSize = 8
Other1Page2Features2.TextXAlignment = "Center"
Other1Page2Features2.Parent = Other1PageSection2Phrame

Other1Page2Features2Image = Instance.new("ImageLabel")
Other1Page2Features2Image.Size = UDim2.new(0, 20, 0, 20)
Other1Page2Features2Image.Position = UDim2.new(0.36, 0, 0.02, 0)
Other1Page2Features2Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features2Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2Image.BackgroundTransparency = 1
Other1Page2Features2Image.BorderSizePixel = 0
Other1Page2Features2Image.Visible = true
Other1Page2Features2Image.Image = "rbxassetid://12900618433"
Other1Page2Features2Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2Image.Parent = Other1PageSection2Phrame

Other1Page2Features2Kill = Instance.new("TextButton")
Other1Page2Features2Kill.Size = UDim2.new(0, 120, 0, 20)
Other1Page2Features2Kill.Position = UDim2.new(0.36, 0, 0.12, 0)
Other1Page2Features2Kill.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features2Kill.BackgroundTransparency = 0.4
Other1Page2Features2Kill.BorderSizePixel = 1
Other1Page2Features2Kill.Text = "Kill"
Other1Page2Features2Kill.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2Kill.TextSize = 8
Other1Page2Features2Kill.TextXAlignment = "Center"
Other1Page2Features2Kill.Parent = Other1PageSection2Phrame

Other1Page2Features2KillImage = Instance.new("ImageLabel")
Other1Page2Features2KillImage.Size = UDim2.new(0, 20, 0, 20)
Other1Page2Features2KillImage.Position = UDim2.new(0.36, 0, 0.12, 0)
Other1Page2Features2KillImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features2KillImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2KillImage.BackgroundTransparency = 1
Other1Page2Features2KillImage.BorderSizePixel = 0
Other1Page2Features2KillImage.Visible = true
Other1Page2Features2KillImage.Image = "rbxassetid://12900618433"
Other1Page2Features2KillImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2KillImage.Parent = Other1PageSection2Phrame

Other1Page2Features2Kill.MouseButton1Click:Connect(function()
	local SPlayer = game.Players:FindFirstChild(LocalTab1SelectedPlayer)
	if LocalTab1SelectedPlayer ~= nil and LocalTab1SelectedPlayer ~= nan and LocalTab1SelectedPlayer ~= "" then
		--Notify("[Kill]: Killed ".. LocalTab1SelectedPlayer .. "!", 5, 60, 160, 60)
		AnnounceBox("Killed " .. LocalTab1SelectedPlayer .. "!", "KILL", 5, 60, 160, 60, 255, 255, 255)
		Kill(SPlayer)
	else
		--Notify("[Error]: No player selected!", 5, 95, 60, 60)
		AnnounceBox("No player selected!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	end
end)

Other1Page2Features2Kick = Instance.new("TextButton")
Other1Page2Features2Kick.Size = UDim2.new(0, 120, 0, 20)
Other1Page2Features2Kick.Position = UDim2.new(0.36, 0, 0.22, 0)
Other1Page2Features2Kick.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features2Kick.BackgroundTransparency = 0.4
Other1Page2Features2Kick.BorderSizePixel = 1
Other1Page2Features2Kick.Text = "Kick"
Other1Page2Features2Kick.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2Kick.TextSize = 8
Other1Page2Features2Kick.TextXAlignment = "Center"
Other1Page2Features2Kick.Parent = Other1PageSection2Phrame

Other1Page2Features2KickImage = Instance.new("ImageLabel")
Other1Page2Features2KickImage.Size = UDim2.new(0, 20, 0, 20)
Other1Page2Features2KickImage.Position = UDim2.new(0.36, 0, 0.22, 0)
Other1Page2Features2KickImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features2KickImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2KickImage.BackgroundTransparency = 1
Other1Page2Features2KickImage.BorderSizePixel = 0
Other1Page2Features2KickImage.Visible = true
Other1Page2Features2KickImage.Image = "rbxassetid://12900618433"
Other1Page2Features2KickImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2KickImage.Parent = Other1PageSection2Phrame

Other1Page2Features2Kick.MouseButton1Click:Connect(function()
	local SPlayer = game.Players:FindFirstChild(LocalTab1SelectedPlayer)
	if LocalTab1SelectedPlayer ~= nil and LocalTab1SelectedPlayer ~= nan and LocalTab1SelectedPlayer ~= "" then
		--Notify("[Kill]: Kicked ".. LocalTab1SelectedPlayer .. "!", 5, 60, 160, 60)
		AnnounceBox("Kicked " .. LocalTab1SelectedPlayer .. "!", "KICK", 5, 60, 160, 60, 255, 255, 255)
		Kick(SPlayer)
	else
		--Notify("[Error]: No player selected!", 5, 95, 60, 60)
		AnnounceBox("No player selected!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	end
end)

Other1Page2Features2 = Instance.new("TextButton")
Other1Page2Features2.Size = UDim2.new(0, 120, 0, 20)
Other1Page2Features2.Position = UDim2.new(0.36, 0, 0.32, 0)
Other1Page2Features2.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features2.BackgroundTransparency = 0.4
Other1Page2Features2.BorderSizePixel = 1
Other1Page2Features2.Text = "Crash"
Other1Page2Features2.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2.TextSize = 8
Other1Page2Features2.TextXAlignment = "Center"
Other1Page2Features2.Parent = Other1PageSection2Phrame

Other1Page2Features2Image = Instance.new("ImageLabel")
Other1Page2Features2Image.Size = UDim2.new(0, 20, 0, 20)
Other1Page2Features2Image.Position = UDim2.new(0.36, 0, 0.32, 0)
Other1Page2Features2Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features2Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2Image.BackgroundTransparency = 1
Other1Page2Features2Image.BorderSizePixel = 0
Other1Page2Features2Image.Visible = true
Other1Page2Features2Image.Image = "rbxassetid://12900618433"
Other1Page2Features2Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2Image.Parent = Other1PageSection2Phrame

Other1Page2Features2 = Instance.new("TextButton")
Other1Page2Features2.Size = UDim2.new(0, 120, 0, 20)
Other1Page2Features2.Position = UDim2.new(0.36, 0, 0.42, 0)
Other1Page2Features2.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features2.BackgroundTransparency = 0.4
Other1Page2Features2.BorderSizePixel = 1
Other1Page2Features2.Text = "ForceField"
Other1Page2Features2.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2.TextSize = 8
Other1Page2Features2.TextXAlignment = "Center"
Other1Page2Features2.Parent = Other1PageSection2Phrame

Other1Page2Features2Image = Instance.new("ImageLabel")
Other1Page2Features2Image.Size = UDim2.new(0, 20, 0, 20)
Other1Page2Features2Image.Position = UDim2.new(0.36, 0, 0.42, 0)
Other1Page2Features2Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features2Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2Image.BackgroundTransparency = 1
Other1Page2Features2Image.BorderSizePixel = 0
Other1Page2Features2Image.Visible = true
Other1Page2Features2Image.Image = "rbxassetid://12900618433"
Other1Page2Features2Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2Image.Parent = Other1PageSection2Phrame

Other1Page2Features2ToggleVest = Instance.new("TextButton")
Other1Page2Features2ToggleVest.Size = UDim2.new(0, 120, 0, 20)
Other1Page2Features2ToggleVest.Position = UDim2.new(0.36, 0, 0.52, 0)
Other1Page2Features2ToggleVest.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features2ToggleVest.BackgroundTransparency = 0.4
Other1Page2Features2ToggleVest.BorderSizePixel = 1
Other1Page2Features2ToggleVest.Text = "Rem Vest"
Other1Page2Features2ToggleVest.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2ToggleVest.TextSize = 8
Other1Page2Features2ToggleVest.TextXAlignment = "Center"
Other1Page2Features2ToggleVest.Parent = Other1PageSection2Phrame

Other1Page2Features2ToggleVestImage = Instance.new("ImageLabel")
Other1Page2Features2ToggleVestImage.Size = UDim2.new(0, 20, 0, 20)
Other1Page2Features2ToggleVestImage.Position = UDim2.new(0.36, 0, 0.52, 0)
Other1Page2Features2ToggleVestImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features2ToggleVestImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2ToggleVestImage.BackgroundTransparency = 1
Other1Page2Features2ToggleVestImage.BorderSizePixel = 0
Other1Page2Features2ToggleVestImage.Visible = true
Other1Page2Features2ToggleVestImage.Image = "rbxassetid://12900618433"
Other1Page2Features2ToggleVestImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2ToggleVestImage.Parent = Other1PageSection2Phrame

Other1Page2Features2ToggleVest.MouseButton1Click:Connect(function()
	local SPlayer = game.Players:FindFirstChild(LocalTab1SelectedPlayer)
	if LocalTab1SelectedPlayer ~= nil and LocalTab1SelectedPlayer ~= nan and LocalTab1SelectedPlayer ~= "" then
		if Other1Page2Features2ToggleVest.Text == "Rem Vest" then
			AnnounceBox("Removed vest from " .. LocalTab1SelectedPlayer .. "!", "TOGGLE VEST", 5, 60, 160, 60, 255, 255, 255)
			Vest(SPlayer, 2)
			Other1Page2Features2ToggleVest.Text = "Add Vest"
		else
			AnnounceBox("Added vest to " .. LocalTab1SelectedPlayer .. "!", "TOGGLE VEST", 5, 60, 160, 60, 255, 255, 255)
			Vest(SPlayer, 1)
			Other1Page2Features2ToggleVest.Text = "Rem Vest"
		end
	else
		AnnounceBox("No player selected!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	end
end)


Other1Page2Features2PKGod = Instance.new("TextButton")
Other1Page2Features2PKGod.Size = UDim2.new(0, 120, 0, 20)
Other1Page2Features2PKGod.Position = UDim2.new(0.36, 0, 0.62, 0)
Other1Page2Features2PKGod.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features2PKGod.BackgroundTransparency = 0.4
Other1Page2Features2PKGod.BorderSizePixel = 1
Other1Page2Features2PKGod.Text = "God"
Other1Page2Features2PKGod.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2PKGod.TextSize = 8
Other1Page2Features2PKGod.TextXAlignment = "Center"
Other1Page2Features2PKGod.Parent = Other1PageSection2Phrame

Other1Page2Features2PKGodImage = Instance.new("ImageLabel")
Other1Page2Features2PKGodImage.Size = UDim2.new(0, 20, 0, 20)
Other1Page2Features2PKGodImage.Position = UDim2.new(0.36, 0, 0.62, 0)
Other1Page2Features2PKGodImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features2PKGodImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2PKGodImage.BackgroundTransparency = 1
Other1Page2Features2PKGodImage.BorderSizePixel = 0
Other1Page2Features2PKGodImage.Visible = true
Other1Page2Features2PKGodImage.Image = "rbxassetid://12900618433"
Other1Page2Features2PKGodImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2PKGodImage.Parent = Other1PageSection2Phrame

Other1Page2Features2PKGod.MouseButton1Click:Connect(function()
	local SPlayer = game.Players:FindFirstChild(LocalTab1SelectedPlayer)
	if Other1Page2Features2PKGod.Text == "God" then
		if LocalTab1SelectedPlayer ~= nil and LocalTab1SelectedPlayer ~= nan and LocalTab1SelectedPlayer ~= "" then
			--Notify("[PKGod]: Gave PKGod to ".. LocalTab1SelectedPlayer .. "!", 5, 60, 160, 60)
			AnnounceBox("Gave PKGod to " .. LocalTab1SelectedPlayer .. "!", "PKGOD", 5, 60, 160, 60, 255, 255, 255)
			Other1Page2Features2PKGod.Text = "UnGod"
			PKGod(SPlayer, 1)
		else
			--Notify("[Error]: No player selected!", 5, 95, 60, 60)
			AnnounceBox("No player selected!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
		end
	else
		if LocalTab1SelectedPlayer ~= nil and LocalTab1SelectedPlayer ~= nan and LocalTab1SelectedPlayer ~= "" then
			--Notify("[PKGod]: Removed PKGod from ".. LocalTab1SelectedPlayer .. "!", 5, 60, 160, 60)
			AnnounceBox("Removed PKGod from " .. LocalTab1SelectedPlayer .. "!", "PKGOD", 5, 60, 160, 60, 255, 255, 255)
			Other1Page2Features2PKGod.Text = "God"
			PKGod(SPlayer, 2)
		else
			--Notify("[Error]: No player selected!", 5, 95, 60, 60)
			AnnounceBox("No player selected!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
		end
	end
end)

Other1Page2Features2VitalsRem = Instance.new("TextButton")
Other1Page2Features2VitalsRem.Size = UDim2.new(0, 120, 0, 20)
Other1Page2Features2VitalsRem.Position = UDim2.new(0.36, 0, 0.72, 0)
Other1Page2Features2VitalsRem.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features2VitalsRem.BackgroundTransparency = 0.4
Other1Page2Features2VitalsRem.BorderSizePixel = 1
Other1Page2Features2VitalsRem.Text = "No Vitals"
Other1Page2Features2VitalsRem.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2VitalsRem.TextSize = 8
Other1Page2Features2VitalsRem.TextXAlignment = "Center"
Other1Page2Features2VitalsRem.Parent = Other1PageSection2Phrame

Other1Page2Features2VitalsRemImage = Instance.new("ImageLabel")
Other1Page2Features2VitalsRemImage.Size = UDim2.new(0, 20, 0, 20)
Other1Page2Features2VitalsRemImage.Position = UDim2.new(0.36, 0, 0.72, 0)
Other1Page2Features2VitalsRemImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features2VitalsRemImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2VitalsRemImage.BackgroundTransparency = 1
Other1Page2Features2VitalsRemImage.BorderSizePixel = 0
Other1Page2Features2VitalsRemImage.Visible = true
Other1Page2Features2VitalsRemImage.Image = "rbxassetid://12900618433"
Other1Page2Features2VitalsRemImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2VitalsRemImage.Parent = Other1PageSection2Phrame

Other1Page2Features2VitalsRem.MouseButton1Click:Connect(function()
	local SPlayer = game.Players:FindFirstChild(LocalTab1SelectedPlayer)
	if LocalTab1SelectedPlayer ~= nil and LocalTab1SelectedPlayer ~= nan and LocalTab1SelectedPlayer ~= "" then
		--Notify("[Vitals]: Gave no-vitals to ".. LocalTab1SelectedPlayer .. "!", 5, 60, 160, 60)
		AnnounceBox("Gave no-vitals to " .. LocalTab1SelectedPlayer .. "!", "VITALS", 5, 60, 160, 60, 255, 255, 255)
		Vitals(SPlayer, 1)
	else
		--Notify("[Error]: No player selected!", 5, 95, 60, 60)
		AnnounceBox("No player selected!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	end
end)

Other1Page2Features2VitalsAdd = Instance.new("TextButton")
Other1Page2Features2VitalsAdd.Size = UDim2.new(0, 120, 0, 20)
Other1Page2Features2VitalsAdd.Position = UDim2.new(0.36, 0, 0.82, 0)
Other1Page2Features2VitalsAdd.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features2VitalsAdd.BackgroundTransparency = 0.4
Other1Page2Features2VitalsAdd.BorderSizePixel = 1
Other1Page2Features2VitalsAdd.Text = "Inf Vitals"
Other1Page2Features2VitalsAdd.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2VitalsAdd.TextSize = 8
Other1Page2Features2VitalsAdd.TextXAlignment = "Center"
Other1Page2Features2VitalsAdd.Parent = Other1PageSection2Phrame

Other1Page2Features2VitalsAddImage = Instance.new("ImageLabel")
Other1Page2Features2VitalsAddImage.Size = UDim2.new(0, 20, 0, 20)
Other1Page2Features2VitalsAddImage.Position = UDim2.new(0.36, 0, 0.82, 0)
Other1Page2Features2VitalsAddImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features2VitalsAddImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2VitalsAddImage.BackgroundTransparency = 1
Other1Page2Features2VitalsAddImage.BorderSizePixel = 0
Other1Page2Features2VitalsAddImage.Visible = true
Other1Page2Features2VitalsAddImage.Image = "rbxassetid://12900618433"
Other1Page2Features2VitalsAddImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features2VitalsAddImage.Parent = Other1PageSection2Phrame

Other1Page2Features2VitalsAdd.MouseButton1Click:Connect(function()
	local SPlayer = game.Players:FindFirstChild(LocalTab1SelectedPlayer)
	if LocalTab1SelectedPlayer ~= nil and LocalTab1SelectedPlayer ~= nan and LocalTab1SelectedPlayer ~= "" then
		--Notify("[Vitals]: Gave inf-vitals to ".. LocalTab1SelectedPlayer .. "!", 5, 60, 160, 60)
		AnnounceBox("Gave inf-vitals to " .. LocalTab1SelectedPlayer .. "!", "VITALS", 5, 60, 160, 60, 255, 255, 255)
		Vitals(SPlayer, 2)
	else
		--Notify("[Error]: No player selected!", 5, 95, 60, 60)
		AnnounceBox("No player selected!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	end
end)

Other1Page2Features3ZombieKills = Instance.new("TextButton")
Other1Page2Features3ZombieKills.Size = UDim2.new(0, 120, 0, 20)
Other1Page2Features3ZombieKills.Position = UDim2.new(0.698, 0, 0.02, 0)
Other1Page2Features3ZombieKills.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features3ZombieKills.BackgroundTransparency = 0.4
Other1Page2Features3ZombieKills.BorderSizePixel = 1
Other1Page2Features3ZombieKills.Text = "ZombieKills"
Other1Page2Features3ZombieKills.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3ZombieKills.TextSize = 8
Other1Page2Features3ZombieKills.TextXAlignment = "Center"
Other1Page2Features3ZombieKills.Parent = Other1PageSection2Phrame

Other1Page2Features3ZombieKillsImage = Instance.new("ImageLabel")
Other1Page2Features3ZombieKillsImage.Size = UDim2.new(0, 20, 0, 20)
Other1Page2Features3ZombieKillsImage.Position = UDim2.new(0.698, 0, 0.02, 0)
Other1Page2Features3ZombieKillsImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features3ZombieKillsImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3ZombieKillsImage.BackgroundTransparency = 1
Other1Page2Features3ZombieKillsImage.BorderSizePixel = 0
Other1Page2Features3ZombieKillsImage.Visible = true
Other1Page2Features3ZombieKillsImage.Image = "rbxassetid://12900618433"
Other1Page2Features3ZombieKillsImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3ZombieKillsImage.Parent = Other1PageSection2Phrame

Other1Page2Features3ZombieKills.MouseButton1Click:Connect(function()
    local Amount = tonumber(Other1Page2FeaturesAmount.Text)
	local SPlayer = game.Players:FindFirstChild(LocalTab1SelectedPlayer)
	if LocalTab1SelectedPlayer ~= nil and LocalTab1SelectedPlayer ~= nan and LocalTab1SelectedPlayer ~= "" then
	    --Notify("[Stat]: Set ".. LocalTab1SelectedPlayer .. " zombie kills to " .. Amount .. "!", 5, 60, 160, 60)
		if Amount then
		    AnnounceBox("Set " .. LocalTab1SelectedPlayer .. " zombie kills to " .. Amount .. "!", "STAT", 5, 60, 160, 60, 255, 255, 255)
		    StatMod(SPlayer, Amount, 2)
		else
		    AnnounceBox("Amount is invalid!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
		end
	else
		--Notify("[Error]: No player selected!", 5, 95, 60, 60)
		AnnounceBox("No player selected!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	end
end)

Other1Page2Features3PlayerKills = Instance.new("TextButton")
Other1Page2Features3PlayerKills.Size = UDim2.new(0, 120, 0, 20)
Other1Page2Features3PlayerKills.Position = UDim2.new(0.698, 0, 0.12, 0)
Other1Page2Features3PlayerKills.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features3PlayerKills.BackgroundTransparency = 0.4
Other1Page2Features3PlayerKills.BorderSizePixel = 1
Other1Page2Features3PlayerKills.Text = "PlayerKills"
Other1Page2Features3PlayerKills.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3PlayerKills.TextSize = 8
Other1Page2Features3PlayerKills.TextXAlignment = "Center"
Other1Page2Features3PlayerKills.Parent = Other1PageSection2Phrame

Other1Page2Features3PlayerKillsImage = Instance.new("ImageLabel")
Other1Page2Features3PlayerKillsImage.Size = UDim2.new(0, 20, 0, 20)
Other1Page2Features3PlayerKillsImage.Position = UDim2.new(0.698, 0, 0.12, 0)
Other1Page2Features3PlayerKillsImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features3PlayerKillsImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3PlayerKillsImage.BackgroundTransparency = 1
Other1Page2Features3PlayerKillsImage.BorderSizePixel = 0
Other1Page2Features3PlayerKillsImage.Visible = true
Other1Page2Features3PlayerKillsImage.Image = "rbxassetid://12900618433"
Other1Page2Features3PlayerKillsImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3PlayerKillsImage.Parent = Other1PageSection2Phrame

Other1Page2Features3PlayerKills.MouseButton1Click:Connect(function()
    local Amount = tonumber(Other1Page2FeaturesAmount.Text)
	local SPlayer = game.Players:FindFirstChild(LocalTab1SelectedPlayer)
	if LocalTab1SelectedPlayer ~= nil and LocalTab1SelectedPlayer ~= nan and LocalTab1SelectedPlayer ~= "" then
	    --Notify("[Stat]: Set ".. LocalTab1SelectedPlayer .. " player kills to " .. Amount .. "!", 5, 60, 160, 60)
		if Amount then
		    AnnounceBox("Set " .. LocalTab1SelectedPlayer .. " player kills to " .. Amount .. "!", "STAT", 5, 60, 160, 60, 255, 255, 255)
		    StatMod(SPlayer, Amount, 1)
		else
		    AnnounceBox("Amount is invalid!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
		end
	else
		--Notify("[Error]: No player selected!", 5, 95, 60, 60)
		AnnounceBox("No player selected!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	end
end)

Other1Page2Features3Days = Instance.new("TextButton")
Other1Page2Features3Days.Size = UDim2.new(0, 120, 0, 20)
Other1Page2Features3Days.Position = UDim2.new(0.698, 0, 0.22, 0)
Other1Page2Features3Days.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features3Days.BackgroundTransparency = 0.4
Other1Page2Features3Days.BorderSizePixel = 1
Other1Page2Features3Days.Text = "Days"
Other1Page2Features3Days.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3Days.TextSize = 8
Other1Page2Features3Days.TextXAlignment = "Center"
Other1Page2Features3Days.Parent = Other1PageSection2Phrame

Other1Page2Features3DaysImage = Instance.new("ImageLabel")
Other1Page2Features3DaysImage.Size = UDim2.new(0, 20, 0, 20)
Other1Page2Features3DaysImage.Position = UDim2.new(0.698, 0, 0.22, 0)
Other1Page2Features3DaysImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features3DaysImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3DaysImage.BackgroundTransparency = 1
Other1Page2Features3DaysImage.BorderSizePixel = 0
Other1Page2Features3DaysImage.Visible = true
Other1Page2Features3DaysImage.Image = "rbxassetid://12900618433"
Other1Page2Features3DaysImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3DaysImage.Parent = Other1PageSection2Phrame

Other1Page2Features3Days.MouseButton1Click:Connect(function()
    local Amount = tonumber(Other1Page2FeaturesAmount.Text)
	local SPlayer = game.Players:FindFirstChild(LocalTab1SelectedPlayer)
	if LocalTab1SelectedPlayer ~= nil and LocalTab1SelectedPlayer ~= nan and LocalTab1SelectedPlayer ~= "" then
	    --Notify("[Stat]: Set ".. LocalTab1SelectedPlayer .. " days to " .. Amount .. "!", 5, 60, 160, 60)
		if Amount then
		    AnnounceBox("Set " .. LocalTab1SelectedPlayer .. " days to " .. Amount .. "!", "STAT", 5, 60, 160, 60, 255, 255, 255)
		    StatMod(SPlayer, Amount, 3)
		else
		    AnnounceBox("Amount is invalid!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
		end
	else
		--Notify("[Error]: No player selected!", 5, 95, 60, 60)
		AnnounceBox("No player selected!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	end
end)

Other1Page2Features3Invis = Instance.new("TextButton")
Other1Page2Features3Invis.Size = UDim2.new(0, 120, 0, 20)
Other1Page2Features3Invis.Position = UDim2.new(0.698, 0, 0.32, 0)
Other1Page2Features3Invis.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features3Invis.BackgroundTransparency = 0.4
Other1Page2Features3Invis.BorderSizePixel = 1
Other1Page2Features3Invis.Text = "Invis"
Other1Page2Features3Invis.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3Invis.TextSize = 8
Other1Page2Features3Invis.TextXAlignment = "Center"
Other1Page2Features3Invis.Parent = Other1PageSection2Phrame

Other1Page2Features3InvisImage = Instance.new("ImageLabel")
Other1Page2Features3InvisImage.Size = UDim2.new(0, 20, 0, 20)
Other1Page2Features3InvisImage.Position = UDim2.new(0.698, 0, 0.32, 0)
Other1Page2Features3InvisImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features3InvisImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3InvisImage.BackgroundTransparency = 1
Other1Page2Features3InvisImage.BorderSizePixel = 0
Other1Page2Features3InvisImage.Visible = true
Other1Page2Features3InvisImage.Image = "rbxassetid://12900717295"
Other1Page2Features3InvisImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3InvisImage.Parent = Other1PageSection2Phrame

local Other1LastModifiedInvisPlayer = ""
Other1Page2Features3Invis.MouseButton1Click:Connect(function()
	local SPlayer = game.Players:FindFirstChild(LocalTab1SelectedPlayer)
	if LocalTab1SelectedPlayer ~= nil and LocalTab1SelectedPlayer ~= nan and LocalTab1SelectedPlayer ~= "" then
	    Other1LastModifiedInvisPlayer = LocalTab1SelectedPlayer
		if Other1Page2Features3InvisImage.Image == "rbxassetid://12900717295" then
			Other1Page2Features3InvisImage.Image = "rbxassetid://12900770221"
			--Notify("[Invis]: Set visibility of ".. LocalTab1SelectedPlayer .. " to invisible!", 5, 60, 160, 60)
			AnnounceBox("Set visibility of " .. LocalTab1SelectedPlayer .. " to invisible!", "INVIS", 5, 60, 160, 60, 255, 255, 255)
			Texture(SPlayer.Character, "Plastic", 1) 
			Vest(SPlayer, 2)
		else
			Other1Page2Features3InvisImage.Image = "rbxassetid://12900717295"
			--Notify("[Invis]: Set visibility of ".. LocalTab1SelectedPlayer .. " to visible!", 5, 60, 160, 60)
			AnnounceBox("Set visibility of " .. LocalTab1SelectedPlayer .. " to visible!", "INVIS", 5, 60, 160, 60, 255, 255, 255)
			Texture(SPlayer.Character, "Plastic", 0) 
			Vest(SPlayer, 1)
		end
	else
		--Notify("[Error]: No player selected!", 5, 95, 60, 60)
		AnnounceBox("No player selected!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	end
end)

Other1Page2Features3ZIvis = Instance.new("TextButton")
Other1Page2Features3ZIvis.Size = UDim2.new(0, 120, 0, 20)
Other1Page2Features3ZIvis.Position = UDim2.new(0.698, 0, 0.42, 0)
Other1Page2Features3ZIvis.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features3ZIvis.BackgroundTransparency = 0.4
Other1Page2Features3ZIvis.BorderSizePixel = 1
Other1Page2Features3ZIvis.Text = "Zombie Invis"
Other1Page2Features3ZIvis.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3ZIvis.TextSize = 8
Other1Page2Features3ZIvis.TextXAlignment = "Center"
Other1Page2Features3ZIvis.Parent = Other1PageSection2Phrame

Other1Page2Features3ZIvisImage = Instance.new("ImageLabel")
Other1Page2Features3ZIvisImage.Size = UDim2.new(0, 20, 0, 20)
Other1Page2Features3ZIvisImage.Position = UDim2.new(0.698, 0, 0.42, 0)
Other1Page2Features3ZIvisImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features3ZIvisImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3ZIvisImage.BackgroundTransparency = 1
Other1Page2Features3ZIvisImage.BorderSizePixel = 0
Other1Page2Features3ZIvisImage.Visible = true
Other1Page2Features3ZIvisImage.Image = "rbxassetid://12900717295"
Other1Page2Features3ZIvisImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3ZIvisImage.Parent = Other1PageSection2Phrame

local Other1LastModifiedZInvisPlayer = ""
Other1Page2Features3ZIvis.MouseButton1Click:Connect(function()
	local SPlayer = game.Players:FindFirstChild(LocalTab1SelectedPlayer)
	if LocalTab1SelectedPlayer ~= nil and LocalTab1SelectedPlayer ~= nan and LocalTab1SelectedPlayer ~= "" then
	    Other1LastModifiedZInvisPlayer = LocalTab1SelectedPlayer
		if Other1Page2Features3ZIvisImage.Image == "rbxassetid://12900717295" then
			Other1Page2Features3ZIvisImage.Image = "rbxassetid://12900770221"
			--Notify("[ZInvis]: Set zombie visibility of ".. LocalTab1SelectedPlayer .. " to invisible!", 5, 60, 160, 60)
			AnnounceBox("Set zombie visibility of " .. LocalTab1SelectedPlayer .. " to invisible!", "ZINVIS", 5, 60, 160, 60, 255, 255, 255)
			ZombieVisible(SPlayer, true)
		elseif Other1Page2Features3ZIvisImage.Image == "rbxassetid://12900770221" then
			Other1Page2Features3ZIvisImage.Image = "rbxassetid://12900717295"
			--Notify("[ZInvis]: Set zombie visibility of ".. LocalTab1SelectedPlayer .. " to visible!", 5, 60, 160, 60)
			AnnounceBox("Set zombie visibility of " .. LocalTab1SelectedPlayer .. " to visible!", "ZINVIS", 5, 60, 160, 60, 255, 255, 255)
			ZombieVisible(SPlayer, false)
		end
	else
		--Notify("[Error]: No player selected!", 5, 95, 60, 60)
		AnnounceBox("No player selected!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
	end
end)

Other1Page2Features3 = Instance.new("TextButton")
Other1Page2Features3.Size = UDim2.new(0, 120, 0, 20)
Other1Page2Features3.Position = UDim2.new(0.698, 0, 0.52, 0)
Other1Page2Features3.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features3.BackgroundTransparency = 0.4
Other1Page2Features3.BorderSizePixel = 1
Other1Page2Features3.Text = "Horde"
Other1Page2Features3.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3.TextSize = 8
Other1Page2Features3.TextXAlignment = "Center"
Other1Page2Features3.Parent = Other1PageSection2Phrame

Other1Page2Features3Image = Instance.new("ImageLabel")
Other1Page2Features3Image.Size = UDim2.new(0, 20, 0, 20)
Other1Page2Features3Image.Position = UDim2.new(0.698, 0, 0.52, 0)
Other1Page2Features3Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features3Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3Image.BackgroundTransparency = 1
Other1Page2Features3Image.BorderSizePixel = 0
Other1Page2Features3Image.Visible = true
Other1Page2Features3Image.Image = "rbxassetid://12900618433"
Other1Page2Features3Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3Image.Parent = Other1PageSection2Phrame

Other1Page2Features3 = Instance.new("TextButton")
Other1Page2Features3.Size = UDim2.new(0, 120, 0, 20)
Other1Page2Features3.Position = UDim2.new(0.698, 0, 0.62, 0)
Other1Page2Features3.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features3.BackgroundTransparency = 0.4
Other1Page2Features3.BorderSizePixel = 1
Other1Page2Features3.Text = "Spam"
Other1Page2Features3.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3.TextSize = 8
Other1Page2Features3.TextXAlignment = "Center"
Other1Page2Features3.Parent = Other1PageSection2Phrame

Other1Page2Features3Image = Instance.new("ImageLabel")
Other1Page2Features3Image.Size = UDim2.new(0, 20, 0, 20)
Other1Page2Features3Image.Position = UDim2.new(0.698, 0, 0.62, 0)
Other1Page2Features3Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features3Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3Image.BackgroundTransparency = 1
Other1Page2Features3Image.BorderSizePixel = 0
Other1Page2Features3Image.Visible = true
Other1Page2Features3Image.Image = "rbxassetid://12900618433"
Other1Page2Features3Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3Image.Parent = Other1PageSection2Phrame

Other1Page2Features3 = Instance.new("TextButton")
Other1Page2Features3.Size = UDim2.new(0, 120, 0, 20)
Other1Page2Features3.Position = UDim2.new(0.698, 0, 0.72, 0)
Other1Page2Features3.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features3.BackgroundTransparency = 0.4
Other1Page2Features3.BorderSizePixel = 1
Other1Page2Features3.Text = "Skins"
Other1Page2Features3.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3.TextSize = 8
Other1Page2Features3.TextXAlignment = "Center"
Other1Page2Features3.Parent = Other1PageSection2Phrame

Other1Page2Features3Image = Instance.new("ImageLabel")
Other1Page2Features3Image.Size = UDim2.new(0, 20, 0, 20)
Other1Page2Features3Image.Position = UDim2.new(0.698, 0, 0.72, 0)
Other1Page2Features3Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features3Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3Image.BackgroundTransparency = 1
Other1Page2Features3Image.BorderSizePixel = 0
Other1Page2Features3Image.Visible = true
Other1Page2Features3Image.Image = "rbxassetid://12900618433"
Other1Page2Features3Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3Image.Parent = Other1PageSection2Phrame

Other1Page2Features3 = Instance.new("TextButton")
Other1Page2Features3.Size = UDim2.new(0, 120, 0, 20)
Other1Page2Features3.Position = UDim2.new(0.698, 0, 0.82, 0)
Other1Page2Features3.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features3.BackgroundTransparency = 0.4
Other1Page2Features3.BorderSizePixel = 1
Other1Page2Features3.Text = "Inf Stamina"
Other1Page2Features3.TextColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3.TextSize = 8
Other1Page2Features3.TextXAlignment = "Center"
Other1Page2Features3.Parent = Other1PageSection2Phrame

Other1Page2Features3Image = Instance.new("ImageLabel")
Other1Page2Features3Image.Size = UDim2.new(0, 20, 0, 20)
Other1Page2Features3Image.Position = UDim2.new(0.698, 0, 0.82, 0)
Other1Page2Features3Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Other1Page2Features3Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3Image.BackgroundTransparency = 1
Other1Page2Features3Image.BorderSizePixel = 0
Other1Page2Features3Image.Visible = true
Other1Page2Features3Image.Image = "rbxassetid://12900618433"
Other1Page2Features3Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Other1Page2Features3Image.Parent = Other1PageSection2Phrame
--frames



--frames
Tools1PageSection1Phrame = Instance.new("ScrollingFrame")
Tools1PageSection1Phrame.Size = UDim2.new(0.27, 0, 0.80, 0)
Tools1PageSection1Phrame.Position = UDim2.new(0.01, 0, 0.05, 0)
Tools1PageSection1Phrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Tools1PageSection1Phrame.CanvasSize = UDim2.new(0, 0, 30, 0)
Tools1PageSection1Phrame.BorderSizePixel = 1
Tools1PageSection1Phrame.Transparency = 0.2
Tools1PageSection1Phrame.Active = false
Tools1PageSection1Phrame.Selectable = true
Tools1PageSection1Phrame.Visible = false
Tools1PageSection1Phrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
Tools1PageSection1Phrame.ScrollBarThickness = 4
Tools1PageSection1Phrame.Parent = GuiPhrame

Tools1PageSection2Phrame = Instance.new("Frame")
Tools1PageSection2Phrame.Size = UDim2.new(0.42, 0, 0.9, 0)
Tools1PageSection2Phrame.Position = UDim2.new(0.57, 0, 0.05, 0)
Tools1PageSection2Phrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Tools1PageSection2Phrame.BorderSizePixel = 1
Tools1PageSection2Phrame.Transparency = 0.2
Tools1PageSection2Phrame.Active = false
Tools1PageSection2Phrame.Selectable = true
Tools1PageSection2Phrame.Visible = false
Tools1PageSection2Phrame.Parent = GuiPhrame


Tools1PageSection3Phrame = Instance.new("ScrollingFrame")
Tools1PageSection3Phrame.Size = UDim2.new(0.27, 0, 0.9, 0)
Tools1PageSection3Phrame.Position = UDim2.new(0.29, 0, 0.05, 0)
Tools1PageSection3Phrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Tools1PageSection3Phrame.BorderSizePixel = 1
Tools1PageSection3Phrame.Transparency = 0.2
Tools1PageSection3Phrame.CanvasSize = UDim2.new(0, 0, 3, 0)
Tools1PageSection3Phrame.Active = false
Tools1PageSection3Phrame.Selectable = true
Tools1PageSection3Phrame.Visible = false
Tools1PageSection3Phrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
Tools1PageSection3Phrame.ScrollBarThickness = 4
Tools1PageSection3Phrame.Parent = GuiPhrame

PlayerListFrame4 = Instance.new("Frame", Tools1PageSection1Phrame)
PlayerListFrame4.Name = "NotifyFrame4"
PlayerListFrame4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayerListFrame4.BackgroundTransparency = 1
PlayerListFrame4.BorderSizePixel = 0
PlayerListFrame4.Position = UDim2.new(0, 0, 0, 0)
PlayerListFrame4.Size = UDim2.new(0, 1, 0, 20)

PlayerListLabel4 = Instance.new("TextButton", PlayerListFrame4)
PlayerListLabel4.Name = "NotifyLabel5"
PlayerListLabel4.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
PlayerListLabel4.BackgroundTransparency = 1
PlayerListLabel4.BorderColor3 = Color3.fromRGB(110, 172, 216)
PlayerListLabel4.BorderSizePixel = 0
PlayerListLabel4.Size = UDim2.new(0, 160, 0, PlayerListFrame4.Size.Y.Offset)
PlayerListLabel4.Font = Enum.Font.SourceSans
PlayerListLabel4.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerListLabel4.TextSize = 20
PlayerListLabel4.Visible = false

local SpawningTabSelectedItem = ""
function CreatePlayerListsLabelP4(Text)
    for i, v in pairs(PlayerListFrame4:GetChildren()) do
		if v ~= PlayerListLabel4 then
			v.Position = UDim2.new(0, 0, 0, 20*(#PlayerListFrame4:GetChildren()-(i-1)))
		end
    end
    local F = PlayerListLabel4:Clone()
	F.Visible = true
    F.Parent = PlayerListFrame4
    F.Position = UDim2.new(0, 0, 0, 0)
    F.Text = Text
    if Time == nil then
        Time = 3
    end
    F.MouseButton1Click:Connect(function()
		F.TextColor3 = Color3.fromRGB(170, 170, 170)
		SpawningTabSelectedItem = F.Text
		if ShowFunctionAlerts then
			AnnounceBox("Item ".. F.Text .. " was selected!", "ITEM", 5, 255, 255, 255, 255, 255, 255)
		end
		wait(1)
		F.TextColor3 = Color3.fromRGB(255, 255, 255)
	end)
    spawn(function()
        for i, v in pairs(PlayerListFrame4:GetChildren()) do
			if v ~= PlayerListLabel4 then 
				v.Position = UDim2.new(0, 0, 0, 20*(#PlayerListFrame4:GetChildren()-(i)))
			end
        end
    end)
end

function ClearDisplay()
for i, v in pairs(PlayerListLabel4:GetChildren()) do
v:remove()
end
end

function ItemsDisplay(Specific)
ClearDisplay()
wait()
    for i, v in pairs(game.Lighting.LootDrops:GetChildren()) do
        if Specific == nil or string.match(string.lower(v.Name), string.lower(Specific)) then
            CreatePlayerListsLabelP4(tostring(v))
            --rconsoleprint("[!] " .. tostring(v) .. "\n")
        end
    end
end

ItemsDisplay()

Tools1Page2FeaturesSearch = Instance.new("TextBox")
Tools1Page2FeaturesSearch.Size = UDim2.new(0, 162, 0, 20)
Tools1Page2FeaturesSearch.Position = UDim2.new(-1.332, 0, 0.92, 0)
Tools1Page2FeaturesSearch.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Tools1Page2FeaturesSearch.BackgroundTransparency = 0.4
Tools1Page2FeaturesSearch.BorderSizePixel = 1
Tools1Page2FeaturesSearch.Text = "Search"
Tools1Page2FeaturesSearch.TextColor3 = Color3.fromRGB(255, 255, 255)
--Tools1Page2FeaturesAmount.TextScaled = true
Tools1Page2FeaturesSearch.TextSize = 8
Tools1Page2FeaturesSearch.TextWrapped = true
Tools1Page2FeaturesSearch.TextXAlignment = "Center"
Tools1Page2FeaturesSearch.Parent = Tools1PageSection2Phrame

Tools1Page2FeaturesSearch.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        ItemsDisplay(Tools1Page2FeaturesSearch.Text)
    end
end)

--setup players
PlayerListFrame3 = Instance.new("Frame", Tools1PageSection3Phrame)
PlayerListFrame3.Name = "NotifyFrame8"
PlayerListFrame3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayerListFrame3.BackgroundTransparency = 1
PlayerListFrame3.BorderSizePixel = 0
PlayerListFrame3.Position = UDim2.new(0, 0, 0, 0)
PlayerListFrame3.Size = UDim2.new(0, 1, 0, 20)

PlayerListLabel3 = Instance.new("TextButton", PlayerListFrame3)
PlayerListLabel3.Name = "NotifyLabel7"
PlayerListLabel3.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
PlayerListLabel3.BackgroundTransparency = 1
PlayerListLabel3.BorderColor3 = Color3.fromRGB(110, 172, 216)
PlayerListLabel3.BorderSizePixel = 0
PlayerListLabel3.Size = UDim2.new(0, 160, 0, PlayerListFrame3.Size.Y.Offset)
PlayerListLabel3.Font = Enum.Font.SourceSans
PlayerListLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerListLabel3.TextSize = 20
PlayerListLabel3.Visible = false

local SpawningTabSelectedPlayer = ""
function CreatePlayerListsLabelP3(Text, Time)
    for i, v in pairs(PlayerListFrame3:GetChildren()) do
		if v ~= PlayerListLabel3 then
			v.Position = UDim2.new(0, 0, 0, 20*(#PlayerListFrame3:GetChildren()-(i-1)))
		end
    end
    local F = PlayerListLabel3:Clone()
	F.Visible = true
    F.Parent = PlayerListFrame3
    F.Position = UDim2.new(0, 0, 0, 0)
    F.Text = Text
    if Time == nil then
        Time = 3
    end
    F.MouseButton1Click:Connect(function()
		F.TextColor3 = Color3.fromRGB(170, 170, 170)
		SpawningTabSelectedPlayer = F.Text
		if ShowFunctionAlerts then
			AnnounceBox("Player ".. F.Text .. " was selected!", "PLAYER", 5, 255, 255, 255, 255, 255, 255)
		end
		wait(1)
		F.TextColor3 = Color3.fromRGB(255, 255, 255)
	end)
    spawn(function()
        wait(Time)
        F:remove()
        for i, v in pairs(PlayerListFrame3:GetChildren()) do
			if v ~= PlayerListLabel3 then 
				v.Position = UDim2.new(0, 0, 0, 20*(#PlayerListFrame3:GetChildren()-(i)))
			end
        end
    end)
end
--setup players

--setup players	
spawn(function()
while wait(30) do
    for _, v in pairs(Players:GetPlayers()) do
    	--if v ~= Client then
    	CreatePlayerListsLabelP3(tostring(v), 30, 60, 160, 60)
    	--end
	end
  end
end)

for _, v in pairs(Players:GetPlayers()) do
    CreatePlayerListsLabelP3(tostring(v), 30, 60, 160, 60)
end
--setup players

Tools1Page2FeaturesSpawning = Instance.new("TextButton")
Tools1Page2FeaturesSpawning.Size = UDim2.new(0, 100, 0, 20)
Tools1Page2FeaturesSpawning.Position = UDim2.new(0.02, 0, 0.12, 0)
Tools1Page2FeaturesSpawning.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Tools1Page2FeaturesSpawning.BackgroundTransparency = 0.4
Tools1Page2FeaturesSpawning.BorderSizePixel = 1
Tools1Page2FeaturesSpawning.Text = "Spawn"
Tools1Page2FeaturesSpawning.TextColor3 = Color3.fromRGB(255, 255, 255)
Tools1Page2FeaturesSpawning.TextSize = 8
Tools1Page2FeaturesSpawning.TextXAlignment = "Center"
Tools1Page2FeaturesSpawning.Parent = Tools1PageSection2Phrame

Tools1Page2FeaturesSpawningImage = Instance.new("ImageLabel")
Tools1Page2FeaturesSpawningImage.Size = UDim2.new(0, 20, 0, 20)
Tools1Page2FeaturesSpawningImage.Position = UDim2.new(0.012, 0, 0.12, 0)
Tools1Page2FeaturesSpawningImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Tools1Page2FeaturesSpawningImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Tools1Page2FeaturesSpawningImage.BackgroundTransparency = 1
Tools1Page2FeaturesSpawningImage.BorderSizePixel = 0
Tools1Page2FeaturesSpawningImage.Visible = true
Tools1Page2FeaturesSpawningImage.Image = "rbxassetid://12900618433"
Tools1Page2FeaturesSpawningImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Tools1Page2FeaturesSpawningImage.Parent = Tools1PageSection2Phrame

Tools1Page2FeaturesSpawningItemAmount = Instance.new("TextBox")
Tools1Page2FeaturesSpawningItemAmount.Size = UDim2.new(0, 100, 0, 20)
Tools1Page2FeaturesSpawningItemAmount.Position = UDim2.new(0.02, 0, 0.02, 0)
Tools1Page2FeaturesSpawningItemAmount.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Tools1Page2FeaturesSpawningItemAmount.BackgroundTransparency = 0.4
Tools1Page2FeaturesSpawningItemAmount.BorderSizePixel = 1
Tools1Page2FeaturesSpawningItemAmount.Text = "Amount"
Tools1Page2FeaturesSpawningItemAmount.TextColor3 = Color3.fromRGB(255, 255, 255)
Tools1Page2FeaturesSpawningItemAmount.TextSize = 8
Tools1Page2FeaturesSpawningItemAmount.TextWrapped = true
Tools1Page2FeaturesSpawningItemAmount.TextXAlignment = "Center"
Tools1Page2FeaturesSpawningItemAmount.Parent = Tools1PageSection2Phrame

local ItemSpawningAmount = 1
Tools1Page2FeaturesSpawningItemAmount.FocusLost:Connect(function(enterPressed)
	local GetValue = tonumber(Tools1Page2FeaturesSpawningItemAmount.Text)
    if enterPressed then
		if GetValue then
			ItemSpawningAmount = GetValue
			AnnounceBox("Set item amount to " .. GetValue .. "!", "SCRIPT", 5, 255, 255, 255, 255, 255, 255)
		else
			AnnounceBox("Amount is invalid!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
		end
	end
end)

Tools1Page2FeaturesSpawning.MouseButton1Down:connect(function()
local LightS = game:GetService("Lighting")
local LootS = LightS.LootDrops
local LootSI = SpawningTabSelectedItem
local SPlayer = game.Players:FindFirstChild(SpawningTabSelectedPlayer)
local Amount = ItemSpawningAmount
    for i = 1, Amount do
        SpawnItem(LootS, Vector3.new(3, 2, 0), LootSI, SPlayer)
    end
end)
--frames



--frames
Scripts1PageSection2Phrame = Instance.new("Frame")
Scripts1PageSection2Phrame.Size = UDim2.new(0.9, 0, 0.9, 0)
Scripts1PageSection2Phrame.Position = UDim2.new(0.05, 0, 0.05, 0)
Scripts1PageSection2Phrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Scripts1PageSection2Phrame.BorderSizePixel = 1
Scripts1PageSection2Phrame.Transparency = 0.2
Scripts1PageSection2Phrame.Active = false
Scripts1PageSection2Phrame.Selectable = true
Scripts1PageSection2Phrame.Visible = false
Scripts1PageSection2Phrame.Parent = GuiPhrame

Scripts1Page2Features = Instance.new("TextButton")
Scripts1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Scripts1Page2Features.Position = UDim2.new(0.02, 0, 0.02, 0)
Scripts1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2Features.BackgroundTransparency = 0.4
Scripts1Page2Features.BorderSizePixel = 1
Scripts1Page2Features.Text = "Ventrix"
Scripts1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2Features.TextSize = 8
Scripts1Page2Features.TextXAlignment = "Center"
Scripts1Page2Features.Parent = Scripts1PageSection2Phrame

Scripts1Page2FeaturesImage = Instance.new("ImageLabel")
Scripts1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Scripts1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.012, 0)
Scripts1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2FeaturesImage.BackgroundTransparency = 1
Scripts1Page2FeaturesImage.BorderSizePixel = 0
Scripts1Page2FeaturesImage.Visible = true
Scripts1Page2FeaturesImage.Image = "rbxassetid://12900618433"
Scripts1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2FeaturesImage.Parent = Scripts1PageSection2Phrame

Scripts1Page2Features = Instance.new("TextButton")
Scripts1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Scripts1Page2Features.Position = UDim2.new(0.02, 0, 0.12, 0)
Scripts1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2Features.BackgroundTransparency = 0.4
Scripts1Page2Features.BorderSizePixel = 1
Scripts1Page2Features.Text = "SethMilkMan Gui"
Scripts1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2Features.TextSize = 8
Scripts1Page2Features.TextXAlignment = "Center"
Scripts1Page2Features.Parent = Scripts1PageSection2Phrame

Scripts1Page2FeaturesImage = Instance.new("ImageLabel")
Scripts1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Scripts1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.11, 0)
Scripts1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2FeaturesImage.BackgroundTransparency = 1
Scripts1Page2FeaturesImage.BorderSizePixel = 0
Scripts1Page2FeaturesImage.Visible = true
Scripts1Page2FeaturesImage.Image = "rbxassetid://12900618433"
Scripts1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2FeaturesImage.Parent = Scripts1PageSection2Phrame

Scripts1Page2Features = Instance.new("TextButton")
Scripts1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Scripts1Page2Features.Position = UDim2.new(0.02, 0, 0.22, 0)
Scripts1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2Features.BackgroundTransparency = 0.4
Scripts1Page2Features.BorderSizePixel = 1
Scripts1Page2Features.Text = "Neptunium v.n3"
Scripts1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2Features.TextSize = 8
Scripts1Page2Features.TextXAlignment = "Center"
Scripts1Page2Features.Parent = Scripts1PageSection2Phrame

Scripts1Page2FeaturesImage = Instance.new("ImageLabel")
Scripts1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Scripts1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.21, 0)
Scripts1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2FeaturesImage.BackgroundTransparency = 1
Scripts1Page2FeaturesImage.BorderSizePixel = 0
Scripts1Page2FeaturesImage.Visible = true
Scripts1Page2FeaturesImage.Image = "rbxassetid://12900618433"
Scripts1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2FeaturesImage.Parent = Scripts1PageSection2Phrame

Scripts1Page2Features = Instance.new("TextButton")
Scripts1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Scripts1Page2Features.Position = UDim2.new(0.02, 0, 0.32, 0)
Scripts1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2Features.BackgroundTransparency = 0.4
Scripts1Page2Features.BorderSizePixel = 1
Scripts1Page2Features.Text = "Old XR Hub"
Scripts1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2Features.TextSize = 8
Scripts1Page2Features.TextXAlignment = "Center"
Scripts1Page2Features.Parent = Scripts1PageSection2Phrame

Scripts1Page2FeaturesImage = Instance.new("ImageLabel")
Scripts1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Scripts1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.31, 0)
Scripts1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2FeaturesImage.BackgroundTransparency = 1
Scripts1Page2FeaturesImage.BorderSizePixel = 0
Scripts1Page2FeaturesImage.Visible = true
Scripts1Page2FeaturesImage.Image = "rbxassetid://12900618433"
Scripts1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2FeaturesImage.Parent = Scripts1PageSection2Phrame

Scripts1Page2Features = Instance.new("TextButton")
Scripts1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Scripts1Page2Features.Position = UDim2.new(0.02, 0, 0.42, 0)
Scripts1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2Features.BackgroundTransparency = 0.4
Scripts1Page2Features.BorderSizePixel = 1
Scripts1Page2Features.Text = "Older XR Hub"
Scripts1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2Features.TextSize = 8
Scripts1Page2Features.TextXAlignment = "Center"
Scripts1Page2Features.Parent = Scripts1PageSection2Phrame

Scripts1Page2FeaturesImage = Instance.new("ImageLabel")
Scripts1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Scripts1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.41, 0)
Scripts1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2FeaturesImage.BackgroundTransparency = 1
Scripts1Page2FeaturesImage.BorderSizePixel = 0
Scripts1Page2FeaturesImage.Visible = true
Scripts1Page2FeaturesImage.Image = "rbxassetid://12900618433"
Scripts1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2FeaturesImage.Parent = Scripts1PageSection2Phrame

Scripts1Page2Features = Instance.new("TextButton")
Scripts1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Scripts1Page2Features.Position = UDim2.new(0.02, 0, 0.52, 0)
Scripts1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2Features.BackgroundTransparency = 0.4
Scripts1Page2Features.BorderSizePixel = 1
Scripts1Page2Features.Text = "Lightning GUI"
Scripts1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2Features.TextSize = 8
Scripts1Page2Features.TextXAlignment = "Center"
Scripts1Page2Features.Parent = Scripts1PageSection2Phrame

Scripts1Page2FeaturesImage = Instance.new("ImageLabel")
Scripts1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Scripts1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.51, 0)
Scripts1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2FeaturesImage.BackgroundTransparency = 1
Scripts1Page2FeaturesImage.BorderSizePixel = 0
Scripts1Page2FeaturesImage.Visible = true
Scripts1Page2FeaturesImage.Image = "rbxassetid://12900618433"
Scripts1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2FeaturesImage.Parent = Scripts1PageSection2Phrame

Scripts1Page2Features = Instance.new("TextButton")
Scripts1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Scripts1Page2Features.Position = UDim2.new(0.02, 0, 0.62, 0)
Scripts1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2Features.BackgroundTransparency = 0.4
Scripts1Page2Features.BorderSizePixel = 1
Scripts1Page2Features.Text = "Inf Yield"
Scripts1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2Features.TextSize = 8
Scripts1Page2Features.TextXAlignment = "Center"
Scripts1Page2Features.Parent = Scripts1PageSection2Phrame

Scripts1Page2FeaturesImage = Instance.new("ImageLabel")
Scripts1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Scripts1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.61, 0)
Scripts1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2FeaturesImage.BackgroundTransparency = 1
Scripts1Page2FeaturesImage.BorderSizePixel = 0
Scripts1Page2FeaturesImage.Visible = true
Scripts1Page2FeaturesImage.Image = "rbxassetid://12900618433"
Scripts1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2FeaturesImage.Parent = Scripts1PageSection2Phrame

Scripts1Page2Features = Instance.new("TextButton")
Scripts1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Scripts1Page2Features.Position = UDim2.new(0.02, 0, 0.72, 0)
Scripts1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2Features.BackgroundTransparency = 0.4
Scripts1Page2Features.BorderSizePixel = 1
Scripts1Page2Features.Text = "Victini V2"
Scripts1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2Features.TextSize = 8
Scripts1Page2Features.TextXAlignment = "Center"
Scripts1Page2Features.Parent = Scripts1PageSection2Phrame

Scripts1Page2FeaturesImage = Instance.new("ImageLabel")
Scripts1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Scripts1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.71, 0)
Scripts1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2FeaturesImage.BackgroundTransparency = 1
Scripts1Page2FeaturesImage.BorderSizePixel = 0
Scripts1Page2FeaturesImage.Visible = true
Scripts1Page2FeaturesImage.Image = "rbxassetid://12900618433"
Scripts1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2FeaturesImage.Parent = Scripts1PageSection2Phrame

Scripts1Page2Features = Instance.new("TextButton")
Scripts1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Scripts1Page2Features.Position = UDim2.new(0.02, 0, 0.82, 0)
Scripts1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2Features.BackgroundTransparency = 0.4
Scripts1Page2Features.BorderSizePixel = 1
Scripts1Page2Features.Text = "Victini V1"
Scripts1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2Features.TextSize = 8
Scripts1Page2Features.TextXAlignment = "Center"
Scripts1Page2Features.Parent = Scripts1PageSection2Phrame

Scripts1Page2FeaturesImage = Instance.new("ImageLabel")
Scripts1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Scripts1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.81, 0)
Scripts1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2FeaturesImage.BackgroundTransparency = 1
Scripts1Page2FeaturesImage.BorderSizePixel = 0
Scripts1Page2FeaturesImage.Visible = true
Scripts1Page2FeaturesImage.Image = "rbxassetid://12900618433"
Scripts1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2FeaturesImage.Parent = Scripts1PageSection2Phrame

Scripts1Page2Features2 = Instance.new("TextButton")
Scripts1Page2Features2.Size = UDim2.new(0, 160, 0, 20)
Scripts1Page2Features2.Position = UDim2.new(0.35, 0, 0.02, 0)
Scripts1Page2Features2.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2Features2.BackgroundTransparency = 0.4
Scripts1Page2Features2.BorderSizePixel = 1
Scripts1Page2Features2.Text = "Impulse Hub"
Scripts1Page2Features2.TextColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2Features2.TextSize = 8
Scripts1Page2Features2.TextXAlignment = "Center"
Scripts1Page2Features2.Parent = Scripts1PageSection2Phrame

Scripts1Page2Features2Image = Instance.new("ImageLabel")
Scripts1Page2Features2Image.Size = UDim2.new(0, 20, 0, 20)
Scripts1Page2Features2Image.Position = UDim2.new(0.342, 0, 0.012, 0)
Scripts1Page2Features2Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2Features2Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2Features2Image.BackgroundTransparency = 1
Scripts1Page2Features2Image.BorderSizePixel = 0
Scripts1Page2Features2Image.Visible = true
Scripts1Page2Features2Image.Image = "rbxassetid://12900618433"
Scripts1Page2Features2Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2Features2Image.Parent = Scripts1PageSection2Phrame

Scripts1Page2Features2 = Instance.new("TextButton")
Scripts1Page2Features2.Size = UDim2.new(0, 160, 0, 20)
Scripts1Page2Features2.Position = UDim2.new(0.35, 0, 0.12, 0)
Scripts1Page2Features2.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2Features2.BackgroundTransparency = 0.4
Scripts1Page2Features2.BorderSizePixel = 1
Scripts1Page2Features2.Text = "Apoc Hub"
Scripts1Page2Features2.TextColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2Features2.TextSize = 8
Scripts1Page2Features2.TextXAlignment = "Center"
Scripts1Page2Features2.Parent = Scripts1PageSection2Phrame

Scripts1Page2Features2Image = Instance.new("ImageLabel")
Scripts1Page2Features2Image.Size = UDim2.new(0, 20, 0, 20)
Scripts1Page2Features2Image.Position = UDim2.new(0.342, 0, 0.11, 0)
Scripts1Page2Features2Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2Features2Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2Features2Image.BackgroundTransparency = 1
Scripts1Page2Features2Image.BorderSizePixel = 0
Scripts1Page2Features2Image.Visible = true
Scripts1Page2Features2Image.Image = "rbxassetid://12900618433"
Scripts1Page2Features2Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2Features2Image.Parent = Scripts1PageSection2Phrame

Scripts1Page2Features2 = Instance.new("TextButton")
Scripts1Page2Features2.Size = UDim2.new(0, 160, 0, 20)
Scripts1Page2Features2.Position = UDim2.new(0.35, 0, 0.22, 0)
Scripts1Page2Features2.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2Features2.BackgroundTransparency = 0.4
Scripts1Page2Features2.BorderSizePixel = 1
Scripts1Page2Features2.Text = "Random ESP"
Scripts1Page2Features2.TextColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2Features2.TextSize = 8
Scripts1Page2Features2.TextXAlignment = "Center"
Scripts1Page2Features2.Parent = Scripts1PageSection2Phrame

Scripts1Page2Features2Image = Instance.new("ImageLabel")
Scripts1Page2Features2Image.Size = UDim2.new(0, 20, 0, 20)
Scripts1Page2Features2Image.Position = UDim2.new(0.342, 0, 0.21, 0)
Scripts1Page2Features2Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Scripts1Page2Features2Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2Features2Image.BackgroundTransparency = 1
Scripts1Page2Features2Image.BorderSizePixel = 0
Scripts1Page2Features2Image.Visible = true
Scripts1Page2Features2Image.Image = "rbxassetid://12900618433"
Scripts1Page2Features2Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Scripts1Page2Features2Image.Parent = Scripts1PageSection2Phrame
--frames



--frames
Local1PageSection2Phrame = Instance.new("Frame")
Local1PageSection2Phrame.Size = UDim2.new(0.9, 0, 0.9, 0)
Local1PageSection2Phrame.Position = UDim2.new(0.05, 0, 0.05, 0)
Local1PageSection2Phrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Local1PageSection2Phrame.BorderSizePixel = 1
Local1PageSection2Phrame.Transparency = 0.2
Local1PageSection2Phrame.Active = false
Local1PageSection2Phrame.Selectable = true
Local1PageSection2Phrame.Visible = false
Local1PageSection2Phrame.Parent = GuiPhrame

Local1Page2FeaturesHungerAmount = Instance.new("TextBox")
Local1Page2FeaturesHungerAmount.Size = UDim2.new(0, 160, 0, 20)
Local1Page2FeaturesHungerAmount.Position = UDim2.new(0.02, 0, 0.02, 0)
Local1Page2FeaturesHungerAmount.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2FeaturesHungerAmount.BackgroundTransparency = 0.4
Local1Page2FeaturesHungerAmount.BorderSizePixel = 1
Local1Page2FeaturesHungerAmount.Text = "Hunger"
Local1Page2FeaturesHungerAmount.TextColor3 = Color3.fromRGB(255, 255, 255)
--Local1Page2FeaturesHungerAmount.TextScaled = true
Local1Page2FeaturesHungerAmount.TextSize = 8
Local1Page2FeaturesHungerAmount.TextWrapped = true
Local1Page2FeaturesHungerAmount.TextXAlignment = "Center"
Local1Page2FeaturesHungerAmount.Parent = Local1PageSection2Phrame

Local1Page2FeaturesHungerAmount.FocusLost:Connect(function(enterPressed)
	local GetValue = tonumber(Local1Page2FeaturesHungerAmount.Text)
    if enterPressed then
		if GetValue then
			AnnounceBox("Set hunger to " .. GetValue .. "!", "HUNGER", 5, 255, 255, 255, 255, 255, 255)
			Vitals(LocalPlayer, 4, GetValue)
		else
			AnnounceBox("Amount is invalid!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
		end
	end
end)

Local1Page2FeaturesThirstAmount = Instance.new("TextBox")
Local1Page2FeaturesThirstAmount.Size = UDim2.new(0, 160, 0, 20)
Local1Page2FeaturesThirstAmount.Position = UDim2.new(0.02, 0, 0.12, 0)
Local1Page2FeaturesThirstAmount.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2FeaturesThirstAmount.BackgroundTransparency = 0.4
Local1Page2FeaturesThirstAmount.BorderSizePixel = 1
Local1Page2FeaturesThirstAmount.Text = "Thirst"
Local1Page2FeaturesThirstAmount.TextColor3 = Color3.fromRGB(255, 255, 255)
--Local1Page2FeaturesThirstAmount.TextScaled = true
Local1Page2FeaturesThirstAmount.TextSize = 8
Local1Page2FeaturesThirstAmount.TextWrapped = true
Local1Page2FeaturesThirstAmount.TextXAlignment = "Center"
Local1Page2FeaturesThirstAmount.Parent = Local1PageSection2Phrame

Local1Page2FeaturesThirstAmount.FocusLost:Connect(function(enterPressed)
	local GetValue = tonumber(Local1Page2FeaturesThirstAmount.Text)
    if enterPressed then
		if GetValue then
			AnnounceBox("Set thirst to " .. GetValue .. "!", "THIRST", 5, 255, 255, 255, 255, 255, 255)
			Vitals(LocalPlayer, 5, GetValue)
		else
			AnnounceBox("Amount is invalid!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
		end
	end
end)

Local1Page2Features = Instance.new("TextButton")
Local1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Local1Page2Features.Position = UDim2.new(0.02, 0, 0.22, 0)
Local1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features.BackgroundTransparency = 0.4
Local1Page2Features.BorderSizePixel = 1
Local1Page2Features.Text = "Road-Flare Walk"
Local1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features.TextSize = 8
Local1Page2Features.TextXAlignment = "Center"
Local1Page2Features.Parent = Local1PageSection2Phrame

Local1Page2FeaturesImage = Instance.new("ImageLabel")
Local1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Local1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.21, 0)
Local1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2FeaturesImage.BackgroundTransparency = 1
Local1Page2FeaturesImage.BorderSizePixel = 0
Local1Page2FeaturesImage.Visible = true
Local1Page2FeaturesImage.Image = "rbxassetid://12900618433"
Local1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2FeaturesImage.Parent = Local1PageSection2Phrame

Local1Page2Features = Instance.new("TextButton")
Local1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Local1Page2Features.Position = UDim2.new(0.02, 0, 0.32, 0)
Local1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features.BackgroundTransparency = 0.4
Local1Page2Features.BorderSizePixel = 1
Local1Page2Features.Text = "TM46 Walk"
Local1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features.TextSize = 8
Local1Page2Features.TextXAlignment = "Center"
Local1Page2Features.Parent = Local1PageSection2Phrame

Local1Page2FeaturesImage = Instance.new("ImageLabel")
Local1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Local1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.31, 0)
Local1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2FeaturesImage.BackgroundTransparency = 1
Local1Page2FeaturesImage.BorderSizePixel = 0
Local1Page2FeaturesImage.Visible = true
Local1Page2FeaturesImage.Image = "rbxassetid://12900618433"
Local1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2FeaturesImage.Parent = Local1PageSection2Phrame

Local1Page2Features = Instance.new("TextButton")
Local1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Local1Page2Features.Position = UDim2.new(0.02, 0, 0.42, 0)
Local1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features.BackgroundTransparency = 0.4
Local1Page2Features.BorderSizePixel = 1
Local1Page2Features.Text = "VS50 Walk"
Local1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features.TextSize = 8
Local1Page2Features.TextXAlignment = "Center"
Local1Page2Features.Parent = Local1PageSection2Phrame

Local1Page2FeaturesImage = Instance.new("ImageLabel")
Local1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Local1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.41, 0)
Local1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2FeaturesImage.BackgroundTransparency = 1
Local1Page2FeaturesImage.BorderSizePixel = 0
Local1Page2FeaturesImage.Visible = true
Local1Page2FeaturesImage.Image = "rbxassetid://12900618433"
Local1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2FeaturesImage.Parent = Local1PageSection2Phrame

Local1Page2Features = Instance.new("TextButton")
Local1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Local1Page2Features.Position = UDim2.new(0.02, 0, 0.52, 0)
Local1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features.BackgroundTransparency = 0.4
Local1Page2Features.BorderSizePixel = 1
Local1Page2Features.Text = "C4 Walk"
Local1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features.TextSize = 8
Local1Page2Features.TextXAlignment = "Center"
Local1Page2Features.Parent = Local1PageSection2Phrame

Local1Page2FeaturesImage = Instance.new("ImageLabel")
Local1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Local1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.51, 0)
Local1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2FeaturesImage.BackgroundTransparency = 1
Local1Page2FeaturesImage.BorderSizePixel = 0
Local1Page2FeaturesImage.Visible = true
Local1Page2FeaturesImage.Image = "rbxassetid://12900618433"
Local1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2FeaturesImage.Parent = Local1PageSection2Phrame

Local1Page2Features = Instance.new("TextButton")
Local1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Local1Page2Features.Position = UDim2.new(0.02, 0, 0.62, 0)
Local1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features.BackgroundTransparency = 0.4
Local1Page2Features.BorderSizePixel = 1
Local1Page2Features.Text = "Cow Walk #right-click"
Local1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features.TextSize = 8
Local1Page2Features.TextXAlignment = "Center"
Local1Page2Features.Parent = Local1PageSection2Phrame

Local1Page2FeaturesImage = Instance.new("ImageLabel")
Local1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Local1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.61, 0)
Local1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2FeaturesImage.BackgroundTransparency = 1
Local1Page2FeaturesImage.BorderSizePixel = 0
Local1Page2FeaturesImage.Visible = true
Local1Page2FeaturesImage.Image = "rbxassetid://12900618433"
Local1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2FeaturesImage.Parent = Local1PageSection2Phrame

Local1Page2Features = Instance.new("TextButton")
Local1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Local1Page2Features.Position = UDim2.new(0.02, 0, 0.72, 0)
Local1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features.BackgroundTransparency = 0.4
Local1Page2Features.BorderSizePixel = 1
Local1Page2Features.Text = "Clean Cows"
Local1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features.TextSize = 8
Local1Page2Features.TextXAlignment = "Center"
Local1Page2Features.Parent = Local1PageSection2Phrame

Local1Page2FeaturesImage = Instance.new("ImageLabel")
Local1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Local1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.71, 0)
Local1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2FeaturesImage.BackgroundTransparency = 1
Local1Page2FeaturesImage.BorderSizePixel = 0
Local1Page2FeaturesImage.Visible = true
Local1Page2FeaturesImage.Image = "rbxassetid://12900618433"
Local1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2FeaturesImage.Parent = Local1PageSection2Phrame

Local1Page2Features2 = Instance.new("TextButton")
Local1Page2Features2.Size = UDim2.new(0, 160, 0, 20)
Local1Page2Features2.Position = UDim2.new(0.35, 0, 0.02, 0)
Local1Page2Features2.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features2.BackgroundTransparency = 0.4
Local1Page2Features2.BorderSizePixel = 1
Local1Page2Features2.Text = "No Fall Damage"
Local1Page2Features2.TextColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features2.TextSize = 8
Local1Page2Features2.TextXAlignment = "Center"
Local1Page2Features2.Parent = Local1PageSection2Phrame

Local1Page2Features2Image = Instance.new("ImageLabel")
Local1Page2Features2Image.Size = UDim2.new(0, 20, 0, 20)
Local1Page2Features2Image.Position = UDim2.new(0.342, 0, 0.012, 0)
Local1Page2Features2Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features2Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features2Image.BackgroundTransparency = 1
Local1Page2Features2Image.BorderSizePixel = 0
Local1Page2Features2Image.Visible = true
Local1Page2Features2Image.Image = "rbxassetid://12900618433"
Local1Page2Features2Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features2Image.Parent = Local1PageSection2Phrame

Local1Page2Features2 = Instance.new("TextButton")
Local1Page2Features2.Size = UDim2.new(0, 160, 0, 20)
Local1Page2Features2.Position = UDim2.new(0.35, 0, 0.12, 0)
Local1Page2Features2.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features2.BackgroundTransparency = 0.4
Local1Page2Features2.BorderSizePixel = 1
Local1Page2Features2.Text = "Heal God"
Local1Page2Features2.TextColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features2.TextSize = 8
Local1Page2Features2.TextXAlignment = "Center"
Local1Page2Features2.Parent = Local1PageSection2Phrame

Local1Page2Features2Image = Instance.new("ImageLabel")
Local1Page2Features2Image.Size = UDim2.new(0, 20, 0, 20)
Local1Page2Features2Image.Position = UDim2.new(0.342, 0, 0.11, 0)
Local1Page2Features2Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features2Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features2Image.BackgroundTransparency = 1
Local1Page2Features2Image.BorderSizePixel = 0
Local1Page2Features2Image.Visible = true
Local1Page2Features2Image.Image = "rbxassetid://12900618433"
Local1Page2Features2Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features2Image.Parent = Local1PageSection2Phrame

Local1Page2Features2 = Instance.new("TextButton")
Local1Page2Features2.Size = UDim2.new(0, 160, 0, 20)
Local1Page2Features2.Position = UDim2.new(0.35, 0, 0.22, 0)
Local1Page2Features2.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features2.BackgroundTransparency = 0.4
Local1Page2Features2.BorderSizePixel = 1
Local1Page2Features2.Text = "PK-God"
Local1Page2Features2.TextColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features2.TextSize = 8
Local1Page2Features2.TextXAlignment = "Center"
Local1Page2Features2.Parent = Local1PageSection2Phrame

Local1Page2Features2Image = Instance.new("ImageLabel")
Local1Page2Features2Image.Size = UDim2.new(0, 20, 0, 20)
Local1Page2Features2Image.Position = UDim2.new(0.342, 0, 0.21, 0)
Local1Page2Features2Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features2Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features2Image.BackgroundTransparency = 1
Local1Page2Features2Image.BorderSizePixel = 0
Local1Page2Features2Image.Visible = true
Local1Page2Features2Image.Image = "rbxassetid://12900618433"
Local1Page2Features2Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features2Image.Parent = Local1PageSection2Phrame

Local1Page2Features2 = Instance.new("TextButton")
Local1Page2Features2.Size = UDim2.new(0, 160, 0, 20)
Local1Page2Features2.Position = UDim2.new(0.35, 0, 0.32, 0)
Local1Page2Features2.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features2.BackgroundTransparency = 0.4
Local1Page2Features2.BorderSizePixel = 1
Local1Page2Features2.Text = "Heal"
Local1Page2Features2.TextColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features2.TextSize = 8
Local1Page2Features2.TextXAlignment = "Center"
Local1Page2Features2.Parent = Local1PageSection2Phrame

Local1Page2Features2Image = Instance.new("ImageLabel")
Local1Page2Features2Image.Size = UDim2.new(0, 20, 0, 20)
Local1Page2Features2Image.Position = UDim2.new(0.342, 0, 0.31, 0)
Local1Page2Features2Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features2Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features2Image.BackgroundTransparency = 1
Local1Page2Features2Image.BorderSizePixel = 0
Local1Page2Features2Image.Visible = true
Local1Page2Features2Image.Image = "rbxassetid://12900618433"
Local1Page2Features2Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features2Image.Parent = Local1PageSection2Phrame

Local1Page2Features2 = Instance.new("TextButton")
Local1Page2Features2.Size = UDim2.new(0, 160, 0, 20)
Local1Page2Features2.Position = UDim2.new(0.35, 0, 0.42, 0)
Local1Page2Features2.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features2.BackgroundTransparency = 0.4
Local1Page2Features2.BorderSizePixel = 1
Local1Page2Features2.Text = "Inf Vitals"
Local1Page2Features2.TextColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features2.TextSize = 8
Local1Page2Features2.TextXAlignment = "Center"
Local1Page2Features2.Parent = Local1PageSection2Phrame

Local1Page2Features2Image = Instance.new("ImageLabel")
Local1Page2Features2Image.Size = UDim2.new(0, 20, 0, 20)
Local1Page2Features2Image.Position = UDim2.new(0.342, 0, 0.41, 0)
Local1Page2Features2Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features2Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features2Image.BackgroundTransparency = 1
Local1Page2Features2Image.BorderSizePixel = 0
Local1Page2Features2Image.Visible = true
Local1Page2Features2Image.Image = "rbxassetid://12900618433"
Local1Page2Features2Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features2Image.Parent = Local1PageSection2Phrame

Local1Page2Features2 = Instance.new("TextButton")
Local1Page2Features2.Size = UDim2.new(0, 160, 0, 20)
Local1Page2Features2.Position = UDim2.new(0.35, 0, 0.52, 0)
Local1Page2Features2.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features2.BackgroundTransparency = 0.4
Local1Page2Features2.BorderSizePixel = 1
Local1Page2Features2.Text = "Inf Stamina"
Local1Page2Features2.TextColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features2.TextSize = 8
Local1Page2Features2.TextXAlignment = "Center"
Local1Page2Features2.Parent = Local1PageSection2Phrame

Local1Page2Features2Image = Instance.new("ImageLabel")
Local1Page2Features2Image.Size = UDim2.new(0, 20, 0, 20)
Local1Page2Features2Image.Position = UDim2.new(0.342, 0, 0.51, 0)
Local1Page2Features2Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features2Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features2Image.BackgroundTransparency = 1
Local1Page2Features2Image.BorderSizePixel = 0
Local1Page2Features2Image.Visible = true
Local1Page2Features2Image.Image = "rbxassetid://12900618433"
Local1Page2Features2Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features2Image.Parent = Local1PageSection2Phrame

Local1Page2Features3 = Instance.new("TextButton")
Local1Page2Features3.Size = UDim2.new(0, 160, 0, 20)
Local1Page2Features3.Position = UDim2.new(0.682, 0, 0.02, 0)
Local1Page2Features3.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features3.BackgroundTransparency = 0.4
Local1Page2Features3.BorderSizePixel = 1
Local1Page2Features3.Text = "No Fog"
Local1Page2Features3.TextColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features3.TextSize = 8
Local1Page2Features3.TextXAlignment = "Center"
Local1Page2Features3.Parent = Local1PageSection2Phrame

Local1Page2Features3Image = Instance.new("ImageLabel")
Local1Page2Features3Image.Size = UDim2.new(0, 20, 0, 20)
Local1Page2Features3Image.Position = UDim2.new(0.674, 0, 0.012, 0)
Local1Page2Features3Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features3Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features3Image.BackgroundTransparency = 1
Local1Page2Features3Image.BorderSizePixel = 0
Local1Page2Features3Image.Visible = true
Local1Page2Features3Image.Image = "rbxassetid://12900618433"
Local1Page2Features3Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features3Image.Parent = Local1PageSection2Phrame

Local1Page2Features3 = Instance.new("TextButton")
Local1Page2Features3.Size = UDim2.new(0, 160, 0, 20)
Local1Page2Features3.Position = UDim2.new(0.682, 0, 0.12, 0)
Local1Page2Features3.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features3.BackgroundTransparency = 0.4
Local1Page2Features3.BorderSizePixel = 1
Local1Page2Features3.Text = "No-Clip"
Local1Page2Features3.TextColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features3.TextSize = 8
Local1Page2Features3.TextXAlignment = "Center"
Local1Page2Features3.Parent = Local1PageSection2Phrame

Local1Page2Features3Image = Instance.new("ImageLabel")
Local1Page2Features3Image.Size = UDim2.new(0, 20, 0, 20)
Local1Page2Features3Image.Position = UDim2.new(0.674, 0, 0.11, 0)
Local1Page2Features3Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features3Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features3Image.BackgroundTransparency = 1
Local1Page2Features3Image.BorderSizePixel = 0
Local1Page2Features3Image.Visible = true
Local1Page2Features3Image.Image = "rbxassetid://12900618433"
Local1Page2Features3Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features3Image.Parent = Local1PageSection2Phrame

Local1Page2Features3 = Instance.new("TextButton")
Local1Page2Features3.Size = UDim2.new(0, 160, 0, 20)
Local1Page2Features3.Position = UDim2.new(0.682, 0, 0.22, 0)
Local1Page2Features3.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features3.BackgroundTransparency = 0.4
Local1Page2Features3.BorderSizePixel = 1
Local1Page2Features3.Text = "Boost (0s)"
Local1Page2Features3.TextColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features3.TextSize = 8
Local1Page2Features3.TextXAlignment = "Center"
Local1Page2Features3.Parent = Local1PageSection2Phrame

Local1Page2Features3Image = Instance.new("ImageLabel")
Local1Page2Features3Image.Size = UDim2.new(0, 20, 0, 20)
Local1Page2Features3Image.Position = UDim2.new(0.674, 0, 0.21, 0)
Local1Page2Features3Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features3Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features3Image.BackgroundTransparency = 1
Local1Page2Features3Image.BorderSizePixel = 0
Local1Page2Features3Image.Visible = true
Local1Page2Features3Image.Image = "rbxassetid://12900618433"
Local1Page2Features3Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features3Image.Parent = Local1PageSection2Phrame

Local1Page2Features3 = Instance.new("TextButton")
Local1Page2Features3.Size = UDim2.new(0, 160, 0, 20)
Local1Page2Features3.Position = UDim2.new(0.682, 0, 0.32, 0)
Local1Page2Features3.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features3.BackgroundTransparency = 0.4
Local1Page2Features3.BorderSizePixel = 1
Local1Page2Features3.Text = "TP Crates"
Local1Page2Features3.TextColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features3.TextSize = 8
Local1Page2Features3.TextXAlignment = "Center"
Local1Page2Features3.Parent = Local1PageSection2Phrame

Local1Page2Features3Image = Instance.new("ImageLabel")
Local1Page2Features3Image.Size = UDim2.new(0, 20, 0, 20)
Local1Page2Features3Image.Position = UDim2.new(0.674, 0, 0.31, 0)
Local1Page2Features3Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features3Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features3Image.BackgroundTransparency = 1
Local1Page2Features3Image.BorderSizePixel = 0
Local1Page2Features3Image.Visible = true
Local1Page2Features3Image.Image = "rbxassetid://12900618433"
Local1Page2Features3Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features3Image.Parent = Local1PageSection2Phrame

Local1Page2Features3 = Instance.new("TextButton")
Local1Page2Features3.Size = UDim2.new(0, 160, 0, 20)
Local1Page2Features3.Position = UDim2.new(0.682, 0, 0.42, 0)
Local1Page2Features3.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features3.BackgroundTransparency = 0.4
Local1Page2Features3.BorderSizePixel = 1
Local1Page2Features3.Text = "TP Bodies"
Local1Page2Features3.TextColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features3.TextSize = 8
Local1Page2Features3.TextXAlignment = "Center"
Local1Page2Features3.Parent = Local1PageSection2Phrame

Local1Page2Features3Image = Instance.new("ImageLabel")
Local1Page2Features3Image.Size = UDim2.new(0, 20, 0, 20)
Local1Page2Features3Image.Position = UDim2.new(0.674, 0, 0.41, 0)
Local1Page2Features3Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features3Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features3Image.BackgroundTransparency = 1
Local1Page2Features3Image.BorderSizePixel = 0
Local1Page2Features3Image.Visible = true
Local1Page2Features3Image.Image = "rbxassetid://12900618433"
Local1Page2Features3Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features3Image.Parent = Local1PageSection2Phrame

Local1Page2Features3 = Instance.new("TextButton")
Local1Page2Features3.Size = UDim2.new(0, 160, 0, 20)
Local1Page2Features3.Position = UDim2.new(0.682, 0, 0.52, 0)
Local1Page2Features3.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features3.BackgroundTransparency = 0.4
Local1Page2Features3.BorderSizePixel = 1
Local1Page2Features3.Text = "TP Crates"
Local1Page2Features3.TextColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features3.TextSize = 8
Local1Page2Features3.TextXAlignment = "Center"
Local1Page2Features3.Parent = Local1PageSection2Phrame

Local1Page2Features3Image = Instance.new("ImageLabel")
Local1Page2Features3Image.Size = UDim2.new(0, 20, 0, 20)
Local1Page2Features3Image.Position = UDim2.new(0.674, 0, 0.51, 0)
Local1Page2Features3Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Local1Page2Features3Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features3Image.BackgroundTransparency = 1
Local1Page2Features3Image.BorderSizePixel = 0
Local1Page2Features3Image.Visible = true
Local1Page2Features3Image.Image = "rbxassetid://12900618433"
Local1Page2Features3Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Local1Page2Features3Image.Parent = Local1PageSection2Phrame
--frames



--frames
Server1PageSection2Phrame = Instance.new("Frame")
Server1PageSection2Phrame.Size = UDim2.new(0.9, 0, 0.9, 0)
Server1PageSection2Phrame.Position = UDim2.new(0.05, 0, 0.05, 0)
Server1PageSection2Phrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Server1PageSection2Phrame.BorderSizePixel = 1
Server1PageSection2Phrame.Transparency = 0.2
Server1PageSection2Phrame.Active = false
Server1PageSection2Phrame.Selectable = true
Server1PageSection2Phrame.Visible = false
Server1PageSection2Phrame.Parent = GuiPhrame

Server1Page2Features = Instance.new("TextButton")
Server1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Server1Page2Features.Position = UDim2.new(0.02, 0, 0.02, 0)
Server1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features.BackgroundTransparency = 0.4
Server1Page2Features.BorderSizePixel = 1
Server1Page2Features.Text = "Bring Zombies"
Server1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features.TextSize = 8
Server1Page2Features.TextXAlignment = "Center"
Server1Page2Features.Parent = Server1PageSection2Phrame

Server1Page2FeaturesImage = Instance.new("ImageLabel")
Server1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Server1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.012, 0)
Server1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2FeaturesImage.BackgroundTransparency = 1
Server1Page2FeaturesImage.BorderSizePixel = 0
Server1Page2FeaturesImage.Visible = true
Server1Page2FeaturesImage.Image = "rbxassetid://12900618433"
Server1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2FeaturesImage.Parent = Server1PageSection2Phrame

Server1Page2Features = Instance.new("TextButton")
Server1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Server1Page2Features.Position = UDim2.new(0.02, 0, 0.12, 0)
Server1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features.BackgroundTransparency = 0.4
Server1Page2Features.BorderSizePixel = 1
Server1Page2Features.Text = "Kill Zombies"
Server1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features.TextSize = 8
Server1Page2Features.TextXAlignment = "Center"
Server1Page2Features.Parent = Server1PageSection2Phrame

Server1Page2FeaturesImage = Instance.new("ImageLabel")
Server1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Server1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.11, 0)
Server1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2FeaturesImage.BackgroundTransparency = 1
Server1Page2FeaturesImage.BorderSizePixel = 0
Server1Page2FeaturesImage.Visible = true
Server1Page2FeaturesImage.Image = "rbxassetid://12900618433"
Server1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2FeaturesImage.Parent = Server1PageSection2Phrame

Server1Page2Features = Instance.new("TextButton")
Server1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Server1Page2Features.Position = UDim2.new(0.02, 0, 0.22, 0)
Server1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features.BackgroundTransparency = 0.4
Server1Page2Features.BorderSizePixel = 1
Server1Page2Features.Text = "No Loot"
Server1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features.TextSize = 8
Server1Page2Features.TextXAlignment = "Center"
Server1Page2Features.Parent = Server1PageSection2Phrame

Server1Page2FeaturesImage = Instance.new("ImageLabel")
Server1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Server1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.21, 0)
Server1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2FeaturesImage.BackgroundTransparency = 1
Server1Page2FeaturesImage.BorderSizePixel = 0
Server1Page2FeaturesImage.Visible = true
Server1Page2FeaturesImage.Image = "rbxassetid://12900618433"
Server1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2FeaturesImage.Parent = Server1PageSection2Phrame

Server1Page2Features2CleanLoot = Instance.new("TextButton")
Server1Page2Features2CleanLoot.Size = UDim2.new(0, 160, 0, 20)
Server1Page2Features2CleanLoot.Position = UDim2.new(0.35, 0, 0.02, 0)
Server1Page2Features2CleanLoot.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features2CleanLoot.BackgroundTransparency = 0.4
Server1Page2Features2CleanLoot.BorderSizePixel = 1
Server1Page2Features2CleanLoot.Text = "Clean Loot"
Server1Page2Features2CleanLoot.TextColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2CleanLoot.TextSize = 8
Server1Page2Features2CleanLoot.TextXAlignment = "Center"
Server1Page2Features2CleanLoot.Parent = Server1PageSection2Phrame

Server1Page2Features2CleanLootImage = Instance.new("ImageLabel")
Server1Page2Features2CleanLootImage.Size = UDim2.new(0, 20, 0, 20)
Server1Page2Features2CleanLootImage.Position = UDim2.new(0.342, 0, 0.012, 0)
Server1Page2Features2CleanLootImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features2CleanLootImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2CleanLootImage.BackgroundTransparency = 1
Server1Page2Features2CleanLootImage.BorderSizePixel = 0
Server1Page2Features2CleanLootImage.Visible = true
Server1Page2Features2CleanLootImage.Image = "rbxassetid://12900618433"
Server1Page2Features2CleanLootImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2CleanLootImage.Parent = Server1PageSection2Phrame

Server1Page2Features2CleanLoot.MouseButton1Click:Connect(function()
	AnnounceBox("Cleaning loot please wait!", "CLEAN LOOT", 5, 60, 160, 60, 255, 255, 255)
	CleanLoot()
end)

Server1Page2Features2CleanGarbage = Instance.new("TextButton")
Server1Page2Features2CleanGarbage.Size = UDim2.new(0, 160, 0, 20)
Server1Page2Features2CleanGarbage.Position = UDim2.new(0.35, 0, 0.12, 0)
Server1Page2Features2CleanGarbage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features2CleanGarbage.BackgroundTransparency = 0.4
Server1Page2Features2CleanGarbage.BorderSizePixel = 1
Server1Page2Features2CleanGarbage.Text = "Clean Garbage"
Server1Page2Features2CleanGarbage.TextColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2CleanGarbage.TextSize = 8
Server1Page2Features2CleanGarbage.TextXAlignment = "Center"
Server1Page2Features2CleanGarbage.Parent = Server1PageSection2Phrame

Server1Page2Features2CleanGarbageImage = Instance.new("ImageLabel")
Server1Page2Features2CleanGarbageImage.Size = UDim2.new(0, 20, 0, 20)
Server1Page2Features2CleanGarbageImage.Position = UDim2.new(0.342, 0, 0.11, 0)
Server1Page2Features2CleanGarbageImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features2CleanGarbageImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2CleanGarbageImage.BackgroundTransparency = 1
Server1Page2Features2CleanGarbageImage.BorderSizePixel = 0
Server1Page2Features2CleanGarbageImage.Visible = true
Server1Page2Features2CleanGarbageImage.Image = "rbxassetid://12900618433"
Server1Page2Features2CleanGarbageImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2CleanGarbageImage.Parent = Server1PageSection2Phrame

Server1Page2Features2CleanGarbage.MouseButton1Click:Connect(function()
	AnnounceBox("Cleaning garbage please wait!", "CLEAN GARBAGE", 5, 60, 160, 60, 255, 255, 255)
	CleanGarbage()
end)

Server1Page2Features2CleanVehicles = Instance.new("TextButton")
Server1Page2Features2CleanVehicles.Size = UDim2.new(0, 160, 0, 20)
Server1Page2Features2CleanVehicles.Position = UDim2.new(0.35, 0, 0.22, 0)
Server1Page2Features2CleanVehicles.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features2CleanVehicles.BackgroundTransparency = 0.4
Server1Page2Features2CleanVehicles.BorderSizePixel = 1
Server1Page2Features2CleanVehicles.Text = "Clean Vehicles"
Server1Page2Features2CleanVehicles.TextColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2CleanVehicles.TextSize = 8
Server1Page2Features2CleanVehicles.TextXAlignment = "Center"
Server1Page2Features2CleanVehicles.Parent = Server1PageSection2Phrame

Server1Page2Features2CleanVehiclesImage = Instance.new("ImageLabel")
Server1Page2Features2CleanVehiclesImage.Size = UDim2.new(0, 20, 0, 20)
Server1Page2Features2CleanVehiclesImage.Position = UDim2.new(0.342, 0, 0.21, 0)
Server1Page2Features2CleanVehiclesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features2CleanVehiclesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2CleanVehiclesImage.BackgroundTransparency = 1
Server1Page2Features2CleanVehiclesImage.BorderSizePixel = 0
Server1Page2Features2CleanVehiclesImage.Visible = true
Server1Page2Features2CleanVehiclesImage.Image = "rbxassetid://12900618433"
Server1Page2Features2CleanVehiclesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2CleanVehiclesImage.Parent = Server1PageSection2Phrame

Server1Page2Features2CleanVehicles.MouseButton1Click:Connect(function()
	AnnounceBox("Cleaning vehicles please wait!", "CLEAN VEHICLES", 5, 60, 160, 60, 255, 255, 255)
	CleanVehicles()
end)

Server1Page2Features2CleanParts = Instance.new("TextButton")
Server1Page2Features2CleanParts.Size = UDim2.new(0, 160, 0, 20)
Server1Page2Features2CleanParts.Position = UDim2.new(0.35, 0, 0.32, 0)
Server1Page2Features2CleanParts.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features2CleanParts.BackgroundTransparency = 0.4
Server1Page2Features2CleanParts.BorderSizePixel = 1
Server1Page2Features2CleanParts.Text = "Clean Parts"
Server1Page2Features2CleanParts.TextColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2CleanParts.TextSize = 8
Server1Page2Features2CleanParts.TextXAlignment = "Center"
Server1Page2Features2CleanParts.Parent = Server1PageSection2Phrame

Server1Page2Features2CleanPartsImage = Instance.new("ImageLabel")
Server1Page2Features2CleanPartsImage.Size = UDim2.new(0, 20, 0, 20)
Server1Page2Features2CleanPartsImage.Position = UDim2.new(0.342, 0, 0.31, 0)
Server1Page2Features2CleanPartsImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features2CleanPartsImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2CleanPartsImage.BackgroundTransparency = 1
Server1Page2Features2CleanPartsImage.BorderSizePixel = 0
Server1Page2Features2CleanPartsImage.Visible = true
Server1Page2Features2CleanPartsImage.Image = "rbxassetid://12900618433"
Server1Page2Features2CleanPartsImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2CleanPartsImage.Parent = Server1PageSection2Phrame

Server1Page2Features2CleanParts.MouseButton1Click:Connect(function()
	AnnounceBox("Cleaning parts please wait!", "CLEAN PARTS", 5, 60, 160, 60, 255, 255, 255)
	CleanParts()
end)

Server1Page2Features2CleanCows = Instance.new("TextButton")
Server1Page2Features2CleanCows.Size = UDim2.new(0, 160, 0, 20)
Server1Page2Features2CleanCows.Position = UDim2.new(0.35, 0, 0.42, 0)
Server1Page2Features2CleanCows.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features2CleanCows.BackgroundTransparency = 0.4
Server1Page2Features2CleanCows.BorderSizePixel = 1
Server1Page2Features2CleanCows.Text = "Clean Cows"
Server1Page2Features2CleanCows.TextColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2CleanCows.TextSize = 8
Server1Page2Features2CleanCows.TextXAlignment = "Center"
Server1Page2Features2CleanCows.Parent = Server1PageSection2Phrame

Server1Page2Features2CleanCowsImage = Instance.new("ImageLabel")
Server1Page2Features2CleanCowsImage.Size = UDim2.new(0, 20, 0, 20)
Server1Page2Features2CleanCowsImage.Position = UDim2.new(0.342, 0, 0.41, 0)
Server1Page2Features2CleanCowsImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features2CleanCowsImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2CleanCowsImage.BackgroundTransparency = 1
Server1Page2Features2CleanCowsImage.BorderSizePixel = 0
Server1Page2Features2CleanCowsImage.Visible = true
Server1Page2Features2CleanCowsImage.Image = "rbxassetid://12900618433"
Server1Page2Features2CleanCowsImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2CleanCowsImage.Parent = Server1PageSection2Phrame

Server1Page2Features2CleanCows.MouseButton1Click:Connect(function()
	AnnounceBox("Cleaning cows please wait!", "CLEAN COWS", 5, 60, 160, 60, 255, 255, 255)
	CleanCows()
end)

Server1Page2Features2CleanBuildings = Instance.new("TextButton")
Server1Page2Features2CleanBuildings.Size = UDim2.new(0, 160, 0, 20)
Server1Page2Features2CleanBuildings.Position = UDim2.new(0.35, 0, 0.52, 0)
Server1Page2Features2CleanBuildings.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features2CleanBuildings.BackgroundTransparency = 0.4
Server1Page2Features2CleanBuildings.BorderSizePixel = 1
Server1Page2Features2CleanBuildings.Text = "Clean Buildings"
Server1Page2Features2CleanBuildings.TextColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2CleanBuildings.TextSize = 8
Server1Page2Features2CleanBuildings.TextXAlignment = "Center"
Server1Page2Features2CleanBuildings.Parent = Server1PageSection2Phrame

Server1Page2Features2CleanBuildingsImage = Instance.new("ImageLabel")
Server1Page2Features2CleanBuildingsImage.Size = UDim2.new(0, 20, 0, 20)
Server1Page2Features2CleanBuildingsImage.Position = UDim2.new(0.342, 0, 0.51, 0)
Server1Page2Features2CleanBuildingsImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features2CleanBuildingsImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2CleanBuildingsImage.BackgroundTransparency = 1
Server1Page2Features2CleanBuildingsImage.BorderSizePixel = 0
Server1Page2Features2CleanBuildingsImage.Visible = true
Server1Page2Features2CleanBuildingsImage.Image = "rbxassetid://12900618433"
Server1Page2Features2CleanBuildingsImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2CleanBuildingsImage.Parent = Server1PageSection2Phrame

Server1Page2Features2CleanBuildings.MouseButton1Click:Connect(function()
	AnnounceBox("Cleaning buildings please wait!", "CLEAN BUILDINGS", 5, 60, 160, 60, 255, 255, 255)
	CleanBuildings()
end)

Server1Page2Features2DetoExplosives = Instance.new("TextButton")
Server1Page2Features2DetoExplosives.Size = UDim2.new(0, 160, 0, 20)
Server1Page2Features2DetoExplosives.Position = UDim2.new(0.35, 0, 0.62, 0)
Server1Page2Features2DetoExplosives.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features2DetoExplosives.BackgroundTransparency = 0.4
Server1Page2Features2DetoExplosives.BorderSizePixel = 1
Server1Page2Features2DetoExplosives.Text = "Deto- Explosives"
Server1Page2Features2DetoExplosives.TextColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2DetoExplosives.TextSize = 8
Server1Page2Features2DetoExplosives.TextXAlignment = "Center"
Server1Page2Features2DetoExplosives.Parent = Server1PageSection2Phrame

Server1Page2Features2DetoExplosivesImage = Instance.new("ImageLabel")
Server1Page2Features2DetoExplosivesImage.Size = UDim2.new(0, 20, 0, 20)
Server1Page2Features2DetoExplosivesImage.Position = UDim2.new(0.342, 0, 0.61, 0)
Server1Page2Features2DetoExplosivesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features2DetoExplosivesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2DetoExplosivesImage.BackgroundTransparency = 1
Server1Page2Features2DetoExplosivesImage.BorderSizePixel = 0
Server1Page2Features2DetoExplosivesImage.Visible = true
Server1Page2Features2DetoExplosivesImage.Image = "rbxassetid://12900618433"
Server1Page2Features2DetoExplosivesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features2DetoExplosivesImage.Parent = Server1PageSection2Phrame

Server1Page2Features2DetoExplosives.MouseButton1Click:Connect(function()
	AnnounceBox("Detonating explosives please wait!", "DETO EXPLOSIVES", 5, 60, 160, 60, 255, 255, 255)
	CleanExplosives()
end)

Server1Page2Features3 = Instance.new("TextBox")
Server1Page2Features3.Size = UDim2.new(0, 160, 0, 20)
Server1Page2Features3.Position = UDim2.new(0.682, 0, 0.02, 0)
Server1Page2Features3.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features3.BackgroundTransparency = 0.4
Server1Page2Features3.BorderSizePixel = 1
Server1Page2Features3.Text = "Map Color"
Server1Page2Features3.TextColor3 = Color3.fromRGB(255, 255, 255)
--Server1Page2Features3.TextScaled = true
Server1Page2Features3.TextSize = 8
Server1Page2Features3.TextWrapped = true
Server1Page2Features3.TextXAlignment = "Center"
Server1Page2Features3.Parent = Server1PageSection2Phrame

Server1Page2Features3 = Instance.new("TextBox")
Server1Page2Features3.Size = UDim2.new(0, 160, 0, 20)
Server1Page2Features3.Position = UDim2.new(0.682, 0, 0.12, 0)
Server1Page2Features3.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features3.BackgroundTransparency = 0.4
Server1Page2Features3.BorderSizePixel = 1
Server1Page2Features3.Text = "Map Texture"
Server1Page2Features3.TextColor3 = Color3.fromRGB(255, 255, 255)
--Server1Page2Features3.TextScaled = true
Server1Page2Features3.TextSize = 8
Server1Page2Features3.TextWrapped = true
Server1Page2Features3.TextXAlignment = "Center"
Server1Page2Features3.Parent = Server1PageSection2Phrame

Server1Page2Features3 = Instance.new("TextBox")
Server1Page2Features3.Size = UDim2.new(0, 160, 0, 20)
Server1Page2Features3.Position = UDim2.new(0.682, 0, 0.22, 0)
Server1Page2Features3.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features3.BackgroundTransparency = 0.4
Server1Page2Features3.BorderSizePixel = 1
Server1Page2Features3.Text = "Road Color"
Server1Page2Features3.TextColor3 = Color3.fromRGB(255, 255, 255)
--Server1Page2Features3.TextScaled = true
Server1Page2Features3.TextSize = 8
Server1Page2Features3.TextWrapped = true
Server1Page2Features3.TextXAlignment = "Center"
Server1Page2Features3.Parent = Server1PageSection2Phrame

Server1Page2Features3 = Instance.new("TextBox")
Server1Page2Features3.Size = UDim2.new(0, 160, 0, 20)
Server1Page2Features3.Position = UDim2.new(0.682, 0, 0.32, 0)
Server1Page2Features3.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features3.BackgroundTransparency = 0.4
Server1Page2Features3.BorderSizePixel = 1
Server1Page2Features3.Text = "Building Color"
Server1Page2Features3.TextColor3 = Color3.fromRGB(255, 255, 255)
--Server1Page2Features3.TextScaled = true
Server1Page2Features3.TextSize = 8
Server1Page2Features3.TextWrapped = true
Server1Page2Features3.TextXAlignment = "Center"
Server1Page2Features3.Parent = Server1PageSection2Phrame

Server1Page2Features3 = Instance.new("TextButton")
Server1Page2Features3.Size = UDim2.new(0, 160, 0, 20)
Server1Page2Features3.Position = UDim2.new(0.682, 0, 0.42, 0)
Server1Page2Features3.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features3.BackgroundTransparency = 0.4
Server1Page2Features3.BorderSizePixel = 1
Server1Page2Features3.Text = "Random Map"
Server1Page2Features3.TextColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features3.TextSize = 8
Server1Page2Features3.TextXAlignment = "Center"
Server1Page2Features3.Parent = Server1PageSection2Phrame

Server1Page2Features3Image = Instance.new("ImageLabel")
Server1Page2Features3Image.Size = UDim2.new(0, 20, 0, 20)
Server1Page2Features3Image.Position = UDim2.new(0.674, 0, 0.41, 0)
Server1Page2Features3Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features3Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features3Image.BackgroundTransparency = 1
Server1Page2Features3Image.BorderSizePixel = 0
Server1Page2Features3Image.Visible = true
Server1Page2Features3Image.Image = "rbxassetid://12900618433"
Server1Page2Features3Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features3Image.Parent = Server1PageSection2Phrame

Server1Page2Features3 = Instance.new("TextButton")
Server1Page2Features3.Size = UDim2.new(0, 160, 0, 20)
Server1Page2Features3.Position = UDim2.new(0.682, 0, 0.52, 0)
Server1Page2Features3.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features3.BackgroundTransparency = 0.4
Server1Page2Features3.BorderSizePixel = 1
Server1Page2Features3.Text = "Reset Map"
Server1Page2Features3.TextColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features3.TextSize = 8
Server1Page2Features3.TextXAlignment = "Center"
Server1Page2Features3.Parent = Server1PageSection2Phrame

Server1Page2Features3Image = Instance.new("ImageLabel")
Server1Page2Features3Image.Size = UDim2.new(0, 20, 0, 20)
Server1Page2Features3Image.Position = UDim2.new(0.674, 0, 0.51, 0)
Server1Page2Features3Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features3Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features3Image.BackgroundTransparency = 1
Server1Page2Features3Image.BorderSizePixel = 0
Server1Page2Features3Image.Visible = true
Server1Page2Features3Image.Image = "rbxassetid://12900618433"
Server1Page2Features3Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features3Image.Parent = Server1PageSection2Phrame

Server1Page2Features3 = Instance.new("TextButton")
Server1Page2Features3.Size = UDim2.new(0, 160, 0, 20)
Server1Page2Features3.Position = UDim2.new(0.682, 0, 0.62, 0)
Server1Page2Features3.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features3.BackgroundTransparency = 0.4
Server1Page2Features3.BorderSizePixel = 1
Server1Page2Features3.Text = "No Map"
Server1Page2Features3.TextColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features3.TextSize = 8
Server1Page2Features3.TextXAlignment = "Center"
Server1Page2Features3.Parent = Server1PageSection2Phrame

Server1Page2Features3Image = Instance.new("ImageLabel")
Server1Page2Features3Image.Size = UDim2.new(0, 20, 0, 20)
Server1Page2Features3Image.Position = UDim2.new(0.674, 0, 0.61, 0)
Server1Page2Features3Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features3Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features3Image.BackgroundTransparency = 1
Server1Page2Features3Image.BorderSizePixel = 0
Server1Page2Features3Image.Visible = true
Server1Page2Features3Image.Image = "rbxassetid://12900618433"
Server1Page2Features3Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features3Image.Parent = Server1PageSection2Phrame

Server1Page2Features3 = Instance.new("TextButton")
Server1Page2Features3.Size = UDim2.new(0, 160, 0, 20)
Server1Page2Features3.Position = UDim2.new(0.682, 0, 0.72, 0)
Server1Page2Features3.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features3.BackgroundTransparency = 0.4
Server1Page2Features3.BorderSizePixel = 1
Server1Page2Features3.Text = "No Buildings"
Server1Page2Features3.TextColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features3.TextSize = 8
Server1Page2Features3.TextXAlignment = "Center"
Server1Page2Features3.Parent = Server1PageSection2Phrame

Server1Page2Features3Image = Instance.new("ImageLabel")
Server1Page2Features3Image.Size = UDim2.new(0, 20, 0, 20)
Server1Page2Features3Image.Position = UDim2.new(0.674, 0, 0.71, 0)
Server1Page2Features3Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Server1Page2Features3Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features3Image.BackgroundTransparency = 1
Server1Page2Features3Image.BorderSizePixel = 0
Server1Page2Features3Image.Visible = true
Server1Page2Features3Image.Image = "rbxassetid://12900618433"
Server1Page2Features3Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Server1Page2Features3Image.Parent = Server1PageSection2Phrame
--frames



--frames
Misc1PageSection2Phrame = Instance.new("Frame")
Misc1PageSection2Phrame.Size = UDim2.new(0.9, 0, 0.8, 0)
Misc1PageSection2Phrame.Position = UDim2.new(0.05, 0, 0.05, 0)
Misc1PageSection2Phrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Misc1PageSection2Phrame.BorderSizePixel = 1
Misc1PageSection2Phrame.Transparency = 1
Misc1PageSection2Phrame.Active = false
Misc1PageSection2Phrame.Selectable = true
Misc1PageSection2Phrame.Visible = false
Misc1PageSection2Phrame.Parent = GuiPhrame

Misc1PageSection2Phrame2 = Instance.new("ScrollingFrame")
Misc1PageSection2Phrame2.Size = UDim2.new(1, 0, 1, 0)
Misc1PageSection2Phrame2.Position = UDim2.new(0, 0, 0, 0)
Misc1PageSection2Phrame2.CanvasSize = UDim2.new(0, 0, 1, 1)
Misc1PageSection2Phrame2.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Misc1PageSection2Phrame2.BorderSizePixel = 1
Misc1PageSection2Phrame2.Transparency = 0.2
Misc1PageSection2Phrame2.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
Misc1PageSection2Phrame2.ScrollBarThickness = 4
Misc1PageSection2Phrame2.Parent = Misc1PageSection2Phrame

Misc1Page2Features3 = Instance.new("TextBox")
Misc1Page2Features3.Size = UDim2.new(0, 540, 0, 20)
Misc1Page2Features3.Position = UDim2.new(0, 0, 1.05, 0)
Misc1Page2Features3.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Misc1Page2Features3.BackgroundTransparency = 0.4
Misc1Page2Features3.BorderSizePixel = 1
Misc1Page2Features3.Text = "Type ;cmds for commands!"
Misc1Page2Features3.TextColor3 = Color3.fromRGB(255, 255, 255)
--Misc1Page2Features3.TextScaled = true
Misc1Page2Features3.TextSize = 8
Misc1Page2Features3.TextWrapped = true
Misc1Page2Features3.TextXAlignment = "Center"
Misc1Page2Features3.Parent = Misc1PageSection2Phrame

--setup commands
CommandsLogFrame = Instance.new("Frame", Misc1PageSection2Phrame2)
CommandsLogFrame.Name = "CommandLog"
CommandsLogFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CommandsLogFrame.BackgroundTransparency = 1
CommandsLogFrame.BorderSizePixel = 0
CommandsLogFrame.Position = UDim2.new(0, 0, 0, 0)
CommandsLogFrame.Size = UDim2.new(0, 1, 0, 20)

CommandsLogLabel = Instance.new("TextLabel", CommandsLogFrame)
CommandsLogLabel.Name = "CommandLogText"
CommandsLogLabel.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
CommandsLogLabel.BackgroundTransparency = 1
CommandsLogLabel.BorderColor3 = Color3.fromRGB(110, 172, 216)
CommandsLogLabel.BorderSizePixel = 0
CommandsLogLabel.Size = UDim2.new(0, 535, 0, CommandsLogFrame.Size.Y.Offset)
CommandsLogLabel.Font = Enum.Font.SourceSans
CommandsLogLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CommandsLogLabel.TextSize = 20
CommandsLogLabel.TextWrapped = true
CommandsLogLabel.Visible = false

function CreateCommandLog(Text, ColorR, ColorG, ColorB, DestroyElement, Time)
	CommandsLogLabel.TextColor3 = Color3.fromRGB(ColorR, ColorG, ColorB)
    for i, v in pairs(CommandsLogFrame:GetChildren()) do
		if v ~= CommandsLogLabel then
			v.Position = UDim2.new(0, 0, 0, 20*(#CommandsLogFrame:GetChildren()-(i-1)))
		end
    end
    local F = CommandsLogLabel:Clone()
	F.Visible = true
	F.Name = "Message"
    F.Parent = CommandsLogFrame
    F.Position = UDim2.new(0, 0, 0, 0)
    F.Text = Text
    spawn(function()
        if Time ~= 0 then
    	    wait(Time)
    	end
    	if DestroyElement then
    		F:remove()
    	end
        for i, v in pairs(CommandsLogFrame:GetChildren()) do
			if v ~= CommandsLogLabel then 
				v.Position = UDim2.new(0, 0, 0, 20*(#CommandsLogFrame:GetChildren()-(i)))
				Misc1PageSection2Phrame2.CanvasSize = UDim2.new(0, 0, 1, math.floor((i)*(i)))
			end
        end
    end)
end
CreateCommandLog("Welcome To Console, type ;cmds for command!", 170, 170, 170, false, 0)
--setup commands

Misc1Page2Features3.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        if Misc1Page2Features3.Text == ";cmds" then
            CreateCommandLog(";cmds", 255, 255, 255, false, 0)
            CreateCommandLog(";clearconsole", 255, 255, 255, false, 0)
            CreateCommandLog(";kill 'player'", 255, 255, 255, false, 0)
        elseif Misc1Page2Features3.Text == ";clearconsole" then
            CreateCommandLog("Clearing console please wait!", 70, 70, 255, false, 0)
            wait(1)
            for _, Message in pairs(CommandsLogFrame:GetChildren()) do
                if Message.Name == "Message" then
                    Message:Destroy()
                end
            end
            CreateCommandLog("Welcome To Console, type ;cmds for command!", 170, 170, 170, false, 0)
        elseif string.match(Misc1Page2Features3.Text, ";kill") then
            local playerName = string.match(Misc1Page2Features3.Text, "'(.-)'")
            if playerName then
                local player = game:GetService("Players"):FindFirstChild(playerName)
                if player then
                    Kill(player)
                    CreateCommandLog("Killed player " .. playerName, 60, 160, 60, false, 0)
                else
                    CreateCommandLog("Player not found: " .. playerName, 95, 60, 60, false, 0)
                end
            else
                CreateCommandLog("Invalid command: " .. Misc1Page2Features3.Text, 95, 60, 60, false, 0)
                CreateCommandLog("correct: ;kill 'player'", 70, 70, 255, false, 0)
            end
        else
            CreateCommandLog("Invalid command: " .. Misc1Page2Features3.Text, 95, 60, 60, false, 0)
        end
    end
end)

--frames



--frames
Settings1PageSection2Phrame = Instance.new("Frame")
Settings1PageSection2Phrame.Size = UDim2.new(0.9, 0, 0.9, 0)
Settings1PageSection2Phrame.Position = UDim2.new(0.05, 0, 0.05, 0)
Settings1PageSection2Phrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Settings1PageSection2Phrame.BorderSizePixel = 1
Settings1PageSection2Phrame.Transparency = 0.2
Settings1PageSection2Phrame.Active = false
Settings1PageSection2Phrame.Selectable = true
Settings1PageSection2Phrame.Visible = false
Settings1PageSection2Phrame.Parent = GuiPhrame

Settings1Page2FeaturesToggleFunctionAlerts = Instance.new("TextButton")
Settings1Page2FeaturesToggleFunctionAlerts.Size = UDim2.new(0, 160, 0, 20)
Settings1Page2FeaturesToggleFunctionAlerts.Position = UDim2.new(0.02, 0, 0.02, 0)
Settings1Page2FeaturesToggleFunctionAlerts.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Settings1Page2FeaturesToggleFunctionAlerts.BackgroundTransparency = 0.4
Settings1Page2FeaturesToggleFunctionAlerts.BorderSizePixel = 1
Settings1Page2FeaturesToggleFunctionAlerts.Text = "Show Function Alerts"
Settings1Page2FeaturesToggleFunctionAlerts.TextColor3 = Color3.fromRGB(170, 170, 170)
Settings1Page2FeaturesToggleFunctionAlerts.TextSize = 8
Settings1Page2FeaturesToggleFunctionAlerts.TextXAlignment = "Center"
Settings1Page2FeaturesToggleFunctionAlerts.Parent = Settings1PageSection2Phrame

Settings1Page2FeaturesToggleFunctionAlertsImage = Instance.new("ImageLabel")
Settings1Page2FeaturesToggleFunctionAlertsImage.Size = UDim2.new(0, 20, 0, 20)
Settings1Page2FeaturesToggleFunctionAlertsImage.Position = UDim2.new(0.012, 0, 0.02, 0)
Settings1Page2FeaturesToggleFunctionAlertsImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Settings1Page2FeaturesToggleFunctionAlertsImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Settings1Page2FeaturesToggleFunctionAlertsImage.BackgroundTransparency = 1
Settings1Page2FeaturesToggleFunctionAlertsImage.BorderSizePixel = 0
Settings1Page2FeaturesToggleFunctionAlertsImage.Visible = true
Settings1Page2FeaturesToggleFunctionAlertsImage.Image = "rbxassetid://12955247177"
Settings1Page2FeaturesToggleFunctionAlertsImage.ImageColor3 = Color3.fromRGB(170, 170, 170)
Settings1Page2FeaturesToggleFunctionAlertsImage.Parent = Settings1PageSection2Phrame

Settings1Page2FeaturesToggleFunctionAlerts.MouseButton1Click:Connect(function()
	if Settings1Page2FeaturesToggleFunctionAlerts.TextColor3 == Color3.fromRGB(255, 255, 255) then
	    AnnounceBox("Showing function alert messages!", "SCRIPT", 5, 255, 255, 255, 255, 255, 255)
		Settings1Page2FeaturesToggleFunctionAlerts.TextColor3 = Color3.fromRGB(170, 170, 170)
		Settings1Page2FeaturesToggleFunctionAlertsImage.ImageColor3 = Color3.fromRGB(170, 170, 170)
		ShowFunctionAlerts = true
	elseif Settings1Page2FeaturesToggleFunctionAlerts.TextColor3 == Color3.fromRGB(170, 170, 170) then
		AnnounceBox("No longer showing function alert messages!", "SCRIPT", 5, 255, 255, 255, 255, 255, 255)
		Settings1Page2FeaturesToggleFunctionAlerts.TextColor3 = Color3.fromRGB(255, 255, 255)
		Settings1Page2FeaturesToggleFunctionAlertsImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
		ShowFunctionAlerts = false
	end
end)

Settings1Page2FeaturesToggleJoinAlerts = Instance.new("TextButton")
Settings1Page2FeaturesToggleJoinAlerts.Size = UDim2.new(0, 160, 0, 20)
Settings1Page2FeaturesToggleJoinAlerts.Position = UDim2.new(0.02, 0, 0.12, 0)
Settings1Page2FeaturesToggleJoinAlerts.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Settings1Page2FeaturesToggleJoinAlerts.BackgroundTransparency = 0.4
Settings1Page2FeaturesToggleJoinAlerts.BorderSizePixel = 1
Settings1Page2FeaturesToggleJoinAlerts.Text = "Show joins"
Settings1Page2FeaturesToggleJoinAlerts.TextColor3 = Color3.fromRGB(170, 170, 170)
Settings1Page2FeaturesToggleJoinAlerts.TextSize = 8
Settings1Page2FeaturesToggleJoinAlerts.TextXAlignment = "Center"
Settings1Page2FeaturesToggleJoinAlerts.Parent = Settings1PageSection2Phrame

Settings1Page2FeaturesToggleJoinAlertsImage = Instance.new("ImageLabel")
Settings1Page2FeaturesToggleJoinAlertsImage.Size = UDim2.new(0, 20, 0, 20)
Settings1Page2FeaturesToggleJoinAlertsImage.Position = UDim2.new(0.012, 0, 0.12, 0)
Settings1Page2FeaturesToggleJoinAlertsImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Settings1Page2FeaturesToggleJoinAlertsImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Settings1Page2FeaturesToggleJoinAlertsImage.BackgroundTransparency = 1
Settings1Page2FeaturesToggleJoinAlertsImage.BorderSizePixel = 0
Settings1Page2FeaturesToggleJoinAlertsImage.Visible = true
Settings1Page2FeaturesToggleJoinAlertsImage.Image = "rbxassetid://12976284665"
Settings1Page2FeaturesToggleJoinAlertsImage.ImageColor3 = Color3.fromRGB(170, 170, 170)
Settings1Page2FeaturesToggleJoinAlertsImage.Parent = Settings1PageSection2Phrame

Settings1Page2FeaturesToggleJoinAlerts.MouseButton1Click:Connect(function()
	if Settings1Page2FeaturesToggleJoinAlerts.TextColor3 == Color3.fromRGB(255, 255, 255) then
	    AnnounceBox("Showing join alert messages!", "SCRIPT", 5, 255, 255, 255, 255, 255, 255)
		Settings1Page2FeaturesToggleJoinAlerts.TextColor3 = Color3.fromRGB(170, 170, 170)
		Settings1Page2FeaturesToggleJoinAlertsImage.ImageColor3 = Color3.fromRGB(170, 170, 170)
		ShowJoinAlerts = true
	elseif Settings1Page2FeaturesToggleJoinAlerts.TextColor3 == Color3.fromRGB(170, 170, 170) then
		AnnounceBox("No longer showing join alert messages!", "SCRIPT", 5, 255, 255, 255, 255, 255, 255)
		Settings1Page2FeaturesToggleJoinAlerts.TextColor3 = Color3.fromRGB(255, 255, 255)
		Settings1Page2FeaturesToggleJoinAlertsImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
		ShowJoinAlerts = false
	end
end)

Settings1Page2FeaturesToggleLeaveAlerts = Instance.new("TextButton")
Settings1Page2FeaturesToggleLeaveAlerts.Size = UDim2.new(0, 160, 0, 20)
Settings1Page2FeaturesToggleLeaveAlerts.Position = UDim2.new(0.02, 0, 0.22, 0)
Settings1Page2FeaturesToggleLeaveAlerts.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Settings1Page2FeaturesToggleLeaveAlerts.BackgroundTransparency = 0.4
Settings1Page2FeaturesToggleLeaveAlerts.BorderSizePixel = 1
Settings1Page2FeaturesToggleLeaveAlerts.Text = "Show leaves"
Settings1Page2FeaturesToggleLeaveAlerts.TextColor3 = Color3.fromRGB(170, 170, 170)
Settings1Page2FeaturesToggleLeaveAlerts.TextSize = 8
Settings1Page2FeaturesToggleLeaveAlerts.TextXAlignment = "Center"
Settings1Page2FeaturesToggleLeaveAlerts.Parent = Settings1PageSection2Phrame

Settings1Page2FeaturesToggleLeaveAlertsImage = Instance.new("ImageLabel")
Settings1Page2FeaturesToggleLeaveAlertsImage.Size = UDim2.new(0, 20, 0, 20)
Settings1Page2FeaturesToggleLeaveAlertsImage.Position = UDim2.new(0.012, 0, 0.22, 0)
Settings1Page2FeaturesToggleLeaveAlertsImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Settings1Page2FeaturesToggleLeaveAlertsImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Settings1Page2FeaturesToggleLeaveAlertsImage.BackgroundTransparency = 1
Settings1Page2FeaturesToggleLeaveAlertsImage.BorderSizePixel = 0
Settings1Page2FeaturesToggleLeaveAlertsImage.Visible = true
Settings1Page2FeaturesToggleLeaveAlertsImage.Image = "rbxassetid://12976289088"
Settings1Page2FeaturesToggleLeaveAlertsImage.ImageColor3 = Color3.fromRGB(170, 170, 170)
Settings1Page2FeaturesToggleLeaveAlertsImage.Parent = Settings1PageSection2Phrame

Settings1Page2FeaturesToggleLeaveAlerts.MouseButton1Click:Connect(function()
	if Settings1Page2FeaturesToggleLeaveAlerts.TextColor3 == Color3.fromRGB(255, 255, 255) then
	    AnnounceBox("Showing leave alert messages!", "SCRIPT", 5, 255, 255, 255, 255, 255, 255)
		Settings1Page2FeaturesToggleLeaveAlerts.TextColor3 = Color3.fromRGB(170, 170, 170)
		Settings1Page2FeaturesToggleLeaveAlertsImage.ImageColor3 = Color3.fromRGB(170, 170, 170)
		ShowLeaveAlerts = true
	elseif Settings1Page2FeaturesToggleLeaveAlerts.TextColor3 == Color3.fromRGB(170, 170, 170) then
		AnnounceBox("No longer showing leave alert messages!", "SCRIPT", 5, 255, 255, 255, 255, 255, 255)
		Settings1Page2FeaturesToggleLeaveAlerts.TextColor3 = Color3.fromRGB(255, 255, 255)
		Settings1Page2FeaturesToggleLeaveAlertsImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
		ShowLeaveAlerts = false
	end
end)

Settings1Page2FeaturesToggleExploiterDetectionMessages = Instance.new("TextButton")
Settings1Page2FeaturesToggleExploiterDetectionMessages.Size = UDim2.new(0, 160, 0, 20)
Settings1Page2FeaturesToggleExploiterDetectionMessages.Position = UDim2.new(0.02, 0, 0.32, 0)
Settings1Page2FeaturesToggleExploiterDetectionMessages.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Settings1Page2FeaturesToggleExploiterDetectionMessages.BackgroundTransparency = 0.4
Settings1Page2FeaturesToggleExploiterDetectionMessages.BorderSizePixel = 1
Settings1Page2FeaturesToggleExploiterDetectionMessages.Text = "Show Exploiter Alerts"
Settings1Page2FeaturesToggleExploiterDetectionMessages.TextColor3 = Color3.fromRGB(170, 170, 170)
Settings1Page2FeaturesToggleExploiterDetectionMessages.TextSize = 8
Settings1Page2FeaturesToggleExploiterDetectionMessages.TextXAlignment = "Center"
Settings1Page2FeaturesToggleExploiterDetectionMessages.Parent = Settings1PageSection2Phrame

Settings1Page2FeaturesToggleExploiterDetectionMessagesImage = Instance.new("ImageLabel")
Settings1Page2FeaturesToggleExploiterDetectionMessagesImage.Size = UDim2.new(0, 20, 0, 20)
Settings1Page2FeaturesToggleExploiterDetectionMessagesImage.Position = UDim2.new(0.012, 0, 0.32, 0)
Settings1Page2FeaturesToggleExploiterDetectionMessagesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Settings1Page2FeaturesToggleExploiterDetectionMessagesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Settings1Page2FeaturesToggleExploiterDetectionMessagesImage.BackgroundTransparency = 1
Settings1Page2FeaturesToggleExploiterDetectionMessagesImage.BorderSizePixel = 0
Settings1Page2FeaturesToggleExploiterDetectionMessagesImage.Visible = true
Settings1Page2FeaturesToggleExploiterDetectionMessagesImage.Image = "rbxassetid://12902044900"
Settings1Page2FeaturesToggleExploiterDetectionMessagesImage.ImageColor3 = Color3.fromRGB(170, 170, 170)
Settings1Page2FeaturesToggleExploiterDetectionMessagesImage.Parent = Settings1PageSection2Phrame

Settings1Page2FeaturesToggleExploiterDetectionMessages.MouseButton1Click:Connect(function()
	if Settings1Page2FeaturesToggleExploiterDetectionMessages.TextColor3 == Color3.fromRGB(255, 255, 255) then
	    AnnounceBox("Showing exploiter alert messages!", "SCRIPT", 5, 255, 255, 255, 255, 255, 255)
		Settings1Page2FeaturesToggleExploiterDetectionMessages.TextColor3 = Color3.fromRGB(170, 170, 170)
		Settings1Page2FeaturesToggleExploiterDetectionMessagesImage.ImageColor3 = Color3.fromRGB(170, 170, 170)
		ShowExploitAlerts = true
	elseif Settings1Page2FeaturesToggleExploiterDetectionMessages.TextColor3 == Color3.fromRGB(170, 170, 170) then
		AnnounceBox("No longer showing exploiter alert messages!", "SCRIPT", 5, 255, 255, 255, 255, 255, 255)
		Settings1Page2FeaturesToggleExploiterDetectionMessages.TextColor3 = Color3.fromRGB(255, 255, 255)
		Settings1Page2FeaturesToggleExploiterDetectionMessagesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
		ShowExploitAlerts = false
	end
end)

Settings1Page2FeaturesAutoCleanInterval = Instance.new("TextBox")
Settings1Page2FeaturesAutoCleanInterval.Size = UDim2.new(0, 160, 0, 20)
Settings1Page2FeaturesAutoCleanInterval.Position = UDim2.new(0.02, 0, 0.42, 0)
Settings1Page2FeaturesAutoCleanInterval.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Settings1Page2FeaturesAutoCleanInterval.BackgroundTransparency = 0.4
Settings1Page2FeaturesAutoCleanInterval.BorderSizePixel = 1
Settings1Page2FeaturesAutoCleanInterval.Text = "AC Interval (300)"
Settings1Page2FeaturesAutoCleanInterval.TextColor3 = Color3.fromRGB(255, 255, 255)
Settings1Page2FeaturesAutoCleanInterval.TextSize = 8
Settings1Page2FeaturesAutoCleanInterval.TextWrapped = true
Settings1Page2FeaturesAutoCleanInterval.TextXAlignment = "Center"
Settings1Page2FeaturesAutoCleanInterval.Parent = Settings1PageSection2Phrame

local AutoCleanInterval = 300
Settings1Page2FeaturesAutoCleanInterval.FocusLost:Connect(function(enterPressed)
	local GetValue = tonumber(Settings1Page2FeaturesAutoCleanInterval.Text)
    if enterPressed then
		if GetValue then
			AutoCleanInterval = GetValue
			AnnounceBox("Set AutoCleanInterval to " .. GetValue .. "!", "SCRIPT", 5, 255, 255, 255, 255, 255, 255)
		else
			AnnounceBox("Amount is invalid!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
		end
	end
end)

Settings1Page2FeaturesDetectExploitsInterval = Instance.new("TextBox")
Settings1Page2FeaturesDetectExploitsInterval.Size = UDim2.new(0, 160, 0, 20)
Settings1Page2FeaturesDetectExploitsInterval.Position = UDim2.new(0.02, 0, 0.52, 0)
Settings1Page2FeaturesDetectExploitsInterval.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Settings1Page2FeaturesDetectExploitsInterval.BackgroundTransparency = 0.4
Settings1Page2FeaturesDetectExploitsInterval.BorderSizePixel = 1
Settings1Page2FeaturesDetectExploitsInterval.Text = "DE Interval (30)"
Settings1Page2FeaturesDetectExploitsInterval.TextColor3 = Color3.fromRGB(255, 255, 255)
Settings1Page2FeaturesDetectExploitsInterval.TextSize = 8
Settings1Page2FeaturesDetectExploitsInterval.TextWrapped = true
Settings1Page2FeaturesDetectExploitsInterval.TextXAlignment = "Center"
Settings1Page2FeaturesDetectExploitsInterval.Parent = Settings1PageSection2Phrame

local DetectExploitsInterval = 30
Settings1Page2FeaturesDetectExploitsInterval.FocusLost:Connect(function(enterPressed)
	local GetValue = tonumber(Settings1Page2FeaturesDetectExploitsInterval.Text)
    if enterPressed then
		if GetValue then
			DetectExploitsInterval = GetValue
			AnnounceBox("Set DetectExploitsInterval to " .. GetValue .. "!", "SCRIPT", 5, 255, 255, 255, 255, 255, 255)
		else
			AnnounceBox("Amount is invalid!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
		end
	end
end)

Settings1Page2FeaturesAgeLockInterval = Instance.new("TextBox")
Settings1Page2FeaturesAgeLockInterval.Size = UDim2.new(0, 160, 0, 20)
Settings1Page2FeaturesAgeLockInterval.Position = UDim2.new(0.02, 0, 0.62, 0)
Settings1Page2FeaturesAgeLockInterval.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Settings1Page2FeaturesAgeLockInterval.BackgroundTransparency = 0.4
Settings1Page2FeaturesAgeLockInterval.BorderSizePixel = 1
Settings1Page2FeaturesAgeLockInterval.Text = "Age Lock Amount (100)"
Settings1Page2FeaturesAgeLockInterval.TextColor3 = Color3.fromRGB(255, 255, 255)
Settings1Page2FeaturesAgeLockInterval.TextSize = 8
Settings1Page2FeaturesAgeLockInterval.TextWrapped = true
Settings1Page2FeaturesAgeLockInterval.TextXAlignment = "Center"
Settings1Page2FeaturesAgeLockInterval.Parent = Settings1PageSection2Phrame

local AgeLockInterval = 100
Settings1Page2FeaturesAgeLockInterval.FocusLost:Connect(function(enterPressed)
	local GetValue = tonumber(Settings1Page2FeaturesAgeLockInterval.Text)
    if enterPressed then
		if GetValue then
			AgeLockInterval = GetValue
			AnnounceBox("Set AgeLockInterval to " .. GetValue .. "!", "SCRIPT", 5, 255, 255, 255, 255, 255, 255)
		else
			AnnounceBox("Amount is invalid!", "ERROR", 5, 95, 60, 60, 255, 255, 255)
		end
	end
end)
--frames



--frames
Test1PageSection2Phrame = Instance.new("Frame")
Test1PageSection2Phrame.Size = UDim2.new(0.9, 0, 0.9, 0)
Test1PageSection2Phrame.Position = UDim2.new(0.05, 0, 0.05, 0)
Test1PageSection2Phrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Test1PageSection2Phrame.BorderSizePixel = 1
Test1PageSection2Phrame.Transparency = 0.2
Test1PageSection2Phrame.Active = false
Test1PageSection2Phrame.Selectable = true
Test1PageSection2Phrame.Visible = false
Test1PageSection2Phrame.Parent = GuiPhrame

Test1Page2FeaturesDetectExploits = Instance.new("TextButton")
Test1Page2FeaturesDetectExploits.Size = UDim2.new(0, 160, 0, 20)
Test1Page2FeaturesDetectExploits.Position = UDim2.new(0.02, 0, 0.02, 0)
Test1Page2FeaturesDetectExploits.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2FeaturesDetectExploits.BackgroundTransparency = 0.4
Test1Page2FeaturesDetectExploits.BorderSizePixel = 1
Test1Page2FeaturesDetectExploits.Text = "Detect Exploiters"
Test1Page2FeaturesDetectExploits.TextColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2FeaturesDetectExploits.TextSize = 8
Test1Page2FeaturesDetectExploits.TextXAlignment = "Center"
Test1Page2FeaturesDetectExploits.Parent = Test1PageSection2Phrame

Test1Page2FeaturesDetectExploitsImage = Instance.new("ImageLabel")
Test1Page2FeaturesDetectExploitsImage.Size = UDim2.new(0, 20, 0, 20)
Test1Page2FeaturesDetectExploitsImage.Position = UDim2.new(0.012, 0, 0.02, 0)
Test1Page2FeaturesDetectExploitsImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2FeaturesDetectExploitsImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2FeaturesDetectExploitsImage.BackgroundTransparency = 1
Test1Page2FeaturesDetectExploitsImage.BorderSizePixel = 0
Test1Page2FeaturesDetectExploitsImage.Visible = true
Test1Page2FeaturesDetectExploitsImage.Image = "rbxassetid://12902044900"
Test1Page2FeaturesDetectExploitsImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2FeaturesDetectExploitsImage.Parent = Test1PageSection2Phrame

local CheckForExploitersToggle = false;
Test1Page2FeaturesDetectExploits.MouseButton1Click:Connect(function()
	if Test1Page2FeaturesDetectExploits.TextColor3 == Color3.fromRGB(255, 255, 255) then
		Test1Page2FeaturesDetectExploits.TextColor3 = Color3.fromRGB(170, 170, 170)
		Test1Page2FeaturesDetectExploitsImage.ImageColor3 = Color3.fromRGB(170, 170, 170)
		AnnounceBox("Exploit detection is now on!", "DETECT EXPLOITS", 5, 60, 160, 60, 255, 255, 255)
		CheckForExploitersToggle = true
	elseif Test1Page2FeaturesDetectExploits.TextColor3 == Color3.fromRGB(170, 170, 170) then
		AnnounceBox("Exploit detection is now off!", "DETECT EXPLOITS", 5, 60, 160, 60, 255, 255, 255)
		Test1Page2FeaturesDetectExploits.TextColor3 = Color3.fromRGB(255, 255, 255)
		Test1Page2FeaturesDetectExploitsImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
		CheckForExploitersToggle = false
	end
end)
--Linked with AntiKick
spawn(function()
	while wait(DetectExploitsInterval) do
		if CheckForExploitersToggle then
			CheckForExploits()
		end
	end
end)

Test1Page2FeaturesPunishExploits = Instance.new("TextButton")
Test1Page2FeaturesPunishExploits.Size = UDim2.new(0, 160, 0, 20)
Test1Page2FeaturesPunishExploits.Position = UDim2.new(0.02, 0, 0.12, 0)
Test1Page2FeaturesPunishExploits.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2FeaturesPunishExploits.BackgroundTransparency = 0.4
Test1Page2FeaturesPunishExploits.BorderSizePixel = 1
Test1Page2FeaturesPunishExploits.Text = "Punish Exploiters"
Test1Page2FeaturesPunishExploits.TextColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2FeaturesPunishExploits.TextSize = 8
Test1Page2FeaturesPunishExploits.TextXAlignment = "Center"
Test1Page2FeaturesPunishExploits.Parent = Test1PageSection2Phrame

Test1Page2FeaturesPunishExploitsImage = Instance.new("ImageLabel")
Test1Page2FeaturesPunishExploitsImage.Size = UDim2.new(0, 20, 0, 20)
Test1Page2FeaturesPunishExploitsImage.Position = UDim2.new(0.012, 0, 0.12, 0)
Test1Page2FeaturesPunishExploitsImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2FeaturesPunishExploitsImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2FeaturesPunishExploitsImage.BackgroundTransparency = 1
Test1Page2FeaturesPunishExploitsImage.BorderSizePixel = 0
Test1Page2FeaturesPunishExploitsImage.Visible = true
Test1Page2FeaturesPunishExploitsImage.Image = "rbxassetid://12902189825"
Test1Page2FeaturesPunishExploitsImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2FeaturesPunishExploitsImage.Parent = Test1PageSection2Phrame

Test1Page2FeaturesPunishExploits.MouseButton1Click:Connect(function()
	if Test1Page2FeaturesPunishExploits.TextColor3 == Color3.fromRGB(255, 255, 255) then
		Test1Page2FeaturesPunishExploits.TextColor3 = Color3.fromRGB(170, 170, 170)
		Test1Page2FeaturesPunishExploitsImage.ImageColor3 = Color3.fromRGB(170, 170, 170)
		AnnounceBox("Punishing exploiters is now on!", "PUNISH EXPLOITS", 5, 60, 160, 60, 255, 255, 255)
		TogglePunishExploiters = true
	elseif Test1Page2FeaturesPunishExploits.TextColor3 == Color3.fromRGB(170, 170, 170) then
		AnnounceBox("Punishing exploiters is now off!", "PUNISH EXPLOITS", 5, 60, 160, 60, 255, 255, 255)
		Test1Page2FeaturesPunishExploits.TextColor3 = Color3.fromRGB(255, 255, 255)
		Test1Page2FeaturesPunishExploitsImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
		TogglePunishExploiters = false
	end
end)

Test1Page2Features = Instance.new("TextButton")
Test1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Test1Page2Features.Position = UDim2.new(0.02, 0, 0.22, 0)
Test1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features.BackgroundTransparency = 0.4
Test1Page2Features.BorderSizePixel = 1
Test1Page2Features.Text = "Detect Item Spawns"
Test1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features.TextSize = 8
Test1Page2Features.TextXAlignment = "Center"
Test1Page2Features.Parent = Test1PageSection2Phrame

Test1Page2FeaturesImage = Instance.new("ImageLabel")
Test1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Test1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.22, 0)
Test1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2FeaturesImage.BackgroundTransparency = 1
Test1Page2FeaturesImage.BorderSizePixel = 0
Test1Page2FeaturesImage.Visible = true
Test1Page2FeaturesImage.Image = "rbxassetid://13001049350"
Test1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2FeaturesImage.Parent = Test1PageSection2Phrame

Test1Page2Features = Instance.new("TextButton")
Test1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Test1Page2Features.Position = UDim2.new(0.02, 0, 0.32, 0)
Test1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features.BackgroundTransparency = 0.4
Test1Page2Features.BorderSizePixel = 1
Test1Page2Features.Text = "Remove Items"
Test1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features.TextSize = 8
Test1Page2Features.TextXAlignment = "Center"
Test1Page2Features.Parent = Test1PageSection2Phrame

Test1Page2FeaturesImage = Instance.new("ImageLabel")
Test1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Test1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.32, 0)
Test1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2FeaturesImage.BackgroundTransparency = 1
Test1Page2FeaturesImage.BorderSizePixel = 0
Test1Page2FeaturesImage.Visible = true
Test1Page2FeaturesImage.Image = "rbxassetid://13001049350"
Test1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2FeaturesImage.Parent = Test1PageSection2Phrame

Test1Page2FeaturesAutoClean = Instance.new("TextButton")
Test1Page2FeaturesAutoClean.Size = UDim2.new(0, 160, 0, 20)
Test1Page2FeaturesAutoClean.Position = UDim2.new(0.02, 0, 0.42, 0)
Test1Page2FeaturesAutoClean.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2FeaturesAutoClean.BackgroundTransparency = 0.4
Test1Page2FeaturesAutoClean.BorderSizePixel = 1
Test1Page2FeaturesAutoClean.Text = "Auto Clean"
Test1Page2FeaturesAutoClean.TextColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2FeaturesAutoClean.TextSize = 8
Test1Page2FeaturesAutoClean.TextXAlignment = "Center"
Test1Page2FeaturesAutoClean.Parent = Test1PageSection2Phrame

Test1Page2FeaturesAutoCleanImage = Instance.new("ImageLabel")
Test1Page2FeaturesAutoCleanImage.Size = UDim2.new(0, 20, 0, 20)
Test1Page2FeaturesAutoCleanImage.Position = UDim2.new(0.012, 0, 0.42, 0)
Test1Page2FeaturesAutoCleanImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2FeaturesAutoCleanImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2FeaturesAutoCleanImage.BackgroundTransparency = 1
Test1Page2FeaturesAutoCleanImage.BorderSizePixel = 0
Test1Page2FeaturesAutoCleanImage.Visible = true
Test1Page2FeaturesAutoCleanImage.Image = "rbxassetid://12902061564"
Test1Page2FeaturesAutoCleanImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2FeaturesAutoCleanImage.Parent = Test1PageSection2Phrame

local ToggleAutoClean = false;
Test1Page2FeaturesAutoClean.MouseButton1Click:Connect(function()
	if Test1Page2FeaturesAutoClean.TextColor3 == Color3.fromRGB(255, 255, 255) then
		Test1Page2FeaturesAutoClean.TextColor3 = Color3.fromRGB(170, 170, 170)
		Test1Page2FeaturesAutoCleanImage.ImageColor3 = Color3.fromRGB(170, 170, 170)
		AnnounceBox("Auto clean is now on!", "AUTO CLEAN", 5, 60, 160, 60, 255, 255, 255)
		ToggleAutoClean = true
	elseif Test1Page2FeaturesAutoClean.TextColor3 == Color3.fromRGB(170, 170, 170) then
		AnnounceBox("Auto clean is now off!", "AUTO CLEAN", 5, 60, 160, 60, 255, 255, 255)
		Test1Page2FeaturesAutoClean.TextColor3 = Color3.fromRGB(255, 255, 255)
		Test1Page2FeaturesAutoCleanImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
		ToggleAutoClean = false
	end
end)
--Linked with Auto Clean
spawn(function()
	while wait(AutoCleanInterval) do
		if ToggleAutoClean then
			if ShowFunctionAlerts then
				AnnounceBox("Auto clean ran!", "AUTO CLEAN", 5, 60, 160, 60, 255, 255, 255)
			end
			CleanGarbage()
			CleanVehicles()
		end
	end
end)

Test1Page2Features = Instance.new("TextButton")
Test1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Test1Page2Features.Position = UDim2.new(0.02, 0, 0.52, 0)
Test1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features.BackgroundTransparency = 0.4
Test1Page2Features.BorderSizePixel = 1
Test1Page2Features.Text = "Detect Teleports"
Test1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features.TextSize = 8
Test1Page2Features.TextXAlignment = "Center"
Test1Page2Features.Parent = Test1PageSection2Phrame

Test1Page2FeaturesImage = Instance.new("ImageLabel")
Test1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Test1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.52, 0)
Test1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2FeaturesImage.BackgroundTransparency = 1
Test1Page2FeaturesImage.BorderSizePixel = 0
Test1Page2FeaturesImage.Visible = true
Test1Page2FeaturesImage.Image = "rbxassetid://12906152938"
Test1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2FeaturesImage.Parent = Test1PageSection2Phrame

Test1Page2Features = Instance.new("TextButton")
Test1Page2Features.Size = UDim2.new(0, 160, 0, 20)
Test1Page2Features.Position = UDim2.new(0.02, 0, 0.62, 0)
Test1Page2Features.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features.BackgroundTransparency = 0.4
Test1Page2Features.BorderSizePixel = 1
Test1Page2Features.Text = "Punish Teleporters"
Test1Page2Features.TextColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features.TextSize = 8
Test1Page2Features.TextXAlignment = "Center"
Test1Page2Features.Parent = Test1PageSection2Phrame

Test1Page2FeaturesImage = Instance.new("ImageLabel")
Test1Page2FeaturesImage.Size = UDim2.new(0, 20, 0, 20)
Test1Page2FeaturesImage.Position = UDim2.new(0.012, 0, 0.62, 0)
Test1Page2FeaturesImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2FeaturesImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2FeaturesImage.BackgroundTransparency = 1
Test1Page2FeaturesImage.BorderSizePixel = 0
Test1Page2FeaturesImage.Visible = true
Test1Page2FeaturesImage.Image = "rbxassetid://12902189825"
Test1Page2FeaturesImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2FeaturesImage.Parent = Test1PageSection2Phrame

Test1Page2Features2AntiKick = Instance.new("TextButton")
Test1Page2Features2AntiKick.Size = UDim2.new(0, 160, 0, 20)
Test1Page2Features2AntiKick.Position = UDim2.new(0.35, 0, 0.02, 0)
Test1Page2Features2AntiKick.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features2AntiKick.BackgroundTransparency = 0.4
Test1Page2Features2AntiKick.BorderSizePixel = 1
Test1Page2Features2AntiKick.Text = "Anti Kick"
Test1Page2Features2AntiKick.TextColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features2AntiKick.TextSize = 8
Test1Page2Features2AntiKick.TextXAlignment = "Center"
Test1Page2Features2AntiKick.Parent = Test1PageSection2Phrame

Test1Page2Features2AntiKickImage = Instance.new("ImageLabel")
Test1Page2Features2AntiKickImage.Size = UDim2.new(0, 20, 0, 20)
Test1Page2Features2AntiKickImage.Position = UDim2.new(0.342, 0, 0.02, 0)
Test1Page2Features2AntiKickImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features2AntiKickImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features2AntiKickImage.BackgroundTransparency = 1
Test1Page2Features2AntiKickImage.BorderSizePixel = 0
Test1Page2Features2AntiKickImage.Visible = true
Test1Page2Features2AntiKickImage.Image = "rbxassetid://12902106475"
Test1Page2Features2AntiKickImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features2AntiKickImage.Parent = Test1PageSection2Phrame

local AntiKickToggle = false;
Test1Page2Features2AntiKick.MouseButton1Click:Connect(function()
	if Test1Page2Features2AntiKick.TextColor3 == Color3.fromRGB(255, 255, 255) then
		Test1Page2Features2AntiKick.TextColor3 = Color3.fromRGB(170, 170, 170)
		Test1Page2Features2AntiKickImage.ImageColor3 = Color3.fromRGB(170, 170, 170)
		AnnounceBox("Anti kick is now on!", "ANTI KICK", 5, 60, 160, 60, 255, 255, 255)
		AntiKickToggle = true
	elseif Test1Page2Features2AntiKick.TextColor3 == Color3.fromRGB(170, 170, 170) then
		AnnounceBox("Anti kick is now off!", "ANTI KICK", 5, 60, 160, 60, 255, 255, 255)
		Test1Page2Features2AntiKick.TextColor3 = Color3.fromRGB(255, 255, 255)
		Test1Page2Features2AntiKickImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
		AntiKickToggle = false
	end
end)
--Linked with AntiKick
spawn(function()
	while AntiKickToggle do
        LocalPlayer.CharacterAdded:connect(SetupHumanoidWatch)
        spawn(function()
            SetupHumanoidWatch()
        end)
        wait(0.1)
	end
end)

Test1Page2Features2 = Instance.new("TextButton")
Test1Page2Features2.Size = UDim2.new(0, 160, 0, 20)
Test1Page2Features2.Position = UDim2.new(0.35, 0, 0.12, 0)
Test1Page2Features2.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features2.BackgroundTransparency = 0.4
Test1Page2Features2.BorderSizePixel = 1
Test1Page2Features2.Text = "Anti Crash"
Test1Page2Features2.TextColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features2.TextSize = 8
Test1Page2Features2.TextXAlignment = "Center"
Test1Page2Features2.Parent = Test1PageSection2Phrame

Test1Page2Features2Image = Instance.new("ImageLabel")
Test1Page2Features2Image.Size = UDim2.new(0, 20, 0, 20)
Test1Page2Features2Image.Position = UDim2.new(0.342, 0, 0.12, 0)
Test1Page2Features2Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features2Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features2Image.BackgroundTransparency = 1
Test1Page2Features2Image.BorderSizePixel = 0
Test1Page2Features2Image.Visible = true
Test1Page2Features2Image.Image = "rbxassetid://12902195353"
Test1Page2Features2Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features2Image.Parent = Test1PageSection2Phrame

Test1Page2Features2 = Instance.new("TextButton")
Test1Page2Features2.Size = UDim2.new(0, 160, 0, 20)
Test1Page2Features2.Position = UDim2.new(0.35, 0, 0.22, 0)
Test1Page2Features2.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features2.BackgroundTransparency = 0.4
Test1Page2Features2.BorderSizePixel = 1
Test1Page2Features2.Text = "Anti Spawn"
Test1Page2Features2.TextColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features2.TextSize = 8
Test1Page2Features2.TextXAlignment = "Center"
Test1Page2Features2.Parent = Test1PageSection2Phrame

Test1Page2Features2Image = Instance.new("ImageLabel")
Test1Page2Features2Image.Size = UDim2.new(0, 20, 0, 20)
Test1Page2Features2Image.Position = UDim2.new(0.342, 0, 0.22, 0)
Test1Page2Features2Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features2Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features2Image.BackgroundTransparency = 1
Test1Page2Features2Image.BorderSizePixel = 0
Test1Page2Features2Image.Visible = true
Test1Page2Features2Image.Image = "rbxassetid://12902193700"
Test1Page2Features2Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features2Image.Parent = Test1PageSection2Phrame

Test1Page2Features2 = Instance.new("TextButton")
Test1Page2Features2.Size = UDim2.new(0, 160, 0, 20)
Test1Page2Features2.Position = UDim2.new(0.35, 0, 0.32, 0)
Test1Page2Features2.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features2.BackgroundTransparency = 0.4
Test1Page2Features2.BorderSizePixel = 1
Test1Page2Features2.Text = "Anti Teleport"
Test1Page2Features2.TextColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features2.TextSize = 8
Test1Page2Features2.TextXAlignment = "Center"
Test1Page2Features2.Parent = Test1PageSection2Phrame

Test1Page2Features2Image = Instance.new("ImageLabel")
Test1Page2Features2Image.Size = UDim2.new(0, 20, 0, 20)
Test1Page2Features2Image.Position = UDim2.new(0.342, 0, 0.32, 0)
Test1Page2Features2Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features2Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features2Image.BackgroundTransparency = 1
Test1Page2Features2Image.BorderSizePixel = 0
Test1Page2Features2Image.Visible = true
Test1Page2Features2Image.Image = "rbxassetid://12906152938"
Test1Page2Features2Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features2Image.Parent = Test1PageSection2Phrame

Test1Page2Features2 = Instance.new("TextButton")
Test1Page2Features2.Size = UDim2.new(0, 160, 0, 20)
Test1Page2Features2.Position = UDim2.new(0.35, 0, 0.42, 0)
Test1Page2Features2.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features2.BackgroundTransparency = 0.4
Test1Page2Features2.BorderSizePixel = 1
Test1Page2Features2.Text = "Anti Sit"
Test1Page2Features2.TextColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features2.TextSize = 8
Test1Page2Features2.TextXAlignment = "Center"
Test1Page2Features2.Parent = Test1PageSection2Phrame

Test1Page2Features2Image = Instance.new("ImageLabel")
Test1Page2Features2Image.Size = UDim2.new(0, 20, 0, 20)
Test1Page2Features2Image.Position = UDim2.new(0.342, 0, 0.42, 0)
Test1Page2Features2Image.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features2Image.BorderColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features2Image.BackgroundTransparency = 1
Test1Page2Features2Image.BorderSizePixel = 0
Test1Page2Features2Image.Visible = true
Test1Page2Features2Image.Image = "rbxassetid://12902184083"
Test1Page2Features2Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features2Image.Parent = Test1PageSection2Phrame

Test1Page2Features3PremiumLock = Instance.new("TextButton")
Test1Page2Features3PremiumLock.Size = UDim2.new(0, 160, 0, 20)
Test1Page2Features3PremiumLock.Position = UDim2.new(0.682, 0, 0.02, 0)
Test1Page2Features3PremiumLock.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features3PremiumLock.BackgroundTransparency = 0.4
Test1Page2Features3PremiumLock.BorderSizePixel = 1
Test1Page2Features3PremiumLock.Text = "Premium Lock"
Test1Page2Features3PremiumLock.TextColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features3PremiumLock.TextSize = 8
Test1Page2Features3PremiumLock.TextXAlignment = "Center"
Test1Page2Features3PremiumLock.Parent = Test1PageSection2Phrame

Test1Page2Features3PremiumLockImage = Instance.new("ImageLabel")
Test1Page2Features3PremiumLockImage.Size = UDim2.new(0, 20, 0, 20)
Test1Page2Features3PremiumLockImage.Position = UDim2.new(0.674, 0, 0.02, 0)
Test1Page2Features3PremiumLockImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features3PremiumLockImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features3PremiumLockImage.BackgroundTransparency = 1
Test1Page2Features3PremiumLockImage.BorderSizePixel = 0
Test1Page2Features3PremiumLockImage.Visible = true
Test1Page2Features3PremiumLockImage.Image = "rbxassetid://12902116561"
Test1Page2Features3PremiumLockImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features3PremiumLockImage.Parent = Test1PageSection2Phrame

local TogglePremiumLock = false;
function ValidateUserPremium(player)
    local SPlayer = game.Players:FindFirstChild(player)
    if TogglePremiumLock then
        spawn(function()
            if player ~= LocalPlayer and player.MembershipType == Enum.MembershipType.None then
                Kick(player)
                if ShowFunctionAlerts then
		            AnnounceBox("Kicked " .. player.Name .. " account did not have premium!", "PREMIUM LOCK", 5, 130, 130, 60, 255, 255, 255)
                end
            end
        end)
    end
end
--Linked with Premium lock
Test1Page2Features3PremiumLock.MouseButton1Click:Connect(function()
	if Test1Page2Features3PremiumLock.TextColor3 == Color3.fromRGB(255, 255, 255) then
		Test1Page2Features3PremiumLock.TextColor3 = Color3.fromRGB(170, 170, 170)
		Test1Page2Features3PremiumLockImage.ImageColor3 = Color3.fromRGB(170, 170, 170)
		AnnounceBox("Premium lock is now on!", "PREMIUM LOCK", 5, 60, 160, 60, 255, 255, 255)
		TogglePremiumLock = true
        for _, v in pairs(Players:GetPlayers()) do
    	    if v ~= LocalPlayer then
				ValidateUserPremium(v)
	        end
        end
	elseif Test1Page2Features3PremiumLock.TextColor3 == Color3.fromRGB(170, 170, 170) then
		AnnounceBox("Premium lock is now off!", "PREMIUM LOCK", 5, 60, 160, 60, 255, 255, 255)
		Test1Page2Features3PremiumLock.TextColor3 = Color3.fromRGB(255, 255, 255)
		Test1Page2Features3PremiumLockImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
		TogglePremiumLock = false
	end
end)

Test1Page2Features3AgeLock = Instance.new("TextButton")
Test1Page2Features3AgeLock.Size = UDim2.new(0, 160, 0, 20)
Test1Page2Features3AgeLock.Position = UDim2.new(0.682, 0, 0.12, 0)
Test1Page2Features3AgeLock.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features3AgeLock.BackgroundTransparency = 0.4
Test1Page2Features3AgeLock.BorderSizePixel = 1
Test1Page2Features3AgeLock.Text = "Age Lock"
Test1Page2Features3AgeLock.TextColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features3AgeLock.TextSize = 8
Test1Page2Features3AgeLock.TextXAlignment = "Center"
Test1Page2Features3AgeLock.Parent = Test1PageSection2Phrame

Test1Page2Features3AgeLockImage = Instance.new("ImageLabel")
Test1Page2Features3AgeLockImage.Size = UDim2.new(0, 20, 0, 20)
Test1Page2Features3AgeLockImage.Position = UDim2.new(0.674, 0, 0.12, 0)
Test1Page2Features3AgeLockImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features3AgeLockImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features3AgeLockImage.BackgroundTransparency = 1
Test1Page2Features3AgeLockImage.BorderSizePixel = 0
Test1Page2Features3AgeLockImage.Visible = true
Test1Page2Features3AgeLockImage.Image = "rbxassetid://12902035648"
Test1Page2Features3AgeLockImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features3AgeLockImage.Parent = Test1PageSection2Phrame

local AgeLockToggle = false;
function ValidateAccountAge(player)
    local SPlayer = game.Players:FindFirstChild(player)
    if AgeLockToggle then
        spawn(function()
            if player ~= LocalPlayer and player.AccountAge <= AgeLockInterval then
                Kick(player)
                if ShowFunctionAlerts then
		            AnnounceBox("Kicked " .. player.Name .. " account age was " .. player.AccountAge .. "!", "AGE LOCK", 5, 130, 130, 60, 255, 255, 255)
		            --AddTextOnPlayer(player, "Age Blocked", 255, 255, 255)
                end
            end
        end)
    end
end
--Linked with AgeLock
Test1Page2Features3AgeLock.MouseButton1Click:Connect(function()
	if Test1Page2Features3AgeLock.TextColor3 == Color3.fromRGB(255, 255, 255) then
		Test1Page2Features3AgeLock.TextColor3 = Color3.fromRGB(170, 170, 170)
		Test1Page2Features3AgeLockImage.ImageColor3 = Color3.fromRGB(170, 170, 170)
		AnnounceBox("Age lock is now on!", "AGE LOCK", 5, 60, 160, 60, 255, 255, 255)
		AgeLockToggle = true
        for _, v in pairs(Players:GetPlayers()) do
    	    if v ~= LocalPlayer then
    	        ValidateAccountAge(v)
	        end
        end
	elseif Test1Page2Features3AgeLock.TextColor3 == Color3.fromRGB(170, 170, 170) then
		AnnounceBox("Age lock is now off!", "AGE LOCK", 5, 60, 160, 60, 255, 255, 255)
		Test1Page2Features3AgeLock.TextColor3 = Color3.fromRGB(255, 255, 255)
		Test1Page2Features3AgeLockImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
		AgeLockToggle = false
	end
end)

Test1Page2Features3EnglishLock = Instance.new("TextButton")
Test1Page2Features3EnglishLock.Size = UDim2.new(0, 160, 0, 20)
Test1Page2Features3EnglishLock.Position = UDim2.new(0.682, 0, 0.22, 0)
Test1Page2Features3EnglishLock.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features3EnglishLock.BackgroundTransparency = 0.4
Test1Page2Features3EnglishLock.BorderSizePixel = 1
Test1Page2Features3EnglishLock.Text = "English Lock"
Test1Page2Features3EnglishLock.TextColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features3EnglishLock.TextSize = 8
Test1Page2Features3EnglishLock.TextXAlignment = "Center"
Test1Page2Features3EnglishLock.Parent = Test1PageSection2Phrame

Test1Page2Features3EnglishLockImage = Instance.new("ImageLabel")
Test1Page2Features3EnglishLockImage.Size = UDim2.new(0, 20, 0, 20)
Test1Page2Features3EnglishLockImage.Position = UDim2.new(0.674, 0, 0.22, 0)
Test1Page2Features3EnglishLockImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features3EnglishLockImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features3EnglishLockImage.BackgroundTransparency = 1
Test1Page2Features3EnglishLockImage.BorderSizePixel = 0
Test1Page2Features3EnglishLockImage.Visible = true
Test1Page2Features3EnglishLockImage.Image = "rbxassetid://12902154015"
Test1Page2Features3EnglishLockImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features3EnglishLockImage.Parent = Test1PageSection2Phrame

local ToggleEnglishOnly = false;
Test1Page2Features3EnglishLock.MouseButton1Click:Connect(function()
	if Test1Page2Features3EnglishLock.TextColor3 == Color3.fromRGB(255, 255, 255) then
		Test1Page2Features3EnglishLock.TextColor3 = Color3.fromRGB(170, 170, 170)
		Test1Page2Features3EnglishLockImage.ImageColor3 = Color3.fromRGB(170, 170, 170)
		AnnounceBox("English lock is now on!", "ENGLISH LOCK", 5, 60, 160, 60, 255, 255, 255)
		AnnounceBox("Warning this (ENGLISH LOCK) is a beta feature and has a high chance of not working!", "SCRIPT", 5, 255, 255, 255, 255, 255, 255)
		ToggleEnglishOnly = true
	elseif Test1Page2Features3EnglishLock.TextColor3 == Color3.fromRGB(170, 170, 170) then
		AnnounceBox("English lock is now off!", "ENGLISH LOCK", 5, 60, 160, 60, 255, 255, 255)
		Test1Page2Features3EnglishLock.TextColor3 = Color3.fromRGB(255, 255, 255)
		Test1Page2Features3EnglishLockImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
		ToggleEnglishOnly = false
	end
end)

Test1Page2Features3ServerLock = Instance.new("TextButton")
Test1Page2Features3ServerLock.Size = UDim2.new(0, 160, 0, 20)
Test1Page2Features3ServerLock.Position = UDim2.new(0.682, 0, 0.32, 0)
Test1Page2Features3ServerLock.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features3ServerLock.BackgroundTransparency = 0.4
Test1Page2Features3ServerLock.BorderSizePixel = 1
Test1Page2Features3ServerLock.Text = "Server Lock"
Test1Page2Features3ServerLock.TextColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features3ServerLock.TextSize = 8
Test1Page2Features3ServerLock.TextXAlignment = "Center"
Test1Page2Features3ServerLock.Parent = Test1PageSection2Phrame

Test1Page2Features3ServerLockImage = Instance.new("ImageLabel")
Test1Page2Features3ServerLockImage.Size = UDim2.new(0, 20, 0, 20)
Test1Page2Features3ServerLockImage.Position = UDim2.new(0.674, 0, 0.32, 0)
Test1Page2Features3ServerLockImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features3ServerLockImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features3ServerLockImage.BackgroundTransparency = 1
Test1Page2Features3ServerLockImage.BorderSizePixel = 0
Test1Page2Features3ServerLockImage.Visible = true
Test1Page2Features3ServerLockImage.Image = "rbxassetid://284402785"
Test1Page2Features3ServerLockImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features3ServerLockImage.Parent = Test1PageSection2Phrame

local ToggleServerLock = false;
Test1Page2Features3ServerLock.MouseButton1Click:Connect(function()
	if Test1Page2Features3ServerLock.TextColor3 == Color3.fromRGB(255, 255, 255) then
		Test1Page2Features3ServerLock.TextColor3 = Color3.fromRGB(170, 170, 170)
		Test1Page2Features3ServerLockImage.ImageColor3 = Color3.fromRGB(170, 170, 170)
		Test1Page2Features3ServerLockImage.Image = "rbxassetid://284402752"
		AnnounceBox("Server lock is now on!", "SERVER LOCK", 5, 60, 160, 60, 255, 255, 255)
		ToggleServerLock = true
	elseif Test1Page2Features3ServerLock.TextColor3 == Color3.fromRGB(170, 170, 170) then
		AnnounceBox("Server lock is now off!", "SERVER LOCK", 5, 60, 160, 60, 255, 255, 255)
		Test1Page2Features3ServerLock.TextColor3 = Color3.fromRGB(255, 255, 255)
		Test1Page2Features3ServerLockImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
		Test1Page2Features3ServerLockImage.Image = "rbxassetid://284402785"
		ToggleServerLock = false
	end
end)

Test1Page2Features3InvisOnList = Instance.new("TextButton")
Test1Page2Features3InvisOnList.Size = UDim2.new(0, 160, 0, 20)
Test1Page2Features3InvisOnList.Position = UDim2.new(0.682, 0, 0.42, 0)
Test1Page2Features3InvisOnList.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features3InvisOnList.BackgroundTransparency = 0.4
Test1Page2Features3InvisOnList.BorderSizePixel = 1
Test1Page2Features3InvisOnList.Text = "Invis On List"
Test1Page2Features3InvisOnList.TextColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features3InvisOnList.TextSize = 8
Test1Page2Features3InvisOnList.TextXAlignment = "Center"
Test1Page2Features3InvisOnList.Parent = Test1PageSection2Phrame

Test1Page2Features3InvisOnListImage = Instance.new("ImageLabel")
Test1Page2Features3InvisOnListImage.Size = UDim2.new(0, 20, 0, 20)
Test1Page2Features3InvisOnListImage.Position = UDim2.new(0.674, 0, 0.42, 0)
Test1Page2Features3InvisOnListImage.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
Test1Page2Features3InvisOnListImage.BorderColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features3InvisOnListImage.BackgroundTransparency = 1
Test1Page2Features3InvisOnListImage.BorderSizePixel = 0
Test1Page2Features3InvisOnListImage.Visible = true
Test1Page2Features3InvisOnListImage.Image = "rbxassetid://12902136869"
Test1Page2Features3InvisOnListImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
Test1Page2Features3InvisOnListImage.Parent = Test1PageSection2Phrame

local InvisOnListToggle = false;
Test1Page2Features3InvisOnList.MouseButton1Click:Connect(function()
	if Test1Page2Features3InvisOnList.TextColor3 == Color3.fromRGB(255, 255, 255) then
		Test1Page2Features3InvisOnList.TextColor3 = Color3.fromRGB(170, 170, 170)
		Test1Page2Features3InvisOnListImage.ImageColor3 = Color3.fromRGB(170, 170, 170)
		--Notify("[Protection]: Set you as invis on list!", 5, 60, 160, 60)
		AnnounceBox("Set you as invis on list!", "INVISONLIST", 5, 60, 160, 60, 255, 255, 255)
		InvisOnListToggle = true
		fireserver("ChangeParentLocal", LocalPlayer)
	elseif Test1Page2Features3InvisOnList.TextColor3 == Color3.fromRGB(170, 170, 170) then
		--Notify("[Protection]: Set you as visible on list!", 5, 60, 160, 60)
		AnnounceBox("Set you as visible on list!", "INVISONLIST", 5, 60, 160, 60, 255, 255, 255)
		Test1Page2Features3InvisOnList.TextColor3 = Color3.fromRGB(255, 255, 255)
		Test1Page2Features3InvisOnListImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
		InvisOnListToggle = false
		fireserver("ChangeParentLocal", LocalPlayer, game.Players)
	end
end)
--Linked with invisonlist
function BecomeInvisOnList()
    if InvisOnListToggle then
        spawn(function()
        wait(5)
        fireserver("ChangeParentLocal", LocalPlayer)
            if ShowFunctionAlerts then
                --Notify("[ProtectionAlert]: Set you as invis on list!", 5, 130, 130, 60)
		        AnnounceBox("Set you as invis on list!", "INVISONLIST", 5, 130, 130, 60, 255, 255, 255)
            end
        end)
    end
end
--Linked with invisonlist
game.Players.PlayerAdded:connect(BecomeInvisOnList)
game.Players.PlayerRemoving:connect(BecomeInvisOnList)

--frames



--tab stuff
LocalButton.MouseButton1Click:Connect(function()
	if LocalButton.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		LocalButton.ImageColor3 = Color3.fromRGB(60, 95, 60)
		GuiLocalEBarPhrame.Visible = true
		
		Other1PageSection2Phrame.Visible = false
		Tools1PageSection1Phrame.Visible = false
		Tools1PageSection2Phrame.Visible = false
		Tools1PageSection3Phrame.Visible = false
		Settings1PageSection2Phrame.Visible = false
		Other1PageSection1Phrame.Visible = false	
		Other2PageSection2Phrame.Visible = false
		Scripts1PageSection2Phrame.Visible = false
		Server1PageSection2Phrame.Visible = false
		Misc1PageSection2Phrame.Visible = false
		GuiToolsEBarPhrame.Visible = false
		Other2PageSection1Phrame.Visible = false
		GuiServerEBarPhrame.Visible = false
		Local1PageSection2Phrame.Visible = false
		Test1PageSection2Phrame.Visible = false
		GuiOtherEBarPhrame.Visible = false
		LocalTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		SettingsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		MiscButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		TestButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ScripButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		FavoriteButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
OtherButton.MouseButton1Click:Connect(function()
	if OtherButton.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		OtherButton.ImageColor3 = Color3.fromRGB(60, 95, 60)
		GuiOtherEBarPhrame.Visible = true
		
		Other1PageSection2Phrame.Visible = false
		Other1PageSection1Phrame.Visible = false	
		Other2PageSection2Phrame.Visible = false
		Tools1PageSection1Phrame.Visible = false
		Tools1PageSection2Phrame.Visible = false
		Tools1PageSection3Phrame.Visible = false
		Scripts1PageSection2Phrame.Visible = false
		Settings1PageSection2Phrame.Visible = false
		Server1PageSection2Phrame.Visible = false
		Misc1PageSection2Phrame.Visible = false
		GuiServerEBarPhrame.Visible = false
		GuiToolsEBarPhrame.Visible = false
		Other2PageSection1Phrame.Visible = false
		Local1PageSection2Phrame.Visible = false
		Test1PageSection2Phrame.Visible = false
		GuiLocalEBarPhrame.Visible = false
		LocalTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		SettingsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		MiscButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		TestButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ScripButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		FavoriteButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
ServerButton.MouseButton1Click:Connect(function()
	if ServerButton.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		ServerButton.ImageColor3 = Color3.fromRGB(60, 95, 60)
		GuiServerEBarPhrame.Visible = true
		
		Other1PageSection2Phrame.Visible = false
		Other1PageSection1Phrame.Visible = false	
		Other2PageSection2Phrame.Visible = false
		Misc1PageSection2Phrame.Visible = false
		Scripts1PageSection2Phrame.Visible = false
		Settings1PageSection2Phrame.Visible = false
		Tools1PageSection1Phrame.Visible = false
		Tools1PageSection2Phrame.Visible = false
		Tools1PageSection3Phrame.Visible = false
		Server1PageSection2Phrame.Visible = false
		GuiToolsEBarPhrame.Visible = false
		Other2PageSection1Phrame.Visible = false
		Test1PageSection2Phrame.Visible = false
		GuiOtherEBarPhrame.Visible = false
		Local1PageSection2Phrame.Visible = false
		GuiLocalEBarPhrame.Visible = false
		LocalTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		SettingsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		MiscButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		TestButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ScripButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		FavoriteButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
MiscButton.MouseButton1Click:Connect(function()
	if MiscButton.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		MiscButton.ImageColor3 = Color3.fromRGB(60, 95, 60)
		Misc1PageSection2Phrame.Visible = true
		
		Other1PageSection2Phrame.Visible = false
		Other1PageSection1Phrame.Visible = false	
		Other2PageSection2Phrame.Visible = false
		Other2PageSection1Phrame.Visible = false
		Tools1PageSection1Phrame.Visible = false
		Tools1PageSection2Phrame.Visible = false
		Tools1PageSection3Phrame.Visible = false
		Test1PageSection2Phrame.Visible = false
		Settings1PageSection2Phrame.Visible = false
		Server1PageSection2Phrame.Visible = false
		GuiServerEBarPhrame.Visible = false
		Scripts1PageSection2Phrame.Visible = false
		GuiToolsEBarPhrame.Visible = false
		GuiOtherEBarPhrame.Visible = false
		GuiLocalEBarPhrame.Visible = false
		Welcome1PageSection1Phrame.Visible = false
		Local1PageSection2Phrame.Visible = false
		LocalTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		SettingsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		TestButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ScripButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		FavoriteButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
SettingsButton.MouseButton1Click:Connect(function()
	if SettingsButton.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		SettingsButton.ImageColor3 = Color3.fromRGB(60, 95, 60)
		Settings1PageSection2Phrame.Visible = true
		
		Other1PageSection2Phrame.Visible = false
		Other1PageSection1Phrame.Visible = false	
		Other2PageSection2Phrame.Visible = false
		Misc1PageSection2Phrame.Visible = false
		Other2PageSection1Phrame.Visible = false
		Tools1PageSection1Phrame.Visible = false
		Tools1PageSection2Phrame.Visible = false
		Tools1PageSection3Phrame.Visible = false
		Test1PageSection2Phrame.Visible = false
		Server1PageSection2Phrame.Visible = false
		Scripts1PageSection2Phrame.Visible = false
		GuiOtherEBarPhrame.Visible = false
		GuiLocalEBarPhrame.Visible = false
		Welcome1PageSection1Phrame.Visible = false
		GuiToolsEBarPhrame.Visible = false
		Local1PageSection2Phrame.Visible = false
		GuiServerEBarPhrame.Visible = false
		LocalTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		MiscButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		TestButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ScripButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		FavoriteButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
TestButton.MouseButton1Click:Connect(function()
	if TestButton.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		TestButton.ImageColor3 = Color3.fromRGB(60, 95, 60)
		Test1PageSection2Phrame.Visible = true
		
		Other1PageSection2Phrame.Visible = false
		Other1PageSection1Phrame.Visible = false	
		Other2PageSection2Phrame.Visible = false
		Settings1PageSection2Phrame.Visible = false
		Misc1PageSection2Phrame.Visible = false
		Server1PageSection2Phrame.Visible = false
		Tools1PageSection1Phrame.Visible = false
		Tools1PageSection2Phrame.Visible = false
		Tools1PageSection3Phrame.Visible = false
		GuiServerEBarPhrame.Visible = false
		Other2PageSection1Phrame.Visible = false
		Scripts1PageSection2Phrame.Visible = false
		GuiOtherEBarPhrame.Visible = false
		GuiLocalEBarPhrame.Visible = false
		Welcome1PageSection1Phrame.Visible = false
		GuiToolsEBarPhrame.Visible = false
		Local1PageSection2Phrame.Visible = false
		LocalTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		SettingsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		MiscButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ScripButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		FavoriteButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
ToolsButton.MouseButton1Click:Connect(function()
	if ToolsButton.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		ToolsButton.ImageColor3 = Color3.fromRGB(60, 95, 60)
		GuiToolsEBarPhrame.Visible = true
		
		Other1PageSection2Phrame.Visible = false
		Other1PageSection1Phrame.Visible = false	
		Other2PageSection2Phrame.Visible = false
		Other2PageSection1Phrame.Visible = false
		Server1PageSection2Phrame.Visible = false
		Scripts1PageSection2Phrame.Visible = false
		Tools1PageSection1Phrame.Visible = false
		Tools1PageSection2Phrame.Visible = false
		Tools1PageSection3Phrame.Visible = false
		Settings1PageSection2Phrame.Visible = false
		GuiServerEBarPhrame.Visible = false
		Misc1PageSection2Phrame.Visible = false
		Test1PageSection2Phrame.Visible = false
		GuiOtherEBarPhrame.Visible = false
		GuiLocalEBarPhrame.Visible = false
		Local1PageSection2Phrame.Visible = false
		LocalTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		SettingsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		MiscButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		TestButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ScripButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		FavoriteButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
ScripButton.MouseButton1Click:Connect(function()
	if ScripButton.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		ScripButton.ImageColor3 = Color3.fromRGB(60, 95, 60)
		Scripts1PageSection2Phrame.Visible = true
		
		Other1PageSection2Phrame.Visible = false
		Other1PageSection1Phrame.Visible = false	
		Other2PageSection2Phrame.Visible = false
		Other2PageSection1Phrame.Visible = false
		Settings1PageSection2Phrame.Visible = false
		Test1PageSection2Phrame.Visible = false
		GuiOtherEBarPhrame.Visible = false
		Tools1PageSection1Phrame.Visible = false
		Tools1PageSection2Phrame.Visible = false
		Tools1PageSection3Phrame.Visible = false
		GuiLocalEBarPhrame.Visible = false
		Welcome1PageSection1Phrame.Visible = false
		Misc1PageSection2Phrame.Visible = false
		GuiToolsEBarPhrame.Visible = false
		Local1PageSection2Phrame.Visible = false
		GuiServerEBarPhrame.Visible = false
		Server1PageSection2Phrame.Visible = false
		LocalTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		SettingsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		MiscButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		TestButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		FavoriteButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
FavoriteButton.MouseButton1Click:Connect(function()
	if FavoriteButton.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		FavoriteButton.ImageColor3 = Color3.fromRGB(60, 95, 60)
		
		Other1PageSection2Phrame.Visible = false
		Other1PageSection1Phrame.Visible = false	
		Other2PageSection2Phrame.Visible = false
		Other2PageSection1Phrame.Visible = false
		Scripts1PageSection2Phrame.Visible = false
		Tools1PageSection1Phrame.Visible = false
		Tools1PageSection2Phrame.Visible = false
		Tools1PageSection3Phrame.Visible = false
		Test1PageSection2Phrame.Visible = false
		GuiToolsEBarPhrame.Visible = false
		GuiServerEBarPhrame.Visible = false
		Settings1PageSection2Phrame.Visible = false
		GuiOtherEBarPhrame.Visible = false
		GuiLocalEBarPhrame.Visible = false
		Welcome1PageSection1Phrame.Visible = false
		Misc1PageSection2Phrame.Visible = false
		Local1PageSection2Phrame.Visible = false
		Server1PageSection2Phrame.Visible = false
		LocalTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		SettingsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		MiscButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		TestButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ScripButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
--tab stuff



--tab stuff
LocalTab1Button.MouseButton1Click:Connect(function()
	if LocalTab1Button.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		LocalTab1Button.ImageColor3 = Color3.fromRGB(60, 95, 60)
		Local1PageSection2Phrame.Visible = true
		
		Welcome1PageSection1Phrame.Visible = false
		LocalTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
LocalTab2Button.MouseButton1Click:Connect(function()
	if LocalTab2Button.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		LocalTab2Button.ImageColor3 = Color3.fromRGB(60, 95, 60)
		
		Welcome1PageSection1Phrame.Visible = false
		Local1PageSection2Phrame.Visible = false
		LocalTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
LocalTab3Button.MouseButton1Click:Connect(function()
	if LocalTab3Button.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		LocalTab3Button.ImageColor3 = Color3.fromRGB(60, 95, 60)
		
		Welcome1PageSection1Phrame.Visible = false
		Local1PageSection2Phrame.Visible = false
		LocalTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
--tab stuff



--Server tab stuff
ServerTab1Button.MouseButton1Click:Connect(function()
	if ServerTab1Button.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		ServerTab1Button.ImageColor3 = Color3.fromRGB(60, 95, 60)
		Server1PageSection2Phrame.Visible = true
		
		Welcome1PageSection1Phrame.Visible = false
		ServerTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
ServerTab2Button.MouseButton1Click:Connect(function()
	if ServerTab2Button.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		ServerTab2Button.ImageColor3 = Color3.fromRGB(60, 95, 60)
		
		Welcome1PageSection1Phrame.Visible = false
		Server1PageSection2Phrame.Visible = false
		ServerTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
ServerTab3Button.MouseButton1Click:Connect(function()
	if ServerTab3Button.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		ServerTab3Button.ImageColor3 = Color3.fromRGB(60, 95, 60)
		
		Welcome1PageSection1Phrame.Visible = false
		Server1PageSection2Phrame.Visible = false
		ServerTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
--Server tab stuff



--tools tab stuff
ToolsTab1Button.MouseButton1Click:Connect(function()
	if ToolsTab1Button.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		ToolsTab1Button.ImageColor3 = Color3.fromRGB(60, 95, 60)
		Tools1PageSection2Phrame.Visible = true
		Tools1PageSection1Phrame.Visible = true
		Tools1PageSection3Phrame.Visible = true
		
		Welcome1PageSection1Phrame.Visible = false
		ToolsTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
ToolsTab2Button.MouseButton1Click:Connect(function()
	if ToolsTab2Button.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		ToolsTab2Button.ImageColor3 = Color3.fromRGB(60, 95, 60)
		
		Welcome1PageSection1Phrame.Visible = false
		ToolsTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
ToolsTab3Button.MouseButton1Click:Connect(function()
	if ToolsTab3Button.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		ToolsTab3Button.ImageColor3 = Color3.fromRGB(60, 95, 60)
		
		Welcome1PageSection1Phrame.Visible = false
		ToolsTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
--tools tab stuff



--other tab stuff
OtherTab1Button.MouseButton1Click:Connect(function()
	if OtherTab1Button.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		OtherTab1Button.ImageColor3 = Color3.fromRGB(60, 95, 60)
		Other1PageSection1Phrame.Visible = true
		Other1PageSection2Phrame.Visible = true

		Welcome1PageSection1Phrame.Visible = false	
		Other2PageSection2Phrame.Visible = false
		Scripts1PageSection2Phrame.Visible = false
		Other2PageSection1Phrame.Visible = false
		Local1PageSection2Phrame.Visible = false
		OtherTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
OtherTab2Button.MouseButton1Click:Connect(function()
	if OtherTab2Button.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		OtherTab2Button.ImageColor3 = Color3.fromRGB(60, 95, 60)	
		Other2PageSection2Phrame.Visible = true
		Other2PageSection1Phrame.Visible = true
		
		Other1PageSection2Phrame.Visible = false
		Welcome1PageSection1Phrame.Visible = false
		Scripts1PageSection2Phrame.Visible = false
		Local1PageSection2Phrame.Visible = false
		Other1PageSection1Phrame.Visible = false	
		OtherTab3Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
OtherTab3Button.MouseButton1Click:Connect(function()
	if OtherTab3Button.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		OtherTab3Button.ImageColor3 = Color3.fromRGB(60, 95, 60)
		
		Other1PageSection2Phrame.Visible = false
		Welcome1PageSection1Phrame.Visible = false
		Scripts1PageSection2Phrame.Visible = false
		Other1PageSection1Phrame.Visible = false	
		Other2PageSection2Phrame.Visible = false
		Other2PageSection1Phrame.Visible = false
		Local1PageSection2Phrame.Visible = false
		OtherTab1Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
		OtherTab2Button.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
--other tab stuff



--script end
ZeroPhrame:TweenPosition(UDim2.new(0.4, 0, 0.2),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,1.5,true)
IdkButton.MouseButton1Click:Connect(function()
	if Welcome1PageSection1Phrame.Visible == false then
		Welcome1PageSection1Phrame.Visible = true
		
		GuiLocalEBarPhrame.Visible = false	
		Other1PageSection2Phrame.Visible = false
		Other1PageSection1Phrame.Visible = false
		Settings1PageSection2Phrame.Visible = false	
		Other2PageSection2Phrame.Visible = false
		Other2PageSection1Phrame.Visible = false
		Test1PageSection2Phrame.Visible = false
		Scripts1PageSection2Phrame.Visible = false
		Local1PageSection2Phrame.Visible = false
		Misc1PageSection2Phrame.Visible = false
		GuiOtherEBarPhrame.Visible = false
		Server1PageSection2Phrame.Visible = false
		GuiServerEBarPhrame.Visible = false
		GuiToolsEBarPhrame.Visible = false
		OtherButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		SettingsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		MiscButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		TestButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ScripButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		FavoriteButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	else
		Welcome1PageSection1Phrame.Visible = false
		
		GuiLocalEBarPhrame.Visible = false
		Misc1PageSection2Phrame.Visible = false
		GuiToolsEBarPhrame.Visible = false
		Other1PageSection2Phrame.Visible = false
		Other1PageSection1Phrame.Visible = false	
		Other2PageSection2Phrame.Visible = false
		Other2PageSection1Phrame.Visible = false
		Settings1PageSection2Phrame.Visible = false
		Test1PageSection2Phrame.Visible = false
		Scripts1PageSection2Phrame.Visible = false
		Local1PageSection2Phrame.Visible = false
		GuiOtherEBarPhrame.Visible = false
		Server1PageSection2Phrame.Visible = false
		GuiServerEBarPhrame.Visible = false
		OtherButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ServerButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		SettingsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		MiscButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		TestButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ToolsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		ScripButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		FavoriteButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
		LocalButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
	
CopyButton.MouseButton1Click:Connect(function()
	--Notify("[Save]: Copied discord link to your clipboard!", 5, 70, 70, 255)
	AnnounceBox("Copied discord link to your clipboard!", "SAVE", 5, 70, 70, 255, 255, 255, 255)
end)

RestoreFromMinimizeButton = Instance.new("ImageButton")
RestoreFromMinimizeButton.Size = UDim2.new(0, 25, 0, 25)
RestoreFromMinimizeButton.Position = UDim2.new(0.75, 0, 0, 0)
RestoreFromMinimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
RestoreFromMinimizeButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
RestoreFromMinimizeButton.BackgroundTransparency = 1
RestoreFromMinimizeButton.BorderSizePixel = 1
RestoreFromMinimizeButton.Visible = false
RestoreFromMinimizeButton.Image = "rbxassetid://12902044900"
RestoreFromMinimizeButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
RestoreFromMinimizeButton.Parent = ZeroPhrame
--Linked with minimizeButton
MinimizeButton.MouseButton1Click:Connect(function()
	--Notify("[Fail]: Failed to minize gui!", 5, 95, 60, 60)
	AnnounceBox("Minizeing gui!", "MINIMIZE", 5, 60, 160, 60, 255, 255, 255)
	ZeroPhrame:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.In,Enum.EasingStyle.Sine,1,true,callback)
	wait(0.5)
    for i, v in pairs(GuiPhrame:GetChildren()) do
        v.Visible = false
    end
    for i, v in pairs(GuiTabBarPhrame:GetChildren()) do
        v.Visible = false
    end
    for i, v in pairs(GuiBarPhrame:GetChildren()) do
        v.Visible = false
    end
	wait(0.5)
	RestoreFromMinimizeButton.Visible = true
end)
--Linked with minimizeButton
RestoreFromMinimizeButton.MouseButton1Click:Connect(function()
    AnnounceBox("Restoring gui!", "MINIMIZE", 5, 60, 160, 60, 255, 255, 255)
    --AnnounceBox("Waiting 5 seconds before destroying UI!", "SCRIPT", 5, 255, 255, 255, 255, 255, 255)
    ZeroPhrame:TweenSize(UDim2.new(0, 600, 0, 300),Enum.EasingDirection.In,Enum.EasingStyle.Sine,1,true,callback)
    RestoreFromMinimizeButton.Visible = false
    --wait(5)
    --MainGui:destroy()
    wait(0.5)
    for i, v in pairs(GuiPhrame:GetChildren()) do
        v.Visible = true
    end
    for i, v in pairs(GuiTabBarPhrame:GetChildren()) do
        v.Visible = true
    end
    for i, v in pairs(GuiBarPhrame:GetChildren()) do
        v.Visible = true
    end
    wait(0.5)
	Welcome1PageSection1Phrame.Visible = true
		
	GuiLocalEBarPhrame.Visible = false	
	Other1PageSection2Phrame.Visible = false
	Other1PageSection1Phrame.Visible = false
	Settings1PageSection2Phrame.Visible = false	
	Other2PageSection2Phrame.Visible = false
	Other2PageSection1Phrame.Visible = false
	Test1PageSection2Phrame.Visible = false
	Scripts1PageSection2Phrame.Visible = false
	Local1PageSection2Phrame.Visible = false
	Misc1PageSection2Phrame.Visible = false
	GuiOtherEBarPhrame.Visible = false
	Server1PageSection2Phrame.Visible = false
	GuiServerEBarPhrame.Visible = false
	GuiToolsEBarPhrame.Visible = false
	OtherButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	ServerButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	SettingsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	MiscButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	TestButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	ToolsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	ScripButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	FavoriteButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	LocalButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
end)

ExitButton.MouseButton1Click:Connect(function()
    AnnounceBox("Thank you for using Agony!", "GOODBYE!", 5, 70, 70, 255, 255, 255, 255)
	ZeroPhrame:TweenPosition(UDim2.new(0,-900,0,-900),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,1.5,true)
	wait(1.5)
	MainGui:destroy()
	--LocalPlayer:Kick("!")
end)

local isButtonDown = false
local mouseStartPosition = nil
local function onInputBegan(input, gameProcessedEvent)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isButtonDown = true
        mouseStartPosition = input.Position.X
    end
end
local function onInputEnded(input, gameProcessedEvent)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isButtonDown = false
        mouseStartPosition = nil
    end
end
local function onInputChanged(input, gameProcessedEvent)
    if not isButtonDown or not mouseStartPosition then
        return
    end
    
    local mousePosition = input.Position.X
    local mouseDelta = mousePosition - mouseStartPosition
    
    local Count = 0
    if mouseDelta > 0 then
        Count = Count+25
        ZeroPhrame:TweenSize(UDim2.new(0, math.floor(600+Count), 0, math.floor(300+Count)),Enum.EasingDirection.In,Enum.EasingStyle.Sine,1,true,callback)
    elseif mouseDelta < 0 then
        Count = Count-25
        ZeroPhrame:TweenSize(UDim2.new(0, math.floor(600+Count), 0, math.floor(300+Count)),Enum.EasingDirection.In,Enum.EasingStyle.Sine,1,true,callback)
    end
end
ResizeButton.MouseButton1Down:Connect(function()
    if ResizeButton.ImageColor3 == Color3.fromRGB(110, 110, 110) then
        ResizeButtonPhrame.Visible = true
        ResizeButton.ImageColor3 = Color3.fromRGB(170, 170, 170)
        AnnounceBox("Enabled gui resizing!", "SCRIPT", 5, 255, 255, 255, 255, 255, 255)
    else
        ResizeButtonPhrame.Visible = false
        ResizeButton.ImageColor3 = Color3.fromRGB(110, 110, 110)
        AnnounceBox("Disabled gui resizing!", "SCRIPT", 5, 255, 255, 255, 255, 255, 255)
    end
end)

ResizeButtonPhrameButton.MouseButton1Click:Connect(function()
    UserInputService.InputBegan:Connect(onInputBegan)
    UserInputService.InputEnded:Connect(onInputEnded)
    UserInputService.InputChanged:Connect(onInputChanged)
end)

game.Players.PlayerAdded:Connect(function(player)
    ValidateAccountAge(player)
	ValidateUserPremium(player)
    if ShowJoinAlerts then
        AnnounceBox(player.Name.." has joined! (" .. player.AccountAge .. ")", "JOIN", 2, 255, 255, 255, 255, 255, 255)
    end
	if ToggleServerLock then
		AnnounceBox("Kicked " .. player.Name .. " player joined while server lock is on!", "SERVER LOCK", 5, 130, 130, 60, 255, 255, 255)
		Kick(player)
	end
	if ToggleEnglishOnly then
		player.Chatted:Connect(function(message)
			if message:match("[А-Яа-яЁёÖöÜüÄäÕõ]+") then
				if player ~= LocalPlayer then
					if ShowFunctionAlerts then
						AnnounceBox("Kicked " .. player.. " player spoke in another language than english!", "ENGLISH LOCK", 5, 130, 130, 60, 255, 255, 255)
					end
					Kick(player)
				end
			end
		end)
	end
end)

game.Players.PlayerRemoving:Connect(function(player)
    if ShowLeaveAlerts then
        AnnounceBox(player.Name.." has left! (" .. player.AccountAge .. ")", "LEAVE", 2, 255, 255, 255, 255, 255, 255)
    end
end)

local Other1OldSelectedPlayer = ""
local Other1Page2Features2PKGodprevStatus = ""
local Other1Page2Features2ToggleVestprevStatus = ""
function UpdateOtherTab1Statuses()
    local SPlayer = game.Players:FindFirstChild(LocalTab1SelectedPlayer)
    if LocalTab1SelectedPlayer ~= nil and LocalTab1SelectedPlayer ~= "nan" and LocalTab1SelectedPlayer ~= "" then
        if SPlayer.Character:FindFirstChild("Humanoid") and SPlayer.Character.Humanoid:FindFirstChild("DefenseMultiplier") and tonumber(SPlayer.Character.Humanoid.DefenseMultiplier.Value) <= 0 then
            if Other1Page2Features2PKGodprevStatus ~= "UnGod" then
                Other1Page2Features2PKGod.Text = "UnGod"
                Other1Page2Features2PKGodprevStatus = "UnGod"
            end
        else
            if Other1Page2Features2PKGodprevStatus ~= "God" then
                Other1Page2Features2PKGod.Text = "God"
                Other1Page2Features2PKGodprevStatus = "God"
            end
        end
        
        if Other1LastModifiedInvisPlayer == LocalTab1SelectedPlayer and Other1Page2Features3InvisImage.Image == "rbxassetid://12900717295" then
            Other1Page2Features3InvisImage.Image = "rbxassetid://12900770221"
            Other1LastModifiedInvisPlayer = ""
        elseif Other1OldSelectedPlayer ~= LocalTab1SelectedPlayer and Other1LastModifiedInvisPlayer ~= LocalTab1SelectedPlayer then
            Other1Page2Features3InvisImage.Image = "rbxassetid://12900717295"
        end
        
        if Other1LastModifiedZInvisPlayer == LocalTab1SelectedPlayer and Other1Page2Features3ZIvisImage.Image == "rbxassetid://12900717295" then
            Other1Page2Features3ZIvisImage.Image = "rbxassetid://12900770221"
            Other1LastModifiedZInvisPlayer = ""
        elseif Other1OldSelectedPlayer ~= LocalTab1SelectedPlayer and Other1LastModifiedZInvisPlayer ~= LocalTab1SelectedPlayer then
            Other1Page2Features3ZIvisImage.Image = "rbxassetid://12900717295"
        end
    
        if Other1LastModifiedFreezedPlayer == LocalTab1SelectedPlayer and Other1Page2FeaturesFreeze.Text == "Freeze" then
            Other1Page2FeaturesFreeze.Text = "UnFreeze"
            Other1LastModifiedFreezedPlayer = ""
        elseif Other1OldSelectedPlayer ~= LocalTab1SelectedPlayer and Other1LastModifiedFreezedPlayer ~= LocalTab1SelectedPlayer then
            Other1Page2FeaturesFreeze.Text = "Freeze"
        end
		
		local hasvest = false;
		for i, v in pairs(Lighting.PlayerVests:GetChildren()) do
			if SPlayer:FindFirstChild(v.Name) then
				hasvest = true
			end    
		end
        if hasvest then
            if Other1Page2Features2ToggleVestprevStatus ~= "Add Vest" then
                Other1Page2Features2ToggleVest.Text = "Add Vest"
                Other1Page2Features2ToggleVestprevStatus = "Add Vest"
            end
        else
            if Other1Page2Features2ToggleVestprevStatus ~= "Rem Vest" then
                Other1Page2Features2ToggleVest.Text = "Rem Vest"
                Other1Page2Features2ToggleVestprevStatus = "Rem Vest"
            end
        end
        
		for i, v in pairs(AnnnounceFrame:GetChildren()) do
			if v ~= AnnouncementLabel and v ~= TopAnnouncementLabel and v ~= AnnnounceMessageBox and v ~= AnnnounceMessageBoxPersonal then 
				v.Position = UDim2.new(0, 0, 0, -AnnnounceFrame.Size.Y.Offset*(#AnnnounceFrame:GetChildren()-(i)))
			end
		end
        Other1OldSelectedPlayer = LocalTab1SelectedPlayer
    end
end

spawn(function()
	while wait(0.1) do
        UpdateOtherTab1Statuses()
	end
end)

AnnounceBox("Script is in beta, bugs may occur!", "SCRIPT", 15, 255, 255, 255, 255, 255, 255)
AnnounceBox("Don't spam buttons they will cause you to short term lag!", "SCRIPT", 15, 255, 255, 255, 255, 255, 255)
OSend = os.time()
FinalOStime = (OSend-OSstart)
AnnounceBox("Loaded in "..tostring(FinalOStime).."s!", "SCRIPT", 5, 255, 255, 255, 255, 255, 255)
--[[ Req Features --]]

end)
if success then
    --[[rconsoleprint("@@GREEN@@")
    rconsoleprint("[Success] " .. "script works!.\n")
    rconsoleprint("@@YELLOW@@")
    rconsoleprint("[Check] " .. tostring(result) .. "\n")--]]
else
    --[[rconsoleprint("@@RED@@")
    rconsoleprint("[Error] " .. tostring(result) .. "\n")--]]
	AnnounceBox("Error detected " .. tostring(result) .. "", "SCRIPT", 20, 255, 255, 255, 255, 255, 255)
end
