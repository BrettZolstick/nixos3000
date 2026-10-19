{lib, config, ...}: {

  options.experimental-features.enable = lib.mkOption {
    default = true;
  };
  
  config = lib.mkIf config.experimental-features.enable {

    nix.settings.experimental-features = [ "flakes" "nix-command" ];
            
  };
}

