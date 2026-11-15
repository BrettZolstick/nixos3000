{lib, config, ...}: {
  options.niri.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.niri.enable {

    programs.niri.enable = true;

  };
}
