local json = require("dependencies.json")

local file = io.open("./src/lua/test.json", "r")
local fileContent = file:read("*a")
file:close()

local result = json.parse(fileContent)

for key, value in pairs(result) do
  print(key)
  print(value)
end
