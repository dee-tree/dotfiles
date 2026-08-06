{
    description = "dee's nix config a.k.a dotfiles";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";
        home-manager = { 
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {
        nixpkgs, flake-utils, home-manager, ...
    }@inputs: flake-utils.lib.eachDefaultSystem (system:
    let
        pkgs = nixpkgs.legacyPackages.${system};
        cfg = import ./home-manager/cfg.nix { inherit inputs; };
    in {
        packages.homeConfigurations = {
            "dee" = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                  ./home-manager/home.nix
                ];
                extraSpecialArgs = cfg;
            };
            "deetree@deeberry" = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                  ./home-manager/deeberry.home.nix
                ];
                extraSpecialArgs = cfg;
            };
        };
    });
}

