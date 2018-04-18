local input = {}

local function printMessage(message)
  io.write(message .. "\n")
end

local function isValid(input, pattern)
  if string.match(input, pattern) == nil then
    return false
  end

  return true
end

local function getInput(message, pattern)
  printMessage(message)
  local input = io.read("*l")
  
  if isValid(input, pattern) == false then
    io.write("Invalid Input\n")
    return getInput(message, pattern)
  end

  return input
end
input.getInput = getInput

return input
