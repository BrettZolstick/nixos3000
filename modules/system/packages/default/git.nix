{config, lib, ...}: {
  options.git.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.git.enable {

    programs.git = {
      enable = true;
      config = {
        user.email = "crazyeman83@gmail.com";
        user.name = "Ethan";
        init.defaultBranch = "main";
      };
    };

    programs.ssh.extraConfig = ''
      Host github.com
        IdentityFile /etc/ssh/github/id_ed25519
        IdentitiesOnly yes    
    '';
    
  };
}
