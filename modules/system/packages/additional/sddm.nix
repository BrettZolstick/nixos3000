{lib, config, ...}: {

  options.sddm.enable = lib.mkOption {
    default = false;
  };

  config = lib.mkIf config.sddm.enable {
    services.displayManager.sddm.enable = true;
  };
}
