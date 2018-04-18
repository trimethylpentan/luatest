local input = require("dependencies/input")
local message = require("programs/notification/message")

local user = input.getInput("Please enter the user you want to notify:", ".")
message = message.create(user, "bla")

io.write(message.userName .. "\n")