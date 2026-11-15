{config, lib, ...}: {
  options.niri.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.niri.enable {

    # niri-flake docs: https://github.com/sodiboo/niri-flake/blob/main/docs.md
    
    programs.niri.settings = {

      binds = {
        "Mod+Return".action.spawn = "kitty";
        "Mod+Q".action.close-window = {};
      };
        
    };
          
  };
}
