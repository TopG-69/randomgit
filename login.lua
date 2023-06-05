--[[
	Hey if you are seeing this then it means you are at the source
	of agony well i'm here to tell you Agony will make a returns
	at somepoint but i wish for you to make a promise to never
	share this with anyone. Goodbye!
--]]

    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/ModuleZ.lua"))()
    local Window = Library.CreateLib("Agony Account Manager {🔑}", "Synapse")
    local Possible = true
    versionCURRENT = 2
    
makefolder("Agony")
makefolder("Agony/Account")
makefolder("Agony/Settings")

--// --// --// --// --// --// --// --// --// --// --//
    -- Setup
    
    function WriteFile(fn, txt)
	    writefile("Agony/"..fn..".txt", txt, "\n")
    end
    function ReadFile(fn)
	    return pcall(function() return readfile("Agony/"..fn..".txt") end)
    end
    local options = [[
--// --// --// --// --// --// --// --// --// --// --//
    AutoLoadSettings: nil
    HasSavedSettings: nil
    WillLoadScript: nil
--// --// --// --// --// --// --// --// --// --// --//
    ]]
--// --// --// --// --// --// --// --// --// --// --//
    -- Info
    
    
    
    local Info = Window:NewTab("Info")
    local InfoSection = Info:NewSection("Info")
    
    
    
    -- End Of Info
--// --// --// --// --// --// --// --// --// --// --//
    -- Register
    
    
    
    local Register = Window:NewTab("Register")
    local RegisterT1 = Register:NewSection("Step 1  {🟠}")
    local RegisterT2 = Register:NewSection("Step 2 {🟡}")
    
    
    
    RegisterT1:NewTextBox("Username", "Username For Your Account", function(c)
        if c != nil then
            UserName = c
        end
    end)
    RegisterT1:NewTextBox("Password", "Password For Your Account", function(c)
        if c != nil then
            PassWord = c
        end
    end)
    
    
    
    RegisterT2:NewButton("Register", "Allows you to Register", function(P)
        if UserName != nil and PassWord != nil then
            WriteFile("Account/Current", "{"..UserName..", "..PassWord.."}")
        end
    end)
    
    
    
    -- End Of Register
--// --// --// --// --// --// --// --// --// --// --//
    -- Login
    
    
    
    local Login = Window:NewTab("Login")
    local LoginSectionT1 = Login:NewSection("Step 1  {🟠}")
    local LoginSectionT2 = Login:NewSection("Step 2 {🟡}")
    
    
    
    LoginSectionT1:NewTextBox("Username", "Username For Your Account", function(c)
        if c != nil then
            UserNameL = c
        end
    end)
    LoginSectionT1:NewTextBox("Password", "Password For Your Account", function(c)
        if c != nil then
            PassWordL = c
        end
    end)
    
    
    
    LoginSectionT2:NewButton("Enter", "Allows you to Login", function(P)
        if UserNameL != nil and PassWordL != nil then
            UserInfo = ReadFile("Account/Current")
            if UserInfo != nil then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/LoadModules.lua", true))()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Sittapea/Gui-Ui/main/Setup.lua", true))()
            end
        end
    end)
    
    
    
    -- End Of Login
--// --// --// --// --// --// --// --// --// --// --//
    -- Misc
    
    
    
    local Misc = Window:NewTab("Misc")
    local MiscSection = Misc:NewSection("Misc")
    MiscSection:NewTextBox("Discord Key", "Enter Key", function(c)
        if c != nil then
            Discord_Key = c
            WriteFile("Settings/DK", "{"..c.."}")
        end
    end)
    MiscSection:NewTextBox("Premium", "More Access", function(c)
        if c != nil then
            PremiumKey = c
            WriteFile("Settings/P", "{"..c.."}")
        end
    end)
    MiscSection:NewTextBox("Theme", "Aqua / Dark / Light / ?", function(c)
        if c != nil then
            Theme = c
            WriteFile("Settings/T", "{"..c.."}")
        end
    end)
    MiscSection:NewTextBox("ScreenSizeX", "ScreenSize", function(c)
        if c != nil then
            ScreenSizeX = c
            WriteFile("Settings/SZX", "{"..c.."}")
        end
    end)
    MiscSection:NewTextBox("ScreenSizeY", "ScreenSize", function(c)
        if c != nil then
            ScreenSizeY = c
            WriteFile("Settings/SZY", "{"..c.."}")
        end
    end)
    
    
    
    -- End Of Misc
--// --// --// --// --// --// --// --// --// --// --//

WriteFile("Settings/Options", options)

    local SCREENY = ReadFile(Settings/SZY)
    local SCREENX = ReadFile(Settings/SZX)
    local DcKey = ReadFile(Settings/DK)
    local PrKey = ReadFile(Settings/P)
    local THEME = ReadFile(Settings/T)
	wait(0.1)
	
    if SCREENY != nil then
        ScreenSizeY = SCREENY
    elseif SCREENX != nil then
        ScreenSizeX = SCREENX
    elseif THEME == aqua or THEME == dark or THEME == light then
         if THEME == aqua then
             Theme = "Aqua"
         elseif THEME == dark then
             Theme = "Dark"
         elseif THEME == light then
             Theme = "Light"
         end
    elseif DcKey == Ey580OgEJIYnagHJUIWAjfasnfg then
        Discord_Key = "Ey580OgEJIYnagHJUIWAjfasnfg"
    end
