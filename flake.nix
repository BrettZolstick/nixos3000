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
  };

  outputs = {
    nixpkgs,
    home-manager,
    sops-nix,
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
      generic = nixpkgs.lib.nixosSystem{
        system = "x86_64-linux";
        modules = [
          ./hosts/generic.nix
          { networking.hostName = "generic"; }
        ] ++ additionalModules;
      };
      
    };
  };
}
