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

function draw()
  
  panel.render(
    ui.row({ gap = 10, padding = 0, flexGrow = 1}, {
      ui.column({ padding = 10, radius = 10, fill = "surface_container_high/0.3", flexGrow = 1, justify = "space_between", align = "stretch", border = "outline", borderWidth = 1 }, {
        ui.row({ justify = "end" },{
          ui.column({ paddingH = 7, paddingV = 2, radius = 6, fill = "on_surface/0.8" }, {
            ui.label({ text = "1", color = "surface", fontWeight = bold})
          })
        }),
        ui.label({ text = "gaming", fontWeight = "Bold", fontSize = 20})  
      }),
      ui.column({ padding = 10, radius = 10, fill = "surface", flexGrow = 1, justify = "space_between", align = "start", border = "outline", borderWidth = 1 }, {
        ui.label({ text = "personal", fontWeight = "Bold", fontSize = 20})  
      }),
      ui.column({ padding = 10, radius = 10, fill = "surface", flexGrow = 1, justify = "space_between", align = "start", border = "outline", borderWidth = 1 }, {
        ui.label({ text = "cookiegroup", fontWeight = "Bold", fontSize = 20})  
      }),
      ui.column({ padding = 10, radius = 10, fill = "surface", flexGrow = 1, justify = "space_between", align = "start", border = "outline", borderWidth = 1 }, {
        ui.label({ text = "plexus", fontWeight = "Bold", fontSize = 20})  
      }),
    })
  )
    
end

function onOpen(context)
  loadUsers()
  draw()
end
