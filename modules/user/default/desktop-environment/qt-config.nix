{config, lib, ...}:{
  options.qt-config.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.qt-config.enable {
  
    qt = {
      enable = true;
      platformTheme.name = "kde";
      style.name = "breeze";
      kde.settings.kdeglobals = {
        Icons.Theme = config.icon-theme.name;
      };  
    };
  };
}
