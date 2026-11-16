{ config, lib, osConfig, ...}: {
  options.hyprland.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.hyprland.enable {

    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
      configType = "lua";
      extraConfig = "require('hyprland.hyprland')";
     };

    xdg.configFile."hypr/hyprland".source =
      config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/nixOS/homeManager/coreDesktop/hyprland";

    xdg.configFile."hypr/stylix.lua".text = ''
      return {
        base00 = "#0c0d0e",
        base01 = "#2e2f30",
        base02 = "#515253",
        base03 = "#737475",
        base04 = "#959697",
        base05 = "#b7b8b9",
        base06 = "#dadbdc",
        base07 = "#fcfdfe",
        base08 = "#e31a1c",
        base09 = "#e6550d",
        base0A = "#dca060",
        base0B = "#31a354",
        base0C = "#80b1d3",
        base0D = "#3182bd",
        base0E = "#756bb1",
        base0F = "#b15928",
      }
    '';

      xdg.configFile."hypr/host.lua".text = ''
        return "${osConfig.networking.hostName}"
      '';

    services.hyprpaper.enable = true;

    # this is to fix the hyprpaper service not starting because it tries to start before wayland
    systemd.user.services.hyprpaper = {
      Unit = {
        After = ["graphical-session.target"];
        PartOf = ["graphical-session.target"];
      };
      Install = {
        WantedBy = ["graphical-session.target"];
      };
    };

    programs.hyprlock = {
      enable = true;
      settings = {
        general.hide_cursor = true;
        background = lib.mkForce {
          color = "rgba(0, 0, 0, 1.0)";
        };
      };
    };

    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = ''
            hyprctl dispatch 'hl.dsp.dpms({ action = "enable" })'    
          '';
        };
        listener = [
          {
            timeout = 120;
            on-timeout = ''
                hyprctl dispatch 'hl.dsp.dpms({ action = "disable" })' && hyprlock   
              '';
            on-resume = ''
              hyprctl dispatch 'hl.dsp.dpms({ action = "enable" })'    
            '';
          }
        ];
      };
    };
  };
}
