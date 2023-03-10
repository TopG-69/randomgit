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

--[[ Req Features --]]
local MainGui = Instance.new("ScreenGui")
MainGui.Name = "ApocGui"
MainGui.Parent = game.CoreGui

local ZeroPhrame = Instance.new("Frame")
ZeroPhrame.Size = UDim2.new(0, 300, 0, 200)
ZeroPhrame.Position = UDim2.new(0, 200, 0, 200)
ZeroPhrame.BorderSizePixel = 5
ZeroPhrame.Transparency = 1
ZeroPhrame.Draggable = true
ZeroPhrame.Active = true
ZeroPhrame.Selectable = true
ZeroPhrame.Parent = MainGui
--[[ Req Features --]]



--[[ Gui Features --]]
local MinimiseButtonPhrame = Instance.new("Frame")
MinimiseButtonPhrame.Size = UDim2.new(0, 44, 0, 44)
MinimiseButtonPhrame.Position = UDim2.new(0.485, 0, 0, 0)
MinimiseButtonPhrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MinimiseButtonPhrame.Style = 3
MinimiseButtonPhrame.BorderSizePixel = 5
MinimiseButtonPhrame.Transparency = 0.1
MinimiseButtonPhrame.Active = false
MinimiseButtonPhrame.Visible = false
MinimiseButtonPhrame.Selectable = true
MinimiseButtonPhrame.Parent = MainGui

local MinimiseRestroreButton = Instance.new("TextButton")
MinimiseRestroreButton.Size = UDim2.new(0, 34, 0, 34)
MinimiseRestroreButton.Position = UDim2.new(0, -3, 0, -3)
MinimiseRestroreButton.BorderColor3 = Color3.fromRGB(255,0, 0)
MinimiseRestroreButton.Text = "✖️"
MinimiseRestroreButton.BorderSizePixel = 1
MinimiseRestroreButton.Transparency = 0
MinimiseRestroreButton.BackgroundTransparency = 0.9
MinimiseRestroreButton.TextSize = 20
MinimiseRestroreButton.TextXAlignment = "Center"
MinimiseRestroreButton.Parent = MinimiseButtonPhrame

MinimiseRestroreButton.MouseButton1Click:Connect(function()
	if MinimiseRestroreButton.Text == "✖️" then
		MinimiseRestroreButton.Text = "➕"
		MinimiseRestroreButton.BorderColor3 = Color3.fromRGB(0, 255, 255)
		wait(0.1)
		MinimiseRestroreButton.Text = "✖️"
		MinimiseButtonPhrame.Active = false
		MinimiseButtonPhrame.Visible = false
		ZeroPhrame.Visible = true
		ZeroPhrame.Active = true
	end
end)

local BarPhrame = Instance.new("Frame")
BarPhrame.Size = UDim2.new(1, 0, 0.12, 0)
BarPhrame.Position = UDim2.new(0, 0, 0, 0)
BarPhrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BarPhrame.BorderSizePixel = 0
BarPhrame.Transparency = 0.2
BarPhrame.Active = true
BarPhrame.Selectable = true
BarPhrame.Parent = ZeroPhrame

local BarText = Instance.new("TextLabel")
BarText.Size = UDim2.new(1, 0, 1, 0)
BarText.Position = UDim2.new(0.01, 0, 0, 0)
BarText.BorderSizePixel = 0
BarText.Text = "Agony"
BarText.Transparency = 0.1
BarText.TextColor3 = Color3.fromRGB(255,255,255)
BarText.TextSize = 9
BarText.BackgroundTransparency = 1
BarText.TextXAlignment = "Left"
BarText.Parent = BarPhrame
--// linked
local BarText = Instance.new("TextLabel")
BarText.Size = UDim2.new(1, 0, 1, 0)
BarText.Position = UDim2.new(0.13, 0, 0, 0)
BarText.BorderSizePixel = 0
BarText.Text = "Loader"
BarText.TextColor3 = Color3.fromRGB(0,255,255)
BarText.Transparency = 0.1
BarText.TextSize = 9
BarText.BackgroundTransparency = 1
BarText.TextXAlignment = "Left"
BarText.Parent = BarPhrame

local ExitGuiButton = Instance.new("TextButton")
ExitGuiButton.Size = UDim2.new(0, 20, 0, 20)
ExitGuiButton.Position = UDim2.new(0.915, 0, 0.1, 0)
ExitGuiButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ExitGuiButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
ExitGuiButton.Text = "✖️"
ExitGuiButton.BorderSizePixel = 0
ExitGuiButton.Transparency = 0
ExitGuiButton.BackgroundTransparency = 0.9
ExitGuiButton.TextColor3 = Color3.fromRGB(255,255, 255)
ExitGuiButton.TextSize = 12
ExitGuiButton.TextXAlignment = "Center"
ExitGuiButton.Parent = BarPhrame

ExitGuiButton.MouseButton1Click:Connect(function()
MainGui:destroy()
end)

local MinimiseGuiButton = Instance.new("TextButton")
MinimiseGuiButton.Size = UDim2.new(0, 20, 0, 20)
MinimiseGuiButton.Position = UDim2.new(0.84, 0, 0.1, 0)
MinimiseGuiButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MinimiseGuiButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
MinimiseGuiButton.Text = "➖"
MinimiseGuiButton.BorderSizePixel = 0
MinimiseGuiButton.Transparency = 0
MinimiseGuiButton.BackgroundTransparency = 0.9
MinimiseGuiButton.TextColor3 = Color3.fromRGB(255,255, 255)
MinimiseGuiButton.TextSize = 12
MinimiseGuiButton.TextXAlignment = "Center"
MinimiseGuiButton.Parent = BarPhrame

MinimiseGuiButton.MouseButton1Click:Connect(function()
MinimiseButtonPhrame.Active = true
MinimiseButtonPhrame.Visible = true
ZeroPhrame.Visible = false
ZeroPhrame.Active = false
end)

local LoadingBar = Instance.new("TextButton")
LoadingBar.Size = UDim2.new(0, 0, 0, 10)
LoadingBar.Position = UDim2.new(0.48, 0, 0.28, 0)
LoadingBar.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
LoadingBar.BorderColor3 = Color3.fromRGB(255, 255, 255)
LoadingBar.Text = ""
LoadingBar.BorderSizePixel = 0
LoadingBar.Transparency = 0
LoadingBar.BackgroundTransparency = 0.9
LoadingBar.TextColor3 = Color3.fromRGB(255,255, 255)
LoadingBar.TextSize = 8
LoadingBar.TextXAlignment = "Center"
LoadingBar.Parent = BarPhrame

local LoadingFill = Instance.new("TextButton")
LoadingFill.Size = UDim2.new(0, 100, 0, 10)
LoadingFill.Position = UDim2.new(0.48, 0, 0.28, 0)
LoadingFill.BorderColor3 = Color3.fromRGB(190, 190, 190)
LoadingFill.Text = "0/100%"
LoadingFill.BorderSizePixel = 1
LoadingFill.Transparency = 0
LoadingFill.BackgroundTransparency = 0.9
LoadingFill.TextColor3 = Color3.fromRGB(255,255, 255)
LoadingFill.TextSize = 7
LoadingFill.TextXAlignment = "Center"
LoadingFill.Parent = BarPhrame

local InfoPhrame = Instance.new("Frame")
InfoPhrame.Size = UDim2.new(1, 0, 1, 0)
InfoPhrame.Position = UDim2.new(0, 0, 0.12, 0)
InfoPhrame.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
InfoPhrame.BorderSizePixel = 0
InfoPhrame.Transparency = 0.3
InfoPhrame.Active = true
InfoPhrame.Selectable = true
InfoPhrame.Parent = ZeroPhrame

local BarPhrameB = Instance.new("Frame")
BarPhrameB.Size = UDim2.new(0.55, 0, 0.12, 0)
BarPhrameB.Position = UDim2.new(1.05, 0, 0, 0)
BarPhrameB.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BarPhrameB.BorderSizePixel = 0
BarPhrameB.Transparency = 0.2
BarPhrameB.Active = false
BarPhrameB.Selectable = true
BarPhrameB.Visible = false
BarPhrameB.Parent = ZeroPhrame

local InfoPhrameB = Instance.new("ScrollingFrame")
InfoPhrameB.Size = UDim2.new(0.55, 0, 0.6, 0)
InfoPhrameB.Position = UDim2.new(1.05, 0, 0.12, 0)
InfoPhrameB.BackgroundColor3 = Color3.fromRGB(60, 60, 95)
InfoPhrameB.Active = false
InfoPhrameB.Selectable = true
InfoPhrameB.BorderSizePixel = 0
InfoPhrameB.Transparency = 0.3
InfoPhrameB.BackgroundTransparency = 0.4
InfoPhrameB.Visible = false
InfoPhrameB.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
InfoPhrameB.ScrollBarThickness = 4
InfoPhrameB.Parent = ZeroPhrame

local InfoPhrameC = Instance.new("Frame")
InfoPhrameC.Size = UDim2.new(0.55, 0, 0.385, 0)
InfoPhrameC.Position = UDim2.new(1.05, 0, 0.735, 0)
InfoPhrameC.BackgroundColor3 = Color3.fromRGB(60, 60, 95)
InfoPhrameC.Active = false
InfoPhrameC.Selectable = true
InfoPhrameC.BorderSizePixel = 0
InfoPhrameC.Transparency = 0.3
InfoPhrameC.BackgroundTransparency = 0.4
InfoPhrameC.Visible = false
InfoPhrameC.Parent = ZeroPhrame

local InfoPhrameCText = Instance.new("TextLabel")
InfoPhrameCText.Size = UDim2.new(0.01, 0, 0.01, 0)
InfoPhrameCText.Position = UDim2.new(0.08, 0, 0.12, 0)
InfoPhrameCText.BorderSizePixel = 0
InfoPhrameCText.Text = "concrats you found this text"
InfoPhrameCText.TextColor3 = Color3.fromRGB(255,255,255)
InfoPhrameCText.TextSize = 7
InfoPhrameCText.BackgroundTransparency = 1
InfoPhrameCText.TextXAlignment = "Left"
InfoPhrameCText.Parent = InfoPhrameC

local InfoPhrameCText = Instance.new("TextLabel")
InfoPhrameCText.Size = UDim2.new(0.01, 0, 0.01, 0)
InfoPhrameCText.Position = UDim2.new(0.08, 0, 0.27, 0)
InfoPhrameCText.BorderSizePixel = 0
InfoPhrameCText.Text = "now you can idk do something"
InfoPhrameCText.TextColor3 = Color3.fromRGB(255,255,255)
InfoPhrameCText.TextSize = 7
InfoPhrameCText.BackgroundTransparency = 1
InfoPhrameCText.TextXAlignment = "Left"
InfoPhrameCText.Parent = InfoPhrameC

local InfoPhrameCText = Instance.new("TextLabel")
InfoPhrameCText.Size = UDim2.new(0.01, 0, 0.01, 0)
InfoPhrameCText.Position = UDim2.new(0.08, 0, 0.42, 0)
InfoPhrameCText.BorderSizePixel = 0
InfoPhrameCText.Text = "with this text ig :skull:"
InfoPhrameCText.TextColor3 = Color3.fromRGB(255,255,255)
InfoPhrameCText.TextSize = 7
InfoPhrameCText.BackgroundTransparency = 1
InfoPhrameCText.TextXAlignment = "Left"
InfoPhrameCText.Parent = InfoPhrameC

local BarTextB = Instance.new("TextLabel")
BarTextB.Size = UDim2.new(1, 0, 1, 0)
BarTextB.Position = UDim2.new(0, 0, 0, 0)
BarTextB.BorderSizePixel = 0
BarTextB.Text = "Info Section"
BarTextB.TextColor3 = Color3.fromRGB(255,255,255)
BarTextB.Transparency = 0.1
BarTextB.TextSize = 9
BarTextB.BackgroundTransparency = 1
BarTextB.TextXAlignment = "Center"
BarTextB.Parent = BarPhrameB

local ExentsionBarPlayersText = Instance.new("TextLabel")
ExentsionBarPlayersText.Size = UDim2.new(0.01, 0, 0.01, 0)
ExentsionBarPlayersText.Position = UDim2.new(0.08, 0, 0.03, 0)
ExentsionBarPlayersText.BorderSizePixel = 0
ExentsionBarPlayersText.Text = "(Players) - "..tostring(#game.Players:GetPlayers())
ExentsionBarPlayersText.TextColor3 = Color3.fromRGB(255,255,255)
ExentsionBarPlayersText.TextSize = 8
ExentsionBarPlayersText.BackgroundTransparency = 1
ExentsionBarPlayersText.TextXAlignment = "Left"
ExentsionBarPlayersText.Parent = InfoPhrameB

local ExentsionBarText = Instance.new("TextLabel")
ExentsionBarText.Size = UDim2.new(0.01, 0, 0.01, 0)
ExentsionBarText.Position = UDim2.new(0.08, 0, 0.08, 0)
ExentsionBarText.BorderSizePixel = 0
ExentsionBarText.Text = "(Users) - nil"
ExentsionBarText.TextColor3 = Color3.fromRGB(255,255,255)
ExentsionBarText.TextSize = 8
ExentsionBarText.BackgroundTransparency = 1
ExentsionBarText.TextXAlignment = "Left"
ExentsionBarText.Parent = InfoPhrameB

local ExentsionBarText = Instance.new("TextLabel")
ExentsionBarText.Size = UDim2.new(0.01, 0, 0.01, 0)
ExentsionBarText.Position = UDim2.new(0.08, 0, 0.13, 0)
ExentsionBarText.BorderSizePixel = 0
ExentsionBarText.Text = "(ID) - nil"
ExentsionBarText.TextColor3 = Color3.fromRGB(255,255,255)
ExentsionBarText.TextSize = 8
ExentsionBarText.BackgroundTransparency = 1
ExentsionBarText.TextXAlignment = "Left"
ExentsionBarText.Parent = InfoPhrameB

local ExentsionBarText = Instance.new("TextLabel")
ExentsionBarText.Size = UDim2.new(0.01, 0, 0.01, 0)
ExentsionBarText.Position = UDim2.new(0.08, 0, 0.18, 0)
ExentsionBarText.BorderSizePixel = 0
ExentsionBarText.Text = "(Ping) - ".."nil ms"--Game.Players.LocalPlayer.Name:GetNetworkPing().." ms"
ExentsionBarText.TextColor3 = Color3.fromRGB(255,255,255)
ExentsionBarText.TextSize = 8
ExentsionBarText.BackgroundTransparency = 1
ExentsionBarText.TextXAlignment = "Left"
ExentsionBarText.Parent = InfoPhrameB

local ExentsionBarText = Instance.new("TextLabel")
ExentsionBarText.Size = UDim2.new(0.01, 0, 0.01, 0)
ExentsionBarText.Position = UDim2.new(0.08, 0, 0.23, 0)
ExentsionBarText.BorderSizePixel = 0
ExentsionBarText.Text = "(Loadtime) - "..tostring(ScriptLoadTime).." ms"
ExentsionBarText.TextColor3 = Color3.fromRGB(255,255,255)
ExentsionBarText.TextSize = 8
ExentsionBarText.BackgroundTransparency = 1
ExentsionBarText.TextXAlignment = "Left"
ExentsionBarText.Parent = InfoPhrameB

local UpdateLogPhrame = Instance.new("ScrollingFrame")
UpdateLogPhrame.Size = UDim2.new(0.9, 0, 0.9, 0)
UpdateLogPhrame.Position = UDim2.new(0, 0.01, 0.05, 0)
UpdateLogPhrame.BackgroundColor3 = Color3.fromRGB(60, 60, 95)
UpdateLogPhrame.BorderSizePixel = 0
UpdateLogPhrame.Transparency = 0.3
UpdateLogPhrame.BackgroundTransparency = 0.4
UpdateLogPhrame.Active = true
UpdateLogPhrame.Selectable = true
UpdateLogPhrame.Visible = true
UpdateLogPhrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
UpdateLogPhrame.ScrollBarThickness = 4
UpdateLogPhrame.Parent = InfoPhrame

local ErrorLogPhrame = Instance.new("ScrollingFrame")
ErrorLogPhrame.Size = UDim2.new(0.9, 0, 0.9, 0)
ErrorLogPhrame.Position = UDim2.new(0, 0.01, 0.05, 0)
ErrorLogPhrame.BackgroundColor3 = Color3.fromRGB(60, 60, 95)
ErrorLogPhrame.BorderSizePixel = 0
ErrorLogPhrame.Transparency = 0.3
ErrorLogPhrame.BackgroundTransparency = 0.4
ErrorLogPhrame.Active = false
ErrorLogPhrame.Selectable = true
ErrorLogPhrame.Visible = false
ErrorLogPhrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
ErrorLogPhrame.ScrollBarThickness = 4
ErrorLogPhrame.Parent = InfoPhrame

local ScriptPhrameB = Instance.new("ScrollingFrame")
ScriptPhrameB.Size = UDim2.new(0.9, 0, 0.9, 0)
ScriptPhrameB.Position = UDim2.new(0, 0.01, 0.05, 0)
ScriptPhrameB.BackgroundColor3 = Color3.fromRGB(60, 60, 95)
ScriptPhrameB.BorderSizePixel = 0
ScriptPhrameB.Transparency = 0.3
ScriptPhrameB.BackgroundTransparency = 0.4
ScriptPhrameB.Active = false
ScriptPhrameB.Selectable = true
ScriptPhrameB.Visible = false
ScriptPhrameB.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
ScriptPhrameB.ScrollBarThickness = 4
ScriptPhrameB.Parent = InfoPhrame
--[[ Gui Features --]]



--[[ Error Log Text --]]
local UpdateLabelError = Instance.new("TextLabel")
UpdateLabelError.Size = UDim2.new(0, 0, 0, 0)
UpdateLabelError.Position = UDim2.new(0.5, 0, 0.05, 0)
UpdateLabelError.BorderSizePixel = 0
UpdateLabelError.Text = "(Catching Errors)"
UpdateLabelError.TextColor3 = Color3.fromRGB(255,255,255)
UpdateLabelError.TextSize = 8
UpdateLabelError.TextXAlignment = "Center"
UpdateLabelError.Parent = ErrorLogPhrame

local UpdateLabelScript = Instance.new("TextLabel")
UpdateLabelScript.Size = UDim2.new(0, 0, 0, 0)
UpdateLabelScript.Position = UDim2.new(0.5, 0, 0.1, 0)
UpdateLabelScript.BorderSizePixel = 0
UpdateLabelScript.Text = "-"
UpdateLabelScript.TextColor3 = Color3.fromRGB(255,255,255)
UpdateLabelScript.TextSize = 8
UpdateLabelScript.TextXAlignment = "Center"
UpdateLabelScript.Parent = ErrorLogPhrame

local UpdateLabelInfo1 = Instance.new("TextLabel")
UpdateLabelInfo1.Size = UDim2.new(0, 0, 0, 0)
UpdateLabelInfo1.Position = UDim2.new(0.5, 0, 0.15, 0)
UpdateLabelInfo1.BorderSizePixel = 0
UpdateLabelInfo1.Text = "-"
UpdateLabelInfo1.TextColor3 = Color3.fromRGB(255,255,255)
UpdateLabelInfo1.TextSize = 8
UpdateLabelInfo1.TextXAlignment = "Center"
UpdateLabelInfo1.Parent = ErrorLogPhrame

local UpdateLabelInfo2 = Instance.new("TextLabel")
UpdateLabelInfo2.Size = UDim2.new(0, 0, 0, 0)
UpdateLabelInfo2.Position = UDim2.new(0.5, 0, 0.2, 0)
UpdateLabelInfo2.BorderSizePixel = 0
UpdateLabelInfo2.Text = "-"
UpdateLabelInfo2.TextColor3 = Color3.fromRGB(255,255,255)
UpdateLabelInfo2.TextSize = 8
UpdateLabelInfo2.TextXAlignment = "Center"
UpdateLabelInfo2.Parent = ErrorLogPhrame
--[[ Error Log Text --]]



--[[ Info Bar Buttons --]]
local ErrorUpdateButton = Instance.new("TextButton")
ErrorUpdateButton.Size = UDim2.new(0, 20, 0, 20)
ErrorUpdateButton.Position = UDim2.new(0.915, 0, 0.05, 0)
ErrorUpdateButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
ErrorUpdateButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
ErrorUpdateButton.Text = "1/3"
ErrorUpdateButton.BackgroundTransparency = 0.4
ErrorUpdateButton.BorderSizePixel = 0
ErrorUpdateButton.Transparency = 0
ErrorUpdateButton.TextColor3 = Color3.fromRGB(95, 60, 60)--(60, 95, 60)
ErrorUpdateButton.TextSize = 8
ErrorUpdateButton.TextXAlignment = "Center"
ErrorUpdateButton.Parent = InfoPhrame

ErrorUpdateButton.MouseButton1Click:Connect(function()
	if ErrorUpdateButton.Text == "1/3" then--"1/3" then
		ErrorUpdateButton.Text = "2/3"
		ErrorUpdateButton.TextColor3 = Color3.fromRGB(70, 70, 255)
		ErrorLogPhrame.Visible = true
		UpdateLogPhrame.Visible = false
		UpdateLogPhrame.Active = false
		ErrorLogPhrame.Active = true
		ScriptPhrameB.Visible = false
		ScriptPhrameB.Active = false
	elseif ErrorUpdateButton.Text == "3/3" then--"2/3" then
		ErrorUpdateButton.Text = "1/3"--"3/3"
		ErrorUpdateButton.TextColor3 = Color3.fromRGB(95, 60, 60)
		ErrorLogPhrame.Visible = false
		UpdateLogPhrame.Visible = true
		UpdateLogPhrame.Active = true
		ErrorLogPhrame.Active = false
		ScriptPhrameB.Visible = false
		ScriptPhrameB.Active = false
	elseif ErrorUpdateButton.Text == "2/3" then--"1/3" then
		ErrorUpdateButton.Text = "3/3"--"1/3"
		ErrorUpdateButton.TextColor3 = Color3.fromRGB(60, 95, 60)
		ErrorLogPhrame.Visible = false
		UpdateLogPhrame.Visible = false
		UpdateLogPhrame.Active = false
		ErrorLogPhrame.Active = false
		ScriptPhrameB.Visible = true
		ScriptPhrameB.Active = true
	end
end)

local ExecuteButton = Instance.new("ImageButton")
ExecuteButton.Size = UDim2.new(0, 20, 0, 20)
ExecuteButton.Position = UDim2.new(0.915, 0, 0.17, 0)
ExecuteButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
ExecuteButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.BackgroundTransparency = 0.4
ExecuteButton.BorderSizePixel = 0
ExecuteButton.Transparency = 0
ExecuteButton.Visible = true
ExecuteButton.Image = "rbxassetid://6022860343"
ExecuteButton.ImageColor3 = Color3.fromRGB(95, 60, 60)--(60, 95, 60)
ExecuteButton.Parent = InfoPhrame

ExecuteButton.MouseButton1Click:Connect(function()
	if ExecuteButton.ImageColor3 == Color3.fromRGB(95, 60, 60) then--(60, 95, 60) then
		ExecuteButton.ImageColor3 = Color3.fromRGB(70, 70, 255)
		InfoPhrameB.Visible = true
		BarPhrameB.Visible = true
		InfoPhrameB.Active = true
		BarPhrameB.Active = true
	elseif ExecuteButton.ImageColor3 == Color3.fromRGB(70, 70, 255) then
		ExecuteButton.ImageColor3 = Color3.fromRGB(60, 95, 60)--(95, 60, 60)
		InfoPhrameB.Visible = true
		BarPhrameB.Visible = true
		InfoPhrameB.Active = true
		BarPhrameB.Active = true
		InfoPhrameC.Visible = true
		InfoPhrameC.Active = true
	elseif ExecuteButton.ImageColor3 == Color3.fromRGB(60, 95, 60) then--(95, 60, 60) then
		ExecuteButton.ImageColor3 = Color3.fromRGB(95, 60, 60)--(60, 95, 60)
		InfoPhrameB.Visible = false
		BarPhrameB.Visible = false
		InfoPhrameB.Active = false
		BarPhrameB.Active = false
		InfoPhrameC.Visible = false
		InfoPhrameC.Active = false
	end
end)

local SoqButton = Instance.new("ImageButton")
SoqButton.Size = UDim2.new(0, 20, 0, 20)
SoqButton.Position = UDim2.new(0.915, 0, 0.61, 0)
SoqButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
SoqButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
SoqButton.BackgroundTransparency = 0.4
SoqButton.BorderSizePixel = 0
SoqButton.Transparency = 0
SoqButton.Visible = true
SoqButton.Image = "rbxassetid://5012544693"
SoqButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
SoqButton.Parent = InfoPhrame

SoqButton.MouseButton1Click:Connect(function()
	if SoqButton.Image == "rbxassetid://5012544693" then
		SoqButton.Image = "rbxassetid://6031280883"
		SoqButton.ImageColor3 = Color3.fromRGB(70, 70, 255)
		wait(1)
		SoqButton.Image = "rbxassetid://5012544693"
		SoqButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)

local SeqButton = Instance.new("ImageButton")
SeqButton.Size = UDim2.new(0, 20, 0, 20)
SeqButton.Position = UDim2.new(0.915, 0, 0.73, 0)
SeqButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
SeqButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
SeqButton.BackgroundTransparency = 0.4
SeqButton.BorderSizePixel = 0
SeqButton.Transparency = 0
SeqButton.Visible = true
SeqButton.Image = "rbxassetid://284402785"
SeqButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
SeqButton.Parent = InfoPhrame

SeqButton.MouseButton1Click:Connect(function()
	if SeqButton.Image == "rbxassetid://284402785" then
		SeqButton.Image = "rbxassetid://284402752"
		SeqButton.ImageColor3 = Color3.fromRGB(60, 95, 60)
	elseif SeqButton.Image == "rbxassetid://284402752" then
		SeqButton.Image = "rbxassetid://284402785"
		SeqButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)

local SettingsButton = Instance.new("ImageButton")
SettingsButton.Size = UDim2.new(0, 20, 0, 20)
SettingsButton.Position = UDim2.new(0.915, 0, 0.85, 0)
SettingsButton.BackgroundColor3 = Color3.fromRGB(60, 60, 105)
SettingsButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
SettingsButton.BackgroundTransparency = 0.4
SettingsButton.BorderSizePixel = 0
SettingsButton.Transparency = 0
SettingsButton.Visible = true
SettingsButton.Image = "rbxassetid://6034509993"
SettingsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
SettingsButton.Parent = InfoPhrame

SettingsButton.MouseButton1Click:Connect(function()
	if SettingsButton.ImageColor3 == Color3.fromRGB(95, 60, 60) then
		SettingsButton.ImageColor3 = Color3.fromRGB(60, 95, 60)
	elseif SettingsButton.ImageColor3 == Color3.fromRGB(60, 95, 60) then
		SettingsButton.ImageColor3 = Color3.fromRGB(95, 60, 60)
	end
end)
--[[ Info Bar Buttons --]]



--[[ Update Log --]]
local BigUpdateText = Instance.new("TextLabel")
BigUpdateText.Size = UDim2.new(0.01, 0, 0.01, 0)
BigUpdateText.Position = UDim2.new(0.05, 0, 0.05, 0)
BigUpdateText.BorderSizePixel = 0
BigUpdateText.Text = "New Update [10/03/2023] [16/10] ━━━━━━━━━━━━━"
BigUpdateText.TextColor3 = Color3.fromRGB(255,255,255)
BigUpdateText.TextSize = 8
BigUpdateText.BackgroundTransparency = 1
BigUpdateText.TextXAlignment = "Left"
BigUpdateText.Parent = UpdateLogPhrame

local SmallUpdateText = Instance.new("TextLabel")
SmallUpdateText.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallUpdateText.Position = UDim2.new(0.08, 0, 0.1, 0)
SmallUpdateText.BorderSizePixel = 0
SmallUpdateText.Text = "(+) added something i think lmfao"
SmallUpdateText.TextColor3 = Color3.fromRGB(60,160,60)
SmallUpdateText.TextSize = 6
SmallUpdateText.BackgroundTransparency = 1
SmallUpdateText.TextXAlignment = "Left"
SmallUpdateText.Parent = UpdateLogPhrame
local SmallUpdateText = Instance.new("TextLabel")
SmallUpdateText.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallUpdateText.Position = UDim2.new(0.08, 0, 0.13, 0)
SmallUpdateText.BorderSizePixel = 0
SmallUpdateText.Text = "(+) ahhaahahha"
SmallUpdateText.TextColor3 = Color3.fromRGB(60,160,60)
SmallUpdateText.TextSize = 6
SmallUpdateText.BackgroundTransparency = 1
SmallUpdateText.TextXAlignment = "Left"
SmallUpdateText.Parent = UpdateLogPhrame
local SmallUpdateText = Instance.new("TextLabel")
SmallUpdateText.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallUpdateText.Position = UDim2.new(0.08, 0, 0.16, 0)
SmallUpdateText.BorderSizePixel = 0
SmallUpdateText.Text = "(+) xd lmfao"
SmallUpdateText.TextColor3 = Color3.fromRGB(60,160,60)
SmallUpdateText.TextSize = 6
SmallUpdateText.BackgroundTransparency = 1
SmallUpdateText.TextXAlignment = "Left"
SmallUpdateText.Parent = UpdateLogPhrame

local BigUpdateText = Instance.new("TextLabel")
BigUpdateText.Size = UDim2.new(0.01, 0, 0.01, 0)
BigUpdateText.Position = UDim2.new(0.05, 0, 0.25, 0)
BigUpdateText.BorderSizePixel = 0
BigUpdateText.Text = "Last Update [10/03/2023] [16/08] ━━━━━━━━━━━━━"
BigUpdateText.TextColor3 = Color3.fromRGB(255,255,255)
BigUpdateText.TextSize = 8
BigUpdateText.BackgroundTransparency = 1
BigUpdateText.TextXAlignment = "Left"
BigUpdateText.Parent = UpdateLogPhrame

local SmallUpdateText = Instance.new("TextLabel")
SmallUpdateText.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallUpdateText.Position = UDim2.new(0.08, 0, 0.30, 0)
SmallUpdateText.BorderSizePixel = 0
SmallUpdateText.Text = "(-) idk"
SmallUpdateText.TextColor3 = Color3.fromRGB(160,60,60)
SmallUpdateText.TextSize = 6
SmallUpdateText.BackgroundTransparency = 1
SmallUpdateText.TextXAlignment = "Left"
SmallUpdateText.Parent = UpdateLogPhrame
local SmallUpdateText = Instance.new("TextLabel")
SmallUpdateText.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallUpdateText.Position = UDim2.new(0.08, 0, 0.33, 0)
SmallUpdateText.BorderSizePixel = 0
SmallUpdateText.Text = "(-) idk xd"
SmallUpdateText.TextColor3 = Color3.fromRGB(160,60,60)
SmallUpdateText.TextSize = 6
SmallUpdateText.BackgroundTransparency = 1
SmallUpdateText.TextXAlignment = "Left"
SmallUpdateText.Parent = UpdateLogPhrame
local SmallUpdateText = Instance.new("TextLabel")
SmallUpdateText.Size = UDim2.new(0.01, 0, 0.01, 0)
SmallUpdateText.Position = UDim2.new(0.08, 0, 0.36, 0)
SmallUpdateText.BorderSizePixel = 0
SmallUpdateText.Text = "(-) eheheheh"
SmallUpdateText.TextColor3 = Color3.fromRGB(160,60,60)
SmallUpdateText.TextSize = 6
SmallUpdateText.BackgroundTransparency = 1
SmallUpdateText.TextXAlignment = "Left"
SmallUpdateText.Parent = UpdateLogPhrame
--[[ Update Log --]]



--[[ Renew Text --]]
game.Players.PlayerAdded:Connect(function(player)
	ExentsionBarPlayersText.Text = "(Players) - "..tostring(#game.Players:GetPlayers())
end)

game.Players.PlayerRemoving:Connect(function(player)
	ExentsionBarPlayersText.Text = "(Players) - "..tostring(#game.Players:GetPlayers())
end)
--[[ Renew Text --]]



--[[ Final Setup --]]
local ScriptLoadTime = 0
local function StartLoading(Val, ValQ, Time, Amount)
local MakeUpRandomNumber = math.random(20, 100)
for i = 0, Amount do
local LoadedBarAmount = math.floor(0+(i/Amount*ValQ))
local LoadedAmount = math.floor(0+(i/Amount*Val))
local ScriptLoadTime = math.floor(((Time * Amount)*1000)+MakeUpRandomNumber)
LoadingFill.Text= tostring(LoadedAmount).."/100%"
LoadingBar.Size = UDim2.new(0, tostring(LoadedBarAmount), 0, 10)
ExentsionBarText.Text = "(Loadtime) - "..tostring(ScriptLoadTime).." ms"
wait(Time)
end
end

local MakeUpLoadingBar = math.random(20, 100)
StartLoading(100, 100, 0.1, tostring(MakeUpLoadingBar))
--[[ Final Setup --]]

--[--Run Checks

--Anti Bypass Modules

FishingSimulatorCURRENT = 2
DoorsCURRENT = 2
ApocCURRENT = 1
ThemeParkTycoon2CURRENT = 1
UltimateDrivingCURRENT = 1

FAILEDLOADING = nil
ISUNIVERSAL = false
OUTDATEDVERSION = nil
DOORSISPATCHED = nil
APOCISPATCHED = nil
FSISPATCHED = nil
TPT2ISPATCHED = nil
UDISPATCHED = nil

--End Of ABM

--[--Verify Main Loader

local VerifyVersion = 2
if versionCURRENT ~= VerifyVersion then
  UpdateLabelError.TextSize = 9
  UpdateLabelError.Text = "Error 7: outdated"
  UpdateLabelScript.Text = "!"
  UpdateLabelInfo1.Text = "!"
  UpdateLabelInfo2.Text = "!"
  OUTDATEDVERSION = true
elseif versionCURRENT == VerifyVersion then
  OUTDATEDVERSION = false
else 
  UpdateLabelError.TextSize = 9
  UpdateLabelError.Text = "Error 7: invalid version"
  UpdateLabelScript.Text = "!"
  UpdateLabelInfo1.Text = "!"
  UpdateLabelInfo2.Text = "!"
  OUTDATEDVERSION = true
end

--]--End Of Verify Main Loader

--[--Is Patched

local FishingSimulatorVersion = 2
local ThemeParkTycoon2Version = 1
local UltimateDrivingVersion = 1
local DoorsVersion = 2
local ApocVersion = 1

--Start Of IsPatched

if FishingSimulatorCURRENT ~= FishingSimulatorVersion then
FSISPATCHED = true
elseif FishingSimulatorCURRENT == FishingSimulatorVersion then
FSISPATCHED = false
else
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 8: failed verify"
UpdateLabelScript.Text = "Failed Verifying"
UpdateLabelInfo1.Text = "Fishing Simulator Script"
UpdateLabelInfo2.Text = "!"
FSISPATCHED = true
end

if ThemeParkTycoon2CURRENT ~= ThemeParkTycoon2Version then
TPT2ISPATCHED = true
elseif ThemeParkTycoon2CURRENT == ThemeParkTycoon2Version then
TPT2ISPATCHED = false
else
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 8: failed verify"
UpdateLabelScript.Text = "Failed Verifying"
UpdateLabelInfo1.Text = "Theme Park Tycoon 2 Script"
UpdateLabelInfo2.Text = "!"
TPT2ISPATCHED = true
end

if UltimateDrivingCURRENT ~= UltimateDrivingVersion then
UDISPATCHED = true
elseif UltimateDrivingCURRENT == UltimateDrivingVersion then
UDISPATCHED = false
else
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 8: failed verify"
UpdateLabelScript.Text = "Failed Verifying"
UpdateLabelInfo1.Text = "Ultimate Driving Script"
UpdateLabelInfo2.Text = "!"
UDISPATCHED = true
end

if DoorsCURRENT ~= DoorsVersion then
DOORSISPATCHED = true
elseif DoorsCURRENT == DoorsVersion then
DOORSISPATCHED = false
else
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 8: failed verify"
UpdateLabelScript.Text = "Failed Verifying"
UpdateLabelInfo1.Text = "Doors Script"
UpdateLabelInfo2.Text = "!"
DOORSISPATCHED = true
end

if ApocCURRENT ~= ApocVersion then
APOCISPATCHED = true
elseif ApocCURRENT == ApocVersion then
APOCISPATCHED = false
else
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 8: failed verify"
UpdateLabelScript.Text = "Failed Verifying"
UpdateLabelInfo1.Text = "Apoc Script"
UpdateLabelInfo2.Text = "!"
APOCISPATCHED = true
end

--]--End Of Is Patched

--]--Finished

--[--Setup

FixedThemes = Theme == "Aqua" or Theme == "Light" or Theme == "Dark" or Theme == "Jester" or Theme == "Mocha"
BrokenThemes = Theme ~= "Aqua" or Theme ~= "Light" or Theme ~= "Dark" or Theme ~= "Jester" or Theme ~= "Mocha" or Theme == nil
IsPatched = TPT2ISPATCHED == false and UDISPATCHED == false and FSISPATCHED == false and DOORSISPATCHED == false and ApocISPATCHED == false
ScreenCheckX = ScreenSizeX ~= nil or ScreenSizeX ~= nan
ScreenCheckY = ScreenSizeY ~= nil or ScreenSizeY ~= nan
IsAGameThatWorks = game.PlaceId == 2866967438 or game.PlaceId == 237590761 or game.PlaceId == 69184822 or game.PlaceId == 54865335 or game.PlaceId == 6516141723 or game.PlaceId == 237590657 or game.PlaceId == 1228674372 or game.PlaceId == 1600503 or game.PlaceId == 237590761

--]--End Of Setup

--[--Script

wait(0.1)
if game.PlaceId == 2866967438 and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and FSISPATCHED == false and ScreenCheckX and ScreenCheckY then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Script Is Loading"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Fishing%20Simulator.lua", true))()
	
elseif game.PlaceId == 69184822 and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and TPT2ISPATCHED == false and ScreenCheckX and ScreenCheckY then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Script Is Loading"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/ThemeParkTycoon2.lua", true))()
	
elseif game.PlaceId == 54865335 and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and UDISPATCHED == false and ScreenCheckX and ScreenCheckY then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Script Is Loading"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Ultimate%20Driving.lua", true))()
	
elseif game.PlaceId == 6516141723 or game.PlaceId == 6839171747 and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and DOORSISPATCHED == false and ScreenCheckX and ScreenCheckY then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Script Is Loading"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Doors.lua", true))()
	
elseif game.PlaceId == 237590761 or game.PlaceId == 237590657 or game.PlaceId == 1228674372 or game.PlaceId == 1600503 or game.PlaceId == 237590761 and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and ApocISPATCHED == false and ScreenCheckX and ScreenCheckY then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Script Is Loading"
UpdateLabelScript.Text = "!"
UpdateLabelInfo1.Text = "!"
UpdateLabelInfo2.Text = "!"
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/apocloader.lua", true))()
	
elseif IsAGameThatWorks and BrokenThemes and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and IsPatched and ScreenCheckX and ScreenCheckY then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 1: wrong theme / no theme"
UpdateLabelScript.Text = "Your missing Theme = "
UpdateLabelInfo1.Text = "Your missing Theme"
UpdateLabelInfo2.Text = "!"
	
elseif IsAGameThatWorks and Discord_Key ~= "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and IsPatched and ScreenCheckX and ScreenCheckY then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 2: wrong discord key"
UpdateLabelScript.Text = "Your discord key is invalid"
UpdateLabelInfo1.Text = "Your discord key is missing"
UpdateLabelInfo2.Text = "!"
	
elseif IsAGameThatWorks and OUTDATEDVERSION == true and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and IsPatched and ScreenCheckX and ScreenCheckY then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 3: invalid version"
UpdateLabelScript.Text = "Agony is outdated"
UpdateLabelInfo1.Text = "Script you want is outdated"
UpdateLabelInfo2.Text = "!"
	
elseif game.PlaceId ~= 237590657 or game.PlaceId ~= 1228674372 or game.PlaceId ~= 237590761 or game.PlaceId ~= 1600503 or game.PlaceId ~= 237590761 or game.PlaceId ~= 2866967438 or game.PlaceId ~= 69184822 or game.PlaceId ~= 54865335 and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and IsPatched and ScreenCheckX and ScreenCheckY then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 4: unsupported game"
UpdateLabelScript.Text = "Your game isn't supported"
UpdateLabelInfo1.Text = "Game has teleported you"
UpdateLabelInfo2.Text = "!"
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/UniversalScript.lua", true))()

elseif IsAGameThatWorks and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and DOORSISPATCHED == true or TPT2ISPATCHED == true or UDISPATCHED == true or APOCISPATCHED == true or FSISPATCHED == true and ScreenCheckX and ScreenCheckY then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 5: script is patched"
UpdateLabelScript.Text = "Agony is patched"
UpdateLabelInfo1.Text = "Script you want is outdated"
UpdateLabelInfo2.Text = "!"
		
elseif ScreenSizeX == nil or ScreenSizeX == nan or ScreenSizeY == nil or ScreenSizeY == nan and OUTDATEDVERSION == false and Discord_Key == "Ey580OgEJIYnagHJUIWAjfasnfg" and FixedThemes and IsAGameThatWorks then
UpdateLabelError.TextSize = 9
UpdateLabelError.Text = "Error 6: invalid screensize"
UpdateLabelScript.Text = "Your ScreenSizeX or Y is invalid"
UpdateLabelInfo1.Text = "Your missing ScreenSize"
UpdateLabelInfo2.Text = "!"
	
end

--]--End Of Script
