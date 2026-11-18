-- --- DECORATION ---
hl.config({
  decoration = {
    active_opacity = 0.8, -- Opacity multiplier for focused windows. Default: 1.0.
    inactive_opacity = 0.8, -- Opacity multiplier for unfocused windows. Default: 1.0.
    border_part_of_window = true, -- Count border pixels as part of the window geometry. Default: true.
    dim_around = 0.4, -- Darkening when a window requests dim-around. Default: 0.4.
    dim_inactive = false, -- Darken unfocused windows. Default: false.
    dim_modal = true, -- Darken windows behind a modal dialog. Default: true.
    dim_special = 0.2, -- Dimming amount behind special workspaces. Default: 0.2.
    dim_strength = 0.5, -- Darkening intensity for inactive windows. Default: 0.5.
    fullscreen_opacity = 1.0, -- Opacity multiplier for fullscreen windows. Default: 1.0.
    rounding = 8, -- Corner rounding radius in layout pixels. Default: 0.
    rounding_power = 2, -- Shape of rounded corners (2 = circular). Default: 2.0.

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
      enabled = true, -- Enable a glow drawn inside windows. Default: false.
      color = "0xff000000", -- Color of the inner glow on focused windows. Default: 0xee1a1a1a.
      color_inactive = "0xdd000000", -- Inner-glow color for unfocused windows; normally inherits the active glow color.
      range = 10, -- Width/radius of the inner glow effect. Default: 10.
      render_power = 4, -- Falloff curve of the inner glow effect. Default: 3.

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
      variant = "acrylic", -- Choose the visual effect used when blurring transparent backgrounds.
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
        aberration = 0.1, -- Color fringe distortion for acrylic-style blur. Default: 0.025.
        bulb = 20.0, -- Width of the acrylic lens edge. Default: 48.0.
        clarity = 1.0, -- How clearly the background shows through acrylic. Default: 0.82.
        refraction = 0.8, -- Strength of the acrylic light distortion. Default: 24.0.
        tint = 0x55000000, -- Tint color applied by acrylic blur. Default: 0x14EEF5FF.

      },
    },
  },
})

-- --- DECORATION.BLUR.AURORA ---
hl.config({
  decoration = {
    blur = {
      aurora = {
        color1 = 0xaaF0A0FF, -- First tint color used in aurora blur. Default: 0x29F0A0FF.
        color2 = 0x664DFFFF, -- Second tint color used in aurora blur. Default: 0x7A4DFFFF.
        intensity = 0.5, -- Opacity/intensity of aurora color curtains. Default: 0.35.
        speed = 1.0, -- Animation speed of aurora color curtains. Default: 1.0.

      },
    },
  },
})

-- --- DECORATION.BLUR.DROPS ---
hl.config({
  decoration = {
    blur = {
      drops = {
        speed = 0.5, -- Animation speed of droplet blur. Default: 3.0.

      },
    },
  },
})

-- --- DECORATION.BLUR.FLUID_JAR ---
hl.config({
  decoration = {
    blur = {
      fluid_jar = {
        color = 0xCC3399FF, -- Color of simulated fluid. Default: 0xCC3399FF.
        distortion = 8.0, -- Refraction/distortion of simulated fluid. Default: 8.0.
        fill_amount = 0.5, -- How full the fluid container looks. Default: 0.5.
        mass = 1.4, -- Inertial mass of the simulated fluid. Default: 1.4.
        precision = 2.0, -- Precision of the fluid simulation. Default: 2.0.
        speed = 3.7, -- Animation speed of simulated fluid. Default: 3.7.
        turbulence = 1.2, -- Amount of internal fluid turbulence. Default: 1.2.

      },
    },
  },
})

-- --- DECORATION.BLUR.GLASS ---
hl.config({
  decoration = {
    blur = {
      glass = {
        refraction = 20.0, -- Refractive displacement for glass-like blur. Default: 20.0.
        roughness = 0.0, -- Intensity of textured glass shading. Default: 1.0.
        size = 100.0, -- Size of the glass refraction pattern. Default: 40.0.

      },
    },
  },
})

-- --- DECORATION.BLUR.HAZE ---
hl.config({
  decoration = {
    blur = {
      haze = {
        intensity = 1.0, -- Strength of pearlescent haze shading. Default: 0.35.
        iridescence = 1.0, -- Color shift in pearlescent haze. Default: 0.7.

      },
    },
  },
})

-- --- DECORATION.BLUR.HEAT_SHIMMER ---
hl.config({
  decoration = {
    blur = {
      heat_shimmer = {
        speed = 4.0, -- Animation speed of heat-shimmer blur. Default: 1.0.
      },
    },
  },
})

-- --- DECORATION.BLUR.RIPPLE ---
hl.config({
  decoration = {
    blur = {
      ripple = {
        duration = 0.45, -- Lifetime of a single blur ripple. Default: 0.45.
        radius = 400.0, -- Maximum radius reached by blur ripples. Default: 400.0.
        strength = 30.0, -- Strength of ripple refraction. Default: 30.0.
        width = 32.0, -- Thickness of the ripple wave band. Default: 32.0.

      },
    },
  },
})

-- --- DECORATION.BLUR.WATER ---
hl.config({
  decoration = {
    blur = {
      water = {
        damping = 0.9, -- How fast water surface waves decay. Default: 0.95.
        duration = 12.0, -- Maximum lifetime of water-wave effects. Default: 12.0.
        radius = 20.0, -- Radius around input used to disturb the water surface. Default: 20.0.
        speed = 0.76, -- Propagation speed of water-wave effects. Default: 0.76.
        strength = 32.0, -- Strength of water wave/refraction displacement. Default: 32.0.

      },
    },
  },
})
