{lib, config, ...}: {
  options.dconf.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.dconf.enable {

    programs.dconf.enable = true;
    
  };
}
