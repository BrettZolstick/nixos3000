{lib, pkgs, config, ...}:
let
  userName = "cookiegroup";

  isNixFile            = file: lib.strings.hasSuffix ".nix" file;           # function that returns true if the argument has suffix of ".nix"
  allUserPackagesFiles = lib.filesystem.listFilesRecursive ../modules/user; # list of all files under ../modules/user
  userPackagesNixFiles = lib.filter isNixFile allUserPackagesFiles;         # filters the list to where only isNixFile returs true
  
in
{

  sops.secrets."${userName}-user-password" = {
    sopsFile = ../secrets/user-password-${userName}.yaml;
    key = "hashed-password";
    neededForUsers = true;
  };
  
  users.users.${userName} = {
    isNormalUser = true;
    description = userName;
    extraGroups = ["networkmanager" "wheel" "github-auth"];
    shell = pkgs.bash;
    hashedPasswordFile = config.sops.secrets."${userName}-user-password".path;
  };
  
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${userName} = {...}:{
      imports = userPackagesNixFiles; # import all .nix files under ./userPackages
      home = {
        username = userName;
        homeDirectory = "/home/${userName}";
        stateVersion = "26.05";
      };
    };
  };
}
