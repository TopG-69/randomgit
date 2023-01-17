--[--Verify Main Loader

--Anti Bypass Modules
OUTDATEDVERSION = nil
FSISPATCHED = nil
TPT2ISPATCHED = nil
UDISPATCHED = nil
DOORSISPATCHED = nil
APOCISPATCHED = nil
--end of ABM

local VerifyVersion = 2
if versionCURRENT ~= VerifyVersion then
  AlertList = AlertTab.Label({Text = "Your Using A Outdated Version Please Update"})
  OUTDATEDVERSION = true
elseif versionCURRENT == VerifyVersion then
  AlertList = AlertTab.Label({Text = "Your Running The Latest Version"})
  OUTDATEDVERSION = false
else 
  AlertList = AlertTab.Label({Text = "Unknown Issue With Version Verify"})
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
AlertList = AlertTab.Label({Text = "Unknown Issue Happined While Verifying Fishing Simulator Version"})
FSISPATCHED = true
end

if ThemeParkTycoon2CURRENT ~= ThemeParkTycoon2Version then
TPT2ISPATCHED = true
elseif ThemeParkTycoon2CURRENT == ThemeParkTycoon2Version then
TPT2ISPATCHED = false
else
AlertList = AlertTab.Label({Text = "Unknown Issue Happined While Verifying Theme Park Tycoon 2 Version"})
TPT2ISPATCHED = true
end

if UltimateDrivingCURRENT ~= UltimateDrivingVersion then
UDISPATCHED = true
elseif UltimateDrivingCURRENT == UltimateDrivingVersion then
UDISPATCHED = false
else
AlertList = AlertTab.Label({Text = "Unknown Issue Happined While Verifying Ultimate Driving Version"})
UDISPATCHED = true
end

if DoorsCURRENT ~= DoorsVersion then
DOORSISPATCHED = true
elseif DoorsCURRENT == DoorsVersion then
DOORSISPATCHED = false
else
AlertList = AlertTab.Label({Text = "Unknown Issue Happined While Verifying Doors Version"})
DOORSISPATCHED = true
end

if ApocCURRENT ~= ApocVersion then
APOCISPATCHED = true
elseif ApocCURRENT == ApocVersion then
APOCISPATCHED = false
else
AlertList = AlertTab.Label({Text = "Unknown Issue Happined While Verifying Apoc Version"})
APOCISPATCHED = true
end
--]--End Of Is Patched
