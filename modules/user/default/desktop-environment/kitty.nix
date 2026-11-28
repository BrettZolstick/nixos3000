{config, lib, pkgs, ...}: {
  options.kitty.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.kitty.enable {

    assertions = [
      {assertion = config.noctalia.enable; message = "This module needs noctalia enabled. Please set noctalia.enable = true for this user";}
    ];

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

        font_family = ''family="VictorMono Nerd Font" style="SemiBold"'';
        italic_font = ''family="VictorMono Nerd Font" style="SemiBold Oblique"'';
        bold_font = ''family="VictorMono Nerd Font" style="Bold"'';
        bold_italic_font = ''family="VictorMono Nerd Font" style="Bold Oblique"'';
        font_size = 11;
        
      };
      extraConfig = ''
        globinclude themes/noctalia.conf    
      '';
    };

    home.packages = [pkgs.nerd-fonts.victor-mono];
    fonts.fontconfig = {
      enable = true;
      antialiasing = true;
    };  
  };
}
