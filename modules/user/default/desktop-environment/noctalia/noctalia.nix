{config, lib, ...}: {
  options.noctalia.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.noctalia.enable {

    programs.noctalia = {
    	enable = true;
    };
          
  };
}
