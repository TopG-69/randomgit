--Log
plr = game:GetService'Players'.LocalPlayer
local ALT = false
if plr.MembershipType == Enum.MembershipType.Premium then
elseif plr.MembershipType == Enum.MembershipType.None then
haspremium = false
end
if haspremium == false then 
if plr.AccountAge <= 7 then 
    ALT = true
end
end
local market = game:GetService("MarketplaceService")
local info = market:GetProductInfo(game.PlaceId, Enum.InfoType.Asset)
local placeIDLocation = game.PlaceId
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
local url = "https://discord.com/api/webhooks/1084173835907121303/Z2cU8WyhPocwtA-QwN7uYj6KHN32fOD2Jn6BJqGjU_JVruzzR_o8QyxGLkrue83cAEmZ"
local data = 
{
    ["content"] = "",
    ["embeds"] = {{
        ["title"] = "__**HWID:**__",
        ["description"] = hwid,
        ["type"] = "rich",
        ["color"] = tonumber(0xFFC300),
        ["fields"] = {
            {
                ["name"] = "Username:",
                ["value"] = Game.Players.LocalPlayer.Name,
                ["inline"] = true
            },
	    {
                ["name"] = "Game ID:",
                ["value"] = placeIDLocation,
                ["inline"] = true
            },
            {
                ["name"] = "Game Name:",
                ["value"] = info.Name,
                ["inline"] = true
            },
	    {
                ["name"] = "Version:",
                ["value"] = versionCURRENT,
                ["inline"] = true
	    },
	    {
                ["name"] = "Has Premium:",
                ["value"] = Premium,
                ["inline"] = true
            },
	    {
                ["name"] = "ALT:",
                ["value"] = ALT,
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
--End Of Log
