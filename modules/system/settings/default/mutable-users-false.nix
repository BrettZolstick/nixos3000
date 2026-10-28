{lib, config, ...}: {

  options.mutable-users-false.enable = lib.mkOption {
    default = true;
  };
  
  config = lib.mkIf config.mutable-users-false.enable {

    users.mutableUsers = false;
    
  };
}
