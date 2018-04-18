local input = require("dependencies.input")

local function getOpenOrStart()
  local userInput = input.getInput("Do you want to start the machine or open it? (start/open)", "^%a%a%a%a%a?$")
  if userInput == "start" or userInput == "open" then
    return userInput
  end
  
  io.write("Only 'start' or 'open' are allowed inputs!\n")
  return getOpenOrStart()
end

local function convertToBool(table)
    for key, value in pairs(table) do
    if value == "y" then
      table[key] = true
    else
      table[key] = false
    end
  end
  return table
end

local function doStart()
  local inputs = {}
  inputs["doorInput"] = input.getInput("Door closed? (y/n)", "^%a$")
  inputs["programInput"] = input.getInput("Entered Program? (y/n)", "^%a$")
  inputs["temperatureInput"] = input.getInput("Entered Temperature? (y/n)", "^%a$")
  
  inputs = convertToBool(inputs)
    
    if inputs["doorInput"] == true and inputs["programInput"] == true and inputs["temperatureInput"] == true then
      return true
    end
    
    return false
end

local function doOpen()
  local inputs = {}
  inputs["programInput"] = input.getInput("Program stopped? (y/n)", "^%a$")
  inputs["waterInput"] = input.getInput("Water emptied? (y/n)", "^%a$")
  
  inputs = convertToBool(inputs)
    
    if inputs["programInput"] == true and inputs["waterInput"] == true then
      return true
    end
    
    return false
  end

io.write("Washing Machine\n")
local modus = getOpenOrStart()

if modus == "start" then
  local canStart = doStart()
  local message = "The washing machine could not be started!\n"
  
  if canStart == true then
    message = "Washing machine successfuly started!\n"
  end
  
  io.write(message)
else
  local canOpen = doOpen()
  local message = "Could not open the door!\n"
  
  if canOpen == true then
    message = "The door is open...\n"
  end
  
  io.write(message)
end
