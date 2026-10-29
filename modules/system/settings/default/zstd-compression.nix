{lib, config, ...}: {

  options.zstd-compression.enable = lib.mkOption {
    default = true;
  };
  
  config = lib.mkIf config.zstd-compression.enable {

    fileSystems."/".options = lib.optionals (config.filesystems."/".fsType == "btrfs")[
      "compress=zstd"
    ];
          
  };
}

