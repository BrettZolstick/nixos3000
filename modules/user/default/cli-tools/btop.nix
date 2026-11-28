{config, lib, ...}: {
  options.btop.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.btop.enable {

    assertions = [
      {assertion = config.noctalia.enable; message = "This module needs noctalia enabled. Please set noctalia.enable = true for this user";}
    ];

    programs.btop = {
      enable = true;
      settings = {
        color_theme = "noctalia";
        theme_background = false;
      };
    };
    
  };
}
