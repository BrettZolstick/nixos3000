{lib, config, ...}: {

  options.clone-nixos3000-repo.enable = lib.mkOption {
    default = true;
  };

  config = lib.mkIf config.clone-nixos3000-repo.enable {

    # this module requires git, configured in my git module 
    git.enable = lib.mkDefault true;
    
    systemd.services.clone-nixos3000 = {
      description = "clone the nixos3000 repo to /etc/nixos if it doesn't exist there already";
      wantedBy = [ "multi-user.target" ];
      wants = [ "network-online.target" ];
      after = [ "network-online.target" ];
      serviceConfig = {
        Type = "oneshot";
        ConditionPathExists = "!/etc/nixos/nixos3000/.git";
        WorkingDirectory = "/etc/nixos";
      };
      script = ''
        #git clone "git@github.com:BrettZolstick/nixos3000.git"    
      '';
      
    };
  
    
 };
}
