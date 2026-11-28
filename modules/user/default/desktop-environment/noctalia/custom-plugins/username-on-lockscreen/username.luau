function update()
  local user = noctalia.getenv("USER") or "unknown"
  desktopWidget.render(ui.label({
    text = user,
    fontSize = 20,
    color = "on_primary",
    shadow = true,
  }))
end
