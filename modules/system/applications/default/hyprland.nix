{lib, config, ...}: {
  options.hyprland.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.hyprland.enable {

    programs.hyprland.enable = true;

  };
}
