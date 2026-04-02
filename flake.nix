{
    description = "dotfiles";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";
        home-manager = { 
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {
        nixpkgs, flake-utils, home-manager, ...
    }:
    
    let
        system = "x86_64-linux";
        pkgs = import nixpkgs { inherit system; };
    in {
        homeConfigurations = {
            "dee" = home-manager.lib.homeManagerConfiguration {
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

