{config, lib, pkgs, osConfig, ...}: {
  options.gtk3.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.gtk3.enable {

    assertions = [
      {
        assertion = osConfig.programs.dconf.enable;
        message = "gtk3 theming requires dconf to be enabled at the system level. Set programs.dconf.enable = true;";
      }  
    ];

    gtk = {
      enable = true;
      theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };
      iconTheme = {
        name = "Numix";
        package = pkgs.numix-icon-theme;
      };
      gtk4.theme = null;
    };
  };
}
