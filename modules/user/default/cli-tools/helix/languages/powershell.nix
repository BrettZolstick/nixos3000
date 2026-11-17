{
  config,
  lib,
  pkgs,
  ...
}:

let
  pses = pkgs.fetchzip {
    url = "https://github.com/PowerShell/PowerShellEditorServices/releases/download/v4.4.0/PowerShellEditorServices.zip";
    sha256 = "1gri08mkd0x9ig40xidhmr0d2f2vrphljw4m3dkqrqq58z3glv5n";
  };
in

{
  config = lib.mkIf config.helix.enable {
    home.packages = [pkgs.powershell];
    programs.helix.languages = {
      "language-server"."powershell-editor-services" = {
        command = "pwsh";
        args = [
          "-NoLogo"
          "-NoProfile"
          "-Command"
          "${pses}/PowerShellEditorServices/Start-EditorServices.ps1 -HostName helix -HostProfileId helix -HostVersion 1.0.0 -Stdio"
        ];
      };
      language = [
        {
         name = "powershell";
         "language-servers" = ["powershell-editor-services"];
        }
      ];
    };
    
  };
}
