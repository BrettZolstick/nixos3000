{config, lib, pkgs, ...}: {

  options.btop.enable = lib.mkOption {default = true;};

  config = lib.mkIf config.btop.enable {

    home.packages = with pkgs; [btop];
    
  };
}
