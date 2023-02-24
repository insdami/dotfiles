{
  description = "Home Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # nix-darwin
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };
  
  outputs = { self, nixpkgs, home-manager, darwin }: {
  
    darwinConfigurations."dalbrunm-mac" = darwin.lib.darwinSystem {
    # you can have multiple darwinConfigurations per flake, one per hostname
  
      system = "aarch64-darwin"; # "x86_64-darwin" if you're using a pre M1 mac
      modules = [ ./hosts/dalbrunm-mac/default.nix ]; # will be important later
    };
  };
}
