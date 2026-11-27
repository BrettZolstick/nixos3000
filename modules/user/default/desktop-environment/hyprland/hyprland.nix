{ lib, config, ... }: {
  options.hyprland.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.hyprland.enable {

    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
      configType = "lua";
      extraConfig = ''
        hl.env("QT_QPA_PLATFORMTHEME", "kde")
        hl.env("QT_STYLE_OVERRIDE", "breeze")
        hl.env("XCURSOR_THEME","${config.cursor-theme.name}")
        hl.env("XCURSOR_SIZE","${toString config.cursor-theme.size}")

        require("hyprland.general")
        require("hyprland.decoration")
        require("hyprland.animations")
        require("hyprland.input")
        require("hyprland.group")
        require("hyprland.misc")
        require("hyprland.binds")
        require("hyprland.render")
        require("hyprland.cursor")

        local ok, noctalia = pcall(require, "noctalia")
        if ok then
          noctalia.apply_theme()
        end
      '';
    };
    
    xdg.configFile."hypr/hyprland" = lib.mkForce {
      source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/nixos3000/modules/user/default/desktop-environment/hyprland/lua";
    };
    
    
  };
}
