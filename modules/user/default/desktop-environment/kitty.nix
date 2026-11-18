{config, lib, pkgs, ...}: {
  options.kitty.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.kitty.enable {

    programs.kitty = {
      enable = true;
      enableGitIntegration = true;
      shellIntegration = {
        enableBashIntegration = true;
        enableFishIntegration = true;
      };
      settings = {
        shell = "${pkgs.fish}/bin/fish";
        remember_window_size = "no";
        confirm_os_window_close = 0;
      };
    };
      
  };
}
