local input = require("dependencies.input")

local function generateCrossSum(number)
    sum = 0;
    while number ~= 0 do
        sum = sum + (number % 10);
        number = math.floor(number / 10);
    end
    
    return sum;
end

local function getEvenChecksum(userInput) 
    t = {}
    userInput:gsub(".",function(c) table.insert(t,c) end)
    
    result = 0
    for key, value in pairs(t) do
        if key % 2 == 0 then
            result = result + generateCrossSum(value)
        end
    end
    
    return result
end

local function getDifferenceToNextTenNumber(checksum)
    nextTen = 10 * (math.ceil(checksum / 10))
    
    if nextTen == 10 then
        nextTen = 0
    end
    
    return nextTen - checksum
end

local function getOddChecksum(userInput)
    t = {}
    userInput:gsub(".",function(c) table.insert(t,c) end)
    
    result = 0
    for key, value in pairs(t) do
        if key % 2 == 1 then
            result = result + value
        end
    end
    
    return result
end

local function isValid(userInput)
    evenSum = getEvenChecksum(userInput)
    oddSum = getOddChecksum(userInput)
    difference = getDifferenceToNextTenNumber(evenSum + oddSum)
    
    cardNumbers = {}
    userInput:gsub(".",function(c) table.insert(cardNumbers,c) end)
    
    return tonumber(difference) == tonumber(cardNumbers[16])
end

local valid = isValid(input.getInput("Please Enter your credit card number", "^%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d$"))

local message = "Incorrect credit card number!"
if valid then
  message = "Correct credit card number!"
end

io.write(message .. "\n")