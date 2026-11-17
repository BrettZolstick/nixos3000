{ lib, config, ... }: {
  options.hyprland.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.hyprland.enable {
  
    wayland.windowManager.hyprland = {
      enable = true; # Manage the current user's Hyprland configuration.
      configType = "lua"; # Generate ~/.config/hypr/hyprland.lua.
      plugins = [ ]; # Do not load third-party compositor plugins.
      systemd.enable = true; # Manage Hyprland's graphical-session user target
      xwayland.enable = true; # Allow X11 applications through XWayland.
      xdph.settings.screencopy.custom_picker_binary = "hyprland-share-picker"; # Choose what to use as the screen share picker (will look into more options later)

      settings = {
        config = {

          # --- GENERAL ---
          general.allow_tearing = true; # Permit tearing for lower-latency rendering when applicable. Default: false.
          general.border_size = 1; # Border thickness around windows in layout pixels. Default: 1.
          general.extend_border_grab_area = 15; # Extra pointer grab area for dragging borders. Default: 15.
          general.float_gaps = 0; # Padding around floating windows; -1 means automatic. Default: 0.
          general.gaps_in = 5; # Space between adjacent tiled windows. Default: 5.
          general.gaps_out = 20; # Space between windows and monitor edges. Default: 20.
          general.gaps_workspaces = 0; # Additional spacing between workspace views. Default: 0.
          general.hover_icon_on_border = true; # Show resize cursor when hovering a resizable border. Default: true.
          general.modal_parent_blocking = true; # Control interactivity of windows behind modal dialogs. Default: true.
          general.no_focus_fallback = false; # Keep focus unchanged if directional focus finds no target. Default: false.
          general.resize_corner = 0; # Select the forced corner for resizing floating windows. Default: 0.
          general.resize_on_border = false; # Allow dragging window borders or gaps to resize. Default: false.
          general.layout = "dwindle"; # Recursively splits space as windows are added.
                          # "master"; # Keeps one or more master windows with the others in a stack.
                          # "scrolling"; # Places windows on a scrolling tape, similar to Niri.
                          # "monocle"; # Displays one maximized tiled window at a time.
          # --- DWINDLE ---
          # Dwindle split direction: Which side of the existing window receives new windows.
          # dwindle.force_split = 0; # Default. Follow the cursor/split context.
          # dwindle.force_split = 1; # Always place the new window left or above.
          # dwindle.force_split = 2; # Always place the new window right or below.

          # dwindle.preserve_split = false; # Keep the current split direction as windows change. Default: false.
          # dwindle.smart_split = false; # Use cursor position to choose the next split direction. Default: false.
          # dwindle.smart_resizing = true; # Configure smart resizing behavior in dwindle. Default: true.
          # dwindle.permanent_direction_override = false; # Configure permanent direction override behavior in dwindle. Default: false.
          # dwindle.special_scale_factor = 1; # Adjust special scale factor for dwindle. Default: 1.
          # dwindle.split_width_multiplier = 1.0; # Configure split width multiplier behavior in dwindle. Default: 1.0.
          # dwindle.use_active_for_splits = true; # Configure use active for splits behavior in dwindle. Default: true.
          # dwindle.default_split_ratio = 1.0; # Default split ratio; 1.0 produces equal halves. Default: 1.0.
          # Dwindle split bias: Which half is affected by the configured split ratio.
          # dwindle.split_bias = 0; # Default. Bias the upper or left half.
          # dwindle.split_bias = 1; # Bias the currently focused window.

          # dwindle.precise_mouse_move = false; # Configure precise mouse move behavior in dwindle. Default: false.

          # --- MASTER ---
          # master.allow_small_split = false; # Permit horizontal splits among multiple master windows. Default: false.
          # master.special_scale_factor = 1; # Adjust special scale factor for master. Default: 1.
          # master.mfact = 0.55; # Fraction of workspace reserved for the master column. Default: 0.55.
          # Master new-window status: Whether new windows join the master region or slave stack.
          # master.new_status = "slave"; # Default. Put new windows in the slave stack.
          # master.new_status = "master"; # Make each new window a master.
          # master.new_status = "inherit"; # Use the focused window's master/slave status.

          # master.new_on_top = false; # Place newly opened slave windows at top of stack. Default: false.
          # Master insertion position: Where new windows appear relative to the focused window.
          # master.new_on_active = "none"; # Default. Follow the master.new_on_top rule.
          # master.new_on_active = "before"; # Insert a window immediately before the active window.
          # master.new_on_active = "after"; # Insert a window immediately after the active window.

          # Master orientation: Which side of the monitor contains the main window(s).
          # master.orientation = "left"; # Default. Place master windows on the left.
          # master.orientation = "right"; # Place master windows on the right.
          # master.orientation = "top"; # Place master windows above the stack.
          # master.orientation = "bottom"; # Place master windows below the stack.
          # master.orientation = "center"; # Center master windows between slave stacks.

          # master.slave_count_for_center_master = 2; # Number of slaves before centered master activates. Default: 2.
          # Centered-master fallback: Position master when too few slave windows exist.
          # master.center_master_fallback = "left"; # Default. Fall back to master on the left.
          # master.center_master_fallback = "right"; # Fall back to master on the right.
          # master.center_master_fallback = "top"; # Fall back to master at the top.
          # master.center_master_fallback = "bottom"; # Fall back to master at the bottom.

          # master.smart_resizing = true; # Resize the nearest relevant master/slave split. Default: true.
          # master.drop_at_cursor = true; # Choose drop position from pointer when moving windows. Default: true.
          # master.always_keep_position = false; # Preserve master position during layout changes. Default: false.
          # master.focus_master_on_close = false; # Focus master window after a slave closes. Default: false.

          # --- SCROLLING ---
          # scrolling.fullscreen_on_one_column = true; # Expand a workspace single column to output width. Default: true.
          # scrolling.column_width = 0.5; # Fraction of output width allocated to a new scrolling column. Default: 0.5.
          # Scrolling focus visibility: How a focused column is brought on screen.
          # scrolling.focus_fit_method = 0; # Center the focused column.
          # scrolling.focus_fit_method = 1; # Default. Scroll only enough to fit the column.
          # scrolling.focus_fit_method = 2; # Center the column, clamped to available tape bounds.

          # Scrolling follow focus: When the scroll strip should follow the focused window.
          # scrolling.follow_focus = 0; # Focusing does not move the scrolling strip.
          # scrolling.follow_focus = 1; # Default. Follow focus when needed; clicks always reposition the strip.
          # scrolling.follow_focus = 2; # Follow focus as needed, without special click behavior.

          # scrolling.follow_min_visible = 0.4; # Minimum visible portion needed for focus behavior. Default: 0.4.
          # scrolling.explicit_column_widths = "0.333, 0.5, 0.667, 1.0"; # Predefined scrolling-column widths. Default: "0.333, 0.5, 0.667, 1.0".
          # scrolling.wrap_focus = true; # Wrap focus at first/last column. Default: true.
          # scrolling.wrap_swapcol = true; # Wrap column swaps at tape ends. Default: true.
          # Scrolling tape direction: Where new columns extend from the current one.
          # scrolling.direction = "right"; # Default. Extend and scroll horizontally to the right.
          # scrolling.direction = "left"; # Extend and scroll horizontally to the left.
          # scrolling.direction = "down"; # Extend and scroll vertically downward.
          # scrolling.direction = "up"; # Extend and scroll vertically upward.

          # --- GENERAL.COL ---
          general.col.active_border = "0xffffffff"; # Color or gradient of the currently focused window border. Default: 0xffffffff.
          general.col.inactive_border = "0xff444444"; # Color or gradient of other window borders. Default: 0xff444444.
          general.col.nogroup_border = "0xffffaaff"; # Border for windows that cannot join a group. Default: 0xffffaaff.
          general.col.nogroup_border_active = "0xffff00ff"; # Active border for windows that cannot join a group. Default: 0xffff00ff.

          # --- GENERAL.SNAP ---
          general.snap.enabled = false; # Enable snapping of floating windows to nearby edges. Default: false.
          general.snap.border_overlap = false; # Account for overlapping borders during snapping. Default: false.
          general.snap.respect_gaps = false; # Keep configured gaps when snapping floating windows. Default: false.
          general.snap.monitor_gap = 10; # Distance at which floating windows snap to monitor edges. Default: 10.
          general.snap.window_gap = 10; # Distance at which floating windows snap to each other. Default: 10.

          # --- DECORATION ---
          decoration.active_opacity = 1.0; # Opacity multiplier for focused windows. Default: 1.0.
          decoration.border_part_of_window = true; # Count border pixels as part of the window geometry. Default: true.
          decoration.dim_around = 0.4; # Darkening when a window requests dim-around. Default: 0.4.
          decoration.dim_inactive = false; # Darken unfocused windows. Default: false.
          decoration.dim_modal = true; # Darken windows behind a modal dialog. Default: true.
          decoration.dim_special = 0.2; # Dimming amount behind special workspaces. Default: 0.2.
          decoration.dim_strength = 0.5; # Darkening intensity for inactive windows. Default: 0.5.
          decoration.fullscreen_opacity = 1.0; # Opacity multiplier for fullscreen windows. Default: 1.0.
          decoration.inactive_opacity = 1.0; # Opacity multiplier for unfocused windows. Default: 1.0.
          decoration.rounding = 0; # Corner rounding radius in layout pixels. Default: 0.
          decoration.rounding_power = 2.0; # Shape of rounded corners (2 = circular). Default: 2.0.

          # --- DECORATION.SHADOW ---
          decoration.shadow.enabled = true; # Draw a drop shadow around windows. Default: true.
          decoration.shadow.color = "0xee1a1a1a"; # Color and transparency of focused shadows. Default: 0xee1a1a1a.
          decoration.shadow.color_inactive = "0xee1a1a1a"; # Default: (omitted / unset). Control the color inactive appearance for decoration / shadow.
          decoration.shadow.offset = "0xee1a1a1a"; # Default: {0,0}. Horizontal and vertical shadow displacement.
          decoration.shadow.range = 4; # How far the shadow extends from window edges. Default: 4.
          decoration.shadow.render_power = 3; # Rate at which the shadow fades away from window edges. Default: 3.
          decoration.shadow.scale = 1.0; # Scale of the shadow geometry. Default: 1.0.
          decoration.shadow.sharp = false; # Use sharp shadows instead of a soft falloff. Default: false.

          # --- DECORATION.GLOW ---
          decoration.glow.enabled = false; # Enable a glow drawn inside windows. Default: false.
          decoration.glow.color = "0xee1a1a1a"; # Color of the inner glow on focused windows. Default: 0xee1a1a1a.
          decoration.glow.color_inactive = "0xee1a1a1a"; # Default: (omitted / unset). Control the color inactive appearance for decoration / glow.
          decoration.glow.range = 10; # Width/radius of the inner glow effect. Default: 10.
          decoration.glow.render_power = 3; # Falloff curve of the inner glow effect. Default: 3.

          # --- DECORATION.MOTION_BLUR ---
          decoration.motion_blur.enabled = false; # Enable motion blur for moving/resizing windows. Default: false.
          decoration.motion_blur.samples = 7; # Number of frames/samples blended for motion blur. Default: 7.

          # --- DECORATION.WOBBLE ---
          decoration.wobble.enabled = false; # Enable a springy wobble when dragging windows. Default: false.
          decoration.wobble.mesh = 12; # Mesh detail of wobbling window edges. Default: 12.
          decoration.wobble.stiffness = 200; # Spring stiffness of the wobble deformation. Default: 200.
          decoration.wobble.damping = 12; # How fast spring wobble settles. Default: 12.
          decoration.wobble.mass = 1; # Simulated mass of wobbling windows. Default: 1.
          decoration.wobble.intensity = 0.2; # Strength of wobble motion. Default: 0.2.
          decoration.wobble.value_epsilon = 0.25; # Distance threshold below which wobble stops. Default: 0.25.
          decoration.wobble.velocity_epsilon = 2; # Speed threshold below which wobble stops. Default: 2.

          # --- DECORATION.BLUR ---
          decoration.blur.enabled = true; # Enable background blur through translucent surfaces. Default: true.
          decoration.blur.brightness = 1; # Brightness multiplier of blurred surfaces. Default: 1.
          decoration.blur.contrast = 0.8916; # Contrast multiplier of blurred surfaces. Default: 0.8916.
          decoration.blur.ignore_opacity = true; # Apply blur independently of window opacity. Default: true.
          decoration.blur.input_methods = false; # Blur behind IME/input-method popups. Default: false.
          decoration.blur.input_methods_ignorealpha = 0.2; # Skip input-method blur below this alpha threshold. Default: 0.2.
          decoration.blur.new_optimizations = true; # Use optimized blur calculations. Default: true.
          decoration.blur.noise = 0.0117; # Amount of noise added to blur. Default: 0.0117.
          decoration.blur.passes = 1; # Number of blur passes; higher costs more GPU time. Default: 1.
          decoration.blur.popups = false; # Blur menus and other popup surfaces. Default: false.
          decoration.blur.popups_ignorealpha = 0.2; # Skip popup blur below this alpha threshold. Default: 0.2.
          decoration.blur.proportional = false; # Scale blur strength with per-pixel opacity. Default: false.
          decoration.blur.size = 8; # Spatial blur radius. Default: 8.
          decoration.blur.special = false; # Blur background behind special workspaces. Default: false.
          decoration.blur.vibrancy = 0.1696; # Increase saturation of blurred content. Default: 0.1696.
          decoration.blur.vibrancy_darkness = 0.0; # Vibrancy intensity in the dark parts of the scene. Default: 0.0.
          decoration.blur.xray = false; # Exclude tiled windows from floating-window blur sampling. Default: false.
          decoration.blur.variant = "kawase"; # Default. Conventional, relatively inexpensive background blur.
                                  # "acrylic"; # Refracted liquid-glass-like acrylic blur.
                                  # "aurora"; # Adds aurora-like colored light streaks.
                                  # "drops"; # Simulates raindrops on a glass surface.
                                  # "fluid_jar"; # Uses a simulated moving fluid pattern; can be expensive.
                                  # "frost"; # Creates a cracked-ice appearance.
                                  # "haze"; # Uses a diffused, pearlescent haze.
                                  # "heat_shimmer"; # Adds a subtle heat-distortion effect.
                                  # "prism"; # Uses a triangular refraction pattern.
                                  # "ripple"; # Adds ripples in response to clicks.
                                  # "water"; # Simulates water-like heightmap ripples.

          # --- DECORATION.BLUR.ACRYLIC ---
          # decoration.blur.acrylic.aberration = 0.025; # Color fringe distortion for acrylic-style blur. Default: 0.025.
          # decoration.blur.acrylic.bulb = 48.0; # Width of the acrylic lens edge. Default: 48.0.
          # decoration.blur.acrylic.clarity = 0.82; # How clearly the background shows through acrylic. Default: 0.82.
          # decoration.blur.acrylic.refraction = 24.0; # Strength of the acrylic light distortion. Default: 24.0.
          # decoration.blur.acrylic.tint = 0x14EEF5FF; # Tint color applied by acrylic blur. Default: 0x14EEF5FF.

          # --- DECORATION.BLUR.AURORA ---
          # decoration.blur.aurora.color1 = 0x29F0A0FF; # First tint color used in aurora blur. Default: 0x29F0A0FF.
          # decoration.blur.aurora.color2 = 0x7A4DFFFF; # Second tint color used in aurora blur. Default: 0x7A4DFFFF.
          # decoration.blur.aurora.intensity = 0.35; # Opacity/intensity of aurora color curtains. Default: 0.35.
          # decoration.blur.aurora.speed = 1.0; # Animation speed of aurora color curtains. Default: 1.0.

          # --- DECORATION.BLUR.DROPS ---
          # decoration.blur.drops.speed = 3.0; # Animation speed of droplet blur. Default: 3.0.

          # --- DECORATION.BLUR.FLUID_JAR ---
          # decoration.blur.fluid_jar.color = 0xCC3399FF; # Color of simulated fluid. Default: 0xCC3399FF.
          # decoration.blur.fluid_jar.distortion = 8.0; # Refraction/distortion of simulated fluid. Default: 8.0.
          # decoration.blur.fluid_jar.fill_amount = 0.5; # How full the fluid container looks. Default: 0.5.
          # decoration.blur.fluid_jar.mass = 1.4; # Inertial mass of the simulated fluid. Default: 1.4.
          # decoration.blur.fluid_jar.precision = 2.0; # Precision of the fluid simulation. Default: 2.0.
          # decoration.blur.fluid_jar.speed = 3.7; # Animation speed of simulated fluid. Default: 3.7.
          # decoration.blur.fluid_jar.turbulence = 1.2; # Amount of internal fluid turbulence. Default: 1.2.

          # --- DECORATION.BLUR.GLASS ---
          # decoration.blur.glass.refraction = 20.0; # Refractive displacement for glass-like blur. Default: 20.0.
          # decoration.blur.glass.roughness = 1.0; # Intensity of textured glass shading. Default: 1.0.
          # decoration.blur.glass.size = 40.0; # Size of the glass refraction pattern. Default: 40.0.

          # --- DECORATION.BLUR.HAZE ---
          # decoration.blur.haze.intensity = 0.35; # Strength of pearlescent haze shading. Default: 0.35.
          # decoration.blur.haze.iridescence = 0.7; # Color shift in pearlescent haze. Default: 0.7.

          # --- DECORATION.BLUR.HEAT_SHIMMER ---
          # decoration.blur.heat_shimmer.speed = 1.0; # Animation speed of heat-shimmer blur. Default: 1.0.

          # --- DECORATION.BLUR.RIPPLE ---
          # decoration.blur.ripple.duration = 0.45; # Lifetime of a single blur ripple. Default: 0.45.
          # decoration.blur.ripple.radius = 400.0; # Maximum radius reached by blur ripples. Default: 400.0.
          # decoration.blur.ripple.strength = 30.0; # Strength of ripple refraction. Default: 30.0.
          # decoration.blur.ripple.width = 32.0; # Thickness of the ripple wave band. Default: 32.0.

          # --- DECORATION.BLUR.WATER ---
          # decoration.blur.water.damping = 0.95; # How fast water surface waves decay. Default: 0.95.
          # decoration.blur.water.duration = 12.0; # Maximum lifetime of water-wave effects. Default: 12.0.
          # decoration.blur.water.radius = 20.0; # Radius around input used to disturb the water surface. Default: 20.0.
          # decoration.blur.water.speed = 0.76; # Propagation speed of water-wave effects. Default: 0.76.
          # decoration.blur.water.strength = 32.0; # Strength of water wave/refraction displacement. Default: 32.0.

          # --- ANIMATIONS ---
          animations.enabled = true; # Enable Hyprland animation system. Default: true.
          animations.workspace_wraparound = true; # Wrap workspace transition animations at the ends. Default: false.

          # --- INPUT ---
          input.force_no_accel = true; # Bypass pointer acceleration for rawer mouse movement. Default: false.
          input.accel_profile = "flat"; # Constant gain without speed-dependent acceleration.
                              # "adaptive"; # Speed-dependent acceleration, faster when moving quickly.
                              # "custom"; # Use a custom pointer acceleration curve supported by libinput.

          input.emulate_discrete_scroll = 1; # Default. Emulate only for non-standard wheel events.
                                        # 0; # Do not emulate discrete wheel steps.
                                        # 2; # Force emulation for every wheel event.

          input.float_switch_override_focus = 1; # Default. Follow pointer when switching between tiled and floating.
                                            # 0; # Never change focus specifically because a window switches layout.
                                            # 2; # Also follow pointer when switching between floating windows.

          input.focus_on_close = 0; # Default. Focus the next eligible window.
                                # 1; # Focus the window currently under the pointer.
                                # 2; # Focus the most recently active window.

          input.follow_mouse = 1; # Default. Moving the pointer focuses the window beneath it.
                              # 0; # Moving the pointer does not change keyboard focus.
                              # 2; # Pointer focus is separate; clicking a window gives it keyboard focus.
                              # 3; # Pointer and keyboard focus remain separate even on click.

          input.follow_mouse_shrink = 0; # Shrink hover areas before mouse-following focus changes. Default: 0.
          input.follow_mouse_threshold = 0.0; # Minimum pointer travel before changing focus. Default: 0.0.
          input.kb_layout = "us"; # XKB keyboard layout name(s). Default: "us".
          input.left_handed = false; # Configure left handed behavior in input. Default: false.
          input.mouse_refocus = true; # Refocus hovered windows when crossing into their areas. Default: true.
          input.natural_scroll = false; # Move content with the finger/wheel direction. Default: false.
          input.numlock_by_default = true; # Enable Num Lock at session startup. Default: false.

          input.off_window_axis_events = 1; # Default. Forward events with out-of-bounds coordinates.
                                        # 0; # Ignore wheel events outside the focused window.
                                        # 2; # Send events using coordinates clamped inside the focused window.
                                        # 3; # Warp the cursor to the nearest point inside the focused window.

          input.repeat_delay = 200; # Milliseconds before held keys begin repeating. Default: 600.
          input.repeat_rate = 40; # Number of repeats per second for held keys. Default: 25.
          input.resolve_binds_by_sym = false; # Match shortcuts by key symbols across multiple layouts. Default: false.
          input.rotation = 0; # Clockwise rotation of input device coordinates. Default: 0.
          input.scroll_button = 3; # Mouse button used to initiate button-scrolling. Default: 0.
          input.scroll_button_lock = false; # Toggle button-scrolling without holding its activation key. Default: false.

          input.scroll_factor = 1.0; # Scroll speed multiplier for external mice. Default: 1.0.
          input.sensitivity = 0.0; # Pointer movement sensitivity/speed adjustment. Default: 0.0.
          input.special_fallthrough = false; # Allow focus to pass through floating special workspaces. Default: false.
          input.swallow_focus_click = false; # Use first click only to focus an unfocused window. Default: false.

          # --- INPUT.TOUCHPAD ---
          input.touchpad.clickfinger_behavior = true; # Use number of fingers pressed to choose mouse button. Default: false.
          input.touchpad.disable_while_typing = true; # Reduce accidental touches while typing. Default: true.
          input.touchpad.drag_3fg = 0; # Default. Disable multi-finger drag.
                                  # 1; # Drag by moving three fingers together.
                                  # 2; # Drag by moving four fingers together.

          input.touchpad.drag_lock = 0; # Default. Releasing the finger ends the drag.
                                    # 1; # Keep the drag briefly after release, subject to a timeout.
                                    # 2; # Use sticky drag lock until explicitly released.

          input.touchpad.flip_x = false; # Invert horizontal touchpad movement. Default: false.
          input.touchpad.flip_y = false; # Invert vertical touchpad movement. Default: false.
          input.touchpad.middle_button_emulation = false; # Treat simultaneous left+right as middle click. Default: false.
          input.touchpad.natural_scroll = false; # Make touchpad content move with finger direction. Default: false.
          input.touchpad.scroll_factor = 1.0; # Multiply touchpad scroll movement. Default: 1.0.
          input.touchpad.tap_and_drag = true; # Allow tapping and dragging items. Default: true.
          input.touchpad.tap_button_map = "lrm"; # One-finger left; two-finger right; three-finger middle.
          input.touchpad.tap_to_click = true; # Treat a tap on the touchpad as a mouse click. Default: true.

          # --- INPUT.TOUCHDEVICE ---
          input.touchdevice.enabled = true; # Enable or disable the input / touchdevice feature. Default: true.
          input.touchdevice.transform = 0; # Default. No rotation or mirroring.


          # --- INPUT.VIRTUALKEYBOARD ---
          input.virtualkeyboard.release_pressed_on_close = false; # Configure release pressed on close behavior in input / virtualkeyboard. Default: false.

          input.virtualkeyboard.share_states = 2; # Default. Share except for input-method-editor clients.
                                              # 0; # Keep virtual keyboard key states separate.
                                              # 1; # Share key and modifier states with other keyboards.


          # --- INPUT.TABLET ---
          input.tablet.enabled = true; # Enable or disable the input / tablet feature. Default: true.
          input.tablet.output = 1; # Monitor receiving drawing-tablet input.
          input.tablet.transform = 0; # Default. No rotation or mirroring.

          input.tablet.absolute_region_position = false; # Configure absolute region position behavior in input / tablet. Default: false.
          input.tablet.relative_input = false; # Configure relative input behavior in input / tablet. Default: false.
          input.tablet.left_handed = false; # Configure left handed behavior in input / tablet. Default: false.
          input.tablet.active_area_position = "{0,0}"; # Default: {0,0}. Configure active area position behavior in input / tablet.
          input.tablet.active_area_size = "{0,0}"; # Default: {0,0}. Configure active area size behavior in input / tablet.
          input.tablet.region_position = "{0,0}"; # Default: {0,0}. Configure region position behavior in input / tablet.
          input.tablet.region_size = "{0,0}"; # Default: {0,0}. Physical region of the screen mapped to tablet input.

          # --- INPUT.TABLETTOOL ---
          # input.tablettool.eraser_button_override = 0; # Override the pen eraser key/button identifier. Default: 0.
          # input.tablettool.pressure_range_min = -1.0; # Minimum accepted pen pressure; -1 uses hardware. Default: -1.0.
          # input.tablettool.pressure_range_max = -1.0; # Maximum accepted pen pressure; -1 uses hardware. Default: -1.0.
          # input.tablettool.eraser_button_mode = 0; # Default. Let the tablet use its native eraser behavior.
                                                # 1; # Send a button event instead of a native eraser event.


          # --- GESTURES ---
          # gestures.close_max_timeout = 1000; # Configure close max timeout behavior in gestures. Default: 1000.
          # gestures.workspace_swipe_cancel_ratio = 0.5; # How far a swipe must travel to commit a switch. Default: 0.5.
          # gestures.workspace_swipe_create_new = true; # Create a new workspace when swiping beyond the last. Default: true.
          # gestures.workspace_swipe_direction_lock = true; # Lock swipe to its initial horizontal/vertical direction. Default: true.
          # gestures.workspace_swipe_direction_lock_threshold = 10; # Distance before directional swipe lock activates. Default: 10.
          # gestures.workspace_swipe_distance = 300; # Physical swipe travel required to change workspaces. Default: 300.
          # gestures.workspace_swipe_forever = false; # Allow continuous switching past adjacent workspaces. Default: false.
          # gestures.workspace_swipe_invert = true; # Reverse the direction of touchpad workspace swipes. Default: true.
          # gestures.workspace_swipe_min_speed_to_force = 30; # Swipe speed that forces a switch despite travel threshold. Default: 30.
          # gestures.workspace_swipe_touch = false; # Allow edge swipes on touchscreens to change workspace. Default: false.
          # gestures.workspace_swipe_touch_invert = false; # Reverse touchscreen swipe workspace direction. Default: false.
          # gestures.workspace_swipe_use_r = false; # Navigate relative workspace IDs instead of existing only. Default: false.

          # --- GESTURES.SCROLLING ---
          # gestures.scrolling.move_snap_to_grid = true; # Snap a scrolling layout into its grid after movement. Default: true.
          # gestures.scrolling.move_snap_cursor = true; # Snap cursor after scrolling-layout movement. Default: true.

          # --- GROUP ---
          group.auto_group = false; # Automatically group windows into an unlocked active group. Default: true.
          group.focus_removed_window = true; # Focus the window newly removed from a group. Default: true.
          group.group_on_movetoworkspace = false; # Auto-merge moved windows into groups on destination. Default: false.
          group.insert_after_current = true; # Insert new group windows after active member. Default: true.
          group.merge_floated_into_tiled_on_groupbar = false; # Configure merge floated into tiled on groupbar behavior in group. Default: false.
          group.merge_groups_on_drag = true; # Permit dragging entire groups into other groups. Default: true.
          group.merge_groups_on_groupbar = true; # Configure merge groups on groupbar behavior in group. Default: true.
          group.drag_into_group = 1; # Default. Merge windows dragged into unlocked groups.
                                # 0; # Do not merge windows by dragging into a group.
                                # 2; # Merge only when the window is dropped onto a group bar.


          # --- GROUP.COL ---
          group.col.border_active = "0x66ffff00"; # Control the border active appearance for group / col. Default: 0x66ffff00.
          group.col.border_inactive = "0x66777700"; # Control the border inactive appearance for group / col. Default: 0x66777700.
          group.col.border_locked_active = "0x66ff5500"; # Control the border locked active appearance for group / col. Default: 0x66ff5500.
          group.col.border_locked_inactive = "0x66775500"; # Control the border locked inactive appearance for group / col. Default: 0x66775500.

          # --- GROUP.GROUPBAR ---
          group.groupbar.enabled = true; # Display group tab indicators on grouped windows. Default: true.
          group.groupbar.blur = false; # Configure blur behavior in group / groupbar. Default: false.
          group.groupbar.disable_when_only = false; # Hide a group bar if only one window remains. Default: false.
          # group.groupbar.font_family = <omit>; # Default: (omitted / unset). Configure font family behavior in group / groupbar.
          group.groupbar.font_size = 8; # Size of group window title text. Default: 8.
          group.groupbar.font_weight_active = "normal"; # Configure font weight active behavior in group / groupbar. Default: "normal".
          group.groupbar.font_weight_inactive = "normal"; # Configure font weight inactive behavior in group / groupbar. Default: "normal".
          group.groupbar.gaps_in = 2; # Spacing between group bar gradient blocks. Default: 2.
          group.groupbar.gaps_out = 2; # Spacing from groupbar to its host window. Default: 2.
          group.groupbar.gradients = false; # Render gradient backgrounds in group bars. Default: false.
          group.groupbar.gradient_round_only_edges = true; # Configure gradient round only edges behavior in group / groupbar. Default: true.
          group.groupbar.gradient_rounding = 2; # Configure gradient rounding behavior in group / groupbar. Default: 2.
          group.groupbar.gradient_rounding_power = 2.0; # Configure gradient rounding power behavior in group / groupbar. Default: 2.0.
          group.groupbar.height = 14; # Height of each groupbar area. Default: 14.
          group.groupbar.indicator_gap = 0; # Configure indicator gap behavior in group / groupbar. Default: 0.
          group.groupbar.indicator_height = 3; # Thickness of group tab active-state indicator. Default: 3.
          group.groupbar.keep_upper_gap = true; # Configure keep upper gap behavior in group / groupbar. Default: true.
          group.groupbar.middle_click_close = true; # Middle clicking group tabs closes that member. Default: true.
          group.groupbar.priority = 3; # Configure priority behavior in group / groupbar. Default: 3.
          group.groupbar.render_titles = true; # Draw window names inside group bars. Default: true.
          group.groupbar.round_only_edges = true; # Configure round only edges behavior in group / groupbar. Default: true.
          group.groupbar.rounding = 1; # Corner radius of the group tab indicator. Default: 1.
          group.groupbar.rounding_power = 2.0; # Configure rounding power behavior in group / groupbar. Default: 2.0.
          group.groupbar.scrolling = true; # Switch grouped windows with the mouse wheel. Default: true.
          group.groupbar.stacked = false; # Show the groupbar vertically rather than horizontally. Default: false.
          group.groupbar.text_color = "0xffffffff"; # Color of group tab titles. Default: 0xffffffff.
          # group.groupbar.text_color_inactive = <omit>; # Default: (omitted / unset). Configure text color inactive behavior in group / groupbar.
          # group.groupbar.text_color_locked_active = <omit>; # Default: (omitted / unset). Configure text color locked active behavior in group / groupbar.
          # group.groupbar.text_color_locked_inactive = <omit>; # Default: (omitted / unset). Configure text color locked inactive behavior in group / groupbar.
          group.groupbar.text_offset = 0; # Configure text offset behavior in group / groupbar. Default: 0.
          group.groupbar.text_padding = 0; # Configure text padding behavior in group / groupbar. Default: 0.

          # --- GROUP.GROUPBAR.COL ---
          group.groupbar.col.active = "0x66ffff00"; # Configure active behavior in group / groupbar / col. Default: 0x66ffff00.
          group.groupbar.col.inactive = "0x66777700"; # Configure inactive behavior in group / groupbar / col. Default: 0x66777700.
          group.groupbar.col.locked_active = "0x66ff5500"; # Configure locked active behavior in group / groupbar / col. Default: 0x66ff5500.
          group.groupbar.col.locked_inactive = "0x66775500"; # Configure locked inactive behavior in group / groupbar / col. Default: 0x66775500.

          # --- MISC ---
          misc.allow_session_lock_restore = false; # Permit restarting a crashed session locker. Default: false.
          misc.always_follow_on_dnd = true; # Keep pointer focus tracking while dragging objects. Default: true.
          misc.animate_manual_resizes = false; # Animate manual window resizes. Default: false.
          misc.animate_mouse_windowdragging = false; # Animate window dragging via the mouse. Default: false.
          misc.anr_missed_pings = 5; # Heartbeat pings missed before flagging an app unresponsive. Default: 5.
          misc.background_color = "0x111111"; # Solid background used behind the compositor wallpaper. Default: 0x111111.
          misc.bell_sound = "default"; # Sound file or special value for the system bell. Default: "default".
          misc.close_special_on_empty = true; # Hide special workspaces when their final window closes. Default: true.
          misc.disable_autoreload = false; # Require an explicit reload after config edits. Default: false.
          misc.disable_hyprland_guiutils_check = false; # Control when to disable hyprland guiutils check in misc. Default: false.
          misc.disable_hyprland_logo = true; # Hide Hyprland background branding. Default: false.
          misc.disable_scale_notification = false; # Suppress alerts when a display scale is unsuitable. Default: false.
          misc.disable_splash_rendering = true; # Hide background splash text. Default: false.
          misc.disable_watchdog_warning = false; # Suppress warnings about compositor startup method. Default: false.
          misc.disable_xdg_env_checks = false; # Suppress XDG environment validation warnings. Default: false.
          misc.enable_anr_dialog = true; # Show an application-not-responding dialog. Default: true.
          misc.enable_swallow = false; # Replace a parent terminal with the launched child window. Default: false.
          misc.exit_window_retains_fullscreen = 0; # Default. Do not automatically fullscreen the next window.
                                              # 1; # Give the next focused window fullscreen state.
                                              # 2; # Preserve fullscreen only when closing a grouped window.
                                              # 3; # Preserve fullscreen only when closing a non-grouped window.

          misc.float_force_onscreen = 2; # Keep the whole window inside monitor bounds.
                                    # 0; # Default. No position constraint.
                                    # 1; # Keep at least part of the window on a monitor.

          misc.new_float_force_onscreen = 2; # Default. Keep the whole window inside monitor bounds.
                                        # 0; # No position constraint.
                                        # 1; # Keep at least part of the window on a monitor.

          misc.focus_on_activate = false; # Focus apps that request activation. Default: false.
          misc.font_family = "Sans"; # Font used for compositor-generated text. Default: "Sans".
          misc.force_default_wallpaper = -1; # Default. Choose bundled background style at random.
                                        # 0; # Disable the illustrated/anime background.
                                        # 1; # Disable the illustrated/anime background (legacy alternate mode).
                                        # 2; # Enable the illustrated/anime background.

          misc.initial_workspace_token_timeout = 10; # Seconds to preserve launch-workspace tracking tokens. Default: 10.

          misc.initial_workspace_tracking = 0; # Do not track the workspace on which an app was launched.
                                          # 1; # Default. Track the originally invoked workspace for one window.
                                          # 2; # Keep tracking that workspace for descendant processes.

          misc.key_press_enables_dpms = true; # Key press turns monitors back on. Default: false.
          misc.lockdead_screen_delay = 500; # Delay before failed lockscreen fallback appears. Default: 1000.
          misc.middle_click_paste = false; # Allow X11-style primary-selection middle-click paste. Default: true.
          misc.mouse_move_enables_dpms = false; # Configure mouse move enables dpms behavior in misc. Default: false.
          misc.mouse_move_focuses_monitor = true; # Mouse entering a monitor focuses it. Default: true.
          misc.name_vk_after_proc = true; # Configure virtual keyboard name after proc behavior in misc. Default: true.
          misc.on_focus_under_fullscreen = 2; # Default. Leave fullscreen/maximized mode to focus the other window.
                                          # 0; # Keep focus on the existing fullscreen/maximized window.
                                          # 1; # Allow the requesting window to take over focus.

          misc.render_unfocused_fps = 30; # FPS cap for windows rendered despite being unfocused. Default: 15.
          misc.screencopy_force_8b = true; # Use 8-bit color depth for screenshot capture. Default: true.
          misc.session_lock_blur = true; # Blur graphics behind the lock screen. Default: false.
          misc.session_lock_xray = false; # Continue displaying workspaces behind lock screen. Default: false.
          misc.size_limits_tiled = false; # Apply min/max app sizing constraints to tiled windows. Default: false.
          misc.vrr = 0; # Default. Keep VRR disabled.
                    # 1; # Keep VRR enabled whenever supported.
                    # 2; # Enable VRR only while a window is fullscreen.
                    # 3; # Enable VRR for fullscreen game/video content types.

          # --- BINDS ---
          binds.allow_workspace_cycles = false; # Allow cyclic navigation through workspace history. Default: false.
          binds.disable_keybind_grabbing = false; # Ignore apps asking to intercept global shortcuts. Default: false.
          binds.drag_threshold = 0; # Pointer movement required to start dragging a window. Default: 0.
          binds.drag_center_window = true; # Center floating window beneath cursor when dragged. Default: true.
          binds.focus_preferred_method = 0; # Default. Favor the most recently active matching window.
                                        # 1; # Favor windows that share longer adjacent borders.

          binds.hide_special_on_workspace_change = false; # Hide special workspace when normal workspace changes. Default: false.
          binds.ignore_group_lock = false; # Allow dispatchers to disregard locked groups. Default: false.
          binds.movefocus_cycles_fullscreen = false; # Allow directional focus changes from fullscreen windows. Default: false.
          binds.movefocus_cycles_groupfirst = false; # Visit group members before neighboring windows. Default: false.
          binds.pass_mouse_when_bound = false; # Pass pointer events through even with mouse bindings. Default: false.
          binds.scroll_event_delay = 300; # Minimum delay between wheel-triggered keybindings. Default: 300.
          binds.window_direction_monitor_fallback = true; # Permit directional focus/movement across monitor edges. Default: true.
          binds.workspace_back_and_forth = 0; # Default. Do nothing when focusing the active workspace again.
                                          # 1; # Jump back to the previous workspace globally.
                                          # 2; # Jump back to the previous workspace on the current monitor.

          binds.workspace_center_on = 1; # Default. Center near the workspace's last active window.
                                    # 0; # Center the pointer on the workspace/monitor.


          # --- XWAYLAND ---
          xwayland.enabled = true; # Enable the XWayland compatibility server for X11 apps. Default: true.
          xwayland.create_abstract_socket = false; # Configure create abstract socket behavior in xwayland. Default: false.
          xwayland.force_zero_scaling = false; # Force XWayland windows to render at unscaled resolution. Default: false.
          xwayland.use_nearest_neighbor = true; # Configure use nearest neighbor behavior in xwayland. Default: true.

          # --- OPENGL ---
          opengl.nvidia_anti_flicker = false; # Configure nvidia anti flicker behavior in opengl. Default: true.

          # --- RENDER ---
          render.async_commit = true; # Send GPU display commits asynchronously. Default: false.
          render.cm_auto_hdr = 1; # Default. Switch into the hdr display mode.
                              # 0; # Disable automatic HDR switching.
                              # 2; # Switch into the hdredid display mode.

          render.cm_enabled = false; # Enable color-management pipeline. Default: true.
          render.cm_sdr_eotf = "default"; # Default. Use the standard sRGB behavior.
                              # "gamma22"; # Treat unspecified SDR content as Gamma 2.2.
                              # "gamma22force"; # Treat unspecified and sRGB content as Gamma 2.2.
                              # "srgb"; # Treat unspecified SDR content explicitly as sRGB.
          
          render.ctm_animation = 2; # Default. Automatically disable fades on NVIDIA.
                                # 0; # Disable CTM fade transitions.
                                # 1; # Enable CTM fade transitions.

          render.commit_timing_enabled = true; # Enable precise display-commit timing protocol. Default: true.
          render.direct_scanout = 1; # Enable direct scanout whenever eligible.
                                # 0; # Default. Disable direct scanout.
                                # 2; # Automatic: prioritize windows marked as games.

          render.expand_undersized_textures = true; # Configure expand undersized textures behavior in render. Default: true.
          render.fp16_sdr_tf = 0; # Default. Use the display/monitor transfer function.
                              # 1; # Use linear-light encoding.

          render.icc_vcgt_enabled = true; # Apply ICC calibration color ramps. Default: true.
          render.keep_unmodified_copy = 2; # Default. Keep a copy automatically when needed for HDR/SDR.
                                      # 0; # Do not retain a separate unmodified frame.
                                      # 1; # Always keep an unmodified copy.

          render.new_render_scheduling = false; # Use adaptive/triple-buffer rendering when necessary. Default: false.
          render.not_shown_fifo_lock = 0; # Default. Apply FIFO locking to all relevant surfaces.
                                      # 1; # Ignore surfaces explicitly marked render-unfocused.
                                      # 2; # Skip FIFO locking for surfaces that are not shown.

          render.non_shader_cm = 2; # Default. Use only for direct scanout and passthrough.
                                # 0; # Disable non-shader color management.
                                # 1; # Enable it whenever technically possible.
                                # 3; # Disable and disregard color-management issues.

          render.non_shader_cm_interop = 2; # Default. Disable them only for fullscreen photo/video/game content.
                                        # 0; # Disable external transforms during fullscreen.
                                        # 1; # Allow external transforms during fullscreen.

          render.send_content_type = true; # Configure send content type behavior in render. Default: true.
          render.use_fp16 = 2; # Default. Use FP16 buffers in HDR mode.
                          # 0; # Do not use FP16 buffers.
                          # 1; # Use FP16 buffers for all rendering.

          render.use_shader_blur_blend = false; # Use experimental shader-based blur mixing. Default: false.
          render.xp_mode = false; # Skips bottom layer rendering. Default: false.

          # --- CURSOR ---
          cursor.enable_hyprcursor = true; # Load high-quality Hyprcursor cursor themes. Default: true.
          cursor.hide_on_key_press = false; # Hide pointer while typing until moved. Default: false.
          cursor.hide_on_tablet = false; # Control when to hide on tablet in cursor. Default: false.
          cursor.hide_on_touch = true; # Hide pointer after touch input. Default: true.
          cursor.hotspot_padding = 0; # Space between screen edge and pointer hotspot. Default: 0.
          cursor.inactive_timeout = 0; # Seconds before an idle mouse pointer is hidden; 0 means never. Default: 0.
          cursor.min_refresh_rate = 24; # Configure min refresh rate behavior in cursor. Default: 24.
          cursor.invisible = false; # Configure invisible behavior in cursor. Default: false.
          cursor.no_break_fs_vrr = 2; # Default. Use that behavior automatically for games.
                                  # 0; # Request normal frames when the cursor moves.
                                  # 1; # Avoid cursor-triggered frames during fullscreen VRR.

          cursor.no_hardware_cursors = 2; # Default. Disable hardware cursors automatically when tearig.
                                      # 0; # Prefer hardware cursors when available.
                                      # 1; # Disable hardware cursors; composite the pointer instead.

          cursor.no_warps = false; # Prevent automatic mouse-pointer relocation. Default: false.
          cursor.persistent_warps = false; # Configure persistent warps behavior in cursor. Default: false.
          cursor.sync_gsettings_theme = true; # Synchronize cursor theme with desktop GSettings. Default: true.
          cursor.use_cpu_buffer = 2; # Default. Enable them automatically for NVIDIA.
                                # 0; # Disable CPU-backed cursor buffers.
                                # 1; # Always use CPU-backed cursor buffers.

          cursor.warp_back_after_non_mouse_input = false; # Configure warp back after non mouse input behavior in cursor. Default: false.
          cursor.warp_on_change_workspace = 0; # Default. Do not warp the pointer.
                                          # 1; # Warp the pointer to the focused window.
                                          # 2; # Force warping even when cursor.no_warps is enabled.

          cursor.warp_on_monitor_change = 1; # Warp to the focused window on the new monitor.
                                        # -1; # Default. Inherit cursor.warp_on_change_workspace.
                                        # 0; # Never warp on monitor change.
                                        # 2; # Force warping despite cursor.no_warps.

          cursor.warp_on_toggle_special = 0; # Default. Do not warp the pointer.
                                        # 1; # Warp the pointer to the focused window.
                                        # 2; # Force warping even when cursor.no_warps is enabled.

          cursor.zoom_detached_camera = true; # Free camera movement while zoomed in. Default: true.
          cursor.zoom_disable_aa = false; # Configure zoom disable aa behavior in cursor. Default: false.
          cursor.zoom_factor = 1.0; # Magnification around cursor position. Default: 1.0.
          cursor.zoom_rigid = false; # Keep zoom centered on mouse movement. Default: false.

          # --- ECOSYSTEM ---
          ecosystem.enforce_permissions = false; # Configure enforce permissions behavior in ecosystem. Default: false.
          ecosystem.no_donation_nag = false; # Configure no donation nag behavior in ecosystem. Default: false.
          ecosystem.no_update_news = false; # Suppress Hyprland update announcements. Default: false.

          # --- QUIRKS ---
          quirks.prefer_hdr = 1; # Always advertise HDR as preferred.
                            # 0; # Default. Do not prefer HDR.
                            # 2; # Advertise HDR as preferred only in Gamescope.

          # --- INPUT-CAPTURE ---
          input-capture.capture_modifiers = false; # Configure capture modifiers behavior in input-capture. Default: false.
          input-capture.enforce_barriers = true; # Configure enforce barriers behavior in input-capture. Default: true.

          # --- EXPERIMENTAL ---
          experimental.wp_cm_1_2 = false; # enable experimental wayland color management v2. Default: false.

        };

        # Keybindings use Lua function calls, not old Hyprlang bind strings.
        bind = [
          {
            _args = [
              "SUPER + RETURN" # Super+Enter opens your terminal.
              (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("kitty")'') # Run Kitty.
            ];
          }
          {
            _args = [
              "SUPER + Q" # Super+Q closes the focused window.
              (lib.generators.mkLuaInline ''hl.dsp.window.close()'') # Close that window.
            ];
          }
        ];

        # monitor = [ ]; # Add monitors through hl.monitor(...) declarations.
        # workspace_rule = [ ]; # Add workspace rules (e.g., monitor assignments).
        # window_rule = [ ]; # Add per-app window rules (float, size, focus, etc.).
        # gesture = [ ]; # Add touchpad/touchscreen gesture bindings.
        # animation = [ ]; # Define animation overrides (none by default here).
        # curve = [ ]; # Define animation curves (none by default here).
        # device = [ ]; # Override input behavior for individual devices.
        # env = [ ]; # Add Hyprland-specific environment variables.
        # on = [ ]; # Register Lua event handlers.
      };
    };
  };
}
