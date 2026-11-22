{config, lib, ...}: {
  options.fish.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.fish.enable {

    programs.fish = {
      enable = true;
      functions.fish_greeting = "";
    };
  };
}
