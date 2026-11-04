{config, lib, ...}: {
  options.git.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.git.enable {

    programs.git = {
      enable = true;
      settings = {
        user.email = "crazyeman83@gmail.com";
        user.name = "Ethan";
        init.defaultBranch = "main";
      };
    };

    programs.ssh = {
      enable = true;
      settings = {
        "github.com" = {
          IdentityFile = "/etc/ssh/github/id_ed25519"; # user must be a wheel member
          IdentitiesOnly = true;
        };
      };
    };
    
  };
}
