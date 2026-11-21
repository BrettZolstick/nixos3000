# Noctalia settings, mirrored from the GUI by the dmopp/settings-to-nix plugin
# (/home/personal/.local/state/noctalia/settings.toml). Every export overwrites this file.
#
# This file is your backup: keep it somewhere safe, for example in git.
#
# To restore, run this as your user in the directory of this file:
#   $(nix-build --no-out-link ./gui-settings.nix)/bin/noctalia-restore-settings
# It replaces settings.toml (the old one is kept as settings.toml.bak-<time>).
# Then restart Noctalia; it installs the plugins listed here again on startup.
{ pkgs ? import <nixpkgs> { } }:
let
  settings = {
    backdrop.enabled = true;
    bar.default = {
      background_opacity = 0.69999998435378075;
      capsule_thickness = 0.68999998830258846;
      compositor_blur = false;
      end = [
        "tray"
        "notifications"
        "clipboard"
        "network"
        "bluetooth"
        "volume"
        "brightness"
        "battery"
        "control-center"
        "session"
      ];
      margin_ends = "10%";
      padding = 15;
      radius = 15;
      scale = 0.80000000447034836;
      start = [ "launcher" "wallpaper" "media" ];
      thickness = 23;
      widget_spacing = 10;
    };
    config_version = 20;
    desktop_widgets = {
      grid = {
        cell_size = 16;
        major_interval = 4;
        visible = true;
      };
      schema_version = 2;
      widget = { };
      widget_order = [ ];
    };
    lockscreen_widgets = {
      enabled = false;
      grid = {
        cell_size = 16;
        major_interval = 4;
        visible = true;
      };
      schema_version = 2;
      widget = {
        "lockscreen-login-box@FALLBACK" = {
          box_height = 196.0;
          box_width = 810.0;
          cx = 960.0;
          cy = 898.0;
          output = "FALLBACK";
          placement_height = 1080.0;
          placement_width = 1920.0;
          rotation = 0.0;
          settings = {
            background_color = "surface_container";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            layout = "regular";
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_media = true;
            show_media_controls = true;
            show_password_reveal = true;
            show_session_buttons = true;
            show_unlock_hint = true;
            show_weather = true;
          };
          type = "login_box";
        };
        "lockscreen-login-box@WAYLAND-1" = {
          box_height = 196.0;
          box_width = 720.0;
          cx = 153.5;
          cy = 157.0;
          output = "WAYLAND-1";
          placement_height = 339.0;
          placement_width = 307.0;
          rotation = 0.0;
          settings = {
            background_color = "surface_container";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            layout = "regular";
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_media = true;
            show_media_controls = true;
            show_password_reveal = true;
            show_session_buttons = true;
            show_unlock_hint = true;
            show_weather = true;
          };
          type = "login_box";
        };
        "lockscreen-login-box@eDP-1" = {
          box_height = 196.0;
          box_width = 810.0;
          cx = 640.0;
          cy = 568.33331298828125;
          output = "eDP-1";
          placement_height = 720.0;
          placement_width = 1280.0;
          rotation = 0.0;
          settings = {
            background_color = "surface_container";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            layout = "regular";
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_media = true;
            show_media_controls = true;
            show_password_reveal = true;
            show_session_buttons = true;
            show_unlock_hint = true;
            show_weather = true;
          };
          type = "login_box";
        };
      };
      widget_order = [
        "lockscreen-login-box@eDP-1"
        "lockscreen-login-box@WAYLAND-1"
        "lockscreen-login-box@FALLBACK"
      ];
    };
    plugins = {
      enabled = [ "dmopp/settings-to-nix" ];
      source = [
        {
          kind = "git";
          location = "https://github.com/noctalia-dev/official-plugins";
          name = "official";
        }
        {
          kind = "git";
          location = "https://github.com/noctalia-dev/community-plugins";
          name = "community";
        }
        {
          kind = "git";
          location = "https://github.com/maylton/noctalia-auto-tile-plugin";
          name = "maylton-plugins";
        }
      ];
    };
    shell = {
      animation.speed = 1.7500000260770321;
      card_borders = false;
      font_family = "VictorMono NFM SemiBold";
      launcher.app_grid = true;
      panel = {
        clipboard_position = "auto";
        transparency_mode = "glass";
      };
      screen_corners.size = 53;
      settings_window_translucent = true;
      shadow = {
        alpha = 0.53999998793005943;
        direction = "down_right";
      };
    };
    theme = {
      builtin = "Noctalia";
      community_palette = "Oxocarbon";
      pure_black_dark = true;
      source = "wallpaper";
      wallpaper_scheme = "m3-tonal-spot";
    };
    wallpaper.favorite = [
      {
        path = "/home/personal/Pictures/Artemis_II_Inside_VAB_(NHQ20260116_admin_0002).jpg";
      }
    ];
    weather.enabled = false;
    widget = {
      bluetooth.enabled = false;
      brightness.enabled = false;
      clipboard.enabled = false;
    };
  };
  settingsToml = (pkgs.formats.toml { }).generate "noctalia-settings.toml" settings;
in
(pkgs.writeShellScriptBin "noctalia-restore-settings" ''
  set -eu
  PATH=${pkgs.coreutils}/bin:$PATH
  if [ -n "''${NOCTALIA_STATE_HOME:-}" ]; then
    dir="$NOCTALIA_STATE_HOME/noctalia"
  elif [ -n "''${XDG_STATE_HOME:-}" ]; then
    dir="$XDG_STATE_HOME/noctalia"
  else
    dir="$HOME/.local/state/noctalia"
  fi
  mkdir -p "$dir"
  if [ -e "$dir/settings.toml" ]; then
    backup="$dir/settings.toml.bak-$(date +%Y%m%d-%H%M%S)"
    cp "$dir/settings.toml" "$backup"
    echo "Previous settings saved to $backup"
  fi
  tmp=$(mktemp "$dir/.settings.toml.XXXXXX")
  cat ${settingsToml} > "$tmp"
  chmod 644 "$tmp"
  mv "$tmp" "$dir/settings.toml"
  # Skip the first-run wizard; it would write its own choices over the restored ones.
  touch "$dir/.setup-complete"
  echo "Noctalia settings restored to $dir/settings.toml."
  echo "Restart Noctalia so it installs the plugins from the restored settings."
'') // { inherit settings; }
