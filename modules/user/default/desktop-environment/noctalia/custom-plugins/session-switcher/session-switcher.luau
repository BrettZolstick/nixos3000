local users = {}          
local selectedIndex = 1
local draw

local function loadUsers()
  local result = {}
  local ttyUsersJsonPath = "/etc/ly/tty-users.json"

  -- read tty-users.json
  local rawFile, readErr = noctalia.readFile(ttyUsersJsonPath)
  if not rawFile then
    noctalia.notifyError("Can't read " .. ttyUsersJsonPath, tostring(readErr)) 
    return result
  end

  -- decode the json text into a lua table
  local jsonMap, jsonErr = noctalia.json.decode(rawFile)
  if type(jsonMap) ~= "table" then
    noctalia.notifyError("Could not decode " .. ttyUsersJsonPath, tostring(jsonErr))
    return result
  end

  -- parse the table and extract the tty number
  for tty, userName in pairs(jsonMap) do
    local ttyNumber = tonumber(string.match(tty, "^tty(%d+)$"))
    if ttyNumber then
      table.insert(result, { tty = ttyNumber, name = userName })
    end
  end

  -- sort by tty number
  table.sort(result, function(a, b) return a.tty < b.tty end)

  return result
end

-- Which tty is this machine currently showing?
local function currentTty()
  local active = noctalia.readFile("/sys/class/tty/tty0/active")
  return active and tonumber(string.match(active, "tty(%d+)"))
end

local function switchTo(tty)
  panel.close()
  noctalia.runAsync("switch-session " .. tostring(tty))
end

local function drawTtyBadge(number)
  return ui.row({ justify = "end" }, {
    ui.column({ paddingH = 7, paddingV = 2, radius = 6, fill = "on_surface/0.8" }, {
      ui.label({ text = tostring(number), color = "surface", fontWeight = "bold" })
    })
  })
end

local function drawUsernameLabel(username)
  return ui.label({ text = username, fontWeight = "bold", fontSize = 20 })
end

local function drawSelectionBox(index, number, username)

  local isHovered  = (hoveredIndex == index)
  local isSelected = (selectedIndex == index)

  return ui.column({
    key = "tty" .. number,                     -- stable identity per tile, so re-renders reuse the same native control

    onHover = function(state)
      if state == "true" then
        hoveredIndex = index
      elseif hoveredIndex == index then
        hoveredIndex = nil
      end
      draw()
    end,

    -- mouse clicks this tile
    onClick = function()
      switchTo(number)
    end,

    fill = if isHovered then "surface_container_highest/0.7"
           elseif isSelected then "primary/0.7"
           else "surface_container_high/0.3",

    padding = 10,
    radius = 10,
    flexGrow = 1,
    justify = "space_between",
    align = "stretch",
    border = "outline_variant",
    borderWidth = 1,
  }, {
    drawTtyBadge(number),
    drawUsernameLabel(username),
  })
end

function draw()
  local boxes = {}
  for index, user in ipairs(users) do
    table.insert(boxes, drawSelectionBox(index, user.tty, user.name))
  end

  panel.render(
    ui.row({ gap = 10, padding = 0, flexGrow = 1 }, boxes)
  )
end

function onOpen(context)
  users = loadUsers()
  hoveredIndex = nil

  -- default selection is the current tty
  selectedIndex = 1 -- fallback if the current tty isn't one of the tiles
  local here = currentTty()
  for index, user in ipairs(users) do
    if user.tty == here then
      selectedIndex = index
      break
    end
  end

  draw()
end

function onKey(chord, pressed, repeated)
  if not pressed then return end
  
  if chord == "Left" then
    selectedIndex = math.max(1, selectedIndex - 1)
    draw()
    return
  elseif chord == "Right" then
    selectedIndex = math.min(#users, selectedIndex + 1)
    draw()
    return
  end

  if chord == "Return" then
    local user = users[selectedIndex]
    if user then
      switchTo(user.tty)
    end
    return
  end

  for _, user in ipairs(users) do
    if chord == tostring(user.tty) then
      switchTo(user.tty)
      return
    end
  end
end
