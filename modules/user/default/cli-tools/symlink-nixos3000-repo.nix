{config, lib, ...}: {
  options.symlink-nixos3000-repo.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.symlink-nixos3000-repo.enable {

    home.file."nixos3000".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/nixos3000";
    
  };
}
