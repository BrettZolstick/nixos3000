{config, lib, ...}: {
  options.firefox.cookiegroup.enable = lib.mkOption {default = false;};
  config = lib.mkIf config.firefox.cookiegroup.enable {

    firefox.enable = true;

    programs.firefox.policies.ExtensionSettings = {
      # adnausem 
      "adnauseam@rednoise.org" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/adnauseam/latest.xpi";
        installation_mode = "force_installed";
      };
      
    };
    
    programs.firefox.profiles.default = {
      id = 0;
      isDefault = true;
     
      search = {
        force = true;
        default = "ddg";
        privateDefault = "ddg";

        engines = {
          amazon = {
            name = "Amazon";
            urls = [{
              template = "https://www.amazon.com/s";
              params = [{name = "k"; value = "{searchTerms}";}];
            }];
            icon = "https://www.amazon.com/favicon.ico";
            definedAliases = ["@a"];
          };
     
          amazon-renewed = {
            name = "Amazon Renewed";
            urls = [{
              template = "https://www.amazon.com/s?k=5540&srs=12653393011";
              params = [
                {name = "k"; value = "{searchTerms}";}
                {name = "srs"; value = "12653393011";}
              ];
            }];
            icon = "https://www.amazon.com/favicon.ico";
            definedAliases = ["@ar"];
          };
     
        }; 
      };
    };
    
  };
}
