{config, lib, pkgs, ...}: {
  options.tree.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.tree.enable {

    home.packages = with pkgs; [tree];
    
  };
}
