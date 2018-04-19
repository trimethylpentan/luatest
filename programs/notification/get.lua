local json = require("dependencies.json")
local input = require("dependencies.input")

local usersFile = "./src/lua/programs/notification/data/users.json"
local messagesFile = "./src/lua/programs/notification/data/messages.json"

local users = json.parse(usersFile)

local userName = input.getInput("Please enter your user-name:", ".")
local password = input.getInput("Please enter your password", ".")

local userIsCorrect = false;
local passwordIsCorrect = false;

for user in pairs(users) do
  print(user)
  if user["username"] == userName then
    userIsCorrect = true
  end
end
