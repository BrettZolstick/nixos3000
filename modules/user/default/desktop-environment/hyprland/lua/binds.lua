-- --- KEYBINDINGS ---
local terminal = "kitty"
local browser = "firefox"
local appLauncher = "noctalia msg panel-toggle launcher"
local fileManager = terminal .. " yazi"
local processViewer = terminal .. " btop"
local notificationCenter = "noctalia msg panel-toggle notifications"
local lock = "noctalia msg session lock"
local screenshot = "noctalia msg screenshot-region"
local screenshotAnnotate = "noctalia msg screenshot-region --annotate"
local switchUsers = "noctalia msg panel-toggle BrettZolstick/session-switcher:session-switcher"


-- Launch Apps.
hl.bind("SUPER + RETURN",    hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + SPACE",     hl.dsp.exec_cmd(appLauncher))
hl.bind("SUPER + DELETE",    hl.dsp.exec_cmd(processViewer))
hl.bind("SUPER + B",         hl.dsp.exec_cmd(browser))
hl.bind("SUPER + E",         hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + N",         hl.dsp.exec_cmd(notificationCenter))
hl.bind("SUPER + L",         hl.dsp.exec_cmd(lock))
hl.bind("SUPER + S",         hl.dsp.exec_cmd(screenshot))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(screenshotAnnotate))
hl.bind("SUPER + TAB",       hl.dsp.exec_cmd(switchUsers))


-- Close the focused window.
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + F", hl.dsp.window.fullscreen())

-- Move focus with arrow keys
hl.bind("SUPER + LEFT",  hl.dsp.focus({direction = "left"}))
hl.bind("SUPER + RIGHT", hl.dsp.focus({direction = "right"}))
hl.bind("SUPER + UP",    hl.dsp.focus({direction = "up"}))
hl.bind("SUPER + DOWN",  hl.dsp.focus({direction = "down"}))

-- Switch active workspace (temporary unti I get my custom workspace towers set up)
hl.bind("SUPER + 1", hl.dsp.focus({workspace = "1"}))
hl.bind("SUPER + 2", hl.dsp.focus({workspace = "2"}))
hl.bind("SUPER + 3", hl.dsp.focus({workspace = "3"}))
hl.bind("SUPER + 4", hl.dsp.focus({workspace = "4"}))
hl.bind("SUPER + 5", hl.dsp.focus({workspace = "5"}))
hl.bind("SUPER + 6", hl.dsp.focus({workspace = "6"}))
hl.bind("SUPER + 7", hl.dsp.focus({workspace = "7"}))
hl.bind("SUPER + 8", hl.dsp.focus({workspace = "8"}))
hl.bind("SUPER + 9", hl.dsp.focus({workspace = "9"}))
hl.bind("SUPER + 0", hl.dsp.focus({workspace = "10"}))

-- move active window to workspace (temporary until I get my custom workspace towers set up)
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({workspace = "1"}))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({workspace = "2"}))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({workspace = "3"}))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({workspace = "4"}))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({workspace = "5"}))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({workspace = "6"}))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({workspace = "7"}))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({workspace = "8"}))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({workspace = "9"}))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({workspace = "10"}))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), {mouse = true})
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), {mouse = true})

-- --- BINDS CONFIG ---
hl.config({
  binds = {
    allow_workspace_cycles = false, -- Allow cyclic navigation through workspace history. Default: false.
    disable_keybind_grabbing = false, -- Ignore apps asking to intercept global shortcuts. Default: false.
    drag_threshold = 0, -- Pointer movement required to start dragging a window. Default: 0.
    drag_center_window = true, -- Center floating window beneath cursor when dragged. Default: true.
    focus_preferred_method = 0, -- Choose how Hyprland selects a window when moving focus by direction.
    -- focus_preferred_method = 0, -- Default. Favor the most recently active matching window.
    -- focus_preferred_method = 1, -- Favor windows that share longer adjacent borders.

    hide_special_on_workspace_change = false, -- Hide special workspace when normal workspace changes. Default: false.
    ignore_group_lock = false, -- Allow dispatchers to disregard locked groups. Default: false.
    movefocus_cycles_fullscreen = false, -- Allow directional focus changes from fullscreen windows. Default: false.
    movefocus_cycles_groupfirst = false, -- Visit group members before neighboring windows. Default: false.
    pass_mouse_when_bound = false, -- Pass pointer events through even with mouse bindings. Default: false.
    scroll_event_delay = 300, -- Minimum delay between wheel-triggered keybindings. Default: 300.
    window_direction_monitor_fallback = true, -- Permit directional focus/movement across monitor edges. Default: true.
    workspace_back_and_forth = 0, -- Choose whether selecting the current workspace returns to the previous one.
    -- workspace_back_and_forth = 0, -- Default. Do nothing when focusing the active workspace again.
    -- workspace_back_and_forth = 1, -- Jump back to the previous workspace globally.
    -- workspace_back_and_forth = 2, -- Jump back to the previous workspace on the current monitor.

    workspace_center_on = 1, -- Choose where to place the cursor after switching workspaces.
    -- workspace_center_on = 0, -- Center the pointer on the workspace/monitor.
    -- workspace_center_on = 1, -- Default. Center near the workspace's last active window.


  },
})
