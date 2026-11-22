{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.helix.enable {
    programs.helix.settings = {
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
    # home.sessionVariables = {
    #   EDITOR = "hx";
    #   VISUAL = "hx";
    # };
  };    
}
