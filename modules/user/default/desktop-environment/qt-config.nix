{config, lib, ...}:{
  options.qt-config.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.qt-config.enable {

    assertions = [
      {assertion = config.noctalia.enable; message = "This module needs noctalia enabled. Please set noctalia.enable = true for this user";}
    ];

  
    qt = {
      enable = true;
      platformTheme.name = "kde";
      style.name = "breeze";
      kde.settings = {
        kdeglobals.Icons.Theme = config.icon-theme.name;
        kcminputrc.Mouse = {
          cursorTheme = config.cursor-theme.name;
          cursorSize = config.cursor-theme.size;
        };       
      };  
    };
  };
}
