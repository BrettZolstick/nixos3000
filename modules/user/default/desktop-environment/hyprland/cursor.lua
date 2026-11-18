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

