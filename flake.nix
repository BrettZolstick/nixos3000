{
  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
  };

  outputs = {nixpkgs, ...}: {
    nixosConfigurations = nixpkgs.lib.nixosSystem {
      default = {
        system = "x86_64-linux";
        modules = [
          ./hosts/defaultHost.nix
          { networking.hostName = "default"; }
        ];
      };
      
    };
  };
}
