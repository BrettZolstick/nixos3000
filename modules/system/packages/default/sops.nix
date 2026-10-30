{lib, config, ...}: {

  options.sops.enable = lib.mkOption {
    default = true;
  };

  config = lib.mkIf config.sops.enable {

    sops.age = {
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };
    
  };
}
