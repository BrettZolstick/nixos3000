{lib, ... }: {
  
  imports = [/etc/nixos/hardware-configuration.nix] ++ lib.optional (builtins.pathExists /etc/nixos/luks.nix) /etc/nixos/luks.nix; 
  # also import luks.nix if it exists (generated separately on install).
  # Had to do it this way because nixos-generate-config doesn't properly support luks encryption on its own.


  nix.settings.experimental-features = [ "flakes" "nix-command" ];

  networking.networkmanager.enable = true;

  # allow users to be managed declaratively (also disallows manual/imperitive user managment)
  users.mutableUsers = false; 
  
}
