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

    programs.ssh = {
      knownHosts = {
        "github.com".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
      };
      extraConfig = ''
        Host github.com
          IdentityFile /etc/ssh/github/id_ed25519
          IdentitiesOnly yes    
      '';
    };

    users.groups.github-auth = {};

    systemd.tmpfiles.rules = [
      "z /etc/ssh/github 750 root github-auth -"
      "z /etc/ssh/github/id_ed25519 640 root github-auth -"
    ];
    
  };
}
