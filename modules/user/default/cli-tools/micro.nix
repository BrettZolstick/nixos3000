{config, lib, ...}: {
  options.micro.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.micro.enable {

    programs.micro.enable = true;
    
    # home.sessionVariables = {
    #     EDITOR = "micro";
    #     VISUAL = "micro";
    # };
  };
}
