{config, lib, ...}: {
  options.firefox.enable = lib.mkOption {default = false;};
  config = lib.mkIf config.firefox.enable {

    programs.firefox.enable = true;
    
  };
}
