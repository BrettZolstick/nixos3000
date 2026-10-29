{lib, config, ...}:
let

  isNixFile        = file: lib.strings.hasSuffix ".nix" file;              # function that returns true if the argument has suffix of ".nix"
  allFiles         = lib.filesystem.listFilesRecursive ../modules/system;  # list of all files under ../modules/system
  nixFilesToImport = lib.filter isNixFile allFiles;                        # filters the list of allFiles to where only isNixFile returs true
  
in
{
sops.secrets.root-password = {
  sopsFile = ../secrets/root-password-generic.yaml;
  key = "hashed-password";
  neededForUsers = true;
};

users.users.root.hashedPasswordFile = config.sops.secrets.root-password.path;

imports = [../users/guest.nix] ++ nixFilesToImport; # This recursively imports any nix files under ./systemOptions as well as the specified imports



kde.enable = true; 
sddm.enable = true;
 
  
}
