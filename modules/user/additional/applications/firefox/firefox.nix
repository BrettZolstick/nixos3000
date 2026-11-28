{config, lib, ...}: {
  options.firefox.enable = lib.mkOption {default = false;};
  config = lib.mkIf config.firefox.enable {

    programs.firefox.enable = true;
    programs.firefox.policies = {
      OverrideFirstRunPage = "";
      SkipTermsOfuse = true;
    };
    programs.firefox.profiles.default = {
      id = 0;
      isDefault = true;
      settings = {
        "browser.newtabpage.activity-stream.widgets.enabled" = false;
        "browser.newtabpage.activity-stream.discoverystream.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;	
        "browser.aboutConfig.showWarning" = false;
        "browser.aboutwelcome.enabled" = false;
        "datareporting.policy.firstRunURL" = "";
        "browser.bookmarks.addedImportButton" = true; # tells firefox not to add the import bookmarks button
        "browser.uiCustomization.state" = builtins.readFile ./uiCustomization.json;
        "browser.tabs.inTitlebar" = 0;
      };
    };
    
  };
}
