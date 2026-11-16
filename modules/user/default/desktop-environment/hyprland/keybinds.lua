
local mainMod = "SUPER"
local terminal = "kitty"
local browser = "firefox"
local appLauncher = "wofi"
local fileManager = terminal .. " yazi"
local processViewer = "btop"
local rebuild = terminal .. " /run/current-system/sw/bin/bash -lc 'sudo nixos-rebuild switch --flake $HOME/nixOS##$hostname --impure --show-trace; ec=$?; if [ $ec -eq 0 ]; then exit 0; else echo; echo \"Rebuild failed (exit $ec). Press Enter to close…\"; read -r _; exit $ec; fi'"
local notificationCenter = "swaync-client -t -sw"
local lock = "hyprlock"
local screenshot = "grimblast --freeze copy area"
local screenshotOCR = "grimblast --freeze save area - | tesseract stdin stdout | wl-copy"
local jellyfinQuickAdd = "pwsh -File $HOME/.config/hypr/hyprland/jellyfinScripts/jellyfinQuickAdd.ps1"
local deadlockAudioCalloutsOn = "pwsh -File $HOME/projects/deadlockAudioScript/deadlockAudioCallouts.ps1"
local deadlockAudioCalloutsOff = "pkill --full 'deadlockAudioCallouts.ps1'"


-- Launch Apps
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(appLauncher))
hl.bind(mainMod .. " + DELETE", hl.dsp.exec_cmd(terminal .. " " .. processViewer))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(rebuild))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(notificationCenter))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(lock))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(screenshot))
hl.bind(mainMod .. " + CTRL + SHIFT + S", hl.dsp.exec_cmd(screenshotOCR))

-- window actions
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

-- move focus with mainMod + arrow keys
hl.bind(mainMod .. " + LEFT", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + UP", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + DOWN", hl.dsp.focus({ direction = "down" }))

-- switch active workspace with mainMod + [0-9]
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = "1" }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = "2" }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = "3" }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = "4" }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = "5" }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = "6" }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = "7" }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = "8" }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = "9" }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "10" }))

-- move active window to workspace with mainMod + [0-9]
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = "1" }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = "2" }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = "3" }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = "4" }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = "5" }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = "6" }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = "7" }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = "8" }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = "9" }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))

-- jellyfin add current track to playlist
hl.bind(mainMod .. " + ALT + RETURN", hl.dsp.exec_cmd(jellyfinQuickAdd .. " -AddToPlaylist 'Favorites' -AddToFavorites"))
hl.bind(mainMod .. " + ALT + 0", hl.dsp.exec_cmd(jellyfinQuickAdd .. " -AddToPlaylist 'Work'"))
hl.bind(mainMod .. " + ALT + 9", hl.dsp.exec_cmd(jellyfinQuickAdd .. " -AddToPlaylist 'Vocaloid'"))
hl.bind(mainMod .. " + ALT + 8", hl.dsp.exec_cmd(jellyfinQuickAdd .. " -AddToPlaylist 'Electronic'"))
hl.bind(mainMod .. " + ALT + 7", hl.dsp.exec_cmd(jellyfinQuickAdd .. " -AddToPlaylist 'Chiptune'"))
hl.bind(mainMod .. " + ALT + 6", hl.dsp.exec_cmd(jellyfinQuickAdd .. " -AddToPlaylist 'Metal'"))
hl.bind(mainMod .. " + ALT + 5", hl.dsp.exec_cmd(jellyfinQuickAdd .. " -AddToPlaylist 'Jazz'"))
hl.bind(mainMod .. " + ALT + BACKSPACE", hl.dsp.exec_cmd(jellyfinQuickAdd .. " -AddToPlaylist 'Delete'"))

--jellyfin remove current track from playlist 
-- hl.bind(mainMod .. " + CTRL + ALT + RETURN", hl.dsp.exec_cmd(jellyfinQuickAdd .. " -RemoveFromPlaylist 'Favorites' -AddToFavorites"))
hl.bind(mainMod .. " + CTRL + ALT + 0", hl.dsp.exec_cmd(jellyfinQuickAdd .. " -RemoveFromPlaylist 'Work'"))
hl.bind(mainMod .. " + CTRL + ALT + 9", hl.dsp.exec_cmd(jellyfinQuickAdd .. " -RemoveFromPlaylist 'Vocaloid'"))
hl.bind(mainMod .. " + CTRL + ALT + 8", hl.dsp.exec_cmd(jellyfinQuickAdd .. " -RemoveFromPlaylist 'Electronic'"))
hl.bind(mainMod .. " + CTRL + ALT + 7", hl.dsp.exec_cmd(jellyfinQuickAdd .. " -RemoveFromPlaylist 'Chiptune'"))
hl.bind(mainMod .. " + CTRL + ALT + 6", hl.dsp.exec_cmd(jellyfinQuickAdd .. " -RemoveFromPlaylist 'Metal'"))
hl.bind(mainMod .. " + CTRL + ALT + 5", hl.dsp.exec_cmd(jellyfinQuickAdd .. " -RemoveFromPlaylist 'Jazz'"))
hl.bind(mainMod .. " + CTRL + ALT + BACKSPACE", hl.dsp.exec_cmd(jellyfinQuickAdd .. " -RemoveFromPlaylist 'Delete'"))

-- media control
hl.bind(mainMod .. " + ALT + SHIFT_R", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind(mainMod .. " + ALT + LEFT", hl.dsp.exec_cmd("playerctl previous"))
hl.bind(mainMod .. " + ALT + RIGHT", hl.dsp.exec_cmd("playerctl next"))
hl.bind(mainMod .. " + ALT + UP", hl.dsp.exec_cmd("playerctl volume 0.1+"))
hl.bind(mainMod .. " + ALT + DOWN", hl.dsp.exec_cmd("playerctl volume 0.1-"))

-- Deadlock audio callouts script
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(deadlockAudioCalloutsOn))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(deadlockAudioCalloutsOff))

-- laptop functions
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true})
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { repeating = true})
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { repeating = true})

-- mouse binds
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
