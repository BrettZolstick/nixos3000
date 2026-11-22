{lib, pkgs, ...}: {
  options.icon-theme = {
    name    = lib.mkOption { type = lib.types.str;     default = "Nordzy-yellow-dark"; };
    package = lib.mkOption { type = lib.types.package; default = pkgs.nordzy-icon-theme; };
  };
}
