{lib, config, ...}: {

  options.systemd-boot.enable = lib.mkOption {
    default = true;
  };
  
  config = lib.mkIf config.systemd-boot.enable {

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    
  };
}
