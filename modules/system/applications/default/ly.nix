{lib, config, ...}:
{
  options.ly.ttyUsers.tty1 = lib.mkOption {type = lib.types.attrsOf lib.types.str; default = {};};
  options.ly.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.ly.enable {
    #enable ly
    services.displayManager.ly = {
      enable = true;
    };

    # Enable virtual terminals on tty1-10, with getty explicity on tty10
    services.logind.settings.Login = {
      NAutoVTs = 9; # enable autovt (will be ly) virtual terminals on tty1-9
      ReserveVT = 0;
    };
    systemd.targets.getty.wants = ["getty@tty10.service"]; # start getty on tty 10
    
    # let ly be the default on new ttys instead of getty
    systemd.services."ly@".aliases = ["autovt@.service"];
    systemd.services."getty@".aliases = lib.mkForce [];
    
    # Make ly open on tty1-9
    systemd.services."ly@" = {

      description = "Ly display manager on %I";
          
      after = [ # prevents ly starting until all these are finished
        "systemd-user-sessions.service"
        "plymouth-quit-wait.service"
        "getty@%i.service"
      ];

      conflicts = [ "getty@%i.service" ]; # prevents getty and ly from trying to run on the same tty

      restartIfChanged = false; # do not restart on rebuild switch

      serviceConfig = {
        # launch ly
        ExecStart = "/run/current-system/sw/bin/ly";

        # wait for boot to settle so messages don't draw over ly
        Type = "idle";

        # make sure ly re-launches itself when you log out
        Restart = "always";
        RestartSec = 0 ;

        # receive keyboard input
        StandardInput = "tty";
        StandardOutput = "tty";

        # disconnect anything still attached to the tty
        TTYPath = "/dev/%I";
        TTYReset = true;
        TTYVHangup = true;
        TTYVTDisallocate = true;
        IgnoreSIGPIPE = false;
        SendSIGHUP = true;
        
      };         
    };

    # Autofill the usernames for each specified tty
    
  };
}
