{lib, pkgs, ...}: {
  options.icon-theme = {

    name = lib.mkOption {
      type = lib.types.str;
      default = "Numix";
    };
    
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.numix-icon-theme;
    };
    
  };
}
