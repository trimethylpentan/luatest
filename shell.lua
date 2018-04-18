_DEBUG = false
package.path = package.path .. ";./src/lua/?.lua;./src/lua/dependencies/share/lua/5.1/?.lua"
package.config = "\;?!-"

require "debug"
require("dependencies.standardlib")
io.write("Welcome to the lua shell.\n")

function getCommand()
  local command = io.read("*l")
  if command == "" or command == nil then
    return ""
  end
  
  local splitted = string.split(command, "%S+")
  if splitted == nil then
    splitted = {}
    splitted[0] = command
  end

  if command == "exit" then
    return "exit"
  end

  if canRequire("commands." .. splitted[0]) then
    local toRun = require("commands." .. splitted[0])
    toRun.executeCommand(splitted)
  else
    io.write("Unknown command: " .. splitted[0] .. "\n")
  end

  return splitted[0]
end

repeat
  local command = getCommand()
until command == "exit"

