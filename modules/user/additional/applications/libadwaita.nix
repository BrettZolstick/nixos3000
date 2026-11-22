{config, lib, pkgs, ...}: {
  options.libadwaita.enable = lib.mkOption {default = false;};
  config = lib.mkIf config.libadwaita.enable {

    home.packages = with pkgs; [
      libadwaita
    ];
    
  };
}
