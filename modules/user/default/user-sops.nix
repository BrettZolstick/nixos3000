{config, lib, ...}: {

  options.user-sops.enable = lib.mkOption {default = true;};

  config = lib.mkIf config.user-sops.enable {

    sops.age = {
      keyfile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
      generateKey = true;
    };
    
  };
}
