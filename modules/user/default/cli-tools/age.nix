{config, lib, pkgs, ...}: {

  options.age.enable = lib.mkOption {default = true;};

  config = lib.mkIf config.age.enable {

    home.packages = with pkgs; [age];
    
  };
}
