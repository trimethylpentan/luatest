local xmlReader = {}

local dir = "./luatest/lua/"
local xml2lua = require(dir .. "xml2lua.xml2lua")
local handler = require(dir .. "xml2lua/xmlhandler/tree")
local xml = xml2lua.loadFile("F:/LuaTest/src/luatest/lua/people.xml")
local parser = xml2lua.parser(handler)
--parser:parse(xml)

local function getSettings()
    
    lines = {}
    print(xml2lua.showTable(handler.root))
    
    --for k, p in pairs(handler.root.people.person) do
    --    print("Name:", p.name, "City:", p.city, "Type:", p._attr.type)
    --end
end
xmlReader.getSettings = getSettings

return xmlReader

