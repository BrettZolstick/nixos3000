{lib, config, ...}: {

  options.system-sops.enable = lib.mkOption {
    default = true;
  };

  config = lib.mkIf config.system-sops.enable {

    sops.age = {
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };
    
  };
}
