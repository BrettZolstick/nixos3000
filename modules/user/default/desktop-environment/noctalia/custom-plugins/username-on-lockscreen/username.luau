local user = noctalia.getenv("USER") or "unknown"

local function draw()
  desktopWidget.render(ui.label({
    text = user,
    fontSize = 20,
    color = "on_primary",
    shadow = true,
  }))
end

draw()

function update()
  draw()
end
