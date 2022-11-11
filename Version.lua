local VerifyVersion = 1

if versionCURRENT ~= VerifyVersion then
AlertUI = Alert.Label({Text = "Your Using A Outdated Version Please Update"})
  OUTDATEDVERSION = true
else
  AlertUI = Alert.Label({Text = "Your Running The Latest Version"})
  OUTDATEDVERSION = false
end
