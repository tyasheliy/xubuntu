
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

	nixgl.url = "github:nix-community/nixGL";

    neovim-flake.url = "github:tyasheliy/neovim-flake";
  };

  outputs = inputs@{ nixpkgs, home-manager, nixgl, ... }:
	let
		userConfig = import ./config.nix;
        system = userConfig.system;
	in {
		homeConfigurations.tyasheliy = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};

			modules = [
				./home.nix
			];

			extraSpecialArgs = { 
				inherit inputs; 
				inherit system;
				inherit userConfig;
			};
		};
	};
}
