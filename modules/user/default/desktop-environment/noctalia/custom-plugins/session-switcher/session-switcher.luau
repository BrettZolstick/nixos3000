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
  
  -- grab the file at "/etc/ly/tty-users.json"
  local rawFile, readErr = noctalia.readFile(ttyUsersJsonPath)
  if not rawFile then
    errorText = "Cant read the json file: " .. ttyUsersJsonPath
    debugText = errorText
    return
  end

  -- decode the raw json file into a lua table  
  local jsonMap, jsonErr = noctalia.json.decode(rawFile)
  if type(jsonMap) ~= "table" then
    errorText = "Could not decode the json file at " .. ttyUsersJsonPath .. ": \n\n" .. tostring(rawFile)
    debugText = errorText
    return
  end

  -- extract the tty number and store it in the output table
  for tty, userName in pairs(jsonMap) do
    local ttyNumber = tonumber(string.match(tty, "^tty(%d+)$"))
    table.insert(users, {tty = ttyNumber, name = userName})
  end

  -- sort the users table from first to last tty
  table.sort(users, function(a,b) return a.tty > b.tty end)
  
  debugJson = noctalia.json.encode(users, true)
  debugText = tostring(debugJson)
end


local function debugrender()
  
  panel.render(
    ui.column({padding = 12, gap = 6},{
        ui.label({ text = debugText, fontSize = 14, color = "on_surface"}),
      }
    )
  )
  
end

function onOpen(context)
  loadUsers()
  debugrender()
end
