{lib, config, ...}: {
  options.niri.enable = lib.mkOption {default = false;};
  config = lib.mkIf config.niri.enable {

    programs.niri.enable = true;

  };
}
