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

-- --- QUIRKS ---
hl.config({
  quirks = {
    prefer_hdr = 1, -- Choose when applications are told that HDR is the preferred display mode.
    -- prefer_hdr = 0, -- Default. Do not prefer HDR.
    -- prefer_hdr = 1, -- Always report HDR as the preferred display mode.
    -- prefer_hdr = 2, -- Advertise HDR as preferred only in Gamescope.

  },
})

-- --- EXPERIMENTAL ---
hl.config({
  experimental = {
    wp_cm_1_2 = false, -- Let apps use version 2 of Wayland’s color-management protocol. Default: false.

  },
})


