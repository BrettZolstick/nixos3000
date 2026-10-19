{config, lib, ...}: {

  options.fastfetch.enable = lib.mkOption {default = true;};

  config = lib.mkIf config.fastfetch.enable {

    home.packages = with pkgs; [fastfetch];
    
  };
}
