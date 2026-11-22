{config, lib, ...}:
let
  qtctConfig = variant: ''
    [Appearance]
    color_scheme_path=${config.xdg.configHome}/${variant}/colors/noctalia.conf
    custom_palette=true
    icon_theme=Numix
    standard_dialogs=default
    style=Fusion    
  '';
in
{
  options.qt.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.qt.enable {
  
    qt = {
      enable = true;
      platformTheme.name = "qtct";
    };

    xdg.configFile."qt5ct/qt5ct.conf".text = qtctConfig "qt5ct";
    xdg.configFile."qt6ct/qt6ct.conf".text = qtctConfig "qt6ct";
    
  
  };
}
