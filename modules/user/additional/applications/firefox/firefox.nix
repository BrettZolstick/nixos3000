{config, lib, pkgs, ...}: {
  options.firefox.enable = lib.mkOption {default = false;};
  config = lib.mkIf config.firefox.enable {

    programs.firefox.enable = true;
    programs.firefox.policies = {
      OverrideFirstRunPage = "";
      SkipTermsOfUse = true;
    };
    programs.firefox.profiles.default = {
      id = 0;
      isDefault = true;

      settings = {
        "browser.newtabpage.activity-stream.widgets.enabled" = false;
        "browser.newtabpage.activity-stream.discoverystream.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;	
        "browser.newtabpage.activity-stream.hideLogo" = true;
        "browser.aboutConfig.showWarning" = false;
        "browser.aboutwelcome.enabled" = false;
        "datareporting.policy.firstRunURL" = "";
        "browser.bookmarks.addedImportButton" = true; # tells firefox not to add the import bookmarks button
        "browser.uiCustomization.state" = builtins.readFile ./uiCustomization.json;
        "browser.tabs.inTitlebar" = 0;
        "identity.fxaccounts.enabled" = false;
      };
      
      search = {
        force = true;
        default = "ddg";
        privateDefault = "ddg";

        order = [
          "ddg"
          "google"
          "claude"
          "youtube"
          "osu"
          "nix-packages"
          "nix-options"
          "home-manager-options"
          "noogle"
        ];

        engines = {
          bing.metaData.hidden = true;
          ebay.metaData.hidden = true;
          perplexity.metaData.hidden = true;
          wikipedia.metaData.hidden = true;
          google.metaData.alias = "@g";
          
          claude = {
            name = "Claude";
            urls = [{
              template = "https://claude.ai/new";
              params = [{name = "q"; value = "{searchTerms}";}];
            }];
            icon = "https://claude.ai/favicon.ico";
            definedAliases = ["@c"];
          };

          youtube = {
            name = "YouTube";
            urls = [{
              template = "https://www.youtube.com/results";
              params = [{name = "search_query"; value = "{searchTerms}";}];
            }];
            icon = "https://www.youtube.com/favicon.ico";
            definedAliases = ["@yt"];
          };

          osu = {
            name = "osu";
            urls = [{
              template = "https://osu.ppy.sh/beatmapsets";
              params = [{name = "q"; value = "{searchTerms}";}];
            }];
            icon = "https://osu.ppy.sh/favicon.ico";
            definedAliases = ["@osu"];
          };
          
          nix-packages = {
            name = "Nix Packages";
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                {name = "channel"; value = "unstable";}
                {name = "query"; value = "{searchTerms}";}
              ];
            }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@np"];
          };

          nix-options = {
            name = "Nix Options";
            urls = [{
              template = "https://search.nixos.org/options";
              params = [
                {name = "channel"; value = "unstable";}
                {name = "query"; value = "{searchTerms}";}
              ];
            }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@no"];
          };

          home-manager-options = {
            name = "Home Manager Options";
            urls = [{
              template = "https://home-manager-options.extranix.com/";
              params = [
                {name = "release"; value = "master";}
                {name = "query"; value = "{searchTerms}";}
              ];
            }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@hmo"];
          };
          
          noogle = {
            name = "Noogle";
            urls = [{
              template = "https://noogle.dev/q/";
              params = [{name = "term"; value = "{searchTerms}";}];
            }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@ng"];
          };
        
        }; 
      };
    };
    
  };
}
