{lib, config, ...}: {
  options.logged-in-users-dont-inhibit-shutdown.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.logged-in-users-dont-inhibit-shutdown.enable {

    # logged in users don't inhbit shutdown
    security.polkit.extraConfig = ''

      polkit.addRule(function(action, subject){
        if ((action.id == "org.freedesktop.login1.reboot-multiple-sessions") && subject.local && subject.active){
          return polkit.Result.YES;
        }
      });

      polkit.addRule(function (action, subject){
        if ((action.id == "org.freedesktop.login1.power-off-multiple-sessions") && subject.local && subject.active){
          return.polkit.Result.YES;
        }
      });
        
    '';
      
  };
}
