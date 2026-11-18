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

