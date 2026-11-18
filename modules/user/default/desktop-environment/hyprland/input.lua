-- --- INPUT ---
hl.config({
  input = {
    force_no_accel = true, -- Bypass pointer acceleration for rawer mouse movement. Default: false.
    accel_profile = "flat", -- Choose how pointer speed changes as you move the mouse.
    -- accel_profile = "flat", -- Use a constant speed multiplier without mouse acceleration.
    -- accel_profile = "adaptive", -- Speed-dependent acceleration, faster when moving quickly.
    -- accel_profile = "custom", -- Use a custom pointer acceleration curve supported by libinput.

    emulate_discrete_scroll = 1, -- Choose when to turn fine-grained wheel movement into separate scroll steps.
    -- emulate_discrete_scroll = 0, -- Do not emulate discrete wheel steps.
    -- emulate_discrete_scroll = 1, -- Default. Emulate only for non-standard wheel events.
    -- emulate_discrete_scroll = 2, -- Force emulation for every wheel event.

    float_switch_override_focus = 1, -- Choose when switching between tiled and floating windows changes focus.
    -- float_switch_override_focus = 0, -- Never change focus specifically because a window switches layout.
    -- float_switch_override_focus = 1, -- Default. Follow pointer when switching between tiled and floating.
    -- float_switch_override_focus = 2, -- Also follow pointer when switching between floating windows.

    focus_on_close = 0, -- Choose which window receives keyboard focus after one closes.
    -- focus_on_close = 0, -- Default. Focus the next eligible window.
    -- focus_on_close = 1, -- Focus the window currently under the pointer.
    -- focus_on_close = 2, -- Focus the most recently active window.

    follow_mouse = 1, -- Choose how moving or clicking the mouse changes keyboard focus.
    -- follow_mouse = 0, -- Moving the pointer does not change keyboard focus.
    -- follow_mouse = 1, -- Default. Moving the pointer focuses the window beneath it.
    -- follow_mouse = 2, -- Pointer focus is separate; clicking a window gives it keyboard focus.
    -- follow_mouse = 3, -- Pointer and keyboard focus remain separate even on click.

    follow_mouse_shrink = 0, -- Shrink hover areas before mouse-following focus changes. Default: 0.
    follow_mouse_threshold = 0.0, -- Minimum pointer travel before changing focus. Default: 0.0.
    kb_layout = "us", -- XKB keyboard layout name(s). Default: "us".
    left_handed = false, -- Swap the left and right mouse buttons. Default: false.
    mouse_refocus = true, -- Refocus hovered windows when crossing into their areas. Default: true.
    natural_scroll = false, -- Move content with the finger/wheel direction. Default: false.
    numlock_by_default = true, -- Enable Num Lock at session startup. Default: false.

    off_window_axis_events = 1, -- Choose how scrolling works over the border or gap of the focused window.
    -- off_window_axis_events = 0, -- Ignore wheel events outside the focused window.
    -- off_window_axis_events = 1, -- Default. Forward events with out-of-bounds coordinates.
    -- off_window_axis_events = 2, -- Send events using coordinates clamped inside the focused window.
    -- off_window_axis_events = 3, -- Warp the cursor to the nearest point inside the focused window.

    repeat_delay = 200, -- Milliseconds before held keys begin repeating. Default: 600.
    repeat_rate = 40, -- Number of repeats per second for held keys. Default: 25.
    resolve_binds_by_sym = false, -- Match shortcuts by key symbols across multiple layouts. Default: false.
    rotation = 0, -- Clockwise rotation of input device coordinates. Default: 0.
    scroll_button = 3, -- Mouse button used to initiate button-scrolling. Default: 0.
    scroll_button_lock = false, -- Toggle button-scrolling without holding its activation key. Default: false.

    scroll_factor = 1.0, -- Scroll speed multiplier for external mice. Default: 1.0.
    sensitivity = 0.0, -- Pointer movement sensitivity/speed adjustment. Default: 0.0.
    special_fallthrough = false, -- Allow focus to pass through floating special workspaces. Default: false.
    swallow_focus_click = false, -- Use first click only to focus an unfocused window. Default: false.

  },
})

-- --- INPUT.TOUCHPAD ---
hl.config({
  input = {
    touchpad = {
      clickfinger_behavior = true, -- Use number of fingers pressed to choose mouse button. Default: false.
      disable_while_typing = true, -- Reduce accidental touches while typing. Default: true.
      drag_3fg = 0, -- Choose whether three- or four-finger movement can drag items.
      -- drag_3fg = 0, -- Default. Disable multi-finger drag.
      -- drag_3fg = 1, -- Drag by moving three fingers together.
      -- drag_3fg = 2, -- Drag by moving four fingers together.

      drag_lock = 0, -- Choose whether a touchpad drag continues after lifting your finger.
      -- drag_lock = 0, -- Default. Releasing the finger ends the drag.
      -- drag_lock = 1, -- Keep the drag briefly after release, subject to a timeout.
      -- drag_lock = 2, -- Use sticky drag lock until explicitly released.

      flip_x = false, -- Invert horizontal touchpad movement. Default: false.
      flip_y = false, -- Invert vertical touchpad movement. Default: false.
      middle_button_emulation = false, -- Treat simultaneous left+right as middle click. Default: false.
      natural_scroll = true, -- Make touchpad content move with finger direction. Default: false.
      scroll_factor = 1.0, -- Multiply touchpad scroll movement. Default: 1.0.
      tap_and_drag = true, -- Allow tapping and dragging items. Default: true.
      tap_button_map = "lrm", -- One-finger left; two-finger right; three-finger middle.
      tap_to_click = true, -- Treat a tap on the touchpad as a mouse click. Default: true.

    },
  },
})

-- --- INPUT.TOUCHDEVICE ---
hl.config({
  input = {
    touchdevice = {
      enabled = true, -- Accept input from touchscreens. Default: true.
      transform = 0, -- Default. No rotation or mirroring.


    },
  },
})

-- --- INPUT.VIRTUALKEYBOARD ---
hl.config({
  input = {
    virtualkeyboard = {
      release_pressed_on_close = false, -- Release keys left held down when a virtual keyboard closes. Default: false.

      share_states = 2, -- Choose whether virtual and physical keyboards share held-key states.
      -- share_states = 0, -- Keep virtual keyboard key states separate.
      -- share_states = 1, -- Share key and modifier states with other keyboards.
      -- share_states = 2, -- Default. Share except for input-method-editor clients.


    },
  },
})

-- --- INPUT.TABLET ---
hl.config({
  input = {
    tablet = {
      enabled = true, -- Accept drawing-tablet pen and tablet input. Default: true.
      output = 1, -- Monitor receiving drawing-tablet input.
      transform = 0, -- Default. No rotation or mirroring.

      absolute_region_position = false, -- Treat the tablet mapping region as an absolute screen position when no output is set. Default: false.
      relative_input = false, -- Move the pointer by pen movement instead of placing it at the pen position. Default: false.
      left_handed = false, -- Swap the tablet pen/tablet orientation for left-handed use. Default: false.
      active_area_position = {0,0}, -- Top-left position of the usable tablet area, measured in millimeters. Default: {0,0}.
      active_area_size = {0,0}, -- Width and height of the usable tablet area, in millimeters. Default: {0,0}.
      region_position = {0,0}, -- Top-left screen position to which the tablet is mapped. Default: {0,0}.
      -- region_size = {0,0}, -- Width and height of the screen region controlled by the tablet; zero means unset. Default: {0,0}. Physical region of the screen mapped to tablet input.

    },
  },
})

-- --- INPUT.TABLETTOOL ---
hl.config({
  input = {
    tablettool = {
      -- eraser_button_override = 0, -- Override the pen eraser key/button identifier. Default: 0.
      -- pressure_range_min = -1.0, -- Minimum accepted pen pressure; -1 uses hardware. Default: -1.0.
      -- pressure_range_max = -1.0, -- Maximum accepted pen pressure; -1 uses hardware. Default: -1.0.
      -- eraser_button_mode = 0, -- Default. Let the tablet use its native eraser behavior.
      -- eraser_button_mode = 1, -- Send a button event instead of a native eraser event.


    },
  },
})

-- --- GESTURES ---
hl.config({
  gestures = {
    -- close_max_timeout = 1000, -- Maximum time in milliseconds for a gesture that closes a window. Default: 1000.
    -- workspace_swipe_cancel_ratio = 0.5, -- How far a swipe must travel to commit a switch. Default: 0.5.
    -- workspace_swipe_create_new = true, -- Create a new workspace when swiping beyond the last. Default: true.
    -- workspace_swipe_direction_lock = true, -- Lock swipe to its initial horizontal/vertical direction. Default: true.
    -- workspace_swipe_direction_lock_threshold = 10, -- Distance before directional swipe lock activates. Default: 10.
    -- workspace_swipe_distance = 300, -- Physical swipe travel required to change workspaces. Default: 300.
    -- workspace_swipe_forever = false, -- Allow continuous switching past adjacent workspaces. Default: false.
    -- workspace_swipe_invert = true, -- Reverse the direction of touchpad workspace swipes. Default: true.
    -- workspace_swipe_min_speed_to_force = 30, -- Swipe speed that forces a switch despite travel threshold. Default: 30.
    -- workspace_swipe_touch = false, -- Allow edge swipes on touchscreens to change workspace. Default: false.
    -- workspace_swipe_touch_invert = false, -- Reverse touchscreen swipe workspace direction. Default: false.
    -- workspace_swipe_use_r = false, -- Navigate relative workspace IDs instead of existing only. Default: false.

  },
})

-- --- GESTURES.SCROLLING ---
hl.config({
  gestures = {
    scrolling = {
      -- move_snap_to_grid = true, -- Snap a scrolling layout into its grid after movement. Default: true.
      -- move_snap_cursor = true, -- Snap cursor after scrolling-layout movement. Default: true.

    },
  },
})

