{
  
  imports = [/etc/nixos/hardware-configuration.nix];

  nix.settings.experimental-features = [ "flakes" "nix-command" ];

  networking.networkmanager.enable = true;

  # allow users to be managed declaratively (also disallows manual/imperitive user managment)
  users.mutableUsers = false; 
  
}
