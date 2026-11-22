{config, lib, ...}: {
  options.starship.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.starship.enable {

    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };

    xdg.configFile."starship.toml".source = config.lib.file.mkOutOfStoreSymlink
      "/etc/nixos/nixos3000/modules/user/default/desktop-environment/starship/starship.toml";
    
  };
}
