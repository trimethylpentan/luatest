function string.split(string, divider)
  local splitted = {}
  counter = 0
  for part in string.gmatch(string, divider) do
    splitted[counter] = part
    counter = counter + 1
  end

  return splitted
end

function clearConsole()
  if not os.execute("clear") then
    os.execute("cls")
  elseif not os.execute("cls") then
    for i = 1,15 do
      print("\n")
    end
  end
end

function sleep(n)
  if not os.execute("sleep " .. tonumber(n)) then
    if n > 0 then 
      -- os.execute("ping 127.0.0.1 -n1 -w " .. tonumber(n) " >NUL")
    end
  end
end

function fileExists(name)
  local f=io.open(name,"r")
  if f~=nil then io.close(f) return true else return false end
end

function canRequire(toRequire)
  local canRequire =  pcall(require, toRequire)
  return canRequire
end
