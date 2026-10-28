{lib, config, ...}:
let

  isNixFile        = file: lib.strings.hasSuffix ".nix" file;              # function that returns true if the argument has suffix of ".nix"
  allFiles         = lib.filesystem.listFilesRecursive ../modules/system;  # list of all files under ../modules/system
  nixFilesToImport = lib.filter isNixFile allFiles;                        # filters the list of allFiles to where only isNixFile returs true
  
in
{

sops.secrets.root-password-hash={
  sopsFile = ../secrets/host-root-passwords/generic.yaml;
  key = "root-password-hash";
  neededForUsers = true;
};
users.users.root.hashedPasswordFile = config.sops.secrets.root-password-hash.path;
users.mutableUsers = false;

imports = [../users/guest.nix] ++ nixFilesToImport; # This recursively imports any nix files under ./systemOptions as well as the specified imports



kde.enable = true; 
sddm.enable = true;
 
  
}
