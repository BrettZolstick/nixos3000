{config, lib, ...}: {
  options.kitty.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.kitty.enable {

    programs.kitty = {
      enable = true;
      enableGitIntegration = true;
      shellIntegration = {
        enableBashIntegration = true;
        enableFishIntegration = true;
      };
    };
      
  };
}
