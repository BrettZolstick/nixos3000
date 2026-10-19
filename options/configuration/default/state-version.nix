{lib, config, ...}: {

  options.state-version.value = lib.mkOption {
    type = lib.types.str;
    default = "26.05";
  };

  config = {  
    system.stateVersion = config.state-version.value;
  };
}
