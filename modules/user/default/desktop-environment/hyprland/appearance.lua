
local colors = require("stylix")

hl.config({
  
  general = {
    
    -- borders
    border_size = 2,

    -- gaps
    gaps_in = 2,
    gaps_out = 2,
    gaps_workspaces = 0,

    -- colors
    col = {
      inactive_border = colors.base01 .. "FF",
      active_border = colors.base04 .. "FF",
    },

  },

  decoration = {
    
    -- rounding
    rounding = 4, -- rounded corners’ radius (in layout px)
    rounding_power = 2, -- adjusts the curve used for rounding corners, larger is smoother, 2.0 is a circle, 4.0 is a squircle, 1.0 is a triangular corner.

    -- opacity
    active_opacity = 1, -- opacity of active windows.
    inactive_opacity = 0.9, -- opacity of inactive windows.
    fullscreen_opacity = 1, -- opacity of fullscreen windows.

    -- dimming
    dim_modal = true, -- enables dimming of parents of modal windows
    dim_inactive = false, -- enables dimming of inactive windows
    dim_strength = 0.2, -- how much inactive windows should be dimmed
    dim_special = 0.2, -- how much to dim the rest of the screen by when a special workspace is open.
    dim_around = 0.4, -- how much the dimaround window rule should dim by.

    -- other
    --screen_shader = -- path to a custom shader
    border_part_of_window = true, -- whether the window border should be a part of the window

    -- blur
    blur = {
      enabled = true, -- enable kawase window background blur
      size = 1, -- blur size (distance)
      passes = 2, -- the amount of passes to perform
      ignore_opacity = true, -- make the blur layer ignore the opacity of the window
      new_optimizations = true, -- whether to enable further optimizations to the blur. Recommended to leave on, as it will massively improve performance.
      xray = false, -- if enabled, floating windows will ignore tiled windows in their blur. Only available if new_optimizations is true. Will reduce overhead on floating blur significantly.
      noise = 0.1, --0.0117,	-- how much noise to apply. [0.0 - 1.0]
      contrast = 0.8916, -- contrast modulation for blur. [0.0 - 2.0]
      brightness = 0.8172, -- brightness modulation for blur. [0.0 - 2.0]
      vibrancy = 0.1696, -- Increase saturation of blurred colors. [0.0 - 1.0]
      vibrancy_darkness = 0, -- How strong the effect of vibrancy is on dark areas . [0.0 - 1.0]
      special = false, -- whether to blur behind the special workspace (note: expensive)
      popups = false, -- whether to blur popups (e.g. right-click menus)
      popups_ignorealpha = 0.2, -- works like ignorealpha in layer rules. If pixel opacity is below set value, will not blur. [0.0 - 1.0]
      input_methods = false, -- whether to blur input methods (e.g. fcitx5)
      input_methods_ignorealpha = 0.2, -- works like ignorealpha in layer rules. If pixel opacity is below set value, will not blur. [0.0 - 1.0]
    },

    -- shadow
    shadow = {
      enabled = true, -- enable drop shadows on windows
      range = 6, -- Shadow range (“size”) in layout px
      render_power = 2, -- in what power to render the falloff (more power, the faster the falloff) [1 - 4]
      sharp = false, -- if enabled, will make the shadows sharp, akin to an infinite render power
      --color	 		=	"0xee1a1a1a",		-- shadow’s color. Alpha dictates shadow’s opacity.
      --color_inactive	=	unset,				-- inactive shadow color. (if not set, will fall back to color)
      offset = "1 1", -- shadow’s rendering offset.
      scale = 1, -- shadow’s scale. [0.0 - 1.0]
    },
  },
})
