{ lib, config, ... }: {
  options.hyprlandLua.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.hyprlandLua.enable {

    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
      configType = "lua";
      extraConfig = ''
        require("hyprland.general")
        require("hyprland.decoration")
        require("hyprland.animations")
        require("hyprland.input")
        require("hyprland.group")
        require("hyprland.misc")
        require("hyprland.binds")
        require("hyprland.render")
        require("hyprland.cursor")
        require("noctalia")
      '';
    };
    
    xdg.configFile."hypr/hyprland" = lib.mkForce {
      source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/nixos3000/modules/user/default/desktop-environment/hyprland/lua";
    };
    
    
  };
}
