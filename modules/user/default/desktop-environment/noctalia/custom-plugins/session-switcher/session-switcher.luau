local MAP_PATH = "/etc/ly/tty-users.json"
local TILE_HEIGHT = 128
local me = noctalia.getenv("USER") or ""
local users = {}
local hovered = nil
local errorText = nil

local function loadUsers()
  users = {}
  errorText = nil

  -- import /etc/ly/tty-users.json
  local raw, readError = noctalia.readFile(MAP_PATH)
    if not raw then
      errorText = "Couldn't read " .. MAP_PATH .. " (" .. tostring(readError) ..")"
    return
  end

  -- decode the JSON into a lua table
  local ok, map = pcall(noctalia.json.decode, raw)
  if not ok or type(map) ~= "table" then
    errorText = MAP_PATH .. " isn't valid JSON"
    return
  end

  -- parse into a properly formatted sorted list
  for ttyName, userName in pairs(map) do
    local number = tonumber(string.match(ttyName, "^tty(%d+)$"))
    if number then
      table.insert(users, { tty = number, name = userName})
    end
  end
  table.sort(users, function(a,b) return a.tty < b.tty end)
  
end

-- draw a small number box in each tile's top right corner
local function badge(number)
  return ui.row({ justify = "end"},{
    ui.row({ fill = surface, radius = 6, border = "outline_variant", borderWidth = 1, paddingH = 6, paddingV = 2 }, {
      ui.label({ text = tostring(number), fontSize = 12, color = "on_surface_variant" }),
    }),
  })
end
