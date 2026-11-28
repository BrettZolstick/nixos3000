{config, lib, ... }: {
  options.helix.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.helix.enable {

    assertions = [
      {assertion = config.noctalia.enable; message = "This module needs noctalia enabled. Please set noctalia.enable = true for this user";}
    ];

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
