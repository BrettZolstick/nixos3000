{config, lib, ...}: {
  options.foot.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.foot.enable {

    programs.foot.enable = true;
          
  };
}
