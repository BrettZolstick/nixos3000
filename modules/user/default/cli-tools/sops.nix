{config, lib, ...}: {
  
  options.sops.enable = lib.mkOption {default = true;};

  config = lib.mkIf config.sops.enable {

    sops.age = {
      keyFile = "${config.home.homeDirectory}/.config/sops/age";
      generateKey = true;  
    };

  };
}
