{config, lib, pkgs, ...}: {
  options.btop.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.btop.enable {

    programs.btop = {
      enable = true;
      settings = {
        color_theme = "noctalia";
        theme_background = false;
      };
    };
    
  };
}
