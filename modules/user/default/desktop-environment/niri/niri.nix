{config, lib, osConfig, ...}: {
  options.niri.enable = lib.mkOption {default = true;};
  config = lib.mkIf (config.niri.enable && osConfig.niri.enable) {

    xdg.configFile."niri/config.kdl".source = ./config.kdl;

      
  };
}
