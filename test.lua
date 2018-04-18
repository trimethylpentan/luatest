package.path = ";./src/lua/?.lua"
require("shell")

function useless()
    local baum = 5
    
    while baum < 200 do
        baum = baum + 1
    end
    
    return baum
end

function getRandomArray(length)
    local a = {}
    
    math.randomseed(os.time())
    for i = 0, length do
        a[i] = math.random() * 100
    end
    
    io.write("Generated array... \n")
    return a
end

function doArrayStuff()
    
    local array = getRandomArray(1000)
    
    local sum = 0
    for key, value in pairs(array) do
        sum = sum + array[key]
    end
    
    return (sum / #array)
end

function bubbleSort()
    local toSort = getRandomArray(100000000)
    io.write("Start sorting... \n")
    
    for i = #toSort, 0, - 1 do
        for j = 0, i - 1 do
            if toSort[j] > toSort[j + 1] then
                local helper = toSort[j]
                toSort[j] = toSort[j + 1]
                toSort[j + 1] = helper
            end
        end
    end
    
    io.write("Printing sorted array... \n")
    for i = 0, #toSort do
        print(toSort[i])
    end
end

--bubbleSort()