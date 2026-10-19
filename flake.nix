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
          ./hosts/default.nix
          { networking.hostName = "default"; }
          home-manager.nixosModules.home-manager
        ];
      };
      
    };
  };
}
