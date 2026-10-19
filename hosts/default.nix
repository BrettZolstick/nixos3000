{lib, ...}:
let

  isNixFile        = file: lib.strings.hasSuffix ".nix" file;       # function that returns true if the argument has suffix of ".nix"
  allFiles         = lib.filesystem.listFilesRecursive ../options;  # list of all files under ../options
  nixFilesToImport = lib.filter isNixFile allFiles;                 # filters the list of allFiles to where only isNixFile returs true
  
in
{

imports = [] ++ nixFilesToImport; # This recursively imports any nix files under ../options



kde.enable = true; 
sddm.enable = true;
 
  
}
