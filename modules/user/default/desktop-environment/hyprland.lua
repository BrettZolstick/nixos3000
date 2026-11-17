-- Standalone Hyprland Lua configuration converted from hyprland(3).nix.
-- Edit this file directly; Hyprland automatically reloads Lua config changes.
-- Home Manager still manages Hyprland installation, systemd, XWayland packaging,
-- plugins, and the XDG desktop portal/screen-share picker outside this file.
-- All active compositor settings and their original values have been preserved.

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

-- --- DWINDLE ---
hl.config({
  dwindle = {
    -- Dwindle split direction: Which side of the existing window receives new windows.
    -- force_split = 0, -- Default. Follow the cursor/split context.
    -- force_split = 1, -- Always place the new window left or above.
    -- force_split = 2, -- Always place the new window right or below.

    -- preserve_split = false, -- Keep the current split direction as windows change. Default: false.
    -- smart_split = false, -- Use cursor position to choose the next split direction. Default: false.
    -- smart_resizing = true, -- Choose resize direction based on the mouse position instead of the tiling layout. Default: true.
    -- permanent_direction_override = false, -- Keep a manually chosen split direction until you change or clear it. Default: false.
    -- special_scale_factor = 1, -- Adjust special scale factor for dwindle. Default: 1.
    -- split_width_multiplier = 1.0, -- Adjust when Dwindle divides windows side-by-side versus top-and-bottom. Default: 1.0.
    -- use_active_for_splits = true, -- Base new splits on the focused window instead of the mouse position. Default: true.
    -- default_split_ratio = 1.0, -- Default split ratio; 1.0 produces equal halves. Default: 1.0.
    -- Dwindle split bias: Which half is affected by the configured split ratio.
    -- split_bias = 0, -- Default. Bias the upper or left half.
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

-- --- GENERAL.COL ---
hl.config({
  general = {
    col = {
      active_border = "0xffffffff", -- Color or gradient of the currently focused window border. Default: 0xffffffff.
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

-- --- DECORATION ---
hl.config({
  decoration = {
    active_opacity = 1.0, -- Opacity multiplier for focused windows. Default: 1.0.
    border_part_of_window = true, -- Count border pixels as part of the window geometry. Default: true.
    dim_around = 0.4, -- Darkening when a window requests dim-around. Default: 0.4.
    dim_inactive = false, -- Darken unfocused windows. Default: false.
    dim_modal = true, -- Darken windows behind a modal dialog. Default: true.
    dim_special = 0.2, -- Dimming amount behind special workspaces. Default: 0.2.
    dim_strength = 0.5, -- Darkening intensity for inactive windows. Default: 0.5.
    fullscreen_opacity = 1.0, -- Opacity multiplier for fullscreen windows. Default: 1.0.
    inactive_opacity = 1.0, -- Opacity multiplier for unfocused windows. Default: 1.0.
    rounding = 0, -- Corner rounding radius in layout pixels. Default: 0.
    rounding_power = 2.0, -- Shape of rounded corners (2 = circular). Default: 2.0.

  },
})

-- --- DECORATION.SHADOW ---
hl.config({
  decoration = {
    shadow = {
      enabled = true, -- Draw a drop shadow around windows. Default: true.
      color = "0xee1a1a1a", -- Color and transparency of focused shadows. Default: 0xee1a1a1a.
      color_inactive = "0xee1a1a1a", -- Shadow color for unfocused windows; normally inherits the active shadow color.
      offset = {0,0}, -- Horizontal and vertical distance to shift the window shadow. Default: {0,0}. Horizontal and vertical shadow displacement.
      range = 4, -- How far the shadow extends from window edges. Default: 4.
      render_power = 3, -- Rate at which the shadow fades away from window edges. Default: 3.
      scale = 1.0, -- Scale of the shadow geometry. Default: 1.0.
      sharp = false, -- Use sharp shadows instead of a soft falloff. Default: false.
    },
  },
})

-- --- DECORATION.GLOW ---
hl.config({
  decoration = {
    glow = {
      enabled = false, -- Enable a glow drawn inside windows. Default: false.
      color = "0xee1a1a1a", -- Color of the inner glow on focused windows. Default: 0xee1a1a1a.
      color_inactive = "0xee1a1a1a", -- Inner-glow color for unfocused windows; normally inherits the active glow color.
      range = 10, -- Width/radius of the inner glow effect. Default: 10.
      render_power = 3, -- Falloff curve of the inner glow effect. Default: 3.

    },
  },
})

-- --- DECORATION.MOTION_BLUR ---
hl.config({
  decoration = {
    motion_blur = {
      enabled = false, -- Enable motion blur for moving/resizing windows. Default: false.
      samples = 7, -- Number of frames/samples blended for motion blur. Default: 7.

    },
  },
})

-- --- DECORATION.BLUR ---
hl.config({
  decoration = {
    blur = {
      enabled = true, -- Enable background blur through translucent surfaces. Default: true.
      brightness = 1, -- Brightness multiplier of blurred surfaces. Default: 1.
      contrast = 0.8916, -- Contrast multiplier of blurred surfaces. Default: 0.8916.
      ignore_opacity = true, -- Apply blur independently of window opacity. Default: true.
      input_methods = false, -- Blur behind IME/input-method popups. Default: false.
      input_methods_ignorealpha = 0.2, -- Skip input-method blur below this alpha threshold. Default: 0.2.
      new_optimizations = true, -- Use optimized blur calculations. Default: true.
      noise = 0.0117, -- Amount of noise added to blur. Default: 0.0117.
      passes = 1, -- Number of blur passes; higher costs more GPU time. Default: 1.
      popups = false, -- Blur menus and other popup surfaces. Default: false.
      popups_ignorealpha = 0.2, -- Skip popup blur below this alpha threshold. Default: 0.2.
      size = 8, -- Spatial blur radius. Default: 8.
      special = false, -- Blur background behind special workspaces. Default: false.
      vibrancy = 0.1696, -- Increase saturation of blurred content. Default: 0.1696.
      vibrancy_darkness = 0.0, -- Vibrancy intensity in the dark parts of the scene. Default: 0.0.
      xray = false, -- Exclude tiled windows from floating-window blur sampling. Default: false.
      variant = "kawase", -- Choose the visual effect used when blurring transparent backgrounds.
      -- variant = "kawase", -- Default. Conventional, relatively inexpensive background blur.
      -- variant = "acrylic", -- Refracted liquid-glass-like acrylic blur.
      -- variant = "aurora", -- Adds aurora-like colored light streaks.
      -- variant = "drops", -- Simulates raindrops on a glass surface.
      -- variant = "fluid_jar", -- Uses a simulated moving fluid pattern; can be expensive.
      -- variant = "frost", -- Creates a cracked-ice appearance.
      -- variant = "haze", -- Uses a diffused, pearlescent haze.
      -- variant = "heat_shimmer", -- Adds a subtle heat-distortion effect.
      -- variant = "prism", -- Uses a triangular refraction pattern.
      -- variant = "ripple", -- Adds ripples in response to clicks.
      -- variant = "water", -- Simulates water-like heightmap ripples.

    },
  },
})

-- --- DECORATION.BLUR.ACRYLIC ---
hl.config({
  decoration = {
    blur = {
      acrylic = {
        -- aberration = 0.025, -- Color fringe distortion for acrylic-style blur. Default: 0.025.
        -- bulb = 48.0, -- Width of the acrylic lens edge. Default: 48.0.
        -- clarity = 0.82, -- How clearly the background shows through acrylic. Default: 0.82.
        -- refraction = 24.0, -- Strength of the acrylic light distortion. Default: 24.0.
        -- tint = 0x14EEF5FF, -- Tint color applied by acrylic blur. Default: 0x14EEF5FF.

      },
    },
  },
})

-- --- DECORATION.BLUR.AURORA ---
hl.config({
  decoration = {
    blur = {
      aurora = {
        -- color1 = 0x29F0A0FF, -- First tint color used in aurora blur. Default: 0x29F0A0FF.
        -- color2 = 0x7A4DFFFF, -- Second tint color used in aurora blur. Default: 0x7A4DFFFF.
        -- intensity = 0.35, -- Opacity/intensity of aurora color curtains. Default: 0.35.
        -- speed = 1.0, -- Animation speed of aurora color curtains. Default: 1.0.

      },
    },
  },
})

-- --- DECORATION.BLUR.DROPS ---
hl.config({
  decoration = {
    blur = {
      drops = {
        -- speed = 3.0, -- Animation speed of droplet blur. Default: 3.0.

      },
    },
  },
})

-- --- DECORATION.BLUR.FLUID_JAR ---
hl.config({
  decoration = {
    blur = {
      fluid_jar = {
        -- color = 0xCC3399FF, -- Color of simulated fluid. Default: 0xCC3399FF.
        -- distortion = 8.0, -- Refraction/distortion of simulated fluid. Default: 8.0.
        -- fill_amount = 0.5, -- How full the fluid container looks. Default: 0.5.
        -- mass = 1.4, -- Inertial mass of the simulated fluid. Default: 1.4.
        -- precision = 2.0, -- Precision of the fluid simulation. Default: 2.0.
        -- speed = 3.7, -- Animation speed of simulated fluid. Default: 3.7.
        -- turbulence = 1.2, -- Amount of internal fluid turbulence. Default: 1.2.

      },
    },
  },
})

-- --- DECORATION.BLUR.GLASS ---
hl.config({
  decoration = {
    blur = {
      glass = {
        -- refraction = 20.0, -- Refractive displacement for glass-like blur. Default: 20.0.
        -- roughness = 1.0, -- Intensity of textured glass shading. Default: 1.0.
        -- size = 40.0, -- Size of the glass refraction pattern. Default: 40.0.

      },
    },
  },
})

-- --- DECORATION.BLUR.HAZE ---
hl.config({
  decoration = {
    blur = {
      haze = {
        -- intensity = 0.35, -- Strength of pearlescent haze shading. Default: 0.35.
        -- iridescence = 0.7, -- Color shift in pearlescent haze. Default: 0.7.

      },
    },
  },
})

-- --- DECORATION.BLUR.HEAT_SHIMMER ---
hl.config({
  decoration = {
    blur = {
      heat_shimmer = {
        -- speed = 1.0, -- Animation speed of heat-shimmer blur. Default: 1.0.

      },
    },
  },
})

-- --- DECORATION.BLUR.RIPPLE ---
hl.config({
  decoration = {
    blur = {
      ripple = {
        -- duration = 0.45, -- Lifetime of a single blur ripple. Default: 0.45.
        -- radius = 400.0, -- Maximum radius reached by blur ripples. Default: 400.0.
        -- strength = 30.0, -- Strength of ripple refraction. Default: 30.0.
        -- width = 32.0, -- Thickness of the ripple wave band. Default: 32.0.

      },
    },
  },
})

-- --- DECORATION.BLUR.WATER ---
hl.config({
  decoration = {
    blur = {
      water = {
        -- damping = 0.95, -- How fast water surface waves decay. Default: 0.95.
        -- duration = 12.0, -- Maximum lifetime of water-wave effects. Default: 12.0.
        -- radius = 20.0, -- Radius around input used to disturb the water surface. Default: 20.0.
        -- speed = 0.76, -- Propagation speed of water-wave effects. Default: 0.76.
        -- strength = 32.0, -- Strength of water wave/refraction displacement. Default: 32.0.

      },
    },
  },
})

-- --- ANIMATIONS ---
hl.config({
  animations = {
    enabled = true, -- Enable Hyprland animation system. Default: true.
    workspace_wraparound = true, -- Wrap workspace transition animations at the ends. Default: false.

  },
})

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
      natural_scroll = false, -- Make touchpad content move with finger direction. Default: false.
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
      active_area_position = "{0,0}", -- Top-left position of the usable tablet area, measured in millimeters. Default: {0,0}.
      active_area_size = "{0,0}", -- Width and height of the usable tablet area, in millimeters. Default: {0,0}.
      region_position = "{0,0}", -- Top-left screen position to which the tablet is mapped. Default: {0,0}.
      region_size = "{0,0}", -- Width and height of the screen region controlled by the tablet; zero means unset. Default: {0,0}. Physical region of the screen mapped to tablet input.

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

-- --- GROUP ---
hl.config({
  group = {
    auto_group = false, -- Automatically group windows into an unlocked active group. Default: true.
    focus_removed_window = true, -- Focus the window newly removed from a group. Default: true.
    group_on_movetoworkspace = false, -- Auto-merge moved windows into groups on destination. Default: false.
    insert_after_current = true, -- Insert new group windows after active member. Default: true.
    merge_floated_into_tiled_on_groupbar = false, -- Merge a floating window into a tiled group when dropped on its tab bar. Default: false.
    merge_groups_on_drag = true, -- Permit dragging entire groups into other groups. Default: true.
    merge_groups_on_groupbar = true, -- Allow groups to merge when one is dropped onto another group’s tab bar. Default: true.
    drag_into_group = 1, -- Choose when dragging a window into a group merges it with that group.
    -- drag_into_group = 0, -- Do not merge windows by dragging into a group.
    -- drag_into_group = 1, -- Default. Merge windows dragged into unlocked groups.
    -- drag_into_group = 2, -- Merge only when the window is dropped onto a group bar.


  },
})

-- --- GROUP.COL ---
hl.config({
  group = {
    col = {
      border_active = "0x66ffff00", -- Border color for the focused window in an unlocked group. Default: 0x66ffff00.
      border_inactive = "0x66777700", -- Border color for unfocused windows in unlocked groups. Default: 0x66777700.
      border_locked_active = "0x66ff5500", -- Border color for the focused window in a locked group. Default: 0x66ff5500.
      border_locked_inactive = "0x66775500", -- Border color for unfocused windows in locked groups. Default: 0x66775500.

    },
  },
})

-- --- GROUP.GROUPBAR ---
hl.config({
  group = {
    groupbar = {
      enabled = true, -- Display group tab indicators on grouped windows. Default: true.
      blur = false, -- Blur the backgrounds of group tabs and their indicators. Default: false.
      disable_when_only = false, -- Hide a group bar if only one window remains. Default: false.
      -- font_family = <omit>, -- Optional font for group titles; otherwise use misc.font_family.
      font_size = 8, -- Size of group window title text. Default: 8.
      font_weight_active = "normal", -- Thickness of the text on the selected group tab. Default: "normal".
      font_weight_inactive = "normal", -- Thickness of the text on unselected group tabs. Default: "normal".
      gaps_in = 2, -- Spacing between group bar gradient blocks. Default: 2.
      gaps_out = 2, -- Spacing from groupbar to its host window. Default: 2.
      gradients = false, -- Render gradient backgrounds in group bars. Default: false.
      gradient_round_only_edges = true, -- Round only the outermost ends of the whole group-tab gradient. Default: true.
      gradient_rounding = 2, -- Corner radius used for group-tab color gradients. Default: 2.
      gradient_rounding_power = 2.0, -- Shape of rounded gradient corners; 2 is roughly circular. Default: 2.0.
      height = 14, -- Height of each groupbar area. Default: 14.
      indicator_gap = 0, -- Vertical gap between a group tab’s title and selection indicator. Default: 0.
      indicator_height = 3, -- Thickness of group tab active-state indicator. Default: 3.
      keep_upper_gap = true, -- Keep the space above the group tab bar. Default: true.
      middle_click_close = true, -- Middle clicking group tabs closes that member. Default: true.
      priority = 3, -- Set how the group tab bar is layered relative to other window decorations. Default: 3.
      render_titles = true, -- Draw window names inside group bars. Default: true.
      round_only_edges = true, -- Round only the outer ends of the combined group-tab indicator. Default: true.
      rounding = 1, -- Corner radius of the group tab indicator. Default: 1.
      rounding_power = 2.0, -- Shape of rounded group-tab corners; 2 is roughly circular. Default: 2.0.
      scrolling = true, -- Switch grouped windows with the mouse wheel. Default: true.
      stacked = false, -- Show the groupbar vertically rather than horizontally. Default: false.
      text_color = "0xffffffff", -- Color of group tab titles. Default: 0xffffffff.
      -- text_color_inactive = <omit>, -- Optional text color for unselected group tabs.
      -- text_color_locked_active = <omit>, -- Optional text color for the selected tab of a locked group.
      -- text_color_locked_inactive = <omit>, -- Optional text color for unselected tabs of locked groups.
      text_offset = 0, -- Move group-tab titles up or down by this many pixels. Default: 0.
      text_padding = 0, -- Add horizontal space around group-tab titles. Default: 0.

    },
  },
})

-- --- GROUP.GROUPBAR.COL ---
hl.config({
  group = {
    groupbar = {
      col = {
        active = "0x66ffff00", -- Color of the indicator for the selected tab in an unlocked group. Default: 0x66ffff00.
        inactive = "0x66777700", -- Color of indicators for other tabs in an unlocked group. Default: 0x66777700.
        locked_active = "0x66ff5500", -- Color of the selected-tab indicator in a locked group. Default: 0x66ff5500.
        locked_inactive = "0x66775500", -- Color of other tab indicators in a locked group. Default: 0x66775500.

      },
    },
  },
})

-- --- MISC ---
hl.config({
  misc = {
    allow_session_lock_restore = false, -- Permit restarting a crashed session locker. Default: false.
    always_follow_on_dnd = true, -- Keep pointer focus tracking while dragging objects. Default: true.
    animate_manual_resizes = false, -- Animate manual window resizes. Default: false.
    animate_mouse_windowdragging = false, -- Animate window dragging via the mouse. Default: false.
    anr_missed_pings = 5, -- Heartbeat pings missed before flagging an app unresponsive. Default: 5.
    background_color = "0x111111", -- Solid background used behind the compositor wallpaper. Default: 0x111111.
    bell_sound = "default", -- Sound file or special value for the system bell. Default: "default".
    close_special_on_empty = true, -- Hide special workspaces when their final window closes. Default: true.
    disable_autoreload = false, -- Require an explicit reload after config edits. Default: false.
    disable_hyprland_guiutils_check = false, -- Hide the warning shown when hyprland-guiutils is missing. Default: false.
    disable_hyprland_logo = true, -- Hide Hyprland background branding. Default: false.
    disable_scale_notification = false, -- Suppress alerts when a display scale is unsuitable. Default: false.
    disable_splash_rendering = true, -- Hide background splash text. Default: false.
    disable_watchdog_warning = false, -- Suppress warnings about compositor startup method. Default: false.
    disable_xdg_env_checks = false, -- Suppress XDG environment validation warnings. Default: false.
    enable_anr_dialog = true, -- Show an application-not-responding dialog. Default: true.
    enable_swallow = false, -- Replace a parent terminal with the launched child window. Default: false.
    exit_window_retains_fullscreen = 0, -- Choose whether another window becomes fullscreen after a fullscreen window closes.
    -- exit_window_retains_fullscreen = 0, -- Default. Do not automatically fullscreen the next window.
    -- exit_window_retains_fullscreen = 1, -- Give the next focused window fullscreen state.
    -- exit_window_retains_fullscreen = 2, -- Preserve fullscreen only when closing a grouped window.
    -- exit_window_retains_fullscreen = 3, -- Preserve fullscreen only when closing a non-grouped window.

    float_force_onscreen = 2, -- Choose how existing floating windows are kept within monitor boundaries.
    -- float_force_onscreen = 0, -- Default. No position constraint.
    -- float_force_onscreen = 1, -- Keep at least part of the window on a monitor.
    -- float_force_onscreen = 2, -- Keep the whole window inside monitor bounds.

    new_float_force_onscreen = 2, -- Choose how newly opened floating windows are kept on-screen.
    -- new_float_force_onscreen = 0, -- No position constraint.
    -- new_float_force_onscreen = 1, -- Keep at least part of the window on a monitor.
    -- new_float_force_onscreen = 2, -- Default. Keep the whole window inside monitor bounds.

    focus_on_activate = false, -- Focus apps that request activation. Default: false.
    font_family = "Sans", -- Font used for compositor-generated text. Default: "Sans".
    force_default_wallpaper = -1, -- Choose whether Hyprland shows its built-in illustrated background.
    -- force_default_wallpaper = -1, -- Default. Choose bundled background style at random.
    -- force_default_wallpaper = 0, -- Disable the illustrated/anime background.
    -- force_default_wallpaper = 1, -- Disable the illustrated/anime background (legacy alternate mode).
    -- force_default_wallpaper = 2, -- Enable the illustrated/anime background.

    initial_workspace_token_timeout = 10, -- Seconds to preserve launch-workspace tracking tokens. Default: 10.

    initial_workspace_tracking = 0, -- Choose whether launched apps open on the workspace they were started from.
    -- initial_workspace_tracking = 0, -- Do not track the workspace on which an app was launched.
    -- initial_workspace_tracking = 1, -- Default. Track the originally invoked workspace for one window.
    -- initial_workspace_tracking = 2, -- Keep tracking that workspace for descendant processes.

    key_press_enables_dpms = true, -- Key press turns monitors back on. Default: false.
    lockdead_screen_delay = 500, -- Delay before failed lockscreen fallback appears. Default: 1000.
    middle_click_paste = false, -- Allow X11-style primary-selection middle-click paste. Default: true.
    mouse_move_enables_dpms = false, -- Wake a display that is in power-saving mode when the mouse moves. Default: false.
    mouse_move_focuses_monitor = true, -- Mouse entering a monitor focuses it. Default: true.
    name_vk_after_proc = true, -- Name virtual keyboards after their creator app, such as fcitx5. Default: true.
    on_focus_under_fullscreen = 2, -- Choose what happens when another window asks for focus over fullscreen content.
    -- on_focus_under_fullscreen = 0, -- Keep focus on the existing fullscreen/maximized window.
    -- on_focus_under_fullscreen = 1, -- Allow the requesting window to take over focus.
    -- on_focus_under_fullscreen = 2, -- Default. Leave fullscreen/maximized mode to focus the other window.

    render_unfocused_fps = 30, -- FPS cap for windows rendered despite being unfocused. Default: 15.
    screencopy_force_8b = true, -- Use 8-bit color depth for screenshot capture. Default: true.
    session_lock_blur = true, -- Blur graphics behind the lock screen. Default: false.
    session_lock_xray = false, -- Continue displaying workspaces behind lock screen. Default: false.
    size_limits_tiled = false, -- Apply min/max app sizing constraints to tiled windows. Default: false.
    vrr = 0, -- Choose when monitors use variable refresh rate (Adaptive Sync).
    -- vrr = 0, -- Default. Keep VRR disabled.
    -- vrr = 1, -- Keep VRR enabled whenever supported.
    -- vrr = 2, -- Enable VRR only while a window is fullscreen.
    -- vrr = 3, -- Enable VRR for fullscreen game/video content types.

  },
})

-- --- BINDS ---
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

-- --- XWAYLAND ---
hl.config({
  xwayland = {
    enabled = true, -- Enable the XWayland compatibility server for X11 apps. Default: true.
    create_abstract_socket = false, -- Create an additional Linux abstract socket for X11 app connections. Default: false.
    force_zero_scaling = false, -- Force XWayland windows to render at unscaled resolution. Default: false.
    use_nearest_neighbor = true, -- Scale X11 app images with sharp pixels instead of smoothing them. Default: true.

  },
})

-- --- OPENGL ---
hl.config({
  opengl = {
    nvidia_anti_flicker = false, -- Reduce NVIDIA display flicker, potentially at the cost of dropped frames; ignored on AMD. Default: true.

  },
})

-- --- RENDER ---
hl.config({
  render = {
    async_commit = true, -- Send GPU display commits asynchronously. Default: false.
    cm_auto_hdr = 1, -- Choose whether fullscreen HDR content switches the monitor into HDR mode.
    -- cm_auto_hdr = 0, -- Disable automatic HDR switching.
    -- cm_auto_hdr = 1, -- Default. Automatically switch to the HDR mode for eligible fullscreen content.
    -- cm_auto_hdr = 2, -- Switch into the hdredid display mode.

    cm_enabled = false, -- Enable color-management pipeline. Default: true.
    cm_sdr_eotf = "default", -- Choose how the brightness of standard-range (SDR) content is interpreted.
    -- cm_sdr_eotf = "default", -- Default. Use the standard sRGB behavior.
    -- cm_sdr_eotf = "gamma22", -- Treat unspecified SDR content as Gamma 2.2.
    -- cm_sdr_eotf = "gamma22force", -- Treat unspecified and sRGB content as Gamma 2.2.
    -- cm_sdr_eotf = "srgb", -- Treat unspecified SDR content explicitly as sRGB.

    ctm_animation = 2, -- Choose whether color-temperature changes (e.g. hyprsunset) fade smoothly.
    -- ctm_animation = 0, -- Disable CTM fade transitions.
    -- ctm_animation = 1, -- Enable CTM fade transitions.
    -- ctm_animation = 2, -- Default. Automatically disable fades on NVIDIA.

    commit_timing_enabled = true, -- Enable precise display-commit timing protocol. Default: true.
    direct_scanout = 1, -- Choose when fullscreen windows can bypass normal compositor rendering.
    -- direct_scanout = 0, -- Default. Disable direct scanout.
    -- direct_scanout = 1, -- Enable direct scanout for eligible fullscreen content.
    -- direct_scanout = 2, -- Automatic: prioritize windows marked as games.

    expand_undersized_textures = true, -- Fill missing texture edges by extending edge pixels instead of stretching the image. Default: true.
    fp16_sdr_tf = 0, -- Choose how brightness is encoded in high-precision buffers for SDR content.
    -- fp16_sdr_tf = 0, -- Default. Use the display/monitor transfer function.
    -- fp16_sdr_tf = 1, -- Use linear-light encoding.

    icc_vcgt_enabled = true, -- Apply ICC calibration color ramps. Default: true.
    keep_unmodified_copy = 2, -- Choose when to keep an unaltered SDR image for screen sharing.
    -- keep_unmodified_copy = 0, -- Do not retain a separate unmodified frame.
    -- keep_unmodified_copy = 1, -- Always keep an unmodified copy.
    -- keep_unmodified_copy = 2, -- Default. Keep a copy automatically when needed for HDR/SDR.

    new_render_scheduling = false, -- Use adaptive/triple-buffer rendering when necessary. Default: false.
    not_shown_fifo_lock = 0, -- Choose whether hidden windows remain subject to FIFO frame synchronization.
    -- not_shown_fifo_lock = 0, -- Default. Apply FIFO locking to all relevant surfaces.
    -- not_shown_fifo_lock = 1, -- Ignore surfaces explicitly marked render-unfocused.
    -- not_shown_fifo_lock = 2, -- Skip FIFO locking for surfaces that are not shown.

    non_shader_cm = 2, -- Choose when color adjustments can happen without a GPU shader.
    -- non_shader_cm = 0, -- Disable non-shader color management.
    -- non_shader_cm = 1, -- Enable it whenever technically possible.
    -- non_shader_cm = 2, -- Default. Use only for direct scanout and passthrough.
    -- non_shader_cm = 3, -- Disable and disregard color-management issues.

    non_shader_cm_interop = 2, -- Choose whether external color filters apply to fullscreen content.
    -- non_shader_cm_interop = 0, -- Disable external transforms during fullscreen.
    -- non_shader_cm_interop = 1, -- Allow external transforms during fullscreen.
    -- non_shader_cm_interop = 2, -- Default. Disable them only for fullscreen photo/video/game content.

    send_content_type = true, -- Tell compatible monitors whether content is video, games, or desktop so they may switch picture modes. Default: true.
    use_fp16 = 2, -- Choose when Hyprland uses high-precision FP16 color buffers.
    -- use_fp16 = 0, -- Do not use FP16 buffers.
    -- use_fp16 = 1, -- Use FP16 buffers for all rendering.
    -- use_fp16 = 2, -- Default. Use FP16 buffers in HDR mode.

    use_shader_blur_blend = false, -- Use experimental shader-based blur mixing. Default: false.
    xp_mode = false, -- Skip normal wallpaper/back-buffer and bottom-layer rendering while enabled. Default: false.

  },
})

-- --- CURSOR ---
hl.config({
  cursor = {
    enable_hyprcursor = true, -- Load high-quality Hyprcursor cursor themes. Default: true.
    hide_on_key_press = false, -- Hide pointer while typing until moved. Default: false.
    hide_on_tablet = false, -- Hide the pointer after tablet input until the mouse is used again. Default: false.
    hide_on_touch = true, -- Hide pointer after touch input. Default: true.
    hotspot_padding = 0, -- Space between screen edge and pointer hotspot. Default: 0.
    inactive_timeout = 0, -- Seconds before an idle mouse pointer is hidden; 0 means never. Default: 0.
    min_refresh_rate = 24, -- Minimum refresh rate for cursor motion when fullscreen VRR frame updates are suppressed. Default: 24.
    invisible = false, -- Do not draw any visible mouse cursor. Default: false.
    no_break_fs_vrr = 2, -- Choose when cursor movement avoids triggering new frames during fullscreen VRR.
    -- no_break_fs_vrr = 0, -- Request normal frames when the cursor moves.
    -- no_break_fs_vrr = 1, -- Avoid cursor-triggered frames during fullscreen VRR.
    -- no_break_fs_vrr = 2, -- Default. Use that behavior automatically for games.

    no_hardware_cursors = 2, -- Choose whether the display hardware or compositor draws the mouse pointer.
    -- no_hardware_cursors = 0, -- Prefer hardware cursors when available.
    -- no_hardware_cursors = 1, -- Disable hardware cursors; composite the pointer instead.
    -- no_hardware_cursors = 2, -- Default. Disable hardware cursors automatically during tearing.

    no_warps = false, -- Prevent automatic mouse-pointer relocation. Default: false.
    persistent_warps = false, -- Return the pointer to its previous spot in a window when refocusing it. Default: false.
    sync_gsettings_theme = true, -- Synchronize cursor theme with desktop GSettings. Default: true.
    use_cpu_buffer = 2, -- Choose when hardware cursors use buffers allocated in CPU-backed memory.
    -- use_cpu_buffer = 0, -- Disable CPU-backed cursor buffers.
    -- use_cpu_buffer = 1, -- Always use CPU-backed cursor buffers.
    -- use_cpu_buffer = 2, -- Default. Enable them automatically for NVIDIA.

    warp_back_after_non_mouse_input = false, -- Restore the previous mouse position after another input device moved the pointer. Default: false.
    warp_on_change_workspace = 0, -- Choose whether the cursor moves to a focused window after workspace changes.
    -- warp_on_change_workspace = 0, -- Default. Do not warp the pointer.
    -- warp_on_change_workspace = 1, -- Warp the pointer to the focused window.
    -- warp_on_change_workspace = 2, -- Force warping even when cursor.no_warps is enabled.

    warp_on_monitor_change = 1, -- Choose where the cursor moves when a keybind focuses another monitor.
    -- warp_on_monitor_change = -1, -- Default. Inherit cursor.warp_on_change_workspace.
    -- warp_on_monitor_change = 0, -- Never warp on monitor change.
    -- warp_on_monitor_change = 1, -- Move the cursor to the focused window on the newly focused monitor.
    -- warp_on_monitor_change = 2, -- Force warping despite cursor.no_warps.

    warp_on_toggle_special = 0, -- Choose whether the cursor jumps to a focused window when toggling a scratchpad.
    -- warp_on_toggle_special = 0, -- Default. Do not warp the pointer.
    -- warp_on_toggle_special = 1, -- Warp the pointer to the focused window.
    -- warp_on_toggle_special = 2, -- Force warping even when cursor.no_warps is enabled.

    zoom_detached_camera = true, -- Free camera movement while zoomed in. Default: true.
    zoom_disable_aa = false, -- Show sharp, blocky pixels instead of smoothing the screen when zoomed. Default: false.
    zoom_factor = 1.0, -- Magnification around cursor position. Default: 1.0.
    zoom_rigid = false, -- Keep zoom centered on mouse movement. Default: false.

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

-- --- QUIRKS ---
hl.config({
  quirks = {
    prefer_hdr = 1, -- Choose when applications are told that HDR is the preferred display mode.
    -- prefer_hdr = 0, -- Default. Do not prefer HDR.
    -- prefer_hdr = 1, -- Always report HDR as the preferred display mode.
    -- prefer_hdr = 2, -- Advertise HDR as preferred only in Gamescope.

  },
})

-- --- INPUT-CAPTURE ---
hl.config({
  ["input-capture"] = {
    capture_modifiers = false, -- Let input-sharing apps also capture Ctrl, Shift, Alt, Super, and other modifier keys. Default: false.
    enforce_barriers = true, -- Reject invalid pointer boundaries requested by input-sharing apps with a Wayland error. Default: true.

  },
})

-- --- EXPERIMENTAL ---
hl.config({
  experimental = {
    wp_cm_1_2 = false, -- Let apps use version 2 of Wayland’s color-management protocol. Default: false.

  },
})

-- --- KEYBINDINGS ---
-- Super + Enter: launch Kitty.
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("kitty"))

-- Super + Q: close the focused window.
hl.bind("SUPER + Q", hl.dsp.window.close())

-- Optional next steps: add hl.monitor(...), hl.workspace_rule(...),
-- hl.window_rule(...), hl.gesture(...), hl.curve(...), hl.animation(...),
-- hl.device(...), hl.env(...), and hl.on(...) calls as needed.
