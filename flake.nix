{
  description = "My third NixOS config";
  
  inputs = {

    nixpkgs.url = "nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, home-manager, ...}: {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem{
        system = "x86_64-linux";
        modules = [
          ./hosts/generic.nix
          { networking.hostName = "generic"; }
          home-manager.nixosModules.home-manager
        ];
      };
      
    };
  };
}
