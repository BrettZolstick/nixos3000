{lib, ...}:
let

  isNixFile        = file: lib.strings.hasSuffix ".nix" file;            # function that returns true if the argument has suffix of ".nix"
  allFiles         = lib.filesystem.listFilesRecursive ./systemOptions;  # list of all files under ../systemOptions
  nixFilesToImport = lib.filter isNixFile allFiles;                      # filters the list of allFiles to where only isNixFile returs true
  
in
{

imports = [../users/default.nix] ++ nixFilesToImport; # This recursively imports any nix files under ./systemOptions as well as the specified imports



kde.enable = true; 
sddm.enable = true;
 
  
}
