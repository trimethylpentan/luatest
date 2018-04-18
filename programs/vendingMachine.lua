local input = require("dependencies.input")

local function convertToBool(input)
  if input == "1" then 
    return true
  end
  
  return false
end

local function giveDrink()
  local coin = convertToBool(input.getInput("Muenze einwerfen", "^%d$"))
  local tea = convertToBool(input.getInput("Tee?", "^%d$"))
  local coffee = convertToBool(input.getInput("Kaffee?", "^%d$"))
  
  local water = false
  local giveTea = false
  local giveCoffee = false

  if coin == true and (tea == true or coffee == true) then
    water = true
  end

  if coffee == true and tea == false then
    giveCoffee = true
  end

  if tea == true and coffee == false then
    giveTea = true
  end

  return water, giveCoffee, giveTea
end

water, coffee, tea = giveDrink()

print("Wasser: ")
print(water)
print("Kaffee: ")
print(coffee)
print("Tee: ")
print(tea)
