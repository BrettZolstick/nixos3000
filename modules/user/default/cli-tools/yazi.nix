{config, lib, ...}: {
  options.yazi.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.yazi.enable {

    programs.yazi = {
      enable = true;
    };          
  };
}
