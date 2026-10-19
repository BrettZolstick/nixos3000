{lib, ...}: {

imports = [] ++ lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ../options);

kde.enable = true; 
sddm.enable = true;
 
  
}
