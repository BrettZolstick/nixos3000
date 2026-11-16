
hl.config({
  
  input = {

    -- keyboard
    --kb_model 				= ,
    kb_layout = "us",
    --kb_variant 			= ,
    --kb_options 			= ,
    --kb_rules 				= ,
    --kb_file 				= ,
    numlock_by_default = false,
    resolve_binds_by_sym = false,
    repeat_rate = 40,
    repeat_delay = 200,

    -- mouse
    sensitivity = 0,
    accel_profile = "flat",
    force_no_accel = true,
    left_handed = false,
    --scroll_points 			= ,
    --scroll_method 			= ,
    scroll_button = 0,
    scroll_button_lock = false,
    scroll_factor = 1,
    natural_scroll = false,
    emulate_discrete_scroll = 0,

    -- window interactions
    follow_mouse = 1, -- (see comment below)
    follow_mouse_threshold = 0,
    focus_on_close = 1,
    mouse_refocus = true,
    float_switch_override_focus = 1,
    special_fallthrough = false,
    off_window_axis_events = 1,

    -- Follow Mouse Options --
    --
    --  0 - Cursor movement does not change window focus
    --  1 - Cursor movement will always change the focus to the window under the cursor (Hyprland default)
    --  2 - Cursor focus is detached from keyboard focus. Clicking on a window moves keyboard focus to that window (Windows default)
    --  3 - Cursor focus will be separate from keyboard focus, clicking on a window will not change keyboard focus.
    --
    --

    touchpad = {
      disable_while_typing = true,
      natural_scroll = true,
      scroll_factor = 1.0,
      --middle_button_emulation = true,
      --tap_button_map = ,
      clickfinger_behavior = false, -- this makes 1 finger click on the right side of the trackpad right click (gross)
      tap_to_click = true,
      drag_lock = 0,
      tap_and_drag = true,
      flip_x = false,
      flip_y = false,
      drag_3fg = 0,
    },

    hl.device({
      name ="opentabletdriver-virtual-artist-tablet",
      output = "DP-1",
    })
    
  },
})
