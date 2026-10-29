{ disk }: {
  
  disko.devices.disk.main = {

    type = "disk";
    device = disk;
    content = {

      type = "gpt";
      partitions = {

        ESP = {
          type = "EF00";
          size = "512M";
          content = {
            type = "filesystem";
            format = "vfat";
            extraArgs = [ "-F" "32" ];
            mountpoint = "/boot";
            mountOptions = [ "umask=0077" ];
          };
        };

        swap = {
          size = "32G";
          content = {
            type = "swap";
            resumeDevice = true;
          }; 
        };

        root = {
          size = "100%";
          content = {
            type = "btrfs";
            mountpoint = "/";
            mountOptions = [ "compress=ztsd" ];
          };
        };
        
      };
      
    };
    
  };
  
}
