{lib, config, ...}: {
  options.sddm.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.sddm.enable {

    services.displayManager.sddm.enable = true;
    
  };
}
