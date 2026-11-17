{ lib, config, ... }: {
  options.hyprlandLua.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.hyprlandLua.enable {

    xdg.configFile."hypr/hyprland.lua" = lib.mkForce {
      source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/nixos3000/modules/user/default/desktop-environment/hyprland.lua";
    };
    
    
  };
}
