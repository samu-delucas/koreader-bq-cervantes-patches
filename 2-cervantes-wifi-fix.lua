-- Fixes WiFi checkbox and status icons behavior.
-- These issues were caused by KOReader not detecting the WiFi "off" status.

local NetworkMgr = require("ui/network/manager")

function NetworkMgr:isWifiOn()
    local f = io.open("/sys/class/net/eth0/operstate", "r")
    if not f then return false end
    local state = f:read("*all"):gsub("%s+", "")
    f:close()
    return state ~= "down"
end