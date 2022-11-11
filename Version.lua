local VerifyVersion = 1

if versionCURRENT ~= VerifyVersion then
AlertUI = Alert.Label({Text = "Your Using A Outdated Version Please Update"})
  local OUTDATEDVERSION = true
else
  AlertUI = Alert.Label({Text = "Your Running The Latest Version"})
  local OUTDATEDVERSION = false
end
