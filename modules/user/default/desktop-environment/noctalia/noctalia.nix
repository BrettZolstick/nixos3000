{config, lib, ...}: {
  options.noctalia.enable = lib.mkOption {default = true;};
  config = lib.mkIf config.noctalia.enable {

    # Symlink noctalia settings.toml to the repo so that settings
    # can easily be edited via the gui, but then committed
    # to the repo so that new hosts will use the same settings.
    #
    # Reminder: do not upload secrets into the GUI, as they will
    # be staged for commit into the public repo.
    # If you need configure something in noctalia with a secret,
    # configure it in the home manager module with sops.
    home.file.".local/state/noctalia/settings.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/nixos3000/modules/user/default/desktop-environment/noctalia/settings.toml";
      force = true;
    };

    # Settings can also be edited via the home-manager module
    # (keep in mind that settings.toml overwrites the home-manager
    # modules settings.)
    programs.noctalia = {
    	enable = true;
    	settings = {
    	  lockscreen_widgets = {
    	    enabled = true;
    	    widget.username = {
    	      type = "label";
    	      placement_width = 100.0;
    	      placement_height = 100.0;
    	      cx = 50.0;
    	      cy = 70.0;
    	      box_width = 400.0;
    	      box_height = 100.0;
    	      rotation = 0.0;
    	      settings.title = config.home.username;
    	      settings.color = "primary";
    	    };
    	  };
    	};
    };
  };
}
