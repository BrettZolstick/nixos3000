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
    };

    users.groups.github-auth = {};


    # Give members of the github-auth group access to the ssh key generated and authenticated at install.
    systemd.tmpfiles.rules = [
      "z /etc/ssh/github 750 root github-auth -"
      "z /etc/ssh/github/id_ed25519 640 root github-auth -"
    ];
    
  };
}
