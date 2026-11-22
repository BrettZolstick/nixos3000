{config, lib, ... }: {
  options.helix.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.helix.enable {

    programs.helix = {
      enable = true;
      defaultEditor = true;
      settings={    
        editor = {
          cursor-shape = {
            normal = "bar";
            insert = "bar";
            select = "bar";
          };
          indent-guides.render = true;
          auto-completion = true;
          completion-trigger-len = 1;
          completion-timeout = 5;
        };
        theme = "noctalia";
      };
    };
    
  };
}
