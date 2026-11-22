{lib, config, ...}: {
  options.ly.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.ly.enable {

    services.displayManager.ly = {
      enable = true;
    };    
    
  };
}
