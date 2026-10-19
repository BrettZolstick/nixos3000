{lib, config, ...}: {

  options.kde.enable = lib.mkOption {
    default = false;
  };

  config = lib.mkIf config.kde.enable {
    services.desktopManager.plasma6.enable = true;
  };
}
