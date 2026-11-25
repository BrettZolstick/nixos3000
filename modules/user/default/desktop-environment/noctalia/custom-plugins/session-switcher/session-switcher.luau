-- I will be excessively commenting everything because I
-- am new to lua, and if I don't write it down, I will forget

local function loadUsers()

  -- Define the table we will be creating.
  -- we want a table sorted from first to last with the
  -- following pairs: tty = <number>, name = <username>
  users = {}
  errorText = nil

  -- set the path to the tty-users.json file
  local ttyUsersJsonPath = "/etc/ly/tty-users.json"
  
  -- grab the file at "/etc/ly/tty-ussers.json"
  local rawFile, readErr = noctalia.readFile(ttyUsersJsonPath)
  if not rawFile then
    errorText = "Cant read the json file: " .. ttyUsersJsonPath
    debugText = errorText
    return
  end
  noctalia.log("\n\nRaw File :\n\n" .. tostring(rawFile) .. "\n\n")

  
  -- decode the raw json file into a lua table  
  local jsonMap, jsonErr = noctalia.json.decode(rawFile)
  if type(jsonMap) ~= "table" then
    noctalia.notifyError("Could not decode the json file at " .. ttyUsersJsonPath, tostring(rawFile))
    return
  end
  noctalia.log("\n\nJsonMap :\n\n" .. tostring(noctalia.json.encode(jsonMap, true)) .. "\n\n")

  
  -- extract the tty number and store it in the output table
  for tty, userName in pairs(jsonMap) do
    local ttyNumber = tonumber(string.match(tty, "^tty(%d+)$"))
    table.insert(users, {tty = ttyNumber, name = userName})
  end
  noctalia.log("\n\nUnsortedTable : \n\n".. tostring(noctalia.json.encode(users, true)) .. "\n\n")

  -- sort the users table from first to last tty
  table.sort(users, function(a,b) return a.tty < b.tty end)
  noctalia.log("\n\nsortedTable : \n\n".. tostring(noctalia.json.encode(users, true)) .. "\n\n")
  
end

function onOpen(context)
  loadUsers()
end
