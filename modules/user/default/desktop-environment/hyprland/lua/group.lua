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
