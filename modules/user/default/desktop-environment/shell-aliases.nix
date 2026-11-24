{config, lib, ...}: {
  options.shell-aliases.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.shell-aliases.enable {

    home.shellAliases = {
      # Reboot and shutdown according to my polkit rules that tell it to shutdown regardless whether or not other users are logged in.
      reboot = "busctl call org.freedesktop.login1 /org/freedesktop/login1 org.freedesktop.login1.Manager RebootWithFlags t 0";
      shutdown = "busctl call org.freedesktop.login1 /org/freedesktop/login1 org.freedesktop.login1.Manager PowerOffWithFlags t 0";
    };
    
  };
}
