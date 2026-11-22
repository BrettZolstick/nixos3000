{config, lib, pkgs, ...}: {
  options.cursor-theme = {
    name    = lib.mkOption { type = lib.types.str;     default = "Nordzy-cursors"; };
    package = lib.mkOption { type = lib.types.package; default = pkgs.nordzy-cursor-theme; };
    size    = lib.mkOption { type = lib.types.int;     default = 22; };
  };

  config = {
    home.pointerCursor = {
      enable     = true;     
      gtk.enable = true;
      x11.enable = true;
      name       = config.cursor-theme.name;
      package    = config.cursor-theme.package;
      size       = config.cursor-theme.size;
    };

    systemd.user.sessionVariables = {
      XCURSOR_THEME = config.cursor-theme.name;
      XCURSOR_SIZE = toString config.cursor-theme.size;
    };
  };
}
