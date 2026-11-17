{ config, lib, ... }: {
  # This is wrapped in an option so that it can be easily toggled elsewhere.
  options = {
    helix.enable = lib.mkOption {
      default = true;
    };
  };

  config = lib.mkIf config.helix.enable {
    # Actual content of the module goes here:

    programs.helix = {
      enable = true;
      defaultEditor = true;
    };
  };
}
