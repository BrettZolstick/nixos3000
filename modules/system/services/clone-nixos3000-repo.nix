{lib, config, pkgs, ...}: {
  options.clone-nixos3000-repo.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.clone-nixos3000-repo.enable {

    # this module requires git, configured in nixos3000/modules/system/packages/default/git.nix
    git.enable = true;

    users.users.clone-nixos3000 = {
      isSystemUser = true;
      group = "github-auth";
    };

    systemd.tmpfiles.rules = [
      "d /etc/nixos/nixos3000 2775 clone-nixos3000 github-auth -"
      "a+ /etc/nixos/nixos3000 - - - - d:u::rwx,d:g::rwx,d:m::rwx,d:o::r-x"
    ];

    sops.secrets.nixos3000-deploy-key = {
      sopsFile = ../../../secrets/nixos3000-deploy-key.yaml;
      key = "private-key";
      owner = "clone-nixos3000";
      mode = "0400";
    };

    programs.ssh = {
      extraConfig = ''
        Host nixos3000-deploy
          HostName github.com
          User git
          IdentityFile ${config.sops.secrets.nixos3000-deploy-key.path}
          IdentitiesOnly yes    
      '';
      knownHosts = {
        "nixos3000-deploy".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
      };
    };
    
    
    systemd.services.clone-nixos3000 = {
      description = "clone the nixos3000 repo to /etc/nixos if it doesn't exist there already";

      wantedBy = [ "multi-user.target" ];
      requires = [ "network-online.target" "systemd-tmpfiles-setup.service" ];
      after    = [ "network-online.target" "systemd-tmpfiles-setup.service" ];

      unitConfig = {
        ConditionPathExists = "!/etc/nixos/nixos3000/.git";
      };

      serviceConfig = {
        Type = "oneshot";
        Restart = "on-failure";
        RestartSec = "30s";
        WorkingDirectory = "/etc/nixos";
        User = "clone-nixos3000";
        Group = "github-auth";
      };

      path = [
        pkgs.git
        pkgs.openssh
      ];

      script = ''
        git clone \
          --config=core.sharedRepository=group \
          "nixos3000-deploy:BrettZolstick/nixos3000.git" \
          ./nixos3000

        git -C ./nixos3000 remote set-url origin "git@github.com:BrettZolstick/nixos3000.git"
      '';
     
    };
  
    
 };
}
