{lib, config, pkgs, ...}:
let

  #   I've configured ly to read from /var/lib/ly/tty<#>/save.txt.
  #   save.txt should contain "0-<username>" in the first line.
  #   This will tell ly what username to autofill for each tty.
  #
  #   Each host should declare an options.ly.ttyUsers.<tty ID> = "username"; for each tty they want to autofill
  #
  #   the tmpfile rules below will create the files in the correct locations.

  # list of all ttyUsers declared in the nix config
  allTtyUsers = config.ly.ttyUsers;

  # make tmpfiles rules for each given tty and username
  makeRulesForAGivenTty = tty: username: [
    "d /var/lib/ly/${tty} 0755 root root -"
    "f+ /var/lib/ly/${tty}/save.txt 0600 root root - 0-${username}\\n"
  ];

  # For each tty user, make tmpfile rules, and store them in a list grouped by tty
  listOfRulesGroupedByTty = lib.mapAttrsToList makeRulesForAGivenTty allTtyUsers;

  # Flatten into a big list of tmpfiles to be made
  allTmpFilesRules = lib.concatLists listOfRulesGroupedByTty;
  
 in
{
  options.ly.ttyUsers = lib.mkOption {type = lib.types.attrsOf lib.types.str; default = {};}; # options.ly.ttyUsers.<tty ID> = "username";
  options.ly.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.ly.enable {
    #enable ly
    services.displayManager.ly = {
      enable = true;
      x11Support = false;
      settings = {
        type_username = true;
        shell = false;       
      };
    };

    # export list of ttys and users so other applications (noctalia) can refererence it
    environment.etc."ly/tty-users.json".text = builtins.toJSON config.ly.ttyUsers;

    # Enable virtual terminals on tty1-10, with getty explicity on tty10
    services.logind.settings.Login = {
      NAutoVTs = 9; # enable autovt (will be ly) virtual terminals on tty1-9
      ReserveVT = 0;
    };

    systemd.targets.getty.wants = [
      "ly@tty1.service"      # start ly on tty1 on boot
      "getty@tty10.service"  # start getty on tty10 on boot
    ]; 

    # do not use NixOS display-manager servce, explicitly only start ly via my custom service
     systemd.services.display-manager.enable = lib.mkForce false; 
    
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
        # create a copy of the ly config but change the save file to reference the current tty
        ExecStartPre = "${pkgs.writeShellScript "make-ttySpecific-config" (builtins.readFile ./make-ttySpecific-config.sh)} %I";
        
        # launch ly using the new config
        ExecStart = "/run/current-system/sw/bin/ly --config /run/ly/%I";
        RuntimeDirectory = "ly/%I";
        StateDirectory = "ly/%I";

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
    systemd.tmpfiles.rules = allTmpFilesRules;
    
  };
}
