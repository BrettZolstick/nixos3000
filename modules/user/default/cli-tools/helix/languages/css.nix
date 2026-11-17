{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.helix.enable {
    home.packages = with pkgs; [
      vscode-langservers-extracted
      prettier
    ];
    programs.helix.languages = {
      language = [
        {
         name = "css";
          formatter = {
            command = "prettier";
            args = [
              "--parser"
              "css"
            ];
          };
        }
      ];
    };
  };
}
