
hl.config({
  animations = {
    enabled = true, 
  },
})

hl.curve("quick", {
  type = "bezier",
  points = {
    {0.15, 0},
    {0.1, 1},
  },
})

hl.animation({
  leaf = "global",
  enabled = true,
  speed = 2.5,
  bezier = "quick",
})

