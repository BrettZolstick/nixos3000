{lib, config, ...}: {
  options.home-manager-backups.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.home-manager-backups.enable {

    home-manager.backupFileExtension = "backup";          
  };
}

