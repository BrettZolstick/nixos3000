{config, lib, ...}: {
  options.starship.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.starship.enable {

    assertions = [
      {assertion = config.noctalia.enable; message = "This module needs noctalia enabled. Please set noctalia.enable = true for this user";}
    ];

    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };

    xdg.configFile."starship.toml".source = config.lib.file.mkOutOfStoreSymlink
      "/etc/nixos/nixos3000/modules/user/default/desktop-environment/starship/starship.toml";
    
  };
}
