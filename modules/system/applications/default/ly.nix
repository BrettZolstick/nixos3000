{lib, config, ...}: {
  options.ly.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.ly.enable {

    services.displayManager.ly = {
      enable = true;
    };

    # Enable virtual terminals on tty1-10
    services.logind.settings.Login = {
      NAutoVTs = 10; # enable virtual terminals on tty1-10
      ReserveVT = 10; # keep tty10 a normal getty login for recovery
    };
    
    # Make ly open on tty1-9
    systemd.services."autovt@tty2" = {

      description = "Ly display manager on tty2";

      after = [ # prevents ly starting until all these are finished
        "systemd-user-sessions.service"
        "plymouth-quit-wait.service"
        "getty@tty2.service"
      ];

      conflicts = [ "getty@tty2.service" ]; # prevents getty and ly from trying to run on the same tty

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

        # disconnect anything still attached to tty2
        TTYPath = "/dev/tty2";
        TTYReset = true;
        TTYVHangup = true;
        TTYVTDisallocate = true;
        IgnoreSIGPIPE = false;
        SendSIGHUP = true;
        
      };         
    };
    
  };
}
