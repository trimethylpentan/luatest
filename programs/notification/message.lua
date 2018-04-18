local table = require("std.table")

local Message = {
  userName = "",
  message = ""
}

local function create(userName, message)
  local newMessage = table.clone(Message)
  newMessage.userName = userName
  newMessage.message = message
  
  return newMessage
end
Message.create = create

local function test()
  return "test"
end
Message.test = test

return Message