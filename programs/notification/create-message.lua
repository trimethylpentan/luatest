local input = require("dependencies/input")
local message = require("programs/notification/message")

local user = input.getInput("Please enter the user you want to notify:", ".")
local messageText = input.getInput("Please enter your message:", ".")

newMessage = message.create(user, messageText)
message.register(newMessage)
io.write("Message succesfully created")