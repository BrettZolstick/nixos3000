{
  description = "My third NixOS config";
  
  inputs = {

    nixpkgs.url = "nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url =  "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    sops-nix,
    disko,
    ...
  }:
    let
      additionalModules = [
        home-manager.nixosModules.home-manager
        sops-nix.nixosModules.sops
        {home-manager.sharedModules = [sops-nix.homeManagerModules.sops];}
      ];
    in
    {
    nixosConfigurations = {

      # build the installer iso with "nix build .#nixosConfigurations.installer.config.system.build.isoImage"
      # then flash with "dd if=<pathToIso> of=<pathToUSB> bs=4M conv=fsync status=progress"
      installer = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit disko; };
        modules = [
          "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          ./hosts/installer/installer.nix
        ];
      };

      generic = nixpkgs.lib.nixosSystem{
        system = "x86_64-linux";
        modules = [
          ./hosts/generic.nix
          { networking.hostName = "generic"; }
        ] ++ additionalModules;
      };
      
    };

    diskoConfigurations.btrfs = {disk,...}: import ./hosts/installer/disk-layouts/btrfs.nix {inherit disk;};
  };
}
