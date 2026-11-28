{config, lib, pkgs, ...}: {
  options.fastfetch.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.fastfetch.enable {

    assertions = [
      {assertion = config.noctalia.enable; message = "This module needs noctalia enabled. Please set noctalia.enable = true for this user";}
    ];

    home.packages = with pkgs; [fastfetch];
    
  };
}
