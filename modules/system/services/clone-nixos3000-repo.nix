{lib, config, pkgs, ...}: {
  options.clone-nixos3000-repo.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.clone-nixos3000-repo.enable {

    # this module requires git, configured in nixos3000/modules/system/packages/default/git.nix
    git.enable = true;
   
    systemd.services.clone-nixos3000 = {
      description = "clone the nixos3000 repo to /etc/nixos if it doesn't exist there already";
      wantedBy = [ "multi-user.target" ];
      wants = [ "network-online.target" ];
      after = [ "network-online.target" ];

      unitConfig = {
        ConditionPathExists = "!/etc/nixos/nixos3000/.git";
      };

      serviceConfig = {
        Type = "oneshot";
        WorkingDirectory = "/etc/nixos";
      };

      path = [
        pkgs.git
        pkgs.openssh
      ];

      script = ''
        git clone "git@github.com:BrettZolstick/nixos3000.git"
      '';
      
    };
  
    
 };
}
