{config, lib, pkgs, ...}: {
  options.switch-session.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.switch-session.enable {

    home.packages = [
      (pkgs.writeShellApplication {
        name = "switch-session";
        runtimeInputs = [pkgs.systemd pkgs.coreutils];
        text = builtins.readFile ./switch-session.sh; 
      })
    ];
    
  };
}
