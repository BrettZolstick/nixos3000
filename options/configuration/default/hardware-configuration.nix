{lib, config, ...}: {

  options.hardware-configuration.enable = lib.mkOption {
    default = true;
  };
  
  config = lib.mkIf config.hardware-configuration.enable {

    # Pull the pre-generated hardware configuration from /etc/nixos/
    # This will make the flake impure, rebuild with the --impure flag
    
    imports = [/etc/nixos/hardware-configuration.nix];

  };
}
