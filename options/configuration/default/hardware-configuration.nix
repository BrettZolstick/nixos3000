{lib, config, ...}: {

  options.hardware-configuration.enable = lib.mkOption {
    default = true;
  };

  imports =
    if config.hardware-configuration.enable
    then [/etc/nixos/hardware-configuration.nix]
    else [];

}
