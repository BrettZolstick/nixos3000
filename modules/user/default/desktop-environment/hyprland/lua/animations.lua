-- --- ANIMATIONS ---
hl.config({
  animations = {
    enabled = true, -- Enable Hyprland animation system. Default: true.
    workspace_wraparound = true, -- Wrap workspace transition animations at the ends. Default: false.
  },
})

hl.curve("quick",{
  type = "bezier",
  points = {
    {0.25, 0},
    {0.25, 1},
  },
})

hl.animation({
  leaf = "global",
  enabled = true;
  speed = 2.25,
  bezier = "quick",
})
