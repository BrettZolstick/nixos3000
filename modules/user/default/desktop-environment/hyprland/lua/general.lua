-- --- AUTOSTART ---
hl.on("hyprland.start", function()
	hl.exec_cmd("noctalia")
	hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
end)

-- --- GENERAL ---
hl.config({
  general = {
    allow_tearing = true, -- Permit tearing for lower-latency rendering when applicable. Default: false.
    border_size = 1, -- Border thickness around windows in layout pixels. Default: 1.
    extend_border_grab_area = 15, -- Extra pointer grab area for dragging borders. Default: 15.
    float_gaps = 0, -- Padding around floating windows; -1 means automatic. Default: 0.
    gaps_in = 5, -- Space between adjacent tiled windows. Default: 5.
    gaps_out = 20, -- Space between windows and monitor edges. Default: 20.
    gaps_workspaces = 0, -- Additional spacing between workspace views. Default: 0.
    hover_icon_on_border = true, -- Show resize cursor when hovering a resizable border. Default: true.
    modal_parent_blocking = true, -- Block interaction with a parent window while its modal dialog is open. Default: true.
    no_focus_fallback = false, -- Keep focus unchanged if directional focus finds no target. Default: false.
    resize_corner = 0, -- Select the forced corner for resizing floating windows. Default: 0.
    resize_on_border = false, -- Allow dragging window borders or gaps to resize. Default: false.
    layout = "dwindle", -- Choose how tiled windows are arranged on each workspace.
    -- layout = "dwindle", -- Recursively splits space as windows are added.
    -- layout = "master", -- Keeps one or more master windows with the others in a stack.
    -- layout = "scrolling", -- Places windows on a scrolling tape, similar to Niri.
    -- layout = "monocle", -- Displays one maximized tiled window at a time.
  },
})

-- --- GENERAL.COL ---
hl.config({
  general = {
    col = {
      active_border = "0xff999999", -- Color or gradient of the currently focused window border. Default: 0xffffffff.
      inactive_border = "0xff444444", -- Color or gradient of other window borders. Default: 0xff444444.
      nogroup_border = "0xffffaaff", -- Border for windows that cannot join a group. Default: 0xffffaaff.
      nogroup_border_active = "0xffff00ff", -- Active border for windows that cannot join a group. Default: 0xffff00ff.

    },
  },
})

-- --- GENERAL.SNAP ---
hl.config({
  general = {
    snap = {
      enabled = false, -- Enable snapping of floating windows to nearby edges. Default: false.
      border_overlap = false, -- Account for overlapping borders during snapping. Default: false.
      respect_gaps = false, -- Keep configured gaps when snapping floating windows. Default: false.
      monitor_gap = 10, -- Distance at which floating windows snap to monitor edges. Default: 10.
      window_gap = 10, -- Distance at which floating windows snap to each other. Default: 10.
      
    },
  },
})

-- --- DWINDLE ---
hl.config({
  dwindle = {
    -- Dwindle split direction: Which side of the existing window receives new windows.
    force_split = 0, -- Default. Follow the cursor/split context.
    -- force_split = 1, -- Always place the new window left or above.
    -- force_split = 2, -- Always place the new window right or below.

    preserve_split = false, -- Keep the current split direction as windows change. Default: false.
    smart_split = false, -- Use cursor position to choose the next split direction. Default: false.
    smart_resizing = true, -- Choose resize direction based on the mouse position instead of the tiling layout. Default: true.
    permanent_direction_override = false, -- Keep a manually chosen split direction until you change or clear it. Default: false.
    split_width_multiplier = 1.0, -- Adjust when Dwindle divides windows side-by-side versus top-and-bottom. Default: 1.0.
    use_active_for_splits = true, -- Base new splits on the focused window instead of the mouse position. Default: true.
    default_split_ratio = 1.0, -- Default split ratio; 1.0 produces equal halves. Default: 1.0.
    --Dwindle split bias: Which half is affected by the configured split ratio.
    split_bias = 0, -- Default. Bias the upper or left half.
    -- split_bias = 1, -- Bias the currently focused window.

    -- precise_mouse_move = false, -- Place dragged windows more precisely according to the drop position. Default: false.

  },
})

-- --- MASTER ---
hl.config({
  master = {
    -- allow_small_split = false, -- Permit horizontal splits among multiple master windows. Default: false.
    -- special_scale_factor = 1, -- Adjust special scale factor for master. Default: 1.
    -- mfact = 0.55, -- Fraction of workspace reserved for the master column. Default: 0.55.
    -- Master new-window status: Whether new windows join the master region or slave stack.
    -- new_status = "slave", -- Default. Put new windows in the slave stack.
    -- new_status = "master", -- Make each new window a master.
    -- new_status = "inherit", -- Use the focused window's master/slave status.

    -- new_on_top = false, -- Place newly opened slave windows at top of stack. Default: false.
    -- Master insertion position: Where new windows appear relative to the focused window.
    -- new_on_active = "none", -- Default. Follow the master.new_on_top rule.
    -- new_on_active = "before", -- Insert a window immediately before the active window.
    -- new_on_active = "after", -- Insert a window immediately after the active window.

    -- Master orientation: Which side of the monitor contains the main window(s).
    -- orientation = "left", -- Default. Place master windows on the left.
    -- orientation = "right", -- Place master windows on the right.
    -- orientation = "top", -- Place master windows above the stack.
    -- orientation = "bottom", -- Place master windows below the stack.
    -- orientation = "center", -- Center master windows between slave stacks.

    -- slave_count_for_center_master = 2, -- Number of slaves before centered master activates. Default: 2.
    -- Centered-master fallback: Position master when too few slave windows exist.
    -- center_master_fallback = "left", -- Default. Fall back to master on the left.
    -- center_master_fallback = "right", -- Fall back to master on the right.
    -- center_master_fallback = "top", -- Fall back to master at the top.
    -- center_master_fallback = "bottom", -- Fall back to master at the bottom.

    -- smart_resizing = true, -- Resize the nearest relevant master/slave split. Default: true.
    -- drop_at_cursor = true, -- Choose drop position from pointer when moving windows. Default: true.
    -- always_keep_position = false, -- Preserve master position during layout changes. Default: false.
    -- focus_master_on_close = false, -- Focus master window after a slave closes. Default: false.

  },
})

-- --- SCROLLING ---
hl.config({
  scrolling = {
    -- fullscreen_on_one_column = true, -- Expand a workspace single column to output width. Default: true.
    -- column_width = 0.5, -- Fraction of output width allocated to a new scrolling column. Default: 0.5.
    -- Scrolling focus visibility: How a focused column is brought on screen.
    -- focus_fit_method = 0, -- Center the focused column.
    -- focus_fit_method = 1, -- Default. Scroll only enough to fit the column.
    -- focus_fit_method = 2, -- Center the column, clamped to available tape bounds.

    -- Scrolling follow focus: When the scroll strip should follow the focused window.
    -- follow_focus = 0, -- Focusing does not move the scrolling strip.
    -- follow_focus = 1, -- Default. Follow focus when needed; clicks always reposition the strip.
    -- follow_focus = 2, -- Follow focus as needed, without special click behavior.

    -- follow_min_visible = 0.4, -- Minimum visible portion needed for focus behavior. Default: 0.4.
    -- explicit_column_widths = "0.333, 0.5, 0.667, 1.0", -- Predefined scrolling-column widths. Default: "0.333, 0.5, 0.667, 1.0".
    -- wrap_focus = true, -- Wrap focus at first/last column. Default: true.
    -- wrap_swapcol = true, -- Wrap column swaps at tape ends. Default: true.
    -- Scrolling tape direction: Where new columns extend from the current one.
    -- direction = "right", -- Default. Extend and scroll horizontally to the right.
    -- direction = "left", -- Extend and scroll horizontally to the left.
    -- direction = "down", -- Extend and scroll vertically downward.
    -- direction = "up", -- Extend and scroll vertically upward.

  },
})

-- --- ECOSYSTEM ---
hl.config({
  ecosystem = {
    enforce_permissions = false, -- Require Hyprland permission rules for sensitive features such as screen capture. Default: false.
    no_donation_nag = false, -- Hide Hyprland’s occasional donation reminder. Default: false.
    no_update_news = false, -- Hide Hyprland’s announcement popup after updates. Default: false.

  },
})
