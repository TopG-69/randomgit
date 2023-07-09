IsSuccess, ResultComp = pcall(function()
	for _, v in pairs(game.CoreGui:GetChildren()) do
		if v.Name == "Agony_GUI" then
			game.CoreGui.Agony_GUI:Destroy()
		end
	end
	for _, v in pairs(game.Lighting:GetChildren()) do
		if v.Name == "GUI_Blur" then
			game.Lighting.GUI_Blur:Destroy()
		end
	end

	CreateBase = function()
		ScreenGui = Instance.new("ScreenGui")
		ScreenGui.Name = "Agony_GUI"
		ScreenGui.Parent = game.CoreGui
		
		local BlurEffect = Instance.new("BlurEffect")
		BlurEffect.Name = "GUI_Blur"
		BlurEffect.Size = 50
		BlurEffect.Enabled = true
		BlurEffect.Parent = game:GetService("Lighting")
		
		local Frame = Instance.new("Frame")
		Frame.Size = UDim2.new(0, 450, 0, 275)
		Frame.Position = UDim2.new(0.5, -225, 0.5, -135)
		Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Frame.Transparency = 0.1
		Frame.Visible = true
		Frame.Active = true
		Frame.Parent = ScreenGui
		
		local UICorner = Instance.new("UICorner")
		UICorner.Parent = Frame

		local TextLabel = Instance.new("TextLabel")
		TextLabel.Size = UDim2.new(0, 0, 0, 0)
		TextLabel.Position = UDim2.new(0.5, 0, 0.1, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Text = "LOGIN PROCESS"
		TextLabel.TextColor3 = Color3.fromRGB(170, 170, 170)
		TextLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		TextLabel.TextSize = 26
		TextLabel.TextXAlignment = "Center"
		TextLabel.Parent = Frame

		local Frame_Sep = Instance.new("Frame")
		Frame_Sep.Size = UDim2.new(0.9, 0, 0, 1)
		Frame_Sep.Position = UDim2.new(0.05, 0, 0.25, 0)
		Frame_Sep.BackgroundTransparency = 0
		Frame_Sep.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_Sep.BorderSizePixel = 0
		Frame_Sep.Parent = Frame

		local Frame_Name = Instance.new("Frame")
		Frame_Name.Size = UDim2.new(0.9, 0, 0, 50)
		Frame_Name.Position = UDim2.new(0.05, 0, 0.3, 0)
		Frame_Name.BackgroundTransparency = 0
		Frame_Name.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		Frame_Name.BorderSizePixel = 0
		Frame_Name.Parent = Frame

		local ImageLabel_N = Instance.new("ImageLabel")
		ImageLabel_N.Size = UDim2.new(0, 50, 0, 50)
		ImageLabel_N.Position = UDim2.new(0, 0, 0, 0)
		ImageLabel_N.BorderSizePixel = 0
		ImageLabel_N.Image = "rbxassetid://12899885269"
		ImageLabel_N.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		ImageLabel_N.Parent = Frame_Name

		local TextBox_N = Instance.new("TextBox")
		TextBox_N.Size = UDim2.new(1, -75, 0, 50)
		TextBox_N.Position = UDim2.new(0, 75, 0, 0)
		TextBox_N.BorderSizePixel = 0
		TextBox_N.Text = "Name"
		TextBox_N.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextBox_N.TextSize = 12
		TextBox_N.BackgroundTransparency = 1
		TextBox_N.TextXAlignment = "Left"
		TextBox_N.TextWrapped = true
		TextBox_N.Parent = Frame_Name

		local Frame_Password = Instance.new("Frame")
		Frame_Password.Size = UDim2.new(0.9, 0, 0, 50)
		Frame_Password.Position = UDim2.new(0.05, 0, 0.5, 0)
		Frame_Password.BackgroundTransparency = 0
		Frame_Password.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		Frame_Password.BorderSizePixel = 0
		Frame_Password.Parent = Frame

		local ImageLabel_Holder = Instance.new("Frame")
		ImageLabel_Holder.Size = UDim2.new(0, 50, 0, 50)
		ImageLabel_Holder.Position = UDim2.new(0, 0, 0, 0)
		ImageLabel_Holder.BorderSizePixel = 0
		ImageLabel_Holder.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		ImageLabel_Holder.Parent = Frame_Password

		local ImageLabel_PK = Instance.new("ImageLabel")
		ImageLabel_PK.Size = UDim2.new(0, 40, 0, 40)
		ImageLabel_PK.Position = UDim2.new(0, 5, 0, 5)
		ImageLabel_PK.BorderSizePixel = 0
		ImageLabel_PK.Image = "rbxassetid://14007860092"
		ImageLabel_PK.BackgroundTransparency = 1
		ImageLabel_PK.Parent = ImageLabel_Holder

		local TextBox_PK = Instance.new("TextBox")
		TextBox_PK.Size = UDim2.new(1, -75, 0, 50)
		TextBox_PK.Position = UDim2.new(0, 75, 0, 0)
		TextBox_PK.BorderSizePixel = 0
		TextBox_PK.Text = "Premium Key"
		TextBox_PK.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextBox_PK.TextSize = 12
		TextBox_PK.BackgroundTransparency = 1
		TextBox_PK.TextXAlignment = "Left"
		TextBox_PK.TextWrapped = true
		TextBox_PK.Parent = Frame_Password

		local TextButton = Instance.new("TextButton")
		TextButton.Size = UDim2.new(0, 350, 0, 50)
		TextButton.Position = UDim2.new(0.5, -175, 0.75, 0)
		TextButton.BackgroundTransparency = 0
		TextButton.Text = "LOGIN"
		TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.TextSize = 14
		TextButton.BorderSizePixel = 0
		TextButton.TextXAlignment = "Center"
		TextButton.Parent = Frame

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0.5, 50)
		UICorner.Parent = TextButton

		local Frame_Sep = Instance.new("Frame")
		Frame_Sep.Size = UDim2.new(0.9, 0, 0, 1)
		Frame_Sep.Position = UDim2.new(0.05, 0, 0.72, 0)
		Frame_Sep.BackgroundTransparency = 0
		Frame_Sep.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_Sep.BorderSizePixel = 0
		Frame_Sep.Parent = Frame

		local Frame_Sep = Instance.new("Frame")
		Frame_Sep.Size = UDim2.new(0, 200, 0, 1)
		Frame_Sep.Position = UDim2.new(0.5, -100, 0.95, 0)
		Frame_Sep.BackgroundTransparency = 0
		Frame_Sep.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_Sep.BorderSizePixel = 0
		Frame_Sep.Parent = Frame

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0.5, 50)
		UICorner.Parent = TextButton

		PremiumModules = function()
			ScreenGui = Instance.new("ScreenGui")
			ScreenGui.Name = "Agony_GUI"
			ScreenGui.Parent = game.CoreGui

			local Frame = Instance.new("Frame")
			Frame.Size = UDim2.new(0, 500, 0, 300)
			Frame.Position = UDim2.new(0.5, -250, 0.5, -150)
			Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderColor3 = Color3.fromRGB(20, 20, 20)
			Frame.Transparency = 0.1
			Frame.Draggable = true
			Frame.Visible = true
			Frame.Active = true
			Frame.Parent = ScreenGui

			local Frame_Tabs = Instance.new("Frame")
			Frame_Tabs.Size = UDim2.new(1, 0, 0, 30)
			Frame_Tabs.Position = UDim2.new(0, 0, 0, 0)
			Frame_Tabs.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			Frame_Tabs.BorderColor3 = Color3.fromRGB(20, 20, 20)
			Frame_Tabs.Parent = Frame
		
			local ScrollingFrame = Instance.new("ScrollingFrame")
			ScrollingFrame.Size = UDim2.new(1, 0, 1, -30)
			ScrollingFrame.Position = UDim2.new(0, 0, 0, 30)
			ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
			ScrollingFrame.BackgroundTransparency = 1
			ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
			ScrollingFrame.BorderSizePixel = 0
			ScrollingFrame.Selectable = true
			ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60)
			ScrollingFrame.ScrollBarThickness = 4
			ScrollingFrame.Parent = Frame

			Tabs = function(Tabs)
				for i, v in pairs(ScrollingFrame:GetChildren()) do
					if v:IsA("Frame") then
						v.Visible = false
						if string.find(v.Name, Tabs) then
							v.Visible = true
						end
					end
				end
			end

			local Frame_LOL = Instance.new("Frame")
			Frame_LOL.Size = UDim2.new(0, 50, 0, 20)
			Frame_LOL.Position = UDim2.new(1, -55, 0, 5)
			Frame_LOL.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Frame_LOL.BorderColor3 = Color3.fromRGB(20, 20, 20)
			Frame_LOL.Transparency = 0.1
			Frame_LOL.Parent = Frame_Tabs

			local ImageButton = Instance.new("ImageButton")
			ImageButton.Size = UDim2.new(0, 20, 0, 20)
			ImageButton.Position = UDim2.new(0, 5, 0, 0)
			ImageButton.BackgroundTransparency = 1
			ImageButton.Image = "rbxassetid://12897667997"
			ImageButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
			ImageButton.Parent = Frame_LOL

			local ImageButton = Instance.new("ImageButton")
			ImageButton.Size = UDim2.new(0, 20, 0, 20)
			ImageButton.Position = UDim2.new(1, -25, 0, 0)
			ImageButton.BackgroundTransparency = 1
			ImageButton.Image = "rbxassetid://14008312947"
			ImageButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
			ImageButton.Parent = Frame_LOL

			local TextButton_Betas = Instance.new("TextButton")
			TextButton_Betas.Size = UDim2.new(0, 200, 0, 20)
			TextButton_Betas.Position = UDim2.new(0, 5, 0, 5)
			TextButton_Betas.BackgroundTransparency = 0
			TextButton_Betas.Text = "BETAS"
			TextButton_Betas.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton_Betas.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			TextButton_Betas.TextSize = 10
			TextButton_Betas.BorderSizePixel = 0
			TextButton_Betas.TextXAlignment = "Center"
			TextButton_Betas.Parent = Frame_Tabs

			local UICorner = Instance.new("UICorner")
			UICorner.Parent = TextButton_Betas

			local ImageLabel = Instance.new("ImageLabel")
			ImageLabel.Size = UDim2.new(0, 20, 0, 20)
			ImageLabel.Position = UDim2.new(0, 0, 0, 0)
			ImageLabel.BackgroundTransparency = 1
			ImageLabel.Image = "rbxassetid://13871054619"
			ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
			ImageLabel.Parent = TextButton_Betas
			
			local UICorner = Instance.new("UICorner")
			UICorner.CornerRadius = UDim.new(0.5, 50)
			UICorner.Parent = ImageLabel
		
			TextButton_Betas.MouseButton1Click:connect(function()
				Tabs("Betas")
			end)

			local TextButton_Unrealesed = Instance.new("TextButton")
			TextButton_Unrealesed.Size = UDim2.new(0, 200, 0, 20)
			TextButton_Unrealesed.Position = UDim2.new(0, 210, 0, 5)
			TextButton_Unrealesed.BackgroundTransparency = 0
			TextButton_Unrealesed.Text = "UNRELEASED"
			TextButton_Unrealesed.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton_Unrealesed.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			TextButton_Unrealesed.TextSize = 10
			TextButton_Unrealesed.BorderSizePixel = 0
			TextButton_Unrealesed.TextXAlignment = "Center"
			TextButton_Unrealesed.Parent = Frame_Tabs

			local UICorner = Instance.new("UICorner")
			UICorner.Parent = TextButton_Unrealesed

			local ImageLabel = Instance.new("ImageLabel")
			ImageLabel.Size = UDim2.new(0, 20, 0, 20)
			ImageLabel.Position = UDim2.new(0, 0, 0, 0)
			ImageLabel.BackgroundTransparency = 1
			ImageLabel.Image = "rbxassetid://13871054619"
			ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
			ImageLabel.Parent = TextButton_Unrealesed
			
			local UICorner = Instance.new("UICorner")
			UICorner.CornerRadius = UDim.new(0.5, 50)
			UICorner.Parent = ImageLabel
			
			TextButton_Unrealesed.MouseButton1Click:connect(function()
				Tabs("Unreleased")
			end)

			CreateThing = function(offset, Name, TextPrim, TextSec, image, image2, Script)
				local Frame_Beta = Instance.new("Frame")
				Frame_Beta.Name = Name
				Frame_Beta.Size = UDim2.new(0.9, 0, 0, 60)
				Frame_Beta.Position = UDim2.new(0.05, 0, 0, offset)
				Frame_Beta.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				Frame_Beta.BorderColor3 = Color3.fromRGB(255, 255, 255)
				Frame_Beta.Visible = false
				Frame_Beta.Parent = ScrollingFrame
				
				local ImageLabel = Instance.new("ImageLabel")
				ImageLabel.Size = UDim2.new(0, 100, 0, 50)
				ImageLabel.Position = UDim2.new(0, 5, 0, 5)
				ImageLabel.BackgroundTransparency = 1
				ImageLabel.Image = "rbxassetid://" .. image2
				ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.Parent = Frame_Beta
				
				local UICorner = Instance.new("UICorner")
				UICorner.Parent = ImageLabel
				
				local ImageButton = Instance.new("ImageButton")
				ImageButton.Size = UDim2.new(0, 50, 0, 50)
				ImageButton.Position = UDim2.new(1, -55, 0, 5)
				ImageButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
				ImageButton.Image = "rbxassetid://" .. image
				ImageButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
				ImageButton.Parent = Frame_Beta
	
				local UICorner = Instance.new("UICorner")
				UICorner.CornerRadius = UDim.new(0.5, 50)
				UICorner.Parent = ImageButton
				
				local TextLabel = Instance.new("TextLabel")
				TextLabel.Size = UDim2.new(0, 200, 0, 20)
				TextLabel.Position = UDim2.new(0.5, -78, 0, 5)
				TextLabel.BorderSizePixel = 0
				TextLabel.Text = TextPrim
				TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel.TextSize = 12
				TextLabel.TextXAlignment = "Center"
				TextLabel.Parent = Frame_Beta
				
				local TextLabel = Instance.new("TextLabel")
				TextLabel.Size = UDim2.new(0, 240, 0, 30)
				TextLabel.Position = UDim2.new(0.5, -100, 0, 25)
				TextLabel.BorderSizePixel = 0
				TextLabel.Text = TextSec
				TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
				TextLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				TextLabel.TextWrapped = true
				TextLabel.TextSize = 8
				TextLabel.TextXAlignment = "Center"
				TextLabel.Parent = Frame_Beta

				ImageButton.MouseButton1Click:connect(function()
					pcall(Script)
				end)
			end
			
			CreateThing(10, "Betas", "Apoc GUI V154", "Test the newest version of Agony AR gui.", 12899952249, 13046417598, function()
				loadstring(game:HttpGet(""))()
			end)

			CreateThing(10, "Unreleased", "Anomic V2", "Unreleased upgrade of the original anomic script.", 12899952249, 14010473987, function()
				loadstring(game:HttpGet(""))()
			end)

		end

		TextButton.MouseButton1Click:connect(function()
			if TextBox_PK.Text ~= "" and TextBox_N.Text ~= "" then
		        if string.find(game:HttpGet("https://raw.githubusercontent.com/TopG-69/randomgit/main/passwords", true), TextBox_PK.Text) and string.find(game:HttpGet("https://raw.githubusercontent.com/TopG-69/randomgit/main/names", true), TextBox_N.Text) then
					Frame_Name.BorderSizePixel = 1
					Frame_Name.BorderColor3 = Color3.fromRGB(0, 255, 0)
					TextBox_N.TextColor3 = Color3.fromRGB(0, 255, 0)
					ImageLabel_N.ImageColor3 = Color3.fromRGB(0, 255, 0)
					Frame_Password.BorderSizePixel = 1
					Frame_Password.BorderColor3 = Color3.fromRGB(0, 255, 0)
					TextBox_PK.TextColor3 = Color3.fromRGB(0, 255, 0)
					ImageLabel_PK.ImageColor3 = Color3.fromRGB(0, 255, 0)
					wait(0.25)
					ScreenGui:Destroy()
					for _, v in pairs(game.Lighting:GetChildren()) do
						if v.Name == "GUI_Blur" then
							game.Lighting.GUI_Blur:Destroy()
						end
					end
					PremiumModules()
				else
					if not string.find(game:HttpGet("https://raw.githubusercontent.com/TopG-69/randomgit/main/names", true), TextBox_N.Text) then
						Frame_Name.BorderSizePixel = 1
						Frame_Name.BorderColor3 = Color3.fromRGB(255, 0, 0)
						TextBox_N.TextColor3 = Color3.fromRGB(255, 0, 0)
						ImageLabel_N.ImageColor3 = Color3.fromRGB(255, 0, 0)
					else
						Frame_Name.BorderSizePixel = 1
						Frame_Name.BorderColor3 = Color3.fromRGB(0, 255, 0)
						TextBox_N.TextColor3 = Color3.fromRGB(0, 255, 0)
						ImageLabel_N.ImageColor3 = Color3.fromRGB(0, 255, 0)
					end
					if not string.find(game:HttpGet("https://raw.githubusercontent.com/TopG-69/randomgit/main/passwords", true), TextBox_PK.Text) then
						Frame_Password.BorderSizePixel = 1
						Frame_Password.BorderColor3 = Color3.fromRGB(255, 0, 0)
						TextBox_PK.TextColor3 = Color3.fromRGB(255, 0, 0)
						ImageLabel_PK.ImageColor3 = Color3.fromRGB(255, 0, 0)
					else
						Frame_Password.BorderSizePixel = 1
						Frame_Password.BorderColor3 = Color3.fromRGB(0, 255, 0)
						TextBox_PK.TextColor3 = Color3.fromRGB(0, 255, 0)
						ImageLabel_PK.ImageColor3 = Color3.fromRGB(0, 255, 0)
					end
					wait(1)
					Frame_Name.BorderSizePixel = 0
					Frame_Password.BorderSizePixel = 0
					TextBox_N.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextBox_PK.TextColor3 = Color3.fromRGB(255, 255, 255)
					ImageLabel_N.ImageColor3 = Color3.fromRGB(255, 255, 255)
					ImageLabel_PK.ImageColor3 = Color3.fromRGB(255, 255, 255)
				end
			end
		end)
	end
end)

CreateBase()
