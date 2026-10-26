{
  imports = [/etc/nixos/hardware-configuration.nix];
  
  nix.settings.experimental-features = [ "flakes" "nix-command" ];

  networking.networkmanager.enable = true;
}
