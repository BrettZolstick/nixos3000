{
  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
  };

  outputs = {nixpkgs, ...}: {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem{
        system = "x86_64-linux";
        modules = [
          ./hosts/default.nix
          { networking.hostName = "default"; }
        ];
      };
      
    };
  };
}
