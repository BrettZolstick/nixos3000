{lib, config, ...}: {

  options.allow-unfree.enable = lib.mkOption {
    default = true;
  };
  
  config = lib.mkIf config.allow-unfree.enable {

    nixpkgs.allowUnfree = true;
          
  };
}

