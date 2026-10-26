{lib, config, ...}: {

  options.sudo.enable = lib.mkOption {
    default = true;
  };
  
  config = lib.mkIf config.sudo.enable {

    security.sudo = {
      enable = true;
      wheelNeedsPassword = true;
    };
      
  };
}
