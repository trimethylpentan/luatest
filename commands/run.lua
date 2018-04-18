local run = {}

local function executeCommand(parameters)
  if #parameters < 1 then
    io.write("No program name given, exiting...\n")
    return
  end
  io.write("Trying to start program " .. parameters[1] .. "...\n\n")

  if fileExists("./src/lua/" .. parameters[1] .. ".lua") then
    sleep(0.5)
    clearConsole()
    local status, err = pcall(function() dofile("./src/lua/" .. parameters[1] .. ".lua") end)
    if status == false then
      io.write("Exception raised in program " .. parameters[1] .. ":\n")
      io.write(err .. "\n")
    end

    io.write("\nExiting program...\n")
    sleep(0.5)
    clearConsole()
  else
    io.write("File with name " .. parameters[1] .. " does not exist!\n")
  end
end
run.executeCommand = executeCommand

return run