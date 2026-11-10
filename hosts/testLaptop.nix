{lib, config, ...}:
let

  isNixFile        = file: lib.strings.hasSuffix ".nix" file;              # function that returns true if the argument has suffix of ".nix"
  allFiles         = lib.filesystem.listFilesRecursive ../modules/system;  # list of all files under ../modules/system
  nixFilesToImport = lib.filter isNixFile allFiles;                        # filters the list of allFiles to where only isNixFile returs true
  
in
{

# set root password
users.users.root.hashedPasswordFile = config.sops.secrets.root-password.path;
sops.secrets.root-password = {
  sopsFile = ../secrets/root-password-testLaptop.yaml;
  key = "hashed-password";
  neededForUsers = true;
};

imports = [
  ../users/test.nix
  ../users/personal.nix
  ../users/gaming.nix
  ../users/cookiegroup.nix
  ../users/plexus.nix
] ++ nixFilesToImport; # This recursively imports any nix files under ./systemOptions as well as the specified imports

kde.enable = true; 
sddm.enable = true;
  
}
