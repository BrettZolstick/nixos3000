{lib, pkgs, ...}:
let
  userName = "default";

  isNixFile            = file: lib.strings.hasSuffix ".nix" file;          # function that returns true if the argument has suffix of ".nix"
  allUserPackagesFiles = lib.filesystem.listFilesRecursive ./userPackages; # list of all files under ./userPackages
  userPackagesNixFiles = lib.filter isNixFile allUserPackagesFiles;        # filters the list to where only isNixFile returs true
  
in
{
  users.users.${userName} = {
    isNormalUser = true;
    description = userName;
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.bash;
  };
  
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${userName} = {...}:{
      imports = userPackagesNixFiles; # import all .nix files under ./userPackages
      home = {
        username = userName;
        homeDirectory = /home/${userName};
        stateVersion = "26.05";
      };
    };
  };
}
