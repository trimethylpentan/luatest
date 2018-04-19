local table = require("std.table")
local json = require("dependencies.json")

local messagesFilename = "./src/lua/programs/notification/data/messages.json"

local file = io.open(messagesFilename, "r")
local fileContent = file:read("*a")
file:close()

--all messages
local messages = json.parse(fileContent)

local Message = {}
local singleMessage = {
    userName = "",
    message = ""
  }


local function create(userName, message)
  local newMessage = table.clone(singleMessage)
  newMessage.userName = userName
  newMessage.message = message
  
  return newMessage
end
Message.create = create

local function register(message)
  table.insert(messages, message)
  for key, value in pairs(message) do
    print(key)
    print(value)
  end
  

  local messagesFile = io.open(messagesFilename, "a")
  messagesFile:write(json.stringify(message))
end
Message.register = register
  

return Message