{lib, ...}:
let
  userName = "generic";

  isNixFile        = file: lib.strings.hasSuffix ".nix" file;           # function that returns true if the argument has suffix of ".nix"
  allFiles         = lib.filesystem.listFilesRecursive ./userPackages;  # list of all files under ./userPackages
  nixFilesToImport = lib.filter isNixFile allFiles;                     # filters the list of allFiles to where only isNixFile returs true
  
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${userName} = {...}:{
      imports = nixFilesToImport; # import all .nix files under ./userPackages
      home = {
        username = userName;
        homeDirectory = /home/${userName};
        stateVersion = "26.05";
      };
    };
  };
}
