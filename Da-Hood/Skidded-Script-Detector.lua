-- skidded da hood script detector - by xaxa
-- execute this after you have executed suspected skidded script

local ScriptList = {
    ["Ciazware "] = {
        GlobalEnviromentVariables = {"CiazWareUniversalAimbotLoaded", "CiazwareUniversalAimbotLoaded"},
        Response = "Ciazware Universal Aimbot Detected",
    },

    ["Stefanuk 12 Aiming Module"] = {
        GlobalEnviromentVariables = {"Aiming", "BypassFlyDaHood", "DaHoodSettings", "ValiantAimHacks"},
        Response = "Stefanuk 12's Aiming Module(s) Detected",
    },
}

local format, len, lower, find, split = string.format, string.len, string.lower, string.find, string.split;
local DetectionString = ""

table.foreach(ScriptList, function(TableName, TableValue)
    for Index, Value in next, TableValue do 
        if tostring(Index) == "GlobalEnviromentVariables" then 
            for _, Name in next, Value do 
                if getgenv()[Name] then 
                    DetectionString = split(lower(tostring(TableName)), " ")[1]
                end
            end
        end
        
        if len(DetectionString) > 0 and tostring(Index) == "Response" then 
            if DetectionString == split(lower(tostring(TableName)), " ")[1] then
                print(Value)
            end
        end
    end
end)
