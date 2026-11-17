{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.helix.enable {
    home.packages = with pkgs; [
      clang-tools
    ];
  };
}
