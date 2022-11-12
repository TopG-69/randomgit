--[--Verify Main Loader
local VerifyVersion = 1
if versionCURRENT ~= VerifyVersion then
  AlertList = AlertTab.Label({Text = "Your Using A Outdated Version Please Update"})
  OUTDATEDVERSION = true
elseif versionCURRENT == VerifyVersion then
  AlertList = AlertTab.Label({Text = "Your Running The Latest Version"})
  OUTDATEDVERSION = false
--else 
--  AlertList = AlertTab.Label({Text = "Unknown Issue With Version Verify"})
--  OUTDATEDVERSION = true
end
--]--End Of Verify Main Loader

--[--Is Patched
local FishingSimulatorVersion = 1
local ThemeParkTycoon2Version = 1
local UltimateDrivingVersion = 1



--Start Of IsPatched
if FishingSimulatorCURRENT ~= FishingSimulatorVersion then
AlertList = AlertTab.Label({Text = "Fishing Simulator Is Outdated"})
FSISPATCHED = true
elseif FishingSimulatorCURRENT == FishingSimulatorVersion then
AlertList = AlertTab.Label({Text = "Fishing Simulator Is Running Latest Version"})
FSISPATCHED = false
--else
--AlertList = AlertTab.Label({Text = "Unknown Issue Happined While Verifying Fishing Simulator Version"})
--FSISPATCHED = true
end

if ThemeParkTycoon2CURRENT ~= ThemeParkTycoon2Version then
AlertList = AlertTab.Label({Text = "Theme Park Tycoon 2 Is Outdated"})
TPT2ISPATCHED = true
elseif ThemeParkTycoon2CURRENT == ThemeParkTycoon2Version then
AlertList = AlertTab.Label({Text = "Theme Park Tycoon 2 Is Running Latest Version"})
TPT2ISPATCHED = false
--else
--AlertList = AlertTab.Label({Text = "Unknown Issue Happined While Verifying Theme Park Tycoon 2 Version"})
--TPT2ISPATCHED = true
end

if UltimateDrivingCURRENT ~= UltimateDrivingVersion then
AlertList = AlertTab.Label({Text = "Theme Park Tycoon 2 Is Outdated"})
UDISPATCHED = true
elseif UltimateDrivingCURRENT == UltimateDrivingVersion then
AlertList = AlertTab.Label({Text = "Theme Park Tycoon 2 Is Running Latest Version"})
UDISPATCHED = false
--else
--AlertList = AlertTab.Label({Text = "Unknown Issue Happined While Verifying Ultimate Driving Version"})
--UDISPATCHED = true
end
--]--End Of Is Patched
