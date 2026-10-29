{ pkgs, lib, disko, ... }:
let
  installScript = ./install.ps1;
  runInstaller = pkgs.writeShellScriptBin "install-nixos3000" ''
    exec ${pkgs.powershell}/bin/pwsh -NoLogo -NoProfile -File ${installScript}    
  '';
in
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;

  services.getty.autologinUser = lib.mkForce "root";

  programs.bash.loginShellInit = "${pkgs.runInstaller}/bin/install-nixos3000";
  
  environment.systemPackages = with pkgs; [
    age
    qrencode 
    disko.packages.${pkgs.stdenv.hostPlatform.system}.disko
    runInstaller
  ];  
}
