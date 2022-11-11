local VerifyVersion = 1

if versionCURRENT ~= VerifyVersion then
AlertUI = AlertI.Label({Text = "Your Using A Outdated Version Please Update"})
  OUTDATEDVERSION = true
else
  AlertUI = AlertI.Label({Text = "Your Running The Latest Version"})
  OUTDATEDVERSION = false
end
