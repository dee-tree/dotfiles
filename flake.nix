{
    description = "dotfiles";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";
        # nixpkgs-old.url = "github:nixos/nixpkgs/nixos-23.05";
        home-manager = { 
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {
        nixpkgs, flake-utils, home-manager, ...
    }:
    
    # flake-utils.lib.eachDefaultSystem (system:
    let
        system = "x86_64-linux";
        pkgs = import nixpkgs { inherit system; };
    in {
        homeConfigurations = {
            "sokolov" = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [ ./home-manager/home.nix ];
            };
        };
        # devShells.default = pkgs.mkShell {
        #     buildInputs = with pkgs; [
        #         fish
        #         starship
        #         neovim
        #     ];
        #
        #     shellHook = ''
        #         echo Welcome
        #         cjworkspace $(pwd)
        #         echo "After cjworkspace"
        #     '';
        # };
    };
}

