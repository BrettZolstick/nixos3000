{lib, config, ...}: {

  options.git.enable = lib.mkOption {
    default = true;
  };

  config = lib.mkIf config.git.enable {

    programs.git = {
      enable = true;
      config = {
        init.defaultBranch = "main";
      };
    };

        
  };
}
