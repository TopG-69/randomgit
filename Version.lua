local VerifyVersion = 1

if versionCURRENT ~= VerifyVersion then
  AlertList = AlertTab.Label({Text = "Your Using A Outdated Version Please Update"})
  OUTDATEDVERSION = true
else
  AlertList = AlertTab.Label({Text = "Your Running The Latest Version"})
  OUTDATEDVERSION = false
end
