{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}: {
  config = lib.mkIf config.helix.enable {
    home.packages = with pkgs; [nixd alejandra];
    programs.helix.languages = {
      "language-server" = {
        nixd = {
          command = "nixd";
            config = {
            nixpkgs.expr = "import (builtins.getFlake \"path:${config.home.homeDirectory}/nixOS\").inputs.nixpkgs { }";
            options.nixos.expr = "(builtins.getFlake \"path:${config.home.homeDirectory}/nixOS\").nixosConfigurations.${osConfig.networking.hostName}.options";
          };
        };
      };
      language = [
        {
          name = "nix";
          "language-servers" = ["nixd"];
          formatter = {command = "alejandra";};
        }
      ];
    };
  };
}
