--[--Verify Main Loader
local VerifyVersion = 1
if versionCURRENT ~= VerifyVersion then
  AlertList = AlertTab.Label({Text = "Your Using A Outdated Version Please Update"})
  OUTDATEDVERSION = true
else
  AlertList = AlertTab.Label({Text = "Your Running The Latest Version"})
  OUTDATEDVERSION = false
end
--]--End Of Verify Main Loader

--[--Is Patched
local FishingSimulatorVersion = 0
local ThemeParkTycoon2Version = 0
local UltimateDrivingVersion = 0
wait(0.1)


if FishingSimulatorCURRENT ~= FishingSimulatorVersion then
FSISPATCHED = true
elseif FishingSimulatorCURRENT == FishingSimulatorVersion then
FSISPATCHED = false
end

if ThemeParkTycoon2CURRENT ~= ThemeParkTycoon2Version then
TPT2ISPATCHED = true
elseif ThemeParkTycoon2CURRENT == ThemeParkTycoon2Version then
TPT2ISPATCHED = false
end

if UltimateDrivingCURRENT ~= UltimateDrivingVersion then
UDISPATCHED = true
elseif UltimateDrivingCURRENT == UltimateDrivingVersion then
UDISPATCHED = false
end
--]--End Of Is Patched
