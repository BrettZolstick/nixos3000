{config, lib, pkgs, ...}:
let
  ageKeyDir = "${config.home.homeDirectory}/.config/sops/age"; 
  ageKeyFile = "${ageKeyDir}/keys.txt"; 
in
{

  options.user-sops.enable = lib.mkOption {default = true;};

  config = lib.mkIf config.user-sops.enable {

    sops.age = {
      keyFile = ageKeyFile;
      generateKey = false;  
    };

    
    # setting sops.age.generateKey = true; only generates a key if an encrypted secret already exists.
    # to make first time setup easier, this oneshot service will make an age identity if one doesn't exist already
    systemd.user.services.age-keygen = {
      Unit = {
        Description = "Generate an age identity for sops if one doesn't exist already";
        ConditionPathExists = "!${config.sops.age.keyFile}";
        Requires = ["age-keygen.service"];
        After = ["age-keygen.service"];
        Before = ["sops-nix.service"];
      };
      Service = {
        Type = "oneshot";
        ExecStart = pkgs.writeShellScript "generate-age-identity" ''
          ${pkgs.coreutils}/bin/mkdir --parents "${ageKeyDir}"
          ${pkgs.age}/bin/age-keygen --output "${ageKeyFile}"    
        '';
      };
      Install.WantedBy = ["default.target"];
    };
    
  };
}
