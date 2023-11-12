--[[
you can use this as ip grabber or something you're professional to edit
you can also kick the player
]]
-- Replace "YOUR_API_KEY" with your actual API key
local apiKey = "YOUR_API_KEY"
local HttpService = game:GetService("HttpService")

-- Make the HTTP request to the API
local apiUrl = "https://vpnapi.io/api/?key=" .. apiKey
local jsonResponse = game:HttpGetAsync(apiUrl, Enum.HttpRequestType.GET, Enum.HttpContentType.ApplicationJson)

-- Decode JSON
local data = HttpService:JSONDecode(jsonResponse)

-- Check if VPN or proxy is detected
if data.security.vpn then
    print("VPN detected")
    --you can add something to this
elseif data.security.proxy then
    print("Proxy detected")
    --you can also add something to this
else
    -- Check autonomous_system_organization (Cloudflare sucks it won't noted as vpn sometimes)
    if data.network.autonomous_system_organization == "CLOUDFLARENET" then
        print("Possible VPN or Proxy (CLOUDFLARENET)")
        --add something to this
    else
        print("No VPN or proxy detected")
    end
end
